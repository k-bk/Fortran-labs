#if !defined(PREC)
#define PREC 4
#endif

program main
    use matrix, only : tridiagonal_solve
    use matrix_test, only : tridiagonal_solve_test
    implicit none
    real (kind=8), allocatable :: A(:,:), X(:)
    real (kind=8) :: h
    integer (kind=4) :: N,i

    ! Tests
    call tridiagonal_solve_test ()

    ! Main body
    N = 5
    h = 1.0/N

    allocate(A(N,3))
    allocate(X(N))

    A(:,1) = N * N 
    A(:,2) = - 2 * N * N 
    A(:,3) = 1 * N * N 
    A(1,1) = 0
    A(N,3) = 0

    X = 0
    X(N) = 1

    call tridiagonal_solve (A,X,N)

    ! Write results to file
    open(unit = 10, file = "result.txt")
    do i = 0,N
        write(10,*) real(i / N), X(i)
    end do
    close(10)

end program main
