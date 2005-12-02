#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Sys::MemInfo PACKAGE = Sys::MemInfo

#include <stdio.h>
#include <unistd.h>
#include <libperfstat.h>


u_longlong_t
totalmem()
	PROTOTYPE: DISABLE
	perfstat_memory_total_t meminfo;
	u_longlong_t totalmem = 0;
        CODE:
		if (perfstat_memory_total (NULL, &meminfo, sizeof(perfstat_memory_total_t), 1)!=-1)
			totalmem = meminfo.real_total * 4;
		RETVAL = totalmem;
        OUTPUT:
		RETVAL


u_longlong_t
freepages()
	PROTOTYPE: DISABLE
	perfstat_memory_total_t meminfo;
	u_longlong_t freemem = 0;
	CODE:
		if (perfstat_memory_total (NULL, &meminfo, sizeof(perfstat_memory_total_t), 1)!=-1)
			freemem = meminfo.real_free * 4;
		RETVAL = freemem;
	OUTPUT:
		RETVAL
