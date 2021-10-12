function regression(X,k)
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
hold on
for k = 1: len
     Y_pred(k)=dot(theta_hat,X(k,:));
end
 format bank;
 Y_pred_train = Y_pred(~idx,:);
 Y_pred_test = Y_pred(idx,:);
error_train = 0; 
error_test = 0;
for i = 1 : length(X_train)  ## Calculating modelling error using MSE
    error_train = error_train + sqrt(1/length(X_train)*(Y_pred_train(i) - y_train(i))); 
end
for k = 1 : length(X_test)   ## Calculating generalization error using MSE
    error_test = error_test + sqrt(1/length(X_test)*(Y_pred_test(k) - y_test(k)));
end
for j = 1: len
    figure(1)
    x1 = X(j,1);
    A(j) =dot(theta_hat, [x1 1 1 ]);# linear regression as a function of age
     x2=X(j,2);
    B(j)=dot(theta_hat, [1 x2 1]);# linear regression as a function of bmi
     x3=X(j,3);
    C(j)=dot(theta_hat, [1 1 x3]);
end
clf;
title("Linear Regression")
subplot(2,2,1)
plot(X(:,1),A)
xlabel("Age")
ylabel("Linear Regression function of Age")
subplot(2,2,2)
plot(X(:,2),B)
xlabel("BMI")
ylabel("Linear Regression function of BMI")
subplot(2,2,3)
plot(X(:,3),C)
xlabel("Number of Childern")
ylabel("Linear Regression function of Number of Children")
disp("Modelling Error"); disp(error_train);
disp("GENERALISATION ERROR"); disp(error_test);




end
