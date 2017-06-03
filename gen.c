/* Program that creates random sets of first and second plates, of randomly assigned types. *
 * Also defines incompatibilities between them, again randomly. 			    */
#include<stdio.h>
#include<stdlib.h>
#define N_TYPES 10 //number of types (seafood, red meat, salad....)
#define PROB_INCOMP 4 //The reverse of this number is (supposedly) the probability of two plates being incompatible
#define N_FIR 10     //Ten first plates
#define N_SEC 10    //Ten seconds
#define PRICE_RANGE 15 //Price is from 5->5+PRICE_RANGE
#define CALORIE_RANGE 2000 //Calories can be from 500->500+CALORIE_RANGE
//names: Objects: First, Second, 
//	 Predicates: HasType, IsIncompatibleWith
/*


(Incompatible A B)


(:init
 (clear A)
 (clear B)
 (clear C)
 (clear A)
 (ontable A)
 (ontable B)
 (ontable C)
 (ontable D)
 (handempty)
)

(:goal  (and
 (on D C)
 (on C B)
 (on B A)
))
*/
int main() {
 	int i,j;		
	time_t t; //time seed, used to initiate the pseudorandom function
   	srand((unsigned) time(&t)); //initializing the pseudorandom funciton
	int incompat[N_FIR][N_SEC]; //incompat is a table where the rows are first plates and the columns seconds.
				    //'1' means that they are incompatible
	int typeFir[N_FIR];         //typeFir[i] is Type of First numbered i. 	
	int typeSec[N_SEC];         //Similary but for Seconds.
	
	for (i=0; i<N_FIR; i++) {
		//printf("\n");
		for (j=0; j<N_SEC; j++)	{
		    long random = rand()%PROB_INCOMP;
		    if ((random == 0) && (i!=j)) 
			//we set the first plates numbered 'i' as incompatible with the second plate numberd 'j'.	
			incompat[i][j]=1;
		    else
			incompat[i][j]=0;
		    //printf(" %d",incompat[i][j]);	
		}	
		//printf("\n");
	}

	
        puts("(:init");
	
	for (i=0; i<N_FIR; i++) {
	    long random = rand()%N_TYPES;
	    typeFir[i]=(int)random;
	    printf("isFirst( First%d)\n",i);
	    printf("DishType( Type%d)\n",typeFir[i]);
	    random = rand()%PRICE_RANGE;
	    printf("Price (First%d %ld)\n",i,5+random);
	    random = rand()%CALORIE_RANGE;
	    printf("Calories (First%d %ld)\n",i,500+random);
     	    printf("\n");
	
	}
	for (i=0; i<N_SEC; i++) {
	    long random = rand()%N_TYPES;
	    typeSec[i]=(int)random;
	    printf("isSecond(Second%d)\n",i);
	    printf("DishType(Type%d)\n",typeSec[i]);
	    random = rand()%PRICE_RANGE;
	    printf("Price (Second%d %ld)\n",i,5+random);
	    random = rand()%CALORIE_RANGE;
	    printf("Calories (Second%d %ld)\n",i,500+random);
	    printf("\n");
	}

		
	for (i=0; i<N_FIR; i++) {
		for (j=0; j<N_SEC; j++) 
			if (incompat[i][j]==1) printf("Incompatible (First%d, Second%d) \n",i,j);
	}
	
	printf("\n");
	
	for (j=0; j<N_SEC; j++) {
		for (i=0; i<N_FIR; i++) 
			if (incompat[i][j]==1) printf("Incompatible (Second%d, First%d) \n",j,i);
	}

	
        puts(")");

	
	return 0;
}
	
