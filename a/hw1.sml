fun is_older (date1: (int * int * int), date2: (int * int * int)) =
  let
    val year_is_older = #1 date1 < #1 date2
    val year_is_same = #1 date1 = #1 date2
    val month_is_older = #2 date1 < #2 date2
    val month_is_same = #2 date1 = #2 date2
    val day_is_older = #3 date1 < #3 date2
    val day_is_same = #3 date1 = #3 date2
  in
    if year_is_older
    then true
    else if not year_is_older andalso not year_is_same
    then false
    else if year_is_same andalso month_is_older
    then true
    else if year_is_same andalso (not month_is_older) andalso (not month_is_same)
    then false
    else if month_is_same andalso day_is_older
    then true
    else if month_is_same andalso (not day_is_older) andalso (not day_is_same)
    then false
    else false
  end

fun number_in_month (dates: (int * int * int) list, month: int) =
  let
    fun number_in_month_for_single_date (date: (int * int * int)) =
      if #2 date = month
      then 1
      else 0
  in
    if null dates
    then 0
    else number_in_month_for_single_date(hd dates) + number_in_month(tl dates, month)
  end

fun number_in_months (dates: (int * int * int) list, months: int list) =
  if null months
  then 0
  else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month (dates: (int * int * int) list, month: int) =
  let
    fun date_in_month (date: (int * int * int)) =
      if #2 date = month
      then true
      else false
  in
    if null dates
    then []
    else
      if date_in_month(hd dates)
      then (hd dates) :: dates_in_month(tl dates, month)
      else dates_in_month(tl dates, month)
  end

fun dates_in_months (dates: (int * int * int) list, months: int list) =
  if null months
  then []
  else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strings: string list, n: int) =
  let
    fun get_nth_helper(strings: string list, current_n: int) =
      if (n = current_n)
      then hd strings
      else get_nth_helper(tl strings, current_n + 1)
  in
    get_nth_helper(strings, 1)
  end

fun date_to_string (date: int * int * int) =
  let
    val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  in
    get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ "," ^ " " ^ Int.toString(#1 date)
  end

fun number_before_reaching_sum (sum: int, numbers: int list) =
  let
    fun number_before_reaching_sum_helper (numbers: int list, current_index: int, last_sum: int) =
      if last_sum + hd numbers >= sum
      then current_index - 1
      else number_before_reaching_sum_helper(tl numbers, current_index + 1, last_sum + hd numbers)
  in
    number_before_reaching_sum_helper(numbers, 1, 0)
  end

fun what_month(day: int) =
  let
    val months_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    val month = number_before_reaching_sum(day, months_days)
  in
    month + 1
  end
