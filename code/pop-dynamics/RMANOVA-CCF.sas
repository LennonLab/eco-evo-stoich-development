
data cstat;

INFILE 'C:\Users\Megan\Desktop\Paper 1\cstat_time_series\Data\20121126_RMANOVA_1.csv' lrecl = 400 firstobs=2 missover;
INPUT Day cID$ abd trt$;

data phage1;

INFILE 'C:\Users\Megan\Desktop\Paper 1\cstat_time_series\Data\20121126_RMANOVA_Viruses.csv' lrecl = 400 firstobs=2 missover;
INPUT Day cID$ abd trt$;


PROC MIXED data= virus;
	Title2 'compound symmertry';
	class cID trt Day;
	model abd = Day trt Day*trt/outp=CSpred;
	repeated / type =cs sub=trt(cID) rcorr;
	ODS output infocrit=CS;
	ODS listing close;
	run;

	PROC MIXED data= virus;
	Title2 'HF';
	class cID trt Day;
	model abd = Day trt Day*trt/outp=HFpred;
	repeated / type =HF sub=trt(cID) rcorr;
	ODS output infocrit=HF;
	ODS listing close;
	run;

	PROC MIXED data= virus;
	Title2 'unstructured';
	class cID trt Day;
	model abd = Day trt Day*trt/outp=UNpred;
	repeated / type =UN sub=trt(cID) rcorr;
	ODS output infocrit=UN;
	ODS listing close;
	run;

	
	PROC MIXED data= virus;
	Title2 'AR1';
	class cID trt Day;
	model abd = Day trt Day*trt/outp=ARpred;
	repeated / type =ar(1) sub=trt(cID) rcorr;
	run;
	PROC MIXED data= phage1;
	class cID trt Day;
	model abd = Day trt Day*trt;
	repeated / type =ar(1) sub=cID(trt) rcorr;
	run;

	DATA a;
     SET CS;
     identifier='CS';
 DATA b;
     SET HF;
     identifier='HF';
DATA c;
     SET UN;
     identifier='UN';
DATA d;
     SET AR1;
     identifier='AR1';
DATA compare;
     SET a b c d;
PROC SORT data=compare;
     BY BIC;
ODS listing;
PROC PRINT;
     TITLE2 'Information criteria';
     VAR identifier parms bic aic aicc neg2loglike;
RUN;
