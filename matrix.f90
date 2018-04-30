module matrix
    implicit none
contains

! ---- tridiagonal_solve ---------------------------
! Solves a tridiagonal system using simplified Gauss
! elimination algorithm.
!
!   [A] x [X] = [D]
!
subroutine tridiagonal_solve (A,X,D,N) 
    implicit none

    real (kind=8), intent(inout) :: A(:,:), D(:)
    real (kind=8), intent(out) :: X(:)
    real (kind=8) :: multi
    integer (kind=4) :: i,N

    ! Finding normalized bidiagonal matrix
    D(1) = D(1) / A(1,2)
    A(1,:) = A(1,:) / A(1,2)

    do i = 2,N
        multi = A(i-1,2) / A(i,1) 
        A(i,1) = 0
        A(i,2) = A(i,2) * multi - A(i-1,3) 
        D(i) = D(i) * multi - D(i-1)
        D(i) = D(i) / A(i,2)
        A(i,:) = A(i,:) / A(i,2)
    end do

    ! Obtaining result usig back substitution
    do i = N,1,-1
        X(i) = X(i) + D(i) - A(i,3) * X(i+1)
        write(*,*) D(i), A(i,3), X(i)
    end do
end subroutine tridiagonal_solve

end module matrix

