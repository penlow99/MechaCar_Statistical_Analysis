library(dplyr)

# Deliverable 1 - MPG
mecha_mpg <- read.csv('MechaCar_mpg.csv') # load the csv dataset into a dataframe

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg) # create linear model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)) # summarize lm

# Deliverable 2 - Suspension coils
sus_coils <- read.csv('Suspension_Coil.csv') # load csv into dataFrame

total_summary <- sus_coils %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

lot_summary <- sus_coils %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

# Deliverable 3 - T-Test
sample_table <- sus_coils %>% sample_n(50) # select 50 random rows into a table

t.test(sample_table$PSI, mu=1500) #compare sample versus population means

t.test(subset(sus_coils$PSI, sus_coils$Manufacturing_Lot == "Lot1"), mu=1500) # compare Lot 1 to pop. mean

t.test(subset(sus_coils$PSI, sus_coils$Manufacturing_Lot == "Lot2"), mu=1500) # compare Lot 2 to pop. mean

t.test(subset(sus_coils$PSI, sus_coils$Manufacturing_Lot == "Lot3"), mu=1500) # compare Lot 3 to pop. mean
