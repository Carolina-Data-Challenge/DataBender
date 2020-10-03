/****************************************************************************
*
* Project : Carolina Data Challenge
*
* Program name : CDC.sas
*
* Author : Tanying Lin (TL)
*
* Date created : 2020-10-03
*
* Purpose : This program is designed to clean the WorldEconomics dataset to analyze it..
*
*
****************************************************************************/

*create a reference for the  data folder;
LIBNAME cdcdata 'C:\Users\Tanying\Downloads\2020 Fall\CDC';

*import the dataset as sas;
proc import datafile="C:\Users\Tanying\Downloads\2020 Fall\CDC\WorldEconomicOutlookData.csv"
        out=econ
        dbms=csv
		replace;
run;

*print out the data to see its variable names;
proc print data=econ(obs=20);
run;

*sort the data for later proc transpose;
proc sort data=econ out=sorted_econ;
by Country WEO_Country_Code ISO;
run;

*rearrange data to analyze it;
proc transpose data=sorted_econ out=new_econ;
by Country WEO_Country_Code ISO;
id Subject_Descriptor;
var _1980 _1981 _1982 _1983 _1984 _1985 _1986 _1987 _1988 _1989 _1990 _1991 _1992 _1993 _1994 _1995 _1996 _1997 _1998
_1999 _2000 _2001 _2002 _2003 _2004 _2005 _2006 _2007 _2008 _2009 _2010 _2011 _2012 _2013 _2014 _2015 _2016
_2017 _2018 _2019 _2020 _2021;
run;

*print the dataset out to check;
proc print data=new_econ(obs=100);
run;

*rename the _NAME_;
data cdcdata.newecon2;
set new_econ;
rename _NAME_ = Date;
run;

*print to check;
proc print data=newecon2(obs=100);
run;

*convert the dataset back to cvs for teammate;
proc export data=cdcdata.newecon2
			outfile='C:\Users\Tanying\Downloads\2020 Fall\CDC\DataCleanedEcon.csv'
			dbms=csv 
			replace;
run;
