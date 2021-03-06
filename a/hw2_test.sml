(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw2.sml";

val all_except_option_test1 = all_except_option ("string", ["string"]) = SOME []
val all_except_option_test2 = all_except_option ("cat", ["apple", "boat", "cat", "dog"]) = SOME ["apple", "boat", "dog"]
val all_except_option_test3 = all_except_option ("string", []) = NONE
val all_except_option_test4 = all_except_option ("string", ["abc"]) = NONE

val get_substitutions1_test1 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val get_substitutions1_test2 = get_substitutions1 ([["Fred", "Fredrick"],["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]], "Jeff") = ["Jeffrey", "Geoff", "Jeffrey"]
val get_substitutions1_test3 = get_substitutions1 ([["Fred", "Fredrick"],["Elizabeth", "Betty"], ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick", "Freddie", "F"]
val get_substitutions1_test4 = get_substitutions1 ([], "foo") = []

val get_substitutions2_test1 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val get_substitutions2_test2 = get_substitutions2 ([["Fred", "Fredrick"],["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]], "Jeff") = ["Jeffrey", "Geoff", "Jeffrey"]
val get_substitutions2_test3 = get_substitutions2 ([["Fred", "Fredrick"],["Elizabeth", "Betty"], ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick", "Freddie", "F"]
val get_substitutions2_test4 = get_substitutions2 ([], "foo") = []

val similar_names_test1 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val similar_names_test2 = similar_names([], {first="Fred", middle="W", last="Smith"}) = [{first="Fred", middle="W", last="Smith"}]

val card_color_test1 = card_color (Clubs, Num 2) = Black
val card_color_test2 = card_color (Hearts, Num 2) = Red

val card_value_test1 = card_value (Clubs, Num 2) = 2
val card_value_test2 = card_value (Clubs, Ace) = 11 
val card_value_test3 = card_value (Hearts, King) = 10 
val card_value_test4 = card_value (Clubs, Num 10) = 10 

val remove_card_test1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val remove_card_test2 = remove_card ([(Hearts, Ace), (Clubs, Num 3), (Spades, King)], (Clubs, Num 3), IllegalMove) = [(Hearts, Ace) , (Spades, King)]
val remove_card_test3 = remove_card ([(Hearts, Ace), (Clubs, Num 3), (Spades, King)], (Spades, King), IllegalMove) = [(Hearts, Ace) , (Clubs, Num 3)]

val all_same_color_test1 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val all_same_color_test2 = all_same_color [(Hearts, Ace), (Diamonds, Ace)] = true
val all_same_color_test3 = all_same_color [(Hearts, Ace), (Diamonds, Ace), (Clubs, King)] = false
val all_same_color_test4 = all_same_color [(Spades, Ace), (Clubs, Queen), (Clubs, King)] = true

val sum_cards_test1 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val sum_cards_test2 = sum_cards [] = 0
val sum_cards_test3 = sum_cards [(Clubs, Num 5),(Clubs, King)] = 15 
val sum_cards_test4 = sum_cards [(Clubs, Num 5),(Clubs, King), (Hearts, Jack), (Spades, Ace), (Spades, Num 2)] = 38 

val score_test1 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val score_test2 = score ([(Hearts, Num 2),(Clubs, Num 4)],5) = 3
val score_test3 = score ([(Hearts, Num 2),(Diamonds, Num 4), (Hearts, Ace)],15) = 3

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
