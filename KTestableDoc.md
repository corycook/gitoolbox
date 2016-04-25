# Introduction #
A regular language can be parsed in certain bounded memory. But sometimes we have to learn a DFA <br>
from a subclass of language in which the memory is bounded as a priori. Given a size K of memory, we should <br>
try to find an automaton for the language. This subclass of language is called K-testable lanugage which has the <br>
property that the next character is only dependent on the previous <i>k-1</i> characters. The machine designed to <br>
learn K-testable language is a K-testable machine. Our implementation has designed such a machine and managed <br>
to output a DFA from a set of K-testable language.<br>
<br>
<h1>Function List</h1>
We've implemented following functions for KTestable:<br>
<ul><li><a href='K2dfa.md'>K2dfa</a>
</li><li><a href='KSET.md'>KSET</a>
</li><li><a href='KBuilder.md'>KBuilder</a>