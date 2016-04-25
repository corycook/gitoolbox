<font color='FF5B00'><h2> DFFA </h2></font>
Deterministic Probabilistic Finite Automaton
<font color='B80028'><h2> syntax </h2></font>
function obj = DPFA(q, a, i, fsp, ptm, atm, red, blue)
<font color='B80028'><h2> Description </h2></font>
The DFFA is defined as a Class comprised of following properties:
  * **FiniteSetOfStates:** The set of finite states donated as Q
  * **Alphabets:** The set of alphabets
  * **InitialState:** The initial state.
  * **FinalStateProbability:** The probability set of final states.
  * **ProbabilityTransitionMatrix:** The transition matrix of probability indicating the probability of transmitting from one state to another.
  * **AssociateTransitionMatrix:** The associate transition matrix, the general state transition matrix.
  * **RED:** Set of all the red states
  * **BLUE:** Set of all the blue states
<font color='B80028'><h2> See Also </h2></font>
[DFA](DFA.md),[DFFA](DFFA.md),[Build\_FPTA](Build_FPTA.md),[Build\_PTA](BuildPTA.md), [ReadSamples](ReadSamples.md), [TraversedState](TraversedState.md)