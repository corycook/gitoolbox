<font color='FF5B00'><h2> RPNI </h2></font>
Regular Positive and Negative Inference
<font color='B80028'><h2> syntax </h2></font>
dfa = RPNI(positive, negative)
<font color='B80028'><h2> Description </h2></font>
RPNI starts from creating PTA according to positive samples. Initialize RED state set and <br>
BLUE state set as following:<br>
<ul><li>set start state as RED state and add it to RED set.<br>
</li><li>add all the successors of start state to BLUE set.<br>
After initialization, RPNI starts to extract each BLUE state and merge it for each RED state. <br>
After each Merge, we examine the new merged DFA if it accepts any negative sample,<br>
</li><li>if it does, abandon such DFA and promote currently manipulated BLUE state and continue another Merge.<br>
</li><li>if it does not accpet any negative sample, update DFA and add all the red states' successors which are not BLUE states to BLUE set. Until there's no BLUE state for Merge.<br>
<font color='B80028'><h2> Example </h2></font>
Snippet in File: <i>input3.txt</i>
<pre><code>6 2<br>
1 1 a<br>
1 2 a a a<br>
1 3 b b a<br>
1 4 a b a b<br>
0 2 a b<br>
0 2 b b<br>
</code></pre>
Run in command window:<br>
<pre><code>[training, group, positive, negative] = ReadSamples('Data/input3.txt');<br>
dfa = RPNI(positive, negative);<br>
<br>
Bulding PTA....<br>
Running RPNI on PTA....<br>
<br>
dfa = <br>
  DFA<br>
  Properties:<br>
    FiniteSetOfStates: [1 2 3 4 5 6 7 8 9 10]<br>
            Alphabets: {'a'  'b'}<br>
     TransitionMatrix: [10x2 double]<br>
         InitialState: 1<br>
    FinalAcceptStates: [1 2 7 9 10]<br>
    FinalRejectStates: []<br>
                  RED: 1<br>
                 BLUE: 3<br>
  Methods<br>
merge accepted<br>
ans =<br>
     1<br>
q_b =<br>
     2<br>
<br>
dfa = <br>
  DFA<br>
  Properties:<br>
    FiniteSetOfStates: [1 2 3 4 5 6 7 8 9 10]<br>
            Alphabets: {'a'  'b'}<br>
     TransitionMatrix: [10x2 double]<br>
         InitialState: 1<br>
    FinalAcceptStates: [1 2 7 8 9 10]<br>
    FinalRejectStates: []<br>
                  RED: [1 3]<br>
                 BLUE: 8<br>
  Methods<br>
<br>
merge accepted<br>
<br>
ans =<br>
     3<br>
q_b =<br>
     6<br>
dfa = <br>
  DFA<br>
  Properties:<br>
    FiniteSetOfStates: [1 2 3 4 5 6 7 8 9 10]<br>
            Alphabets: {'a'  'b'}<br>
     TransitionMatrix: [10x2 double]<br>
         InitialState: 1<br>
    FinalAcceptStates: [1 2 7 8 9 10]<br>
    FinalRejectStates: []<br>
                  RED: [1 3 8]<br>
                 BLUE: [1x0 double]<br>
  Methods<br>
merge accepted<br>
ans =<br>
     1<br>
q_b =<br>
    10<br>
</code></pre>
<font color='B80028'><h2> See Also </h2></font>
<a href='RPNICompatible.md'>RPNI_COMPATIBLE</a>, <a href='RPNIFold.md'>RPNI_FOLD</a>, <a href='RPNIMerge.md'>RPNI_MERGE</a>, <a href='RPNIPromote.md'>RPNI_PROMOTE</a>