#if !defined(_KIND)
#define _KIND 4
#endif

module matrix_test
    implicit none
    real (kind=_KIND) :: eps = 0.000001

contains

! ---- tridiagonal_solve_test ----------------------
! Unit tests for algorithm.
!
subroutine tridiagonal_solve_test ()
    use matrix

    real (kind=_KIND) :: A(5,3), X(5)

    ! Test 1
    A(:,1) = 1
    A(:,2) = 2
    A(:,3) = 1
    A(1,1) = 0
    A(5,3) = 0
    X = (/1,2,3,4,5/)
    call tridiagonal_solve(A,X,5)
    if (any(X - (/0.5,0.0,1.5,0.0,2.5/) .GT. eps)) then
        write(*,*) "(tridiagonal_solve) test1 failed"
    endif

    ! Test 2
    A(:,1) = 1
    A(:,2) = 3
    A(:,3) = 2
    A(1,1) = 0
    A(5,3) = 0
    X = (/1,1,1,1,1/)
    call tridiagonal_solve(A,X,5)
    if (any(X - (/(1.0/3),0.0,(1.0/3),0.0,(1.0/3)/) .GT. eps)) then
        write(*,*) "(tridiagonal_solve) test2 failed"
    endif

end subroutine tridiagonal_solve_test

end module matrix_test
