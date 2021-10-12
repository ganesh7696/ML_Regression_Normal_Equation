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
regression(X,0.8);# change k value i.e. 0.8 --> 0.2 here for all diferent training and test sizes asked in the assignment


