(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw3.sml";

val only_capitals_test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val only_capitals_test2 = only_capitals ["Apple", "boat", "cat", "Dog"] = ["Apple", "Dog"]

val longest_string1_test1 = longest_string1 ["A","bc","C"] = "bc"
val longest_string1_test2 = longest_string1 ["A", "apple", "cat", "dog"] = "apple"
val longest_string1_test3 = longest_string1 [] = ""
val longest_string1_test4 = longest_string1 ["apple", "saqib"] = "apple"

val longest_string2_test1 = longest_string2 ["apple", "saqib"] = "saqib"
val longest_string2_test2 = longest_string2 ["apple", "saqib", "eleven", "asdfgh"] = "asdfgh"

val longest_string3_test1 = longest_string3 ["A", "apple", "cat", "dog"] = "apple"
val longest_string3_test2 = longest_string3 ["A","bc","C"] = "bc"

val longest_string4_test1 = longest_string4 ["apple", "saqib", "eleven", "asdfgh"] = "asdfgh"
val longest_string4_test2 = longest_string4 ["A","B","C"] = "C"

val longest_capitalized_test1 = longest_capitalized ["A","bc","C"] = "A"
val longest_capitalized_test2 = longest_capitalized ["Saqib", "Hafeez", "mariamSaddiqua", "rehanaKausar"] = "Hafeez"

val rev_string_test1 = rev_string "abc" = "cba"
val rev_string_test2 = rev_string "tibit" = "tibit"

val first_answer_test1 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val all_answers_test1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val all_answers_test2 = all_answers (fn x => SOME [x]) [2,3,4,5,6,7] = SOME [2, 3, 4, 5, 6, 7]
val all_answers_test3 = all_answers (fn x => if (x mod 2 = 0) then SOME [x, x + 1] else NONE) [2, 4, 6] = SOME [2, 3, 4, 5, 6, 7]

val zipped_list = ListPair.zip ([1, 2, 3], [4, 5, 6])

val all_answers_test4 = all_answers (fn (x, y) => SOME [x + y]) zipped_list = SOME [5, 7, 9]

val test9a = count_wildcards Wildcard = 1
val test9a01 = count_wildcards (Variable "str") = 0
val test9a02 = count_wildcards (TupleP [Wildcard, ConstP 12, Wildcard]) = 2
val test9a03 = count_wildcards (ConstructorP("pattern", (TupleP [Wildcard, ConstP 12, Wildcard]))) = 2

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b01 = count_wild_and_variable_lengths Wildcard = 1
val test9b02 = count_wild_and_variable_lengths (TupleP [Wildcard, ConstP 12, Wildcard]) = 2
val test9b03 = count_wild_and_variable_lengths (TupleP [Wildcard, Variable "str", Wildcard]) = 5
val test9b04 = count_wild_and_variable_lengths (TupleP [Wildcard, Variable "str", Wildcard, Variable "str2"]) = 9
val test9b05 = count_wild_and_variable_lengths (ConstructorP("pattern", (TupleP [Wildcard, ConstP 12, Wildcard]))) = 2
val test9b06 = count_wild_and_variable_lengths (ConstructorP("pattern", (TupleP [Wildcard, Variable "str", Wildcard]))) = 5

val test9c = count_some_var ("x", Variable("x")) = 1
val test9c01 = count_some_var ("x", (TupleP [Wildcard, ConstP 12, Wildcard])) = 0
val test9c02 = count_some_var ("x", (TupleP [Wildcard, Variable "str", Wildcard])) = 0
val test9c03 = count_some_var ("x", (TupleP [Wildcard, Variable "x", Wildcard])) = 1
val test9c04 = count_some_var ("x", (TupleP [Wildcard, Variable "x", Wildcard, Variable "x"])) = 2
val test9c05 = count_some_var ("x", (ConstructorP("pattern", (TupleP [Wildcard, Variable "x", Wildcard])))) = 1
val test9c06 = count_some_var ("x", (ConstructorP("x", (TupleP [Wildcard, Variable "x", Wildcard])))) = 1

val test10 = check_pat (Variable("x")) = true
val test1001 = check_pat (TupleP [Wildcard, Variable "x", Wildcard]) = true
val test1002 = check_pat (TupleP [Wildcard, Variable "x", Variable "y"]) = true
val test1003 = check_pat (TupleP [Wildcard, Variable "x", Variable "x"]) = false
val test1004 = check_pat (ConstructorP("x", (TupleP [Wildcard, Variable "x", Wildcard]))) = true
val test1005 = check_pat (ConstructorP("x", (TupleP [Wildcard, Variable "x", ConstructorP("y", Variable "y")]))) = true
val test1006 = check_pat (ConstructorP("x", (TupleP [Wildcard, Variable "x", ConstructorP("y", Variable "x")]))) = false
val test1007 = check_pat (ConstructorP("x", (TupleP [Wildcard, Variable "x", ConstructorP("y", TupleP [Variable "y"])]))) = true
val test1008 = check_pat (ConstructorP("x", (TupleP [Wildcard, Variable "x", ConstructorP("y", TupleP [Variable "z"])]))) = true
val test1009 = check_pat (ConstructorP("x", (TupleP [Wildcard, Variable "x", ConstructorP("y", TupleP [Variable "x"])]))) = false
val test1010 = check_pat (ConstructorP("x", (ConstructorP("y", TupleP [Variable "x", Variable "y"])))) = true
val test1011 = check_pat (ConstructorP("x", (ConstructorP("y", TupleP [Variable "x", Variable "x"])))) = false
val test1012 = check_pat (TupleP [Wildcard, Variable "x", TupleP [Variable "y"]]) = true

val test11 = match (Const(1), UnitP) = NONE
val test1101 = match (Const(1), ConstP 1) = SOME []
val test1102 = match (Const(1), Variable "s") = SOME [("s", Const(1))]
val test1103 = match (Const(1), TupleP [Wildcard]) = NONE
val test1104 = match (Const(1), TupleP [ConstP 1]) = NONE
val test1105 = match (Tuple [Unit], TupleP [UnitP]) = SOME []
val test1106 = match (Tuple [Tuple [Unit]], TupleP [TupleP[UnitP]]) = SOME []
val test1107 = match (Tuple [Tuple [Unit]], TupleP [TupleP[UnitP, Variable "x"]]) = NONE
val test1108 = match (Tuple [Const(1), Tuple [Unit]], TupleP [ConstP 1, TupleP[UnitP]]) = SOME []
val test1109 = match (Tuple [Const(1), Tuple [Unit, Const(2)]], TupleP [ConstP 1, TupleP[UnitP, Variable("s")]]) = SOME [("s", Const(2))]
val test1110 = match (Tuple [Const(1), Tuple [Unit, Const(2)]], TupleP [ConstP 2, TupleP[UnitP, Variable("s")]]) = NONE
