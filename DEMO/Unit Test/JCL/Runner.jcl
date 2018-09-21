${TOTALTEST_JOBCARD}
//*
//********************************************************************
//* Execute Target Runner
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR
//STEPLIB DD DISP=SHR,DSN=HBRAXA0.DEMO.LOADLIB
//EMPFILE DD DISP=SHR,DSN=HBRAXA0.DEMO.JCLLIB(CWXTDATA)
//RPTFILE  DD  SYSOUT=*
//*
//TRPARM DD *
*
*        Optionally set your custom exit program here:
*
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(ON)
/*
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*
//*      Optionally add your custom DD statements
//
//*DD1 DD DSN=HLQ.CUSTOM.TEST.LOAD,DISP=SHR
//SYSPRINT DD SYSOUT=*
//*


