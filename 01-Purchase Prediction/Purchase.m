  %   Initialization
clear
clc

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
hold on

%   Scale Training Set to match scaled features and Thetas
Train_Data(:, 2) = (Train_Data(:, 2) - mean(Train_Data(:, 2))) ./ (max(Train_Data(:, 2)) - min(Train_Data(:, 2)));
Train_Data(:, 3) = (Train_Data(:, 3) - mean(Train_Data(:, 3))) ./ (max(Train_Data(:, 3)) - min(Train_Data(:, 3)));

for i = 1:length(Train_Data)
    if Train_Data(i,4) == 1
        scatter(Train_Data(i,2), Train_Data(i,3), 'r')
    else
        scatter(Train_Data(i,2), Train_Data(i,3), 'g')
    end
    hold on
end

%   Scale Test Set to match scaled features and Thetas
Test_Data(:, 2) = (Test_Data(:, 2) - mean(Test_Data(:, 2))) ./ (max(Test_Data(:, 2)) - min(Test_Data(:, 2)));
Test_Data(:, 3) = (Test_Data(:, 3) - mean(Test_Data(:, 3))) ./ (max(Test_Data(:, 3)) - min(Test_Data(:, 3)));

%   Plot Test data with the result of classification
figure(2)
plot(X_Plot, Y_Plot, '-k');
hold on

for i = 1:length(Test_Data)
    if Test_Data(i,4) == 1
        scatter(Test_Data(i,2), Test_Data(i,3), 'y')
    else
        scatter(Test_Data(i,2), Test_Data(i,3), 'm')
    end
    hold on
end
