(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let
	val r = g f1 f2
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals strings =
  List.filter (fn str => Char.isUpper(String.sub(str, 0))) strings

fun longest_string1 strings =
  case strings of
    [] => ""
  | _ => List.foldl (fn (str, acc) => if String.size(str) > String.size(acc) then str else acc) "" strings

fun longest_string2 strings =
  case strings of
    [] => ""
  | _ => List.foldr (fn (str, acc) => if String.size(str) > String.size(acc) then str else acc) "" strings

fun longest_string_helper predicate strings =
  case strings of
    [] => ""
  | _ => List.foldl (fn (str, acc) => if predicate(String.size(str), String.size(acc)) then str else acc) "" strings

val longest_string3 = longest_string_helper (fn (x, y) => x > y)
val longest_string4 = longest_string_helper (fn (x, y) => x >= y)

val longest_capitalized = (longest_string1 o only_capitals)

val rev_string = (String.implode o List.rev o String.explode)

fun first_answer f elements =
  case elements of
    [] => raise NoAnswer
  | hd::elements' => case (f hd) of
                       NONE => first_answer f elements'
                     | SOME v => v

fun all_answers f elements =
  case elements of
    [] => SOME []
  | hd::elements' => case (f hd) of
                       NONE => NONE
                     | SOME lst => SOME (lst @ valOf(all_answers f elements'))

val count_wildcards = g (fn () => 1) (fn (str) => 0)

val count_wild_and_variable_lengths = g (fn () => 1) (fn (str) => String.size(str))

fun count_some_var (str, pattern) =
  g (fn () => 0) (fn (varStr) => if str = varStr then 1 else 0) pattern

fun check_pat pattern =
  let
    fun get_variable_strings pattern =
      case pattern of
        Variable str => [str]
      | TupleP ps => List.foldl (fn (p, acc) => acc @ get_variable_strings(p)) [] ps
      | ConstructorP (_, p) => get_variable_strings p
      | _ => []
    fun duplicates_exist strings =
      case strings of
        [] => false
      | str::[] => false
      | str::strings' => (List.exists (fn (s) => if s = str then true else false) strings') orelse duplicates_exist strings'
  in
    not ((duplicates_exist o get_variable_strings) pattern)
  end

fun match (value, pattern) =
  case (value, pattern) of
    (_, Wildcard) => SOME []
  | (_, Variable str) => SOME [(str, value)]
  | (Unit, UnitP) => SOME []
  | (Const x, ConstP y) => if (x = y) then SOME [] else NONE
  | (Tuple vals, TupleP ps) => (
    if (length vals <> length ps)
    then NONE
    else all_answers (fn (v, p) => (
      case match (v, p) of
        NONE => NONE
      | SOME lst => SOME lst
    )) (ListPair.zip (vals, ps))
  )
  | (Constructor (str, valu), ConstructorP (strP, p)) => (
    if (str <> strP)
    then NONE
    else if (isSome (match (valu, p)))
    then match (valu, p)
    else NONE
  )
  | (_, _) => NONE
