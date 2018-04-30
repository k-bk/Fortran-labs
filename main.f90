#if !defined(_KIND)
#define _KIND 4
#endif

program main
    use matrix , only : tridiagonal_solve
    use matrix_test, only : tridiagonal_solve_test
    implicit none
    real (kind=_KIND), allocatable :: A(:,:), X(:)
    real (kind=_KIND) :: h,nn
    integer (kind=4) :: N,i

    ! Tests
    call tridiagonal_solve_test ()

    ! Main body
    N = 100
    nn = 1.0 * N * N
    h = 1.0/N

    allocate(A(N,3))
    allocate(X(N))

    A(:,1) = nn 
    A(:,2) = - 2 * nn
    A(:,3) = nn 
    A(1,1) = 0

    X = 0
    X(N) = 1 * nn 

    call tridiagonal_solve (A,X,N)

    do i = 0,N
        write(*,*) i * h, X(i) + i * h
    end do

end program main
