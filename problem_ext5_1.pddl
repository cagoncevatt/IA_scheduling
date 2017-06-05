(define (problem test-template)
	(:domain recom-menus)
	(:objects
		; Init objects are for the previous day considered for Monday, used as dummies.
		Init Monday Tuesday Wednesday Thursday Friday - Day ; Days
		InitF A B C D E K L M N O P - First ; Firsts
		InitS F G H I J Q R S T U V - Second ; Seconds
		InitT T1 T2 T3 T4 T5 T6 - Type ; Types
	)
	
	(:init
		; Initialize dummy element
		(FirstAssigned Init) (SecondAssigned Init) (FirstType InitF InitT) (SecType InitS InitT)
		(DayFirst Init InitF) (DaySecond Init InitS) (PrevDay Init Monday) (FirstUsed InitF) (SecUsed InitS)
		
		; Days order
		(PrevDay Monday Tuesday) (PrevDay Tuesday Wednesday) (PrevDay Wednesday Thursday) (PrevDay Thursday Friday)
		
		; Problem Instance initiallization
		(FirstType A T1) (FirstType B T1) (FirstType C T2) (FirstType D T3) (FirstType E T2)
		(FirstType K T5) (FirstType L T4) (FirstType M T3) (FirstType N T3) (FirstType O T5) (FirstType P T1)
		
		(SecType F T1) (SecType G T1) (SecType H T2) (SecType I T3) (SecType J T2)
		(SecType Q T2) (SecType R T1) (SecType S T6) (SecType T T6) (SecType U T3) (SecType V T4)
		
		(FirstInDay E Monday) (FirstInDay B Friday) (SecInDay I Monday)
		
		; Funciones de Calories para cada First y Second
		(= (FirstCalories A) 560)
		(= (FirstCalories B) 770)
		(= (FirstCalories C) 500)
		(= (FirstCalories D) 250)
		(= (FirstCalories E) 900)
		(= (FirstCalories K) 550)
		(= (FirstCalories L) 300)
		(= (FirstCalories M) 625)
		(= (FirstCalories N) 400)
		(= (FirstCalories O) 450)
		(= (FirstCalories P) 100)
		
		(= (SecCalories F) 1000)
		(= (SecCalories G) 500)
		(= (SecCalories H) 910)
		(= (SecCalories I) 440)
		(= (SecCalories J) 680)
		(= (SecCalories Q) 500)
		(= (SecCalories R) 1300)
		(= (SecCalories S) 700)
		(= (SecCalories T) 450)
		(= (SecCalories U) 650)
		(= (SecCalories V) 330)
		
		; Prices
		(= (MenuCost) 0)
		
		(= (FirstPrice A) 20)
		(= (FirstPrice B) 80)
		(= (FirstPrice C) 50)
		(= (FirstPrice D) 40)
		(= (FirstPrice E) 120)
		(= (FirstPrice K) 85)
		(= (FirstPrice L) 20)
		(= (FirstPrice M) 100)
		(= (FirstPrice N) 100)
		(= (FirstPrice O) 35)
		(= (FirstPrice P) 15)
		
		(= (SecPrice F) 74)
		(= (SecPrice G) 24)
		(= (SecPrice H) 60)
		(= (SecPrice I) 45)
		(= (SecPrice J) 10)
		(= (SecPrice Q) 200)
		(= (SecPrice R) 0)
		(= (SecPrice S) 35)
		(= (SecPrice T) 89)
		(= (SecPrice U) 40)
		(= (SecPrice V) 100)
	)
	
	(:goal
		(forall (?d - Day)
			(and (FirstAssigned ?d) (SecondAssigned ?d))
		)
	)
	
	(:metric minimize (MenuCost))
)
