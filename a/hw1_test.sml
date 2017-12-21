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

val dates = [(2000, 7, 3), (2000, 6, 3), (2000, 3, 3), (2000, 3, 3), (2000, 7, 3)]
val number_in_month_test1 = number_in_month(dates, 7) = 2
val number_in_month_test2 = number_in_month(dates, 6) = 1
val number_in_month_test3 = number_in_month(dates, 3) = 2
val number_in_month_test4 = number_in_month(dates, 9) = 0

val number_in_months_test1 = number_in_months(dates, [1, 3, 6, 7, 8]) = 5
val number_in_months_test2 = number_in_months(dates, []) = 0
val number_in_months_test3 = number_in_months([], [1, 3, 6, 7, 8]) = 0
val number_in_months_test4 = number_in_months([], []) = 0


val dates_in_month_test1 = dates_in_month (dates,2) = []
val dates_in_month_test2 = dates_in_month (dates,3) = [(2000, 3, 3), (2000, 3, 3)]
val dates_in_month_test3 = dates_in_month (dates,6) = [(2000, 6, 3)]
val dates_in_month_test4 = dates_in_month ([],2) = []
