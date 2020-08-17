X<-c(1,2,3,4,NA,5)
X1<-na.omit(X)
X1
mean(X1)

#if u use the above technique there is a problem of missed information

mean(X,na.rm = TRUE)
#to replace the missing values with mean so that there is not so much deviation in data

is.na(X)

#X[is.na(X)]<-"Missing values" (or)
X[is.na(X)]<-3
X

#to change the NA with mean value
X[is.na(X)]<-mean(X,na.rm = TRUE)
X

#to change the NA with sum 
X<-c(1,2,3,4,NA,5)
X[is.na(X)]<-sum(X,na.rm = TRUE)
X


#To import data from the system
#data1 is the variable name which holds the dataset 

#Download the data set
data1<-read.csv("Enter ur path here")

#Enter ur path at which the dataset is available. Ex - "E:/coding_folder/R_folder/dataset_folder/Missing values data.csv"

str(data1)

#just storing the dataset in data2 to use it separately
data2=data1
data2


#to find the missing values
is.na(data1)
#the above function is useless because u cannot find how many numbers are missing u can see only true or false

#this code gives the column wise null values
colSums(is.na(data1))

which(is.na(data1))

# to find the number of NA values in dataset
sum(is.na(data1))

#to find the percentage of missing data in the total dataset
sum(is.na(data1))/ (nrow(data1)*(ncol(data1)))*100


library(Amelia)
AmeliaView()

dim(data1)

#imputation is the process of replacing missing data with substituted values.
#use amelia view to impute

data_impute<-amelia(data1, m=3)
#m=3 means it will give three different data with different imputations

data_impute_1<-data_impute$imputations[[1]]
data_impute_1

#to round the data to two values
a<-round(data_impute_1,2)
a
#now the data is automatically imputed and is stored in a

#to impute column wise with mean or median
#v9 is a column
data2$v9[is.na(data2$v9)]<-mean(data2$v9,na.rm = TRUE)
data2


data_impute_2<-amelia(data1,m=3,idvars=1,noms=c(11,12,13),ords=14)
data_impute_2$imputations[[1]]