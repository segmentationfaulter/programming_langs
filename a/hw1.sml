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
