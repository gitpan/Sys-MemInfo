#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Sys::MemInfo PACKAGE = Sys::MemInfo

#include <stdio.h>
#include <sys/param.h>
#include <sys/sysctl.h>

double
totalmem()
	PROTOTYPE: DISABLE
	CODE:
		unsigned long ret = 0;
		size_t len = sizeof (unsigned long);
		static int mib[2] = { CTL_HW, HW_PHYSMEM };

		if (!sysctl (mib, 2, &ret, &len, NULL, 0) && len == sizeof (ret)) {
      			RETVAL = (double) (ret);
    		} else {
			RETVAL = 0;
		}
	OUTPUT:
		RETVAL
		

double
freemem()
	PROTOTYPE: DISABLE
	CODE:
		unsigned long ret;
		size_t len = sizeof (unsigned long);
		static int mib[2] = { CTL_HW, HW_USERMEM };

		if (!sysctl (mib, 2, &ret, &len, NULL, 0) && len == sizeof (ret)) {
			RETVAL = (double) (ret);
		} else {
			RETVAL = 0;
		}
	OUTPUT:
		RETVAL
