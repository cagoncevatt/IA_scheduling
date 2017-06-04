(define (domain recom-menus)
	(:requirements :strips :adl :typing)
	(:types First Second Type Day Price Calories)
	
	(:predicates
		(Incompatible ?d1 - First ?d2 - Second)
		
		(FirstType ?d - First ?t - Type)
		(SecType ?d - Second ?t - Type)
		
		(PrevDay ?d1 - Day ?d2 - Day)
		
		(FirstAssigned ?d - Day)
		(SecondAssigned ?d - Day)
		
		(DayFirst ?d - Day ?f - First)
		(DaySecond ?d - Day ?s - Second)
	)
	
	(:action set_first_dish
		:parameters (?day - Day ?first - First ?prev - Day)
		
		:precondition
		(
			(and (not (FirstAssigned ?day))
				(PrevDay ?prev ?day) (FirstAssigned ?prev) (SecondAssigned ?prev)
			)
		)
		
		:effect
		(
			(and (FirstAssigned ?day) (DayFirst ?day ?first))
		)
	)
	
	(:action set_second_dish
		:parameters (?day - Day ?first - First ?second - Second)
		
		:precondition
		(
			(and (not (SecondAssigned ?day)) (FirstAssigned ?day) (DayFirst ?day ?first)
				(not (Incompatible ?first ?second))
			)
		)
		
		:effect
		(
			(and (SecondAssigned ?day) (DaySecond ?day ?second))
		)
	)
)
