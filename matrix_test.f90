module matrix_test
    implicit none

contains

subroutine tridiagonal_solve_test ()
    use matrix

    real (kind=8) :: A(5,3), X(5), D(5)
    A(:,1) = 1
    A(:,2) = 2
    A(:,3) = 1
    A(1,1) = 0
    A(5,3) = 0
    D = (/1,2,3,4,5/)
    call tridiagonal_solve(A,X,D)
    write(*,*) "And solution is"
    write(*,*) X

end subroutine tridiagonal_solve_test

end module matrix_test
