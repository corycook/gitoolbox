<font color='FF5B00'><h2> KBuilder </h2></font>
Create K-testable language from samples
<font color='B80028'><h2> syntax </h2></font>
kset = KBuilder(filename, k)
<font color='B80028'><h2> Description </h2></font>
Read samples from file and convert it into a K-Testable language<br>
<b>Input:</b> <i>filename</i>,the path of sample file;  <i>k</i>, the learning parameter k<br>
<b>Output:</b> return a K-testable language<br>
<font color='B80028'><h2> Example </h2></font>
Snippet of File: <i>k1.txt</i>
<pre><code>0000000001<br>
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
</code></pre>
Run in command window:<br>
<pre><code>&gt;&gt; kset = KBuilder('Data/k1.txt', 3)<br>
<br>
kset = <br>
<br>
  KSET<br>
<br>
  Properties:<br>
    Alphabets: {'0'  '1'}<br>
         ISET: {'00'  '01'}<br>
         CSET: {'0'  '01'}<br>
         FSET: {'01'}<br>
         TSET: {'000'  '001'  '010'  '101'}<br>
</code></pre>
<font color='B80028'><h2> See Also </h2></font>
<a href='K2dfa.md'>K2dfa</a>, <a href='KSET.md'>KSET</a>