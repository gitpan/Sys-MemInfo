#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Sys::MemInfo PACKAGE = Sys::MemInfo

#include <stdio.h>
#include <windows.h>
#include <psapi.h>

double
totalmem()
	PROTOTYPE: DISABLE
	CODE:
		PERFORMANCE_INFORMATION pInfo;
		double ret = 0;		

		if (GetPerformanceInfo(&pInfo, sizeof(PERFORMANCE_INFORMATION)))
			ret = (pInfo.PhysicalTotal * pInfo.PageSize);

		RETVAL = ret;
	OUTPUT:
		RETVAL

double
freemem()
	PROTOTYPE: DISABLE
	CODE:
		PERFORMANCE_INFORMATION pInfo;		
		double ret = 0;

		if (GetPerformanceInfo(&pInfo, sizeof(PERFORMANCE_INFORMATION)))
			ret = (pInfo.PhysicalAvailable * pInfo.PageSize);
		
		RETVAL = ret;
	OUTPUT:
		RETVAL
