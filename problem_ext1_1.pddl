(define (problem test-template)
	(:domain recom-menus)
	(:objects
		; Init objects are for the previous day considered for Monday, used as dummies.
		Init Monday Tuesday Wednesday Thursday Friday - Day ; Days
		InitF A B C D E - First; Firsts
		InitS F G H I J - Second; Seconds
		InitT - Type ; Types
	)
	
	(:init
		; Initialize dummy element
		(FirstAssigned Init) (SecondAssigned Init) (FirstType InitF InitT) (SecType InitS InitT)
		(DayFirst Init InitF) (DaySecond Init InitS) (PrevDay Init Monday) (FirstUsed InitF) (SecUsed InitS)
		
		; Days order
		(PrevDay Monday Tuesday) (PrevDay Tuesday Wednesday) (PrevDay Wednesday Thursday) (PrevDay Thursday Friday)
		
		; Problem Instance initiallization
	)
	
	(:goal
		(forall (?d - Day)
			(and (FirstAssigned ?d) (SecondAssigned ?d))
		)
	)
)
