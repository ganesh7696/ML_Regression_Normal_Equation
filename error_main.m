

## HOMEWORK GROUP 42
## GANESH SUDABATHULA
## VINEEL BABU ANUMUKONDA
## SAI MANOHAR REDDY CHERUKUPALLY
## RAHUL VEMULAPALLI

pkg load io;
pkg load statistics;
clear ; close all; clc;
format bank;
X = csvread('insurance.csv');#Reading the data file
X(1,:)=[];
ERR_MAT = zeros(7,3);
k = 0.8;

for m = 1: 7# CALUCALTING ERROR MATRIX
    [l n p]=error_regression(X,k);
    ERR_MAT(m,1) = l;
    ERR_MAT(m,2) = n;
    ERR_MAT(m,3) = p;
    k = k- 0.1;
end

clf;
subplot(2,2,1);
plot(ERR_MAT(:,3),ERR_MAT(:,1))
xlabel("TRAINING SIZE")
ylabel("MODELLING ERROR")
subplot(2,2,2);
plot(ERR_MAT(:,3),ERR_MAT(:,2))
xlabel("TRAINING SIZE")
ylabel("GENERALISATION ERROR")