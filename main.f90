program main
    use matrix
    use matrix_test
    implicit none
    real (kind=8), allocatable :: A(:,:), X(:), D(:)
    real (kind=8) :: h
    integer (kind=4) :: N,i

    ! Tests
    call tridiagonal_solve_test ()

    ! Main body
    N = 5
    h = 1.0/n

    allocate(A(N,N))
    allocate(X(N+1))
    allocate(D(N+1))

    A(:,1) = n * n 
    A(:,2) = -2 * n * n 
    A(:,3) = A(:,1) 
    A(1,1) = 0
    A(n,3) = 0

    D = 0
    X(N+1) = 1

    !do i = 1,n
        !write(*,*) A(i,:)
    !end do
    call tridiagonal_solve (A,X,D,n)
    do i = 0,n+1
        write(*,*) i * h, X(i)
    end do
end program main

