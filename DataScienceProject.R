mtry=tuneRF(train1,labels,ntreeTry=20,stepFactor=1.5,improve=0.01)
train1
train <- read.csv(file='C:/Users/snelluri/Documents/Chinna/Big Data/R_Work/mnist_train.csv', header=TRUE,sep=",")
test <- read.csv(file='C:/Users/snelluri/Documents/Chinna/Big Data/R_Work/mnist_test.csv', header=TRUE,sep=",")
numTrain = 30000
rows = sample(1:nrow(train),numTrain)
 labels = as.factor(train[rows,1])
train1 = train[rows,-1]
test1=test[,-1]
 rf = randomForest(train1,labels,xtest =test,ntree=100,keep.forest=TRUE) #mtry = # of columns
utils:::menuInstallLocal()
 rf = randomForest(train1,labels,xtest =test,ntree=100,keep.forest=TRUE) #mtry = # of columns
library(randomForest)
 rf = randomForest(train1,labels,xtest =test,ntree=100,keep.forest=TRUE) #mtry = # of columns
 rf = randomForest(train1,labels,xtest =test1,ntree=100,keep.forest=TRUE) #mtry = # of columns
install.packages("FNN",repos="https://cran.rstudio.com");
library(FNN)
model=FNN::knn(train[,-1],test1,train$X5,k=5)
pred_test = data.frame(ImageId=1:nrow(test),label=model)
head pred_test
head(pred_test)
predictions =data.frame(ImageId=1:nrow(test),Label=levels(labels)[rf$test$predicted])
head(predictions)
library(xgboost)
install.packages("xgboost",repos="https://cran.rstudio.com");
library(xgboost)
train$label = as.numeric(train$label)
train$label = as.numeric(train$X5)
var = names(train[2:ncol(train)])
var
train[var]=sapply(train[var],function(x) as.numeric(x))
all_train=xgb.DMatrix(data=data.matrix(train[var]),label=(train$label))
head(all_train)
ls()
all_train
data(all_train)
 param <- list(objective           = "multi:softprob", 
              booster = "gbtree",
              eta                 = 0.01, # 0.06, #0.01,0.005
              max_depth           = 10, #changed from default of 4,6,8,10,15,20
              subsample           = 0.7, #(.5,0.7,1)
              colsample_bytree    = 0.7, #(.5,0.7,1)
              min_child_weight=2,  ## 3/ Event rate - Rule of Thumb 
              num_class = 10
)
head(param)
clf <- xgb.cv(params              = param, 
              data                = all_train, 
              nrounds             = 200, #300, #280, #125, #250, # changed from 300
              verbose             = 1,
              #early.stop.round    = 40,
              #watchlist           = watchlist,
              maximize            = FALSE,
              eval_metric="mlogloss",
              nfold=2
)
###### Use the entire training set using best parameters 
clf_best <- xgboost(params        = param, 
                    data                = all_train, 
                    nrounds             = 10, #300, #280, #125, #250, # changed from 300
                    verbose             = 1,
                    #early.stop.round    = 200,
                    #watchlist           = watchlist,
                    maximize            = FALSE,
                    eval_metric="mlogloss"
                    #nfold=3
)
data(clf_best)
head(clf_best)
imp_var_test <- names(test[1:ncol(test)])
test[imp_var_test] <- sapply(test[imp_var_test],function(x) as.numeric(x))
testDataMatrix<-xgb.DMatrix(data=data.matrix((test[imp_var_test])))
pred1 <- predict(clf_best,testDataMatrix)
pred = matrix(pred1, nrow=1)
pred = data.frame(t(pred))
pred2 <- data.frame(ImageId=1:nrow(test),Label=pred)
head(pred2)
view(pred2)
view(pred2)
help(view)
??view
save.image("C:\\Users\\snelluri\\Documents\\Chinna\\Big Data\\R_Work\\Hackethon.RData")
q()
