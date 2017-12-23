val d1 = (2007, 3, 24)
val d2 = (2009, 3, 3)
val year_test1 = is_older (d1, d2) = true
val year_test2 = is_older (d2, d1) = false

val d1 = (2000, 3, 2)
val d2 = (2000, 6, 1)
val month_test1 = is_older(d1, d2) = true
val month_test2 = is_older(d2, d1) = false

val d1 = (2000, 3, 3);
val d2 = (2000, 3, 6);
val day_test1 = is_older(d1, d2) = true
val day_test2 = is_older(d2, d1) = false

val d1 = (2000, 3, 3)
val d2 = (2000, 3, 3)
val same_date_test = is_older(d1, d2) = false

val dates = [(2000, 3, 30), (2000, 3, 31), (2000, 6, 15), (2000, 7, 8), (2000,7, 11)]
val number_in_month_test1 = number_in_month(dates, 7) = 2
val number_in_month_test2 = number_in_month(dates, 6) = 1
val number_in_month_test3 = number_in_month(dates, 3) = 2
val number_in_month_test4 = number_in_month(dates, 9) = 0

val number_in_months_test1 = number_in_months(dates, [1, 3, 6, 7, 8]) = 5
val number_in_months_test2 = number_in_months(dates, []) = 0
val number_in_months_test3 = number_in_months([], [1, 3, 6, 7, 8]) = 0
val number_in_months_test4 = number_in_months([], []) = 0


val dates_in_month_test1 = dates_in_month (dates,2) = []
val dates_in_month_test2 = dates_in_month (dates,3) = [(2000, 3, 30), (2000, 3,31)]
val dates_in_month_test3 = dates_in_month (dates,6) = [(2000, 6, 15)]
val dates_in_month_test4 = dates_in_month ([],2) = []


val dates_in_months_test1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val dates_in_months_test2 = dates_in_months (dates, []) = []
val dates_in_months_test3 = dates_in_months (dates, [3]) = [(2000, 3, 30), (2000,3, 31)]
val dates_in_months_test4 = dates_in_months (dates, [3, 6]) = [(2000, 3, 30), (2000, 3, 31), (2000, 6, 15)]
val dates_in_months_test5 = dates_in_months ([], [3]) = []
val dates_in_months_test6 = dates_in_months ([], []) = []

val strings = ["hi", "there", "how", "are", "you"]
val get_nth_test1 = get_nth (strings, 2) = "there"
val get_nth_test2 = get_nth (strings, 5) = "you"

val date_to_string_test1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val date_to_string_test2 = date_to_string (2013, 11, 11) = "November 11, 2013"

val number_before_reaching_sum_test1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val number_before_reaching_sum_test2 = number_before_reaching_sum (18, [7, 9, 3, 8]) = 2

val what_month_test1 = what_month 70 = 3
val what_month_test2 = what_month 20 = 1
val what_month_test3 = what_month 360 = 12
