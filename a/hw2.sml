(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option (needle, haystack) =
  let
    fun aux (haystack_head, haystack_tail, acc) =
      if same_string(haystack_head, needle)
      then SOME (acc @ haystack_tail)
      else
        case haystack_tail of
          [] => NONE
        | haystack_neck::haystack_body => aux(haystack_neck, haystack_body, acc @ [haystack_head])
  in
    case haystack of
      [] => NONE
    | haystack_head::haystack_tail => aux(haystack_head, haystack_tail, [])
  end

fun get_substitutions1 (substitutions, s) =
  case substitutions of
    [] => []
  | head_list::substitutions' => case all_except_option(s, head_list) of
                                   NONE => get_substitutions1(substitutions', s)
                                 | SOME string_list => string_list @ get_substitutions1(substitutions', s)

fun get_substitutions2 (substitutions, s) =
  let
    fun aux (substitutions, acc) =
      case substitutions of
        [] => acc
      | head_list::substitutions' => case all_except_option(s, head_list) of
                                       NONE => aux(substitutions', acc)
                                     | SOME string_list => aux(substitutions', acc @ string_list)
  in
    aux(substitutions, [])
  end

fun similar_names (substitutions, {first=first, last=last, middle=middle}) =
  let
    val substitue_names = get_substitutions2(substitutions, first)
    fun form_full_names (substitue_names, acc) =
      case substitue_names of
        [] => acc
      | hd::substitue_names' => form_full_names(substitue_names', acc @ [{first=hd, last=last, middle=middle}])
  in
    form_full_names (substitue_names, [{first=first, last=last, middle=middle}])
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

fun card_color (suit, _) =
  case suit of
    Clubs => Black
  | Spades => Black
  | _ => Red

fun card_value (_, rank) =
  case rank of
    Num value => value
  | Ace => 11
  | _ => 10
