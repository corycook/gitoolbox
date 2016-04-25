## About GI-Toolbox ##
We gave GI-Toolbox's birth since June in 2010. Our goal is simple. We are aiming to provide
users a robust and effective toolbox for grammatical inference. We'll try our best to contribute
to this field as much as we can. We hope that our project can invoke more people's interest on
grammatical inference and of cause any intention to join us is warmly welcome.

## Preliminary ##
In order to use the toolbox, you need at least a legal copy of Matlab, you can get more information
from [here](http://www.mathworks.com/products/matlab/) or you can also download [Octave](http://www.gnu.org/software/octave/).
Since we presume that users who're about to use our toolbox already have some basic knowledge of grammatical
inference, so we're not going to spend time on giving any theoretical tutorial.
### Data Structure of DFA ###
```
     A DFA contains 6 sets:
     FiniteSetOfStates  
        FiniteSetOfStates is the set of finite states donated as Q
     Alphabets
        The set of alphabets
     TransitionMatrix
        The state transition matrix.
     InitialState
        The set of initial states
     FinalAcceptStates
        The set of final accepting states
     FinalRejectStates
        The rejecting states
```

### Data Structure of KSET ###
```
    A KSET contains 5 sets:
    Alphabets
        The set of alphabets
    ISET
        Prefixes of length k-1 and suffixes (or finals) of length k-1   
    CSET
        Short strings with length < k
    FSET
        Prefixes of length k-1 and suffixes (or finals) of length k-1
    TSET
        Allowed segments
```

### Data Structure of DFFA ###
```
    FiniteSetOfStates  
           The set of finite states denoted as Q
    Alphabets   
           The set of alphabets
   InitialStateFrequency
           The frequency set of initial states
   FinalStateFrequency 
           The frequency set of final states
   FrequencyTransitionMatrix
           The transition matrix of frequency
   AssociateTransitionMatrix
           The associate transition matrix 
   RED
           The set of Red states
   BLUE 
           The set of Blue states
```

### Data Structure of DPFA ###
```
   FiniteSetOfStates
           The set of finite states denoted as Q
   Alphabets
           The set of alphabets
   InitialState
           The initial state
   FinalStateProbability
           The probability set of final states
   ProbabilityTransitionMatrix
           The transition matrix of probability
   AssociateTransitionMatrix
           The associate transition matrix 
   RED 
           The set of Red states
   BLUE
           The set of Blue states
```

### Data Structure of TRANSDUCER ###
```
   FiniteSetOfStates
           A set of states
   InAlphabets
           A set of input alphabets 
   OuAlphabets
           A set of output alphabets  
   InitialState
           Initial state
   StateTransition       
           Transition from state q to q'
   OutputTransduction    
           Tranduction by input character
   StateOutputs        
           The output function at each state
   RED
           The red set
   BLUE
           The blue set
```

### Data Input Format ###
In order to make your program runnable, you should follow the format of input sample.
  * For **[RPNI](RPNIDoc.md)** and **[EDSM](EDSMDoc.md)** which require both positive and negative sample,
> > The input data should look like this:
```
    6 2
    1 1 a
    1 2 a a a
    1 3 b b a
    1 4 a b a b
    0 2 a b
    0 2 b b
```
> > The header line indicates the total number of samples (here is 6) and the number of different alphabets (here is 2).
> > Then each line represents a sample, the first bit of which indicate if it's positive sample (1) or negative (0), the second bit
> > indicates the length of the sample and following is the real sample string.
  * For **[K-Testable](KTestableDoc.md)** which requires only positive sample, the input data should look like this:
```
    abb
    aac
    abba
    abbbba
    ccdd
```
> > The data format for KTestable is much more simple. Each line corresponds to a positive sample.

## A Simple Example ##
After downloading the toolbox, extract to any place you want and switch to the root folder in Matlab. Assume that you have a
sample file _"input.txt"_ formated as above for RPNI, open the command line window in Matlab and type:
```
[training, group, positive, negative] = ReadSamples('input.txt');
```
And then type:
```
dfa = RPNI(positive, negative)
```
Now you got a **DFA** learned from sample _"input.txt"_
More instructions can be found on the left.

[[To the Top](Manpage#About_GI-Toolbox.md)]