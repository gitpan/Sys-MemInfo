#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Sys::MemInfo PACKAGE = Sys::MemInfo

#include <sys/sysinfo.h>
#include <machine/hal_sysinfo.h>
#include <mach.h>

double
totalmem()
	PROTOTYPE: DISABLE	
	CODE:
		long totalmem;
		int pos = -1;
		double totalmem_b = 0;

		if (getsysinfo(GSI_PHYSMEM, (caddr_t)&totalmem, sizeof(totalmem), &pos, NULL, NULL)>0) {
			totalmem_b = totalmem * 1024;
		}
		RETVAL = totalmem_b;
	OUTPUT:
		RETVAL

double
freemem()
	PROTOTYPE: DISABLE
	CODE:
		struct vm_statistics vm_stat;
		double freemem = 0;

		if (vm_statistics(current_task(), &vm_stat) == 0) {
			freemem = vm_stat.free_count * vm_stat.pagesize;
		}

		RETVAL = freemem;
	OUTPUT:	
		RETVAL
