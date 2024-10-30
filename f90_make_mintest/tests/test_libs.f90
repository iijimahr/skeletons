!==============================================================================!
!          file: test_libs.f90
!   description: Test library.
!        author: H. Iijima
!          date: 2024-09-17
!==============================================================================!

#include "mintest.f90"
MINTEST_DEFINE_MAIN


subroutine test_case()
  use libs
  implicit none

  check(abs(add(1.d0, -1.d0)) < 1.d-16)
  check(abs(add(2.d0, -1.d0)) < 1.d-16)
end subroutine test_case
