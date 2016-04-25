<font color='FF5B00'><h2> Alergia </h2></font>
The main function of algorithm Alergia.
<font color='B80028'><h2> syntax </h2></font>
`[dffa, dpfa] = Alergia(filename, alpha)`
<font color='B80028'><h2> Description </h2></font>
Alergia starts from creating FPTA according to samples. Initialize RED state set and <br>
BLUE state set as following:<br>
<ul><li>set start state as RED state and add it to RED set.<br>
</li><li>add all the successors of start state to BLUE set.<br>
After initialization, Alergia starts to extract each BLUE state and merge it for each RED state. <br>
Only the state with a frequency larger than some threshold should be able to be merged. <br>
If no merge is possible, promote currently manipulated BLUE state. You can see that this <br> algorithm is simply a variation of RPNI with the capacity to deal the probabilistic <br> problems. The main difference stands at the point of examining the compatibility of <br> a merge.</li></ul>

<font color='B80028'><h2> Example </h2></font>
Snippet in File: <i>alergia_data.txt</i>
<pre><code>ba<br>
bbbb<br>
ba<br>
bbaba<br>
b<br>
bb<br>
<br>
<br>
<br>
<br>
bbba<br>
</code></pre>
Notice that samples can contain empty string. <br>
Run in command window:<br>
<pre><code>[dffa, dpfa] = Alergia('Data/alergia1.txt',0.05)<br>
<br>
Start building FPTA<br>
Running Alergia on FPTA....<br>
Currently no merge is possible, promote...<br>
Currently no merge is possible, promote...<br>
Merge accepted...<br>
<br>
q_r =<br>
<br>
     2<br>
<br>
<br>
q_b =<br>
<br>
    21<br>
<br>
Merge accepted...<br>
<br>
q_r =<br>
<br>
     2<br>
<br>
<br>
q_b =<br>
<br>
     3<br>
<br>
Merge accepted...<br>
<br>
q_r =<br>
<br>
    20<br>
<br>
<br>
q_b =<br>
<br>
    10<br>
<br>
Merge accepted...<br>
<br>
q_r =<br>
<br>
     1<br>
<br>
<br>
q_b =<br>
<br>
    46<br>
<br>
<br>
dffa = <br>
<br>
  DFFA<br>
<br>
  Properties:<br>
            FiniteSetOfStates: [91x1 double]<br>
                    Alphabets: {'b'  'a'}<br>
        InitialStateFrequency: [91x1 double]<br>
          FinalStateFrequency: [91x1 double]<br>
    FrequencyTransitionMatrix: {[91x2 double]  [91x2 double]}<br>
    AssociateTransitionMatrix: [91x2 double]<br>
                          RED: [1 2 20]<br>
                         BLUE: [1x0 double]<br>
<br>
  Methods<br>
<br>
<br>
dpfa = <br>
<br>
  DPFA<br>
<br>
  Properties:<br>
              FiniteSetOfStates: [91x1 double]<br>
                      Alphabets: {'b'  'a'}<br>
                   InitialState: 1<br>
          FinalStateProbability: [91x1 double]<br>
    ProbabilityTransitionMatrix: {[91x2 double]  [91x2 double]}<br>
      AssociateTransitionMatrix: [91x2 double]<br>
                            RED: [1 2 20]<br>
                           BLUE: [1x0 double]<br>
<br>
  Methods<br>
</code></pre>
<font color='B80028'><h2> See Also </h2></font>
<a href='AlergiaCompatible.md'>AlergiaCompatible</a>,<a href='AlergiaTest.md'>AlergiaTest</a>,<a href='AlergiaStochasticMerge.md'>AlergiaStochasticMerge</a>,<a href='AlergiaStochasticFold.md'>AlergiaStochasticFold</a>,<a href='dffa2dpfa.md'>dffa2dpfa</a>,<a href='FreqOfState.md'>FreqOfState</a>