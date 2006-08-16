#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Sys::MemInfo PACKAGE = Sys::MemInfo

#include <stdio.h>
#include <unistd.h>

double
totalmem()
	PROTOTYPE: DISABLE
	CODE:
		const long long pagetotal = sysconf (_SC_PHYS_PAGES);
		const long long pagesize = sysconf (_SC_PAGESIZE);
		double ret = (pagetotal *pagesize);
		RETVAL = ret;
	OUTPUT:
		RETVAL

double
freemem()
	PROTOTYPE: DISABLE
	CODE:
		const long long pagesize = sysconf (_SC_PAGESIZE);
		const long long pageavail = sysconf (_SC_AVPHYS_PAGES);
		double ret= (pageavail * pagesize);
		RETVAL = ret;
	OUTPUT:
		RETVAL
