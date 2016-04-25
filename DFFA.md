<font color='FF5B00'><h2> DFFA </h2></font>
Deterministic Frequency Finite Automaton
<font color='B80028'><h2> syntax </h2></font>
obj = DFFA(q, a, ifr, ffr, ftm, atm, red, blue)
<font color='B80028'><h2> Description </h2></font>
The DFFA is defined as a Class comprised of following properties:
  * **FiniteSetOfStates:** The set of finite states donated as Q
  * **Alphabets:** The set of alphabets
  * **InitialStateFrequency:** The frequency set of initial states there is exactly only one initial state whose initial state frequency is not zero.
  * **FinalStateFrequency:** The frequency set of final states.
  * **FrequencyTransitionMatrix:** The transition matrix of frequency indicating how many strings transmitting from one state to another.
  * **AssociateTransitionMatrix:** The associate transition matrix, the general state transition matrix.
  * **RED:** Set of all the red states
  * **BLUE:** Set of all the blue states
<font color='B80028'><h2> See Also </h2></font>
[DFA](DFA.md),[DPFA](DPFA.md),[Build\_FPTA](Build_FPTA.md),[Build\_PTA](BuildPTA.md), [ReadSamples](ReadSamples.md), [TraversedState](TraversedState.md)