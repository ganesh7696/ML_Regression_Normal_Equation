function [error_train,error_test,training_size]=error_regression(X,k)
y=X(:,7);# Assigning premium as y
X = X(:,[1,3,4]); #age,bmi,number_of_children as X
len = length( X );
cv=cvpartition(X(:,1),'HoldOut',k)# partition data into test and train
idx= test(cv);
X_train = X(~idx, :);
X_test = X(idx,:);
y_train = y(~idx,:);
y_test = y(idx,:);
format long;
theta_hat =inv(X_train'*X_train)*X_train'*y_train;# Finding theta using Normal Equation
Y_pred= zeros(len,1);
for k = 1: len
     Y_pred(k)=dot(theta_hat,X(k,:));
end
 format bank;
 Y_pred_train = Y_pred(~idx,:);
 Y_pred_test = Y_pred(idx,:);
error_train = 0; 
error_test = 0;
training_size = length(X_train);
for i = 1 : length(X_train)  ## Calculating modelling error using MSE
    error_train = error_train + sqrt(1/length(X_train)*(Y_pred_train(i) - y_train(i))); 
end
for k = 1 : length(X_test)   ## Calculating generalization error using MSE
    error_test = error_test + sqrt(1/length(X_test)*(Y_pred_test(k) - y_test(k)));
end
end