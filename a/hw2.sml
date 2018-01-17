(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option (needle, haystack) =
  case haystack of
    [] => NONE
  | head::rest_of_haystack => let fun aux (head: string, rest_of_haystack: string list, acc: string list) =
                         if same_string(head, needle)
                         then SOME (acc @ rest_of_haystack)
                         else case rest_of_haystack of
                                [] => NONE
                              | x :: rest_of_haystack' => aux(x, rest_of_haystack', acc @ [head])
                       in
                         aux(head, rest_of_haystack, [])
                       end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
