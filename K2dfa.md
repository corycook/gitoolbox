<font color='FF5B00'><h2> K2dfa </h2></font>
Convert K-testable language to automaton
<font color='B80028'><h2> syntax </h2></font>
dfa = K2dfa(filename, k)
<font color='B80028'><h2> Description </h2></font>
This function reads samples from file and return a DFA by k-testable language <br>
<b>Input:</b> <i>filename</i>, The path of sample file;  <i>k</i>, the learning parameter k; <br>
<b>Output:</b> Return a DFA <br>
<font color='B80028'><h2> Example </h2></font>
Snippet of <i>File: k1.txt</i>
<pre><code>...<br>
0000000001<br>
000000001<br>
00000001<br>
0000001<br>
000001<br>
00000101<br>
0000010101<br>
00001<br>
0000101<br>
0001<br>
000101<br>
001<br>
00101<br>
...<br>
</code></pre>
Run in command window:<br>
<pre><code>&gt;&gt; K2dfa('Data/k1.txt', 3)<br>
<br>
ans = <br>
<br>
  DFA<br>
<br>
  Properties:<br>
    FiniteSetOfStates: [1 2 3 4 5]<br>
            Alphabets: {'0'  '1'}<br>
     TransitionMatrix: [5x2 double]<br>
         InitialState: 1<br>
    FinalAcceptStates: [4 2]<br>
    FinalRejectStates: []<br>
                  RED: []<br>
                 BLUE: []<br>
<br>
</code></pre>
<font color='B80028'><h2> See Also </h2></font>
<a href='KSET.md'>KSET</a>, <a href='KBuilder.md'>KBuilder</a>