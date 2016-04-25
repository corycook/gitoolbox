<font color='FF5B00'><h2> EDSM </h2></font>
Evidence driven state merging
<font color='B80028'><h2> syntax </h2></font>
dfa = EDSM(positive, negative)
<font color='B80028'><h2> Description </h2></font>
EDSM starts from creating PTA according to positive samples. Initialize RED state set <br>
and BLUE state set as following: <br>
1. set start state as RED state and add it to RED set. <br>
2. add all the successors of start state to BLUE set. <br>
After initialization, EDSM starts to merge blue and red states pairwise. After each Merge, <br>
we caculate the score of the merged DFA by <a href='EDSMCount.md'>EDSM_Count</a> Select the merge <br>
with highest score as the optimal merge, if there's no merge possible, then promote current<br>
blue state until there's no BLUE state for Merge.<br>
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
<pre><code>&gt;&gt; [train, group, positive, negative] = ReadSamples('Data/input3.txt')<br>
&gt;&gt; EDSM(positive, negative)<br>
      Bulding PTA....<br>
      Running EDSM on PTA....<br>
<br>
      dfa = <br>
<br>
      DFA<br>
<br>
      Properties:<br>
       FiniteSetOfStates: [1 2 3 4 5 6 7 8 9 10]<br>
               Alphabets: {'a'  'b'}<br>
        TransitionMatrix: [10x2 double]<br>
            InitialState: 1<br>
       FinalAcceptStates: [2 7 9 10]<br>
       FinalRejectStates: []<br>
                  RED: 1<br>
                  BLUE: [2 3]<br>
      ...<br>
      ...<br>
     ans = <br>
<br>
     DFA<br>
<br>
     Properties:<br>
       FiniteSetOfStates: [1 2 3 4 5 6 7 8 9 10]<br>
               Alphabets: {'a'  'b'}<br>
        TransitionMatrix: [10x2 double]<br>
            InitialState: 1<br>
       FinalAcceptStates: [2 7 9 10]<br>
       FinalRejectStates: [5 1]<br>
                     RED: [1 2 5]<br>
                     BLUE: [1x0 double]<br>
</code></pre>
<font color='B80028'><h2> See Also </h2></font>
<a href='EDSMCount.md'>EDSM_Count</a>, <a href='EDSMFold.md'>EDSM_FOLD</a>, <a href='EDSMMerge.md'>EDSM_MERGE</a>, <a href='EDSMPromote.md'>EDSM_PROMOTE</a>