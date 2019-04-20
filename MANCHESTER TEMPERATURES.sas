/* Import DATA*/ 
PROC IMPORT DATAFILE="/folders/myfolders/2/data/man.csv"  
	DBMS=CSV  
	OUT=man;  
	GETNAMES=YES; 
RUN; 
/* Stat Summary*/ 
PROC MEANS DATA=man MEAN MEDIAN STD; 
    VAR temp; 
RUN; 
/*Univ Histogram inc by 1 */
PROC univariate DATA=man; 
   HISTOGRAM temp / normal 
                    ctext = blue 
                    midpoints=-6 to 34 by 1 
                    ;  
Label temp = 'Temperature (°C)'; 
run; 
/*Univ Histogram inc by .5 */ 
PROC univariate DATA=man; 
   HISTOGRAM temp / normal 
                    ctext = blue 
                    midpoints=-6 to 34 by .5 
                    ; 
Label temp = 'Temperature (°C)'; 
run; 
/*sgp Histogram inc by 0.2 + Kernal */ 
proc sgplot data=man; 
	histogram temp;  
	xaxis values=(-6 to 34 by 0.2);   
	density temp; 
	density temp / type=kernel;	 
	keylegend / location=inside position=topright;   
	Title 'Distribution of Temperature in Manchester (1/10/1973 - 1/10/2016)'; 
run;

