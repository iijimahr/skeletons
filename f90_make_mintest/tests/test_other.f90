!==============================================================================!
!          file: test_other.f90
!   description: Test others.
!        author: H. Iijima
!          date: 2024-09-18
!==============================================================================!

#include "mintest.f90"
MINTEST_DEFINE_MAIN


subroutine test_case()
  implicit none

  check(1 == 1)
  check(1 + 1 == 2)
  check(.true.)
end subroutine test_case
