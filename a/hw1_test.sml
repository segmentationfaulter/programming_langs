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
