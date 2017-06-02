(define (domain recom-menus)
	(:requirements :strips :adl :typing)
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
		(FirstAssigned ?d - Day)
		(SecondAssigned ?d - Day)
		(DayFirst ?d - Day ?f - Dish)
		(DaySecond ?d - Day ?s - Dish)
	)
	
	(:action set_first_dish
		:parameters (?day - Day ?first - Dish ?prev - Day)
		
		:precondition
		(
			(and (not (FirstAssigned ?day)) (IsFirst ?first)
				(PrevDay ?prev ?day) (FirstAssigned ?prev) (SecondAssigned ?prev)
			)
		)
		
		:effect
		(
			(and (FirstAssigned ?day) (DayFirst ?day ?first))
		)
	)
	
	(:action set_second_dish
		:parameters (?day - Day ?first - Dish ?second - Dish)
		
		:precondition
		(
			(and (not (SecondAssigned ?day)) (FirstAssigned ?day) (DayFirst ?day ?first) (IsSecond ?second)
				(not (Incompatible ?first ?second))
			)
		)
		
		:effect
		(
			(and (SecondAssigned ?day) (DaySecond ?day ?second))
		)
	)
)