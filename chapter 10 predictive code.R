library(readxl) 
bank.df<-read_excel("C:/Users/matth/Downloads/Predictive Analytics Repo/Universal Bank.xlsx")
bank.df <- bank.df[ , -c(1, 5)] # Drop ID and zip code columns.
View(bank.df)
# Make education variable categorical
bank.df$Education <- factor(bank.df$Education, levels = c(1, 2, 3),
                            labels = c("Undergrad", "Graduate", "Advanced/Professional"))
# partition data for the training and validation data
set.seed(2)
train.index <- sample(c(1:dim(bank.df)[1]), dim(bank.df)[1]*0.6)
train.df <- bank.df[train.index, ]
View(train.df)
valid.df <- bank.df[-train.index, ]
# run logistic regression
# use glm() (general linear model) with family = "binomial" to fit a logistic
# regression.
colnames(train.df)
names(train.df)[names(train.df) == "Personal Loan"] <- "PL"
logit.reg <- glm(PL ~ ., data = train.df, family = "binomial")
options(scipen=999)
summary(logit.reg)
