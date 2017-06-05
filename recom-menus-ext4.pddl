(define (domain recom-menus)
	(:requirements :strips :adl :typing :equality :fluents)
	(:types First Second Type Day)
	
	(:predicates
		(Incompatible ?d1 - First ?d2 - Second)
		
		(FirstType ?d - First ?t - Type)
		(SecType ?d - Second ?t - Type)
		
		(PrevDay ?d1 ?d2 - Day)
		
		(FirstAssigned ?d - Day)
		(SecondAssigned ?d - Day)
		
		(DayFirst ?d - Day ?f - First)
		(DaySecond ?d - Day ?s - Second)
		
		(FirstUsed ?d - First)
		(SecUsed ?d - Second)
		
		(FirstInDay ?d - First ?day - Day)
		(SecInDay ?d - Second ?day - Day)
	)
	
	(:functions
		(FirstCalories ?d - First)
		(SecCalories ?d - Second)
	)
	
	(:action set_first_dish
		:parameters (?day - Day ?first - First ?firstType - Type ?prev - Day ?prevFirst - First ?prevType - Type)
		
		:precondition
		(and (<= (FirstCalories ?first) 1500)
			(forall (?sf - First)
				(imply (FirstInDay ?sf ?day) (= ?sf ?first))
			)
			(not (FirstAssigned ?day)) (DayFirst ?prev ?prevFirst) (not (FirstUsed ?first))
			(PrevDay ?prev ?day) (FirstAssigned ?prev) (SecondAssigned ?prev)
			(FirstType ?first ?firstType) (FirstType ?prevFirst ?prevType)
			(not (= ?firstType ?prevType))
		)
		
		:effect (and (FirstAssigned ?day) (DayFirst ?day ?first) (FirstUsed ?first))
	)
	
	(:action set_second_dish
		:parameters (?day - Day ?first - First ?secType - Type ?second - Second ?prev - Day ?prevSec - Second ?prevType - Type)
		
		:precondition 
		(and (<= (+ (SecCalories ?second) (FirstCalories ?first)) 1500) (>= (+ (SecCalories ?second) (FirstCalories ?first)) 1000)
			(forall (?ss - Second)
				(imply (SecInDay ?ss ?day) (= ?ss ?second))
			)
			(not (SecondAssigned ?day)) (DayFirst ?day ?first) (not (SecUsed ?second))
			(not (Incompatible ?first ?second)) (DaySecond ?prev ?prevSec) (PrevDay ?prev ?day)
			(SecType ?second ?secType) (SecType ?prevSec ?prevType)
			(not (= ?secType ?prevType))
		)
		
		:effect (and (SecondAssigned ?day) (DaySecond ?day ?second) (SecUsed ?second))
	)
)
