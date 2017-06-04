(define (domain recom-menus)
	(:requirements :strips :adl :typing :equality)
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
		
		(FirstUsed ?d - First)
		(SecUsed ?d - Second)
		
		; Predicates to avoid usage of dummy dishes
		(DummyFirst ?f - First)
		(DummySec ?f - Second)
	)
	
	
	(:action set_first_dish
		:parameters (?day - Day ?first - First ?firstType - Type ?prev - Day ?prevFirst - First ?prevType - Type)
		
		:precondition (and (not (DummyFirst ?first)) (not (FirstAssigned ?day)) (DayFirst ?prev ?prevFirst) (not (FirstUsed ?first))
			(PrevDay ?prev ?day) (FirstAssigned ?prev) (SecondAssigned ?prev)
			(FirstType ?first ?firstType) (FirstType ?prevFirst ?prevType)
			(not (= (?firstType ?typePrev)))
		)
		
		:effect (and (FirstAssigned ?day) (DayFirst ?day ?first) (FirstUsed ?first))
	)
	
	(:action set_second_dish
		:parameters (?day - Day ?first - First ?secType - Type ?second - Second ?prevSec - Second ?prevType - Type)
		
		:precondition (and (not (DummySec ?second)) (not (SecondAssigned ?day)) (DayFirst ?day ?first) (not (SecUsed ?second))
			(not (Incompatible ?first ?second)) (DaySecond ?prev ?prevSec)
			(SecType ?second ?secType) (SecType ?prevSec ?prevType)
			(not (= (?secType ?typePrev)))
		)
		
		:effect (and (SecondAssigned ?day) (DaySecond ?day ?second) (SecUsed ?second))
	)
)
