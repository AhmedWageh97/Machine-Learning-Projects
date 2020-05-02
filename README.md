# Machine-Learning-Projects
This repository contains some machine learning projects as a practise on machine learning course on Coursera for Prof. Andrew Ng from Stanford University.
# Requirements
* PC
* MATLAB or Octave
# ___Projects___
* [__Project1: Purchase Prediction Project__](https://github.com/AhmedWageh97/Machine-Learning-Projects/tree/master/01-Purchase%20Prediction "Purchase Prediction Project") : 
  *This project is an application on Classification using Logistic Regression algorithm. We have [dataset](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/01-Purchase%20Prediction/Social_Network_Ads.csv) for people who purchased a specific production. We have ID, Gender(1 for males and 0 for females), Age, Salary and purchase status (1 for purchasing and 0 for not). we need to classify it by Age and salary for __purchased__ and __not purchased__ people and develop our prediction model depend on the given dataset. I used people whose age is dividabe by 2 as a __Training Set__ and tested my model by people whose age is not dividabe by 2 as a __Test set__.
  * To test this run [__Purchase.m script__](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/01-Purchase%20Prediction/Purchase.m) on MATLAB or Octave, but make sure that all files in your directory.
  * After that you would show 2 figures: [Figure1](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/01-Purchase%20Prediction/Training%20set%20with%20classifier.PNG) and [Figure2](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/01-Purchase%20Prediction/Test%20set%20with%20classifier.PNG).
      * [Figure1 Training set with output classifier:](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/01-Purchase%20Prediction/Training%20set%20with%20classifier.PNG) shows the result of training set with the classifier which all points above the line most probable to purchase and under the line most probable not to purchase.
      * [Figure2 Test set with output classifier:](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/01-Purchase%20Prediction/Test%20set%20with%20classifier.PNG) shows the result of test set with the classifier which all points above the line most probable to purchase and under the line most probable not to purchase.
  * I also calculated the accuracy of the model after testing the training set and print it to the workspace.
# Coursera course Assignments
* You can find all assignments [here](https://github.com/AhmedWageh97/Machine-Learning-Projects/tree/master/00-Course%20Assignments).
  * [Assignments 1](https://github.com/AhmedWageh97/Machine-Learning-Projects/tree/master/00-Course%20Assignments/machine-learning-ex1): Application on linear regression, cost function, and gradient descent. And this is [Project description](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/00-Course%20Assignments/machine-learning-ex1/ex1.pdf).
  * [Assignments 2](https://github.com/AhmedWageh97/Machine-Learning-Projects/tree/master/00-Course%20Assignments/machine-learning-ex2): Application on logistic regression, cost function, gradient descent, and regularization for solving overfitting problem. And this is [Project description](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/00-Course%20Assignments/machine-learning-ex2/ex2.pdf).
  * [Assignments 3](https://github.com/AhmedWageh97/Machine-Learning-Projects/tree/master/00-Course%20Assignments/machine-learning-ex3): Application on one-vs-all logistic regression and neural
networks to recognize hand-written digits. And this is [Project description](https://github.com/AhmedWageh97/Machine-Learning-Projects/blob/master/00-Course%20Assignments/machine-learning-ex3/ex3.pdf).
