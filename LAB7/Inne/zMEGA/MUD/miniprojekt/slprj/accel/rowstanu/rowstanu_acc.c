#include "__cf_rowstanu.h"
#include <math.h>
#include "rowstanu_acc.h"
#include "rowstanu_acc_private.h"
#include <stdio.h>
#include "simstruc.h"
#include "fixedpoint.h"
#define CodeFormat S-Function
#define AccDefine1 Accelerator_S-Function
static void mdlOutputs ( SimStruct * S , int_T tid ) { real_T currentTime ;
B_rowstanu_T * _rtB ; P_rowstanu_T * _rtP ; DW_rowstanu_T * _rtDW ; _rtDW = (
( DW_rowstanu_T * ) ssGetRootDWork ( S ) ) ; _rtP = ( ( P_rowstanu_T * )
ssGetDefaultParam ( S ) ) ; _rtB = ( ( B_rowstanu_T * ) _ssGetBlockIO ( S ) )
; ( ( B_rowstanu_T * ) _ssGetBlockIO ( S ) ) -> B_0_0_0 = ssGetT ( S ) ;
ssCallAccelRunBlock ( S , 0 , 1 , SS_CALL_MDL_OUTPUTS ) ; { ( ( B_rowstanu_T
* ) _ssGetBlockIO ( S ) ) -> B_0_2_0 [ 0 ] = ( _rtP -> P_2 [ 0 ] ) * ( (
X_rowstanu_T * ) ssGetContStates ( S ) ) -> StateSpace_CSTATE [ 0 ] ; ( (
B_rowstanu_T * ) _ssGetBlockIO ( S ) ) -> B_0_2_0 [ 1 ] = ( _rtP -> P_2 [ 1 ]
) * ( ( X_rowstanu_T * ) ssGetContStates ( S ) ) -> StateSpace_CSTATE [ 1 ] ;
} ssCallAccelRunBlock ( S , 0 , 3 , SS_CALL_MDL_OUTPUTS ) ;
ssCallAccelRunBlock ( S , 0 , 4 , SS_CALL_MDL_OUTPUTS ) ; if ( ssIsSampleHit
( S , 1 , 0 ) ) { currentTime = ssGetTaskTime ( S , 1 ) ; if (
ssIsMajorTimeStep ( S ) ) { _rtDW -> Step_MODE = ( currentTime >= _rtP -> P_5
) ; } if ( _rtDW -> Step_MODE == 1 ) { _rtB -> B_0_5_0 = _rtP -> P_7 ; } else
{ _rtB -> B_0_5_0 = _rtP -> P_6 ; } currentTime = ssGetTaskTime ( S , 1 ) ;
if ( ssIsMajorTimeStep ( S ) ) { _rtDW -> Step1_MODE = ( currentTime >= _rtP
-> P_8 ) ; } if ( _rtDW -> Step1_MODE == 1 ) { _rtB -> B_0_6_0 = _rtP -> P_10
; } else { _rtB -> B_0_6_0 = _rtP -> P_9 ; } } UNUSED_PARAMETER ( tid ) ; }
#define MDL_UPDATE
static void mdlUpdate ( SimStruct * S , int_T tid ) { B_rowstanu_T * _rtB ;
P_rowstanu_T * _rtP ; _rtP = ( ( P_rowstanu_T * ) ssGetDefaultParam ( S ) ) ;
_rtB = ( ( B_rowstanu_T * ) _ssGetBlockIO ( S ) ) ; UNUSED_PARAMETER ( tid )
; }
#define MDL_DERIVATIVES
static void mdlDerivatives ( SimStruct * S ) { B_rowstanu_T * _rtB ;
P_rowstanu_T * _rtP ; _rtP = ( ( P_rowstanu_T * ) ssGetDefaultParam ( S ) ) ;
_rtB = ( ( B_rowstanu_T * ) _ssGetBlockIO ( S ) ) ; { ( ( XDot_rowstanu_T * )
ssGetdX ( S ) ) -> StateSpace_CSTATE [ 0 ] = ( _rtP -> P_0 [ 0 ] ) * ( (
X_rowstanu_T * ) ssGetContStates ( S ) ) -> StateSpace_CSTATE [ 0 ] + ( _rtP
-> P_0 [ 1 ] ) * ( ( X_rowstanu_T * ) ssGetContStates ( S ) ) ->
StateSpace_CSTATE [ 1 ] ; ( ( XDot_rowstanu_T * ) ssGetdX ( S ) ) ->
StateSpace_CSTATE [ 0 ] += ( _rtP -> P_1 [ 0 ] ) * ( ( B_rowstanu_T * )
_ssGetBlockIO ( S ) ) -> B_0_6_0 ; ( ( XDot_rowstanu_T * ) ssGetdX ( S ) ) ->
StateSpace_CSTATE [ 1 ] = ( _rtP -> P_0 [ 2 ] ) * ( ( X_rowstanu_T * )
ssGetContStates ( S ) ) -> StateSpace_CSTATE [ 0 ] + ( _rtP -> P_0 [ 3 ] ) *
( ( X_rowstanu_T * ) ssGetContStates ( S ) ) -> StateSpace_CSTATE [ 1 ] ; ( (
XDot_rowstanu_T * ) ssGetdX ( S ) ) -> StateSpace_CSTATE [ 1 ] += ( _rtP ->
P_1 [ 1 ] ) * ( ( B_rowstanu_T * ) _ssGetBlockIO ( S ) ) -> B_0_5_0 ; } }
#define MDL_ZERO_CROSSINGS
static void mdlZeroCrossings ( SimStruct * S ) { P_rowstanu_T * _rtP ;
ZCV_rowstanu_T * _rtZCSV ; _rtZCSV = ( ( ZCV_rowstanu_T * )
ssGetSolverZcSignalVector ( S ) ) ; _rtP = ( ( P_rowstanu_T * )
ssGetDefaultParam ( S ) ) ; _rtZCSV -> Step_StepTime_ZC = ssGetT ( S ) - _rtP
-> P_5 ; _rtZCSV -> Step1_StepTime_ZC = ssGetT ( S ) - _rtP -> P_8 ; } static
void mdlInitializeSizes ( SimStruct * S ) { ssSetChecksumVal ( S , 0 ,
2886095381U ) ; ssSetChecksumVal ( S , 1 , 2746286621U ) ; ssSetChecksumVal (
S , 2 , 1985596913U ) ; ssSetChecksumVal ( S , 3 , 3195052725U ) ; { mxArray
* slVerStructMat = NULL ; mxArray * slStrMat = mxCreateString ( "simulink" )
; char slVerChar [ 10 ] ; int status = mexCallMATLAB ( 1 , & slVerStructMat ,
1 , & slStrMat , "ver" ) ; if ( status == 0 ) { mxArray * slVerMat =
mxGetField ( slVerStructMat , 0 , "Version" ) ; if ( slVerMat == NULL ) {
status = 1 ; } else { status = mxGetString ( slVerMat , slVerChar , 10 ) ; }
} mxDestroyArray ( slStrMat ) ; mxDestroyArray ( slVerStructMat ) ; if ( (
status == 1 ) || ( strcmp ( slVerChar , "8.1" ) != 0 ) ) { return ; } }
ssSetOptions ( S , SS_OPTION_EXCEPTION_FREE_CODE ) ; if ( ssGetSizeofDWork (
S ) != sizeof ( DW_rowstanu_T ) ) { ssSetErrorStatus ( S ,
"Unexpected error: Internal DWork sizes do "
"not match for accelerator mex file." ) ; } if ( ssGetSizeofGlobalBlockIO ( S
) != sizeof ( B_rowstanu_T ) ) { ssSetErrorStatus ( S ,
"Unexpected error: Internal BlockIO sizes do "
"not match for accelerator mex file." ) ; } { int ssSizeofParams ;
ssGetSizeofParams ( S , & ssSizeofParams ) ; if ( ssSizeofParams != sizeof (
P_rowstanu_T ) ) { static char msg [ 256 ] ; sprintf ( msg ,
"Unexpected error: Internal Parameters sizes do "
"not match for accelerator mex file." ) ; } } _ssSetDefaultParam ( S , (
real_T * ) & rowstanu_rtDefaultP ) ; } static void mdlInitializeSampleTimes (
SimStruct * S ) { } static void mdlTerminate ( SimStruct * S ) { }
#include "simulink.c"
