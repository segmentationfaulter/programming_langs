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

fun remove_card (cs, c, e) =
  let
    fun aux (cs, acc) =
      case cs of
        [] => acc
      | hd::cs' => if (hd = c) then acc @ cs' else aux(cs', acc @ [hd])

    val answer = aux(cs, [])
  in
    if answer = cs
    then raise e
    else answer
  end

fun all_same_color (cards) =
  case cards of
    [] => true
  | card::[] => true
  | cards_head::cards_neck::cards' => if (card_color(cards_head) = card_color(cards_neck)) then all_same_color(cards_neck::cards') else false

fun sum_cards (cards) =
  let
    fun aux (cards, sum) =
      case cards of
        [] => sum
      | card::cards' => aux(cards', sum + card_value card)
  in
    aux (cards, 0)
  end

fun score (cards, goal) =
  let
    val sum = sum_cards cards
    val preliminary_score = if (sum > goal)
                            then 3 * (sum - goal)
                            else goal - sum
  in
    if (all_same_color cards)
    then preliminary_score div 2
    else preliminary_score
  end

fun officiate (cards, moves, goal) =
  let
    fun aux (cards, moves, held_cards) =
      case moves of
        [] => score(held_cards, goal)
      | Draw::moves' => (case cards of
                          [] => score(held_cards, goal)
                        | head_cards::cards' => if (sum_cards(head_cards::held_cards) > goal)
                                                then score(head_cards::held_cards, goal)
                                                else aux(cards', moves', head_cards::held_cards))
      | Discard (card_to_discard)::moves' => aux(cards, moves', remove_card(held_cards, card_to_discard, IllegalMove))
  in
    aux (cards, moves, [])
  end

