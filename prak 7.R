
# Memanggil packages
library(e1071)
library(caret)
library(devtools)

# Menginput data
prak7indah <- read.csv("file:///C:/Users/Indah Kurnianda/Documents/SEMESTER 6/PRAKTIKUM KOMSTAT/7/PRAKTIKUM/SVM.csv", header = T, sep = ",")
head(prak7indah)

## Training sample with n observation
# Ketentuan rasio tergantung peneliti
# 75% data untuk data training, sisanya data testing
n <- round(nrow(prak7indah)*0.75) #round=pembulatan bilangan
n

# Mengunci sampel dari bilangan random
set.seed(12345)

sampel <- sample(seq_len(nrow(prak7indah)), size = n)
train <- prak7indah [sampel,]
test <- prak7indah [-sampel,]
# Melihat dimensi dari sampel data train dan data test
dim(train)
dim(test)

## Support Vector Machine ##
data.svm<- svm(Diagnosis ~., data = train)
data.svm

# Pengujian model svm pada data training
pred1<- predict(data.svm, train)
pred1
confusionMatrix(pred1, train$Diagnosis)

# Pengujian model svm pada data testing
pred2<- predict(data.svm, test)
pred2
confusionMatrix(pred2, test$Diagnosis)

