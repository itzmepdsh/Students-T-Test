#MTE PROJECT -> STUDENT'S T-TEST
#PRADEEP SHARMA (2K20/MC/098)
#MUDIT PAL SINGH (2K20/MC/083)

#One-Sample T-Test
#set working directory

#import your dataset
iq_data<-read.csv("iq.csv")

#tells about the no. of rows and columns
dim(iq_data)

#select top 10 data sample
head(iq_data,10)

#Graph the data!
##boxplot works great for numeric and categorial data
boxplot(iq_data)

#Hypothesis Testing
#Null Hypothesis (H0): mu = 116
#ALternative Hypothesis : mu > 116
#one-sided 95% confidence interval for mu
TEST1 = t.test(iq_data, mu = 116,alternative = "greater", conf.level = 0.95)
TEST1
#Just elaborating t.test command there is no relation of this line with the problem
#two-sided, 99% confidence interval for mu 
t.test(iq_data, mu = 116, alternative = "two.sided", conf.level = 0.99)

attributes(TEST1)
TEST1$p.value
TEST1$conf.int


#Independent Two Sample T-test
#set working directory

#import your dataset
score <- read.csv("verbal_reasoning_score.csv", header = TRUE, sep = ",")

#load ggplot 2 - it is great for making graphs
library(ggplot2)

#let's go through the steps of hypothesis testing
#state your null and alternative hypothesis
 ## null: there is no difference in mean score between male and female
 ## alternative: there is a difference in mean score between male and female

#Is it one sided or two-sided test?
 ## two-sided : no directionality is implied

#Is this a two-sample paired or independent test?
 ## the score included in male trials are INDEPENDENT of those included in 
 ## female trials.

#Graph the data!
 ##boxplot works great for numeric and categorial data
ggplot(score, aes(x = Gender, y = Verbal_reasoning_score)) + geom_boxplot() + theme_classic()

#use of t-test command
TEST2 = t.test(Verbal_reasoning_score ~ Gender, data = score, var.equal = TRUE, paired = FALSE)
TEST2

## t = 11.714

# Step 3: Calculate your p-value

## p = 6.028e-16

##Step 4: State your conclusion 

## Our p-value is very low, therefore we can reject the null hypothesis that 
 ##there is no difference in mean score between male and female.


#Paired T-test
#set working directory

#import your dataset
stress_levels <- read.csv("stress_lvls.csv", header = TRUE, sep = ",")

attach(stress_levels)
names(stress_levels)
dim(stress_levels)

boxplot(stress_levels_before, stress_levels_after)

plot(stress_levels_before, stress_levels_after)

abline(a = 0, b = 1)
# As we can see that the most of the points lie below the line of 45 deg slope
# that means the stress level is high before the exam than after.

#Hypothesis Testing
#Null Hypothesis (H0): Mean difference is Zero.
#Two sided Test
TEST3 = t.test(stress_levels_before, stress_levels_after, mu = 0, alternative = "two.sided", paired = T, conf.level = 0.99)
TEST3

# Since, p-value is very less.
# Therefore, Null Hypothesis is rejected.