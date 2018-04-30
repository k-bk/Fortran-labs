#if !defined(_KIND)
#define _KIND 4
#endif

program main
    use matrix , only : tridiagonal_solve
    use matrix_test, only : tridiagonal_solve_test
    implicit none
    real (kind=_KIND), allocatable :: A(:,:), X(:)
    real (kind=_KIND) :: h,nn,error_sum
    integer (kind=4) :: N,i
    character(len=20) :: argv

    ! Read command line input
    call get_command_argument(1,argv)
    if (command_argument_count() < 1) then
        N = 10
    else 
        read(argv,*) N
    end if

    ! Tests
    call tridiagonal_solve_test ()

    ! Main body
    nn = 1.0 * N * N
    h = 1.0/N

    allocate(A(N,3))
    allocate(X(N))

    A(:,1) = nn 
    A(:,2) = - 2 * nn
    A(:,3) = nn 
    A(1,1) = 0

    X = 0
    X(N) = - N*(N + 1) 

    call tridiagonal_solve (A,X,N)

    error_sum = 0
    do i = 0,N
        write(*,*) i * h, X(i)
        error_sum = error_sum + abs(X(i) - i*h)
    end do

    write(*,*) "Average error = ", error_sum / N

end program main
