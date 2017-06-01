(define (domain recom-menus)
	(:requirements :strips :adl :typing :equality)
	(:types Dish Type Day Price Calories)
	
	(:predicates
		(Incompatible ?d1 - Dish ?d2 - Dish)
		(PrevDay ?d1 - Day ?d2 - Day)
		(NextDay ?d1 - Day ?d2 - Day)
		(Price ?d - Dish ?p - Price)
		(Calories ?d - Dish ?c - Calories)
		(DishType ?d - Dish ?t - Type)
		(IsFirst ?d - Dish)
		(IsSecond ?d - Dish)
		(Assigned ?d - Day)
		(DayFirst ?d - Day ?f - Dish)
		(DaySecond ?d - Day ?s - Dish)
		(DishUsed ?d - Dish)
	)
	
	(:action set_dish
		:parameters (?day - Day ?first - Dish ?second - Dish ?prevDay - Day ?prevFirst - Dish ?prevSec - Dish
						?typeFirst - Type ?typeSec - Type ?typePrevFirst - Type ?typePrevSec - Type
		)
		
		:precondition
		(
			(and (not (Assigned ?day)) (Assigned ?prevDay) (IsFirst ?first) (IsSecond ?second)
				(DishType ?first ?typeFirst) (DishType ?sec ?typeSec)
				(DishType ?prevFirst ?typePrevFirst) (DishType ?prevSec ?typePrevSec)
				(not (Incompatible ?first ?second)) (not (DishUsed ?first)) (not (DishUsed ?second))
				(not (= (?typeFirst ?typePrevFirst))) (not (= (?typeSec ?typePrevSec)))
			)
		)
		
		:effect
		(
			(and (Assigned ?day) (DayFirst ?day ?first) (DaySecond ?day ?second) (DishUsed ?first) (DishUsed ?second))
		)
	)
)