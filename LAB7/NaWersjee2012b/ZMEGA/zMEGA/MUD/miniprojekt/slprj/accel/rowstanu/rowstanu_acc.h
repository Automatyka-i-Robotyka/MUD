#include "__cf_rowstanu.h"
#ifndef RTW_HEADER_rowstanu_acc_h_
#define RTW_HEADER_rowstanu_acc_h_
#ifndef rowstanu_acc_COMMON_INCLUDES_
#define rowstanu_acc_COMMON_INCLUDES_
#include <stdlib.h>
#include <stddef.h>
#define S_FUNCTION_NAME simulink_only_sfcn 
#define S_FUNCTION_LEVEL 2
#define RTW_GENERATED_S_FUNCTION
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "rt_defines.h"
#endif
#include "rowstanu_acc_types.h"
typedef struct { real_T B_0_5_0 ; real_T B_0_6_0 ; real_T B_0_0_0 ; real_T
B_0_2_0 [ 2 ] ; } B_rowstanu_T ; typedef struct { void * ToWorkspace2_PWORK ;
void * ToWorkspace_PWORK ; void * ToWorkspace1_PWORK ; int_T Step_MODE ;
int_T Step1_MODE ; } DW_rowstanu_T ; typedef struct { real_T
StateSpace_CSTATE [ 2 ] ; } X_rowstanu_T ; typedef struct { real_T
StateSpace_CSTATE [ 2 ] ; } XDot_rowstanu_T ; typedef struct { boolean_T
StateSpace_CSTATE [ 2 ] ; } XDis_rowstanu_T ; typedef struct { real_T
StateSpace_CSTATE [ 2 ] ; } CStateAbsTol_rowstanu_T ; typedef struct { real_T
Step_StepTime_ZC ; real_T Step1_StepTime_ZC ; } ZCV_rowstanu_T ; typedef
struct { ZCSigState Step_StepTime_ZCE ; ZCSigState Step1_StepTime_ZCE ; }
PrevZCX_rowstanu_T ; struct P_rowstanu_T_ { real_T P_0 [ 4 ] ; real_T P_1 [ 2
] ; real_T P_2 [ 2 ] ; real_T P_4 [ 2 ] ; real_T P_5 ; real_T P_6 ; real_T
P_7 ; real_T P_8 ; real_T P_9 ; real_T P_10 ; } ; extern P_rowstanu_T
rowstanu_rtDefaultP ;
#endif
