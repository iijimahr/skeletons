!==============================================================================!
!    SPDX-FileCopyrightText: Copyright (c) 2024 Haruhisa Iijima
!    SPDX-License-Identifier: BSD-3-Clause
!==============================================================================!

!> @brief Store and increment number of all check macros.
function mintest_num_all_checks(inc) result(retval)
  logical, intent(in), optional :: inc
  integer :: retval

  integer, save :: counter = 0
  if (present(inc)) then
    if (inc) then
      counter = counter + 1
    end if
  end if
  retval = counter
end function mintest_num_all_checks

!> @brief Store and increment number of passed check macros.
function mintest_num_passed_checks(inc) result(retval)
  logical, intent(in), optional :: inc
  integer :: retval

  integer, save :: counter = 0
  if (present(inc)) then
    if (inc) then
      counter = counter + 1
    end if
  end if
  retval = counter
end function mintest_num_passed_checks

!> @brief Helper function of check macro.
subroutine mintest_check_impl(cond, str, file, line)
  implicit none
  interface
    integer function mintest_num_all_checks(inc)
      logical, intent(in), optional :: inc
    end function mintest_num_all_checks

    integer function mintest_num_passed_checks(inc)
      logical, intent(in), optional :: inc
    end function mintest_num_passed_checks
  end interface

  logical, intent(in) :: cond
  character(len=*), intent(in) :: str, file
  integer, intent(in) :: line

  character(len=*), parameter :: col_red = achar(27) // "[31m"
  character(len=*), parameter :: col_yellow = achar(27) // "[33m"
  character(len=*), parameter :: col_reset = achar(27) // "[0m"
  character, parameter :: tab = achar(9)

  integer :: dummy

  dummy = mintest_num_all_checks(inc=.true.)
  if (cond) then
    dummy = mintest_num_passed_checks(inc=.true.)
  else
    print '(a, i0, a)', col_red // "[TEST FAILED] " // col_reset // file // ":", line, ":"
    print '(a)', tab // "CHECK(" // col_yellow // str // col_reset // ") is NOT correct!"
  end if
end subroutine

!> @brief Print ending message.
subroutine mintest_ending(file)
  implicit none
  interface
    integer function mintest_num_all_checks(inc)
      logical, intent(in), optional :: inc
    end function mintest_num_all_checks

    integer function mintest_num_passed_checks(inc)
      logical, intent(in), optional :: inc
    end function mintest_num_passed_checks
  end interface

  character(len=*), intent(in) :: file

  character(len=*), parameter :: col_red = achar(27) // "[31m"
  character(len=*), parameter :: col_green = achar(27) // "[32m"
  character(len=*), parameter :: col_blue = achar(27) // "[34m"
  character(len=*), parameter :: col_reset = achar(27) // "[0m"
  character, parameter :: tab = achar(9)

  logical :: test_case_success
  integer :: num_failed_checks

  test_case_success = mintest_num_all_checks() == mintest_num_passed_checks()
  num_failed_checks = mintest_num_all_checks() - mintest_num_passed_checks()

  write(*, fmt='(a)') col_blue // "[Summary] " // col_reset // file
  write(*, fmt='(a, i0, a, i0, a)', advance="no") &
    & tab // "assertions: ", mintest_num_all_checks(), &
    & " | " // col_green, mintest_num_passed_checks(), " passed" // col_reset
  if (test_case_success) then
    write(*, fmt='(a, i0, a)') " | ", num_failed_checks, " failed"
    write(*, fmt='(a)') tab // "Status: " // col_green // "SUCCESS!" // col_reset
  else
    write(*, fmt='(a, i0, a)') &
      & " | " // col_red, num_failed_checks, " failed" // col_reset
    write(*, fmt='(a)') tab // "Status: " // col_red // "FAILURE!" // col_reset
  end if
end subroutine mintest_ending

!> @brief Default main program of mintest.
#define MINTEST_DEFINE_MAIN \
program main; \
  implicit none; \
  call test_case(); \
  call mintest_ending(__FILE__); \
end program main

!> @brief Assert a conditional expression.
#define check(cond) call mintest_check_impl(cond, "cond", __FILE__, __LINE__)

