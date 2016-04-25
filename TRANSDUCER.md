<font color='FF5B00'><h2> TRANSDUCER</h2></font>
Data structure for Transducer
<font color='B80028'><h2> syntax </h2></font>
function obj = TRANSDUCER(q, ia, oa, i, st, ot, so, red, blue)
<font color='B80028'><h2> Description </h2></font>
The TRANSDUCER is defined as a Class comprised of following properties:
  * **FiniteSetOfStates:** The set of finite states donated as Q
  * **InAlphabets:** The set of input alphabets
  * **OuAlphabets:** The set of output alphabets
  * **InitialState:** The initial state.
  * **StateTransition:**  Transition from state q to q'.
  * **OutputTransduction:** Tranduction by input character.
  * **StateOutputs:** The output function at each state.
  * **RED:** Set of all the red states
  * **BLUE:** Set of all the blue states
<font color='B80028'><h2> See Also </h2></font>
[OSTIA](OSTIA.md),[OSTIA\_Merge](OSTIAMerge.md),[OSTIA\_Fold](OSTIAFold.md),[OSTIA\_Outputs](OSTIAOutputs.md),[OSTIA\_PushBack](OSTIAPushBack.md),[Build\_PTT](Build_PTT.md),[Onward\_PTT](OnwardPTT.md),[LongestCommonPrefix](LCP.md)