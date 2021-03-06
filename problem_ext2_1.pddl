(define (problem test-template)
	(:domain recom-menus)
	(:objects
		; Init objects are for the previous day considered for Monday, used as dummies.
		Init Monday Tuesday Wednesday Thursday Friday - Day ; Days
		InitF A B C D E - First; Firsts
		InitS F G H I J - Second; Seconds
		InitT T1 T2 T3 - Type ; Types
	)
	
	(:init
		; Initialize dummy element
		(FirstAssigned Init) (SecondAssigned Init) (FirstType InitF InitT) (SecType InitS InitT)
		(DayFirst Init InitF) (DaySecond Init InitS) (PrevDay Init Monday) (FirstUsed InitF) (SecUsed InitS)
		
		; Days order
		(PrevDay Monday Tuesday) (PrevDay Tuesday Wednesday) (PrevDay Wednesday Thursday) (PrevDay Thursday Friday)
		
		; Problem Instance initiallization
		(FirstType A T1) (FirstType B T1) (FirstType C T2) (FirstType D T3) (FirstType E T2)
		(SecType F T1) (SecType G T1) (SecType H T2) (SecType I T3) (SecType J T2)
	)
	
	(:goal
		(forall (?d - Day)
			(and (FirstAssigned ?d) (SecondAssigned ?d))
		)
	)
)
