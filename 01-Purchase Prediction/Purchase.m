%   Initialization
clear
clc
hold off
close all

%   Import Data Set
Data = readtable('Social_Network_Ads.csv');
%   From Table to matrix
Data = Data{:,:};

%   Select Training Set
%Train_Data = Data(1:length(Data)/2 ,2:end);
Train_Data = Data(:,2:end);
%   Select Test Set Odd Age people only
Test_Data  = Data(mod(Data(:,3),2) == 1, 2:end);

%   Initialized value of Thetas
Theta = zeros(3,1);

%   Feature Scaling
global X_Data
X_Data = [ones(1,length(Data)); Data(:, 3)'; Data(:, 4)'];
X_Data = [X_Data(1, :); (X_Data(2, :) - mean(Train_Data(:, 2))) ./ (max(Train_Data(:, 2)) - min(Train_Data(:, 2))); (X_Data(3, :) - mean(Train_Data(:, 3))) ./ (max(Train_Data(:, 3)) - min(Train_Data(:, 3)))];

%   Defining the output
global Y_Data
Y_Data =  Train_Data(:,end);

%   Number of Iterations For Gradient Descent
Iter_Times = 100;

%   MATLAB will find best Thetas for me

%   Setting optemization options
options = optimset('GradObj', 'on', 'MaxIter', Iter_Times);

%   Start optimization to find Thetas
[FinalThetas CostVal Flagg] = fminunc(@Cost_Function, Theta, options);

%   Plot Training data with the result of classification
figure(1)
X_Plot = [-1: 0.05: 1];
Y_Plot = -(FinalThetas(1) + X_Plot * FinalThetas(2)) / (FinalThetas(3));
plot(X_Plot, Y_Plot, '-k');
set(gcf,'name','Training set with output classifier')
hold on

%   Scale Training Set to match scaled features and Thetas
Train_Data(:, 2) = (Train_Data(:, 2) - mean(Train_Data(:, 2))) ./ (max(Train_Data(:, 2)) - min(Train_Data(:, 2)));
Train_Data(:, 3) = (Train_Data(:, 3) - mean(Train_Data(:, 3))) ./ (max(Train_Data(:, 3)) - min(Train_Data(:, 3)));

%   Initialize data to scatter "To be available to legend with no errors"
Purchasing_Coordinates = zeros(1,2);
Not_Purchasing_Coordinates = zeros(1,2);


for i = 1:length(Train_Data)
    if Train_Data(i,4) == 1
        Purchasing_Coordinates(end + 1, :) = [Train_Data(i,2) Train_Data(i,3)];        
    else
        Not_Purchasing_Coordinates(end + 1, :) = [Train_Data(i,2) Train_Data(i,3)];
    end
    hold on
end

%   Plotting data
scatter(Purchasing_Coordinates(2:end, 1), Purchasing_Coordinates(2:end ,2), 'r')
scatter(Not_Purchasing_Coordinates(2:end ,1), Not_Purchasing_Coordinates(2:end ,2), 'g')

%   Labeling the figure
title('Training set with result of Logistic Regression')
xlabel('Age (After scaling)')
ylabel('Salary (After scaling)')

legend('Classifier Edge','Will purchase','Will not Purchase')

%   Scale Test Set to match scaled features and Thetas
Test_Data(:, 2) = (Test_Data(:, 2) - mean(Test_Data(:, 2))) ./ (max(Test_Data(:, 2)) - min(Test_Data(:, 2)));
Test_Data(:, 3) = (Test_Data(:, 3) - mean(Test_Data(:, 3))) ./ (max(Test_Data(:, 3)) - min(Test_Data(:, 3)));

%   Plot Test data with the result of classification
figure(2)
plot(X_Plot, Y_Plot, '-k');
set(gcf,'name','Test set with output classifier')
hold on

%   Initialize data to scatter "To be available to legend with no errors"
Purchasing_Coordinates = zeros(1,2);
Not_Purchasing_Coordinates = zeros(1,2);


for i = 1:length(Test_Data)
    if Test_Data(i,4) == 1
        Purchasing_Coordinates(end + 1, :) = [Test_Data(i,2) Test_Data(i,3)];        
    else
        Not_Purchasing_Coordinates(end + 1, :) = [Test_Data(i,2) Test_Data(i,3)];
    end
    hold on
end

%   Plotting data
scatter(Purchasing_Coordinates(2:end, 1), Purchasing_Coordinates(2:end ,2), 'y')
scatter(Not_Purchasing_Coordinates(2:end ,1), Not_Purchasing_Coordinates(2:end ,2), 'c')

%   Labeling the figure
title('Test set with result of Logistic Regression')
xlabel('Age (After scaling)')
ylabel('Salary (After scaling)')

legend('Classifier Edge','Will purchase','Will not Purchase')