library(tidyverse)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
df <- read_csv("Placement_Data_Full_Class.csv")

# Removing unused columns
df <- df[,c(2,3,5,8,11)]

# Placement
# Checking if there are any NA values in the data set
sum(is.na(df))
# Removing the NA values
df = na.omit(df)

# Taking a sample of first 500 rows from the large data set
df = df[1:500,]

# Checking for outliers in the columns used for analysis
boxplot(df$ssc_p)
boxplot(df$hsc_p)
boxplot(df$degree_p)
boxplot(df$etest_p)

# Removing outliers from hsc_p and degree_p columns
# hsc_p
iqr <- IQR(df$hsc_p)
Q <- quantile(df$hsc_p, probs=c(.25, .75), na.rm = FALSE)
up <- Q[2] + 1.5*iqr
low <- Q[1] - 1.5*iqr
df <- subset(df, df$hsc_p > low & df$hsc_p < up)

# degree_p
iqr <- IQR(df$degree_p)
Q <- quantile(df$degree_p, probs=c(.25, .75), na.rm = FALSE)
up <- Q[2] + 1.5*iqr
low <- Q[1] - 1.5*iqr
df <- subset(df, df$degree_p > low & df$degree_p < up)

# Correlation coefficient
cor(df$degree_p, df$etest_p)

# Plotting the degree and employment test percentages
ggplot(df, aes(x=df$degree_p, y=df$etest_p))+
  geom_point()

plot(df$degree_p, df$etest_p, main="Number of meals with fish(per week) vs mercury levels
     in head hair", xlab="Number of meals", ylab="Total mercury in mg/g", pch=19, col=alpha("red", 0.2))

# Linear Regression model
model = lm(df$etest_p ~ df$degree_p)

# Regression line
abline(model)

# Multi Linear Regression
mlr_model <- lm(df$etest_p ~ df$degree_p + df$hsc_p + df$ssc_p)
mlr_model

# critical value
qf(0.95, df1=3, df2=496)

# summary function to find F-statistic, Standard errors, t-values, and p-values
summary(mlr_model)

# t-statistic of degree percentage after controlling for high school and secondary education percentages
t_degree <- 0.121/0.106
t_degree

# t-statistic of high school percentage after controlling for degree and secondary education percentages
t_hsc <- 0.213/0.07
t_hsc

# t-statistic of secondary education percentage after controlling for degree and high school percentages
t_ssc <- 0.42/0.07
t_ssc
qt(0.975, df=496)


# one way ANOVA
# critical value
qf(0.95, df1=1, df2=498)

# aov function to calculate F-statistic and p-value
model <- aov(df$etest_p ~ df$gender, data = df)
summary(model)

# pairwise comparison
TukeyHSD(model)

# After adjusting degree_p
library(car)
Anova(lm(df$etest_p~df$gender+df$degree_p), type=3)

library(emmeans)
my.model <- lm(etest_p~gender+degree_p, data=df)
emm_options(contrasts=c("contr.treatment", "contr.poly"))
emmeans(my.model, specs="gender")
emmeans(my.model, specs = "gender" , contr = "pairwise", adjust="none")