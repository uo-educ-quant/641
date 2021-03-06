# EDUC 641 Assignment 3 key

# 1. Dataset

if (!require(pacman)) install.packages('pacman', repos = 'https://cran.rstudio.com')
pacman::p_load(tidyverse, knitr)

pd <- read_csv(here::here("data", "cont.csv"))

head(pd)
str(pd)

pd$treat <- factor(pd$treat)

# 2. Descriptive statistics of the outcome variable

# 2.1. Central tendency

mean(pd$vocabulary)

median(pd$vocabulary)

table(cut(pd$vocabulary, seq(min(pd$vocabulary), max(pd$vocabulary), by = 5)))

hist(pd$vocabulary,
     xlab = "Student Vocabulary Score",
     ylab = "Frequency",
     main = "Distribution of Vocabulary (Histogram)",
     cex.main = 1.2)

plot(density(pd$vocabulary),
     xlab = "Student Vocabulary Score",
     ylab = "Proportion",
     main = "Distribution of Vocabulary (Kernel Density Plot)",
     cex.main = 1.2)

# 2.2. Variability

var(pd$vocabulary)

sd(pd$vocabulary)

quantile(pd$vocabulary, probs = c(.25, .5, .75))
# round(quantile(pd$vocabulary, probs = c(.25, .5, .75)), 2)

quantile(pd$vocabulary, probs = seq(.1, .9, by = .1))
# round(quantile(pd$vocabulary, probs = seq(.1, .9, by = .1)), 2)

IQR(pd$vocabulary)

range(pd$vocabulary)

# 3. Compare observed mean of vocabulary to population mean

# 3.1
plot(density(pd$vocabulary_random),
     xlab = "Student Vocabulary Score",
     ylab = "Proportion",
     main = "Distribution of Random Sample Score",
     cex.main = 1.2)

ggplot(pd, aes(vocabulary)) +
  geom_density(color = "cornflowerblue") + 
  geom_density(aes(vocabulary_random), color = "coral2") +
  labs(x = "Student Vocabulary Score",
       y = "Proportion",
       title = "Compare Distributions (Blue: Observed, Red: Randomized)") +
  theme_classic()

# 3.2.

t.test(pd$vocabulary, mu = 87, alternative = "two.sided")