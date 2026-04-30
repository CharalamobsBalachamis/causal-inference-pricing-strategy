# Load required libraries
library(tidyverse)
library(lubridate)
library(fixest)

# 1. Load the data (assuming they are in your working directory)
orders <- read_csv("olist_orders_dataset.csv")
items <- read_csv("olist_order_items_dataset.csv")
customers <- read_csv("olist_customers_dataset.csv")

# 2. Join and Clean the Data ####
# We need to link the price of the item to the order date and the customer's state
master_df <- orders %>%
  filter(order_status == "delivered") %>%
  left_join(items, by = "order_id") %>%
  left_join(customers, by = "customer_id") %>%
  mutate(
    order_date = ymd_hms(order_purchase_timestamp),
    # FIX: We wrap floor_date in as.Date() to strip away the time component completely
    month_year = as.Date(floor_date(order_date, "month")) 
  ) %>%
  drop_na(price, month_year, customer_state)

panel_data <- master_df %>%
  filter(
    customer_state %in% c("SP", "RJ", "MG"),
    month_year >= as.Date("2017-01-01") & month_year <= as.Date("2018-08-01")
  ) %>%
  mutate(
    group = ifelse(customer_state == "SP", "Treatment (SP)", "Control (RJ & MG)"),
    is_post = ifelse(month_year >= as.Date("2018-01-01"), 1, 0)
  ) %>%
  group_by(month_year, group, is_post) %>%
  summarise(total_revenue = sum(price), .groups = 'drop')



# 4. Plotting the Pre-Intervention Trends ####
ggplot(panel_data, aes(x = month_year, y = total_revenue, color = group)) +
  geom_line(linewidth = 1.2) + 
  geom_point(size = 3) +
  geom_vline(xintercept = as.Date("2018-01-01"), 
             linetype = "dashed", color = "black", linewidth = 1) +
  annotate("rect", xmin = as.Date("2017-01-01"), xmax = as.Date("2018-01-01"), 
           ymin = -Inf, ymax = Inf, alpha = 0.1, fill = "blue") +
  labs(
    title = "Testing the Parallel Trends Assumption",
    subtitle = "Pre-Intervention trends (shaded area) must be relatively parallel.",
    x = "Month",
    y = "Total Revenue (BRL)",
    color = "Region Group"
  ) +
  scale_y_continuous(labels = scales::comma) + # Adds commas to revenue numbers for readability
  theme_minimal() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(face = "bold", size = 14)
  )


# Run the DiD regression ####
# We use the interaction term group * is_post
did_model <- feols(total_revenue ~ group * is_post, data = panel_data)

# View the results
summary(did_model)
