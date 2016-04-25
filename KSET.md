<font color='FF5B00'><h2> KSET </h2></font>
The definition of K-testable Language
<font color='B80028'><h2> syntax </h2></font>
obj = KSET(Alphabets, ISET, CSET, FSET, TSET)
<font color='B80028'><h2> Description </h2></font>
The KSET is defined as a Class comprised of following properties:
  * **Alphabets**  The set of alphabets
  * **ISET**   Prefixes of length k-1 and suffixes (or finals) of length k-1
  * **CSET**  Short strings with length < k
  * **FSET**  Prefixes of length k-1 and suffixes (or finals) of length k-1
  * **TSET**  Allowed segments
<font color='B80028'><h2> See Also </h2></font>
[K2dfa](K2dfa.md), [KBuilder](KBuilder.md)