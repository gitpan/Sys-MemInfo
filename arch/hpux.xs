#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Sys::MemInfo PACKAGE = Sys::MemInfo

#include <sys/param.h>
#include <sys/pstat.h>


double
totalmem()
	PROTOTYPE: DISABLE	
	CODE:
    		struct pst_static pst_s;
		double pages = 0;
		double pagesize = 0;
    		if (pstat_getstatic (&pst_s, sizeof (struct pst_static), 1, 0) >= 0)
      		{
			pages = pst_s.physical_memory;
			pagesize = pst_s.page_size;
		}
		RETVAL = (pages * pagesize);
	OUTPUT:
		RETVAL

double
freemem()
	PROTOTYPE: DISABLE
	CODE:
		struct pst_static pst_s;
		struct pst_dynamic pst_d;
		double pages = 0;
		double pagesize = 0;
		if (pstat_getstatic (&pst_s, sizeof (struct pst_static), 1, 0) >=0 && pstat_getdynamic (&pst_d, sizeof (struct pst_dynamic), 1, 0) >=0)
      		{
			pages = pst_d.psd_free;
			pagesize = pst_s.page_size;
		}
		RETVAL = (pages * pagesize);
	OUTPUT:	
		RETVAL
