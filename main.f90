program main
    use matrix
    use matrix_test
    implicit none
    real (kind=8), allocatable :: A(:,:), X(:)
    real (kind=8) :: h
    integer (kind=4) :: N,i

    ! Tests
    !call tridiagonal_solve_test ()

    ! Main body
    N = 100
    h = 1.0/N

    allocate(A(N,N))
    allocate(X(N))

    A(:,1) = 1 / (h*h) 
    A(:,2) = -2 / (h*h) 
    A(:,3) = 1 / (h*h) 
    A(1,1) = 0
    A(N,3) = 0

    X(N) = 1

    !do i = 1,n
        !write(*,*) A(i,:)
    !end do
    call tridiagonal_solve (A,X,N)
    do i = 1,N
        write(*,*) i * h, X(i)
    end do
end program main

