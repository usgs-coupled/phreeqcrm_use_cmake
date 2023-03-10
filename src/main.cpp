#include <cstdlib>
#include <iostream>

#include "PhreeqcRM.h"

int main(void)
{
  int nxyz = 10;
  int nthreads = 3;
  PhreeqcRM phreeqc_rm(nxyz, nthreads);

  if (phreeqc_rm.LoadDatabase("phreeqc.dat") != IRM_OK) {
    std::cout << "ERROR: Couldn't load database.\n";
    return EXIT_FAILURE;
  }
  
  std::cout << "Sucessfully loaded database\n";
  return EXIT_SUCCESS;
}
