clear;
clc;
% k = 3 machine

% Q = [1 2 3 4 5];
% 
% F = [2 4];
% 
% A = {'0' '1'};
% 
% R = [];
% 
% B = [];
% 
% I = [1];
% 
% T = [2 0
%      3 4
%      3 4
%      5 0
%      0 4];
% 
% dfa = DFA(Q, A, T, I, F, [], [], []);   


% k = 3 machine

Q = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];

F = [13 16 18 20 24 28 29];

A = {'0' '1'};

R = [];

B = [];

I = [1];

T = [2 13
     0 1
     2 28
     25 24
     24 16
     24 5
     26 23
     6 7
     8 5
     18 29
     10 18
     19 1
     13 14
     1 22
     20 16
     4 28
     18 16
     9 17
     18 16
     20 3
     1 28
     1 29
     8 30
     0 1
     4 1
     6 27
     7 23
     3 28
     11 12
     10 29];

dfa = DFA(Q, A, T, I, F, [], [], []);   

% k = 20 machine


% alphabet = {['0'], ['1']};
% I = {['0110101100110101110'], ['1001010011001010001']};
% F = {['1100110011001100110'], ['0110011001100110011']};
% C = {['1111101'], ['11111111110011']};
% T = {['01111001011101001001'], ['00001110001110001110'], ['00011100011100011100'], ['00001111000011110000']};
% kset = {alphabet, I, C, F, T};
% 
% dfa = K2dfa(kset);
fo = fopen('5000.txt', 'w');
fo2 = fopen('5000_test.txt', 'w');
sample = {};

while(length(sample)~=6000)
   
    s = RandomStringGenerator('01', 150);
    
    if (IsStringAccepted(s, dfa))
       sample{length(sample) + 1} = s;
       % display(s); 
       %fprintf(fo, s);
       %fprintf(fo, '\n');
    end
    sample = unique(sample);   
    length(sample)
end


for i = 1:length(sample) 
     if(i <= 1000)
        fprintf(fo2, sample{i});     
        fprintf(fo2, '\n');    
     else
        fprintf(fo, sample{i});     
        fprintf(fo, '\n');
     end
end

fclose(fo);
fclose(fo2);

[training, group, positive, negative] = ReadSamples('D:\MATLAB GI ToolBox Beta 1.1\Data\input3.txt');

%[training, group, positive, negative] = ReadSamples('/home/hasan/projekte/GI-Library/Parallel RPNI/Data/input2.txt');

% PTA = BUILD_PTA(positive);
dfa = RPNI(positive, negative);

 %kset = {alphabet, I, C, F, T};
 
 % kset = {[a b], I, C, F, T};

k = 5;

% group = [1 1 1 1 1 0 0 0 0 0]';

% training = [15 20 30 40 50 1 2 3 4 5]';

indices = crossvalind('Kfold', group, k);

cp = classperf(group);


for i = 1:k
           display('validation..');
           display(i);
           test = (indices == i); train = ~test;
           class = EDSMClassify(training(test,:),training(train,:),group(train,:));
           classperf(cp,class,test);
end

save('cp.mat', 'cp');