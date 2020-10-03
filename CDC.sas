*create a reference for the course data folder;
LIBNAME biosdata 'C:\Users\Tanying\Downloads\2020 Fall\BIOS 511\Data';
*create a reference for personal data folder;
LIBNAME mydata 'C:\Users\Tanying\Downloads\BIOS511DATA';
proc import datafile="C:\Users\Tanying\Downloads\2020 Fall\BIOS 511\Data\WorldEconomicOutlookData.csv"
        out=econ
        dbms=csv
		replace;
		*GUESSINGROWS=MAX;
run;
proc print data=econ(obs=100);
run;
proc sort data=econ out=sorted_econ;
by Country WEO_Country_Code ISO;
run;
proc transpose data=sorted_econ out=new_econ;
by Country WEO_Country_Code ISO;
id Subject_Descriptor;
var _1980 _1981 _1982 _1983 _1984 _1985 _1986 _1987 _1988 _1989 _1990 _1991 _1992 _1993 _1994 _1995 _1996 _1997 _1998
_1999 _2000 _2001 _2002 _2003 _2004 _2005 _2006 _2007 _2008 _2009 _2010 _2011 _2012 _2013 _2014 _2015 _2016
_2017 _2018 _2019 _2020 _2021;
run;
proc print data=new_econ(obs=100);
run;
data biosdata.newecon2;
set new_econ;
rename _NAME_ = Date;
run;

proc print data=newecon2(obs=100);
run;
