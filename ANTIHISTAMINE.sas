/* Import DATA*/ 
PROC IMPORT DATAFILE="/folders/myfolders/2/data/chlor.csv"  
	DBMS=CSV  
	OUT=anti;  
	GETNAMES=YES;  
RUN; 
/* Stat Summary*/ 
PROC MEANS DATA=anti MEAN MEDIAN MIN MAX Range STD; 
    CLASS lab; 
    VAR meas; 
RUN; 
/* Horizontal Box Plot*/ 
proc sgplot data=anti; 
	hbox meas / category=lab; 
	XAXIS GRID; 
	YAXIS GRID; 
	Title 'Distribution of Measurements for Samples of Antihistamine per Lab '; 
	Label meas = 'Measurements' 
run; 
/*Vertical Box Plot*/ 
PROC SGPLOT DATA=anti; 
    VBOX meas / GROUP=lab; 
	YAXIS GRID; 