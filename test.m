% clear;
% clc;
[training, group, positive, negative] = ReadSamples('Data/input3.txt');

%[training, group, positive, negative] = ReadSamples('/home/hasan/projekte/GI-Library/Parallel RPNI/Data/input2.txt');

% PTA = BUILD_PTA(positive);
dfa = RPNI(positive, negative);

%k = 5;

% group = [1 1 1 1 1 0 0 0 0 0]';

% training = [15 20 30 40 50 1 2 3 4 5]';

%indices = crossvalind('Kfold', group, k);

%cp = classperf(group);


%for i = 1:k
%           display('validation..');
%           display(i);
%           test = (indices == i); train = ~test;
%           class = RPNIClassify(training(test,:),training(train,:),group(train,:));
%           classperf(cp,class,test);
%end

%save('cp.mat', 'cp');