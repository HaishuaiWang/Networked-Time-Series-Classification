clc;clear;
namdaA=1;
namdaI=1;
namda=1;
Xtrain=[1 2 2 1 -2 -2
        2 1 -1 -2 1 -1
        1 1 1 1 1 1];
Xtest=[1 2 2 1 -3 -3
        3 1 -1 -3 1 -1
        1 1 1 1 1 1];
Ytrain=[1 0 0
        1 0 0 
        0 1 0 
        0 1 0 
        0 0 1 
        0 0 1];
Ytest= [1 0 0
        1 0 0 
        0 1 0 
        0 1 0 
        0 0 1 
        0 0 1];
 Network=[1 1 0 0 0 0
    1 1 0 0 0 0 
    0 0 1 1 0 0 
    0 0 1 1 0 0 
    0 0 0 0 1 1 
    0 0 0 0 1 1];
[acc_train, acc_test, W_tp1] = NetRLS(Xtrain, Ytrain, Network, Xtest, Ytest, namdaA, namdaI, namda);
acc_train
acc_test
W_tp1
