# Introduction #
Alergia algorithm is another state-merging algorithm following the same <br>
idea with <a href='RPNI.md'>RPNI</a> but from the probabilistic view. Corresponding with <br>
Deterministic Finite Automata, there's a term of Deterministic Probabilistic <br>
Finite Automata (<a href='DPFA.md'>DPFA</a>) and Deterministic Frequency Finite Automata (<a href='DFFA.md'>DFFA</a>). <br>
In practice, we are dealing with frequency of samples most of time, but it is very <br> trivial to convert a DFFA to DPFA. Alergia is such a learning algorithm which is able <br>
to learn a DFFA and its corresponding DPFA from a sample containing duplicate strings. <br>
Check the function pages to view more details about the algorithm.<br>
<br>
<h1>Function List</h1>
We've implemented following functions for Alergia:<br>
<ul><li><a href='DFFA.md'>DFFA</a>
</li><li><a href='DPFA.md'>DPFA</a>
</li><li><a href='Build_FPTA.md'>Build_FPTA</a>
</li><li><a href='Alergia.md'>Alergia</a>
</li><li><a href='AlergiaCompatible.md'>AlergiaCompatible</a>
</li><li><a href='AlergiaTest.md'>AlergiaTest</a>
</li><li><a href='AlergiaStochasticMerge.md'>AlergiaStochasticMerge</a>
</li><li><a href='AlergiaStochasticFold.md'>AlergiaStochasticFold</a>
</li><li><a href='dffa2dpfa.md'>dffa2dpfa</a>
</li><li><a href='FreqOfState.md'>FreqOfState</a>