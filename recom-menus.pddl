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
		(Assigned ?d - Day)
		(DayFirst ?d - Day ?f - Dish)
		(DaySecond ?d - Day ?s - Dish)
	)
	;Add prev day comprobation here and in ext 1
	(:action set_dish
		:parameters (?day - Day ?first - Dish ?second - Dish)
		
		:precondition
		(
			(and (not (Assigned ?day)) (IsFirst ?first) (IsSecond ?second)
				(not (Incompatible ?first ?second))
			)
		)
		
		:effect
		(
			(and (Assigned ?day) (DayFirst ?day ?first) (DaySecond ?day ?second))
		)
	)
)