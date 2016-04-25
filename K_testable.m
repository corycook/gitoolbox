[training, group, positive, negative] = ReadSamples('./Data/input3.txt');
kset = KBuilder(positive, 2);
dfa = K2dfa(kset);


