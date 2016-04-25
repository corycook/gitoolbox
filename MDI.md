<font color='FF5B00'><h2> MDI </h2></font>
The main function of algorithm MDI.
<font color='B80028'><h2> syntax </h2></font>
`[dffa, dpfa] = MDI(filename, alpha)`
<font color='B80028'><h2> Description </h2></font>
The main MDI function, learning a PDFA from samples.<br>
The only difference between alergia and MDI is the compatibility tesing.<br>
<br>
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
<pre><code>[dffa, dpfa] = MDI('Data/alergia1.txt',0.5)<br>
<br>
Start building FPTA<br>
Running MDI on FPTA....<br>
Currently no merge is possible, promote...<br>
Currently no merge is possible, promote...<br>
Currently no merge is possible, promote...<br>
Currently no merge is possible, promote...<br>
Currently no merge is possible, promote...<br>
Currently no merge is possible, promote...<br>
Currently no merge is possible, promote...<br>
<br>
ans = <br>
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
                          RED: [1 2 20 21 46 54 55 64]<br>
                         BLUE: [1x0 double]<br>
<br>
  Methods<br>
</code></pre>
<font color='B80028'><h2> See Also </h2></font>
<a href='MDICompatible.md'>MDICompatible</a>,<a href='MDIScore.md'>MDIScore</a>,<a href='MDIStochasticMerege.md'>MDIStochasticMerge</a>,<a href='MDIStochasticFold.md'>MDIStochasticFold</a>,<a href='AutomataSize.md'>AutomataSize</a>,<a href='ProbabilityOfString.md'>ProbabilityOfString</a>