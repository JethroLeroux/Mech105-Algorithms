function [L,U,P]=luFactor(A)
%luFactor(A) returns the LU Factorization of a square matrix using partial
%pivoting
%Inputs:
%   A - coefficient matrix for system of equations
%Outputs:
%   L - lower triangular matrix
%   U - upper triangular matrix
%   P - the pivot matrix

if(size(A,1)==size(A,2)&&nargin==1) %checks that the matrix is square by having the same x and y dimensions and that there is one input
    n= size(A,1); %n is the number of rows and columns
    P = diag(ones(n,1,1)); %initializes the square pivot matrix with 1s down the diagonal
    U = A; %initializes U
    L = P; %initializes L
    
    column = 1; %column that is being looked at
    for x=1:n-1 %pivoting may need to be done n-1 times
        [i,c]=max(abs(U(x:n,x)));%finds the absolute max value in a specified column where c is the row with the abs max value        
       
        c=c+(x-1); %adjusts c to be the indices of U and not just part of U
        U([c x],:)=U([x c],:);%switches the x row and the row with the max value
        P([c x],:)=P([x c],:);%pivots the P matrix similarly
        
        if(x~=1)%then the L values in the previous column need to be pivoted as U changed
            temp=L(x,column-1);
            L(x,column-1)=L(c,column-1);
            L(c,column-1)=temp;
        end

        for q=x:n-1%calculate U and L values
            if(~isnan(U(q+1,column)/U(x,column)))%to stop a divide by 0 error
                L(q+1,column)=U(q+1,column)/U(x,column);%find the ratio needed to eliminate a variable
                U(q+1,:)=U(q+1,:)-L(q+1,column)*U(x,:);%find the resultant terms using the ratio
            end   
        end 
        
        column=column+1;%process next column
    end
    
 display(U); 
 display(L);
 
else
    error('This matrix is not square or you have not provided only one input, i.e. the number of rows is not the same as the number of columns');
end

