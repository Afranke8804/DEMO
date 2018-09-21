${TOTALTEST_JOBCARD}
//***   SPECIFY JOBCARD IN TOTALTEST PREFERENCES TO SUBSTITUTE
//*
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH
//*** AS NOTIFY=&SYSUID and also a REGION=0M parameter
//*
//********************************************************************
//* Execute Target Runner under TSO using the DSN command
//*    and the RUN subcommand
//********************************************************************
//RUNBD2 EXEC PGM=IKJEFT01,REGION=0M
//*
//* You need to modify the following DD statements.
//*
//* The first DD statement should be changed to the ECC SLCXLOAD
//* dataset that contains the Topaz for Total Test TTTRUNNR program.
//*
//* The second DD statement should be changed to the loadlib
//* containing the programs to run during the test.
//*
//* The third DD statement should be changed to the loadlib
//* containing the TSO DSN command.
//*
//* The fourth DD statement is only required if running the JCL
//* from Topaz for Total Test CLI with Code Coverage support.
//* If testing an LE application it should be changed to the
//* loadlib containing the COBOL runtime(CEE.SCEERUN), otherwise
//* it can be removed.
//*
//STEPLIB  DD DISP=SHR,DSN=HBRAXA0.DEMO.LOADLIB
//         DD DISP=SHR,DSN=DSNB10.DBCC.RUNLIB.LOAD
//         DD DISP=SHR,DSN=DSNB10.SDSNLOAD
//         DD DISP=SHR,DSN=CEE.SCEERUN
//TRPARM DD *
*
*        Optionally set your custom exit program here:
*
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(OFF)
//*-----
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*-----
//*-----
//*      Optional
//*      Add your custom DD statements
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSTSPRT DD SYSOUT=*
//EMPFILE  DD DISP=SHR,DSN=HBRAXA0.DEMO.PARM(TTTDATD)
//SLSF001 DD DISP=SHR,DSN=HBRAXA0.DEMO.SOURCE.SHRDIR
//*
//* You need to modify the following RUN statement.
//*
//*
//* Change the <SUBSYSTEM ID> to your DB2 subsystem id(SSID).
//* Change the <PLAN NAME> to the plan name for your COBOL test program.
//*
//SYSTSIN  DD *
 DSN SYSTEM(DBCC)
 RUN PROGRAM(TTTRUNNR) PLAN(CVAFDB2X) PARMS('/NOSTAE')
 END
/*
//
//********************************************************************
//* USE THE FOLLOWING INFORMATION TO PREPARE A RUNNERDB2 FILE TO
//* EXECUTE A TOPAZ FOR TOTAL TEST FOR DEMO PROGRAM CWKTDB2X
//*
//* IN THE TOPAZ FOR TOTAL TEST PROJECT JCL FOLDER OPEN THE
//* RUNNERDB2.JCL FILE AND SAVE IT AS CWKTDB2X RUNNERDB2.JCL
//* USE THE FOLLOWING INFO TO UPDATE THE CWKTDB2X RUNNERDB2.JCL FILE
//********************************************************************
//*
//********************************************************************
//*  UPDATE THE 1ST STEPLIB DD TO THE ECC SLCXCNTL DATASET
//*  WHERE MLCXNNN IS MLCX170 OR HIGHER
//*  UPDATE THE 2ND DD TO THE LOADLIB THAT CONTAINS THE
//*  CWKTDB2X TOPAZ FOR TOTAL TEST PROGRAM
//*  UPDATE THE 3ND DD TO THE NAME OF YOUR DB2 SDSNLOAD
//********************************************************************
//*
//********************************************************************
//* NOTE THAT THE EMPFILE DD IS ONLY REQUIRED IF YOU WISH TO RUN
//* THE TEST WITH USE STUBS = NO
//*
//* IF YOU WANT TO RUN WITH USE STUBS = NO ADD THE FOLLOWING
//* EMPFILE DD STATEMENT AFTER THE STEPLIB DD CONCATENATION
//*
//* UPDATE THE EMPFILE DD TO THE ECC SLCXCNTL DATASET
//* WHERE MLCXNNN IS MLCX170 OR HIGHER
//********************************************************************
//*
//EMPFILE  DD DISP=SHR,DSN=CPWR.MLCXNNN.SLCXCNTL(TTTDATD)
//*
//********************************************************************
//* ADD THE FOLLOWING SLSF001 DD AND UPDATE THE DSN TO THAT USED
//* IN THE CWKTCDB2 MEMBER IN THE ECC SLCXCNTL DATASET
//********************************************************************
//*
//SLSF001 DD DISP=SHR,DSN=YOUR.DDIO.FILE
//*
//********************************************************************
//* UPDATE THE DSN SSID VALUE AND PLAN NAME TO THOSE USED IN THE
//* CWKTCDB2 MEMBER IN THE ECC SLCXCNTL DATASET
//********************************************************************


