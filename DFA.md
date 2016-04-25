<font color='FF5B00'><h2> DFA </h2></font>
Deterministic Finite Automaton
<font color='B80028'><h2> syntax </h2></font>
obj = DFA(q, a, tm, i, fa, fr, red, blue)
<font color='B80028'><h2> Description </h2></font>
The DFA is defined as a Class comprised of following properties:
  * **FiniteSetOfStates:** The set of finite states donated as Q
  * **Alphabets:** The set of alphabets
  * **TransitionMatrix:** The state transition matrix.
  * **InitialState:** The set of initial states
  * **FinalAcceptStates:** The set of final accepting states
  * **FinalRejectStates:** The rejecting states
  * **RED:** Set of all the red states
  * **BLUE:** Set of all the blue states
<font color='B80028'><h2> See Also </h2></font>
[Build\_PTA](BuildPTA.md), [ReadSamples](ReadSamples.md), [TraversedState](TraversedState.md)