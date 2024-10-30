!==============================================================================!
!          file: libs.f90
!   description: Library to be tested.
!        author: H. Iijima
!          date: 2024-09-17
!==============================================================================!

module libs
  implicit none

contains

function add(lhs, rhs) result(sum)
  real(8), intent(in) :: lhs, rhs
  real(8) :: sum

  sum = lhs + rhs
end function add

end module libs
