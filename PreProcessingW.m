%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Pre Processing W                                                 %
% Description: Creates the matrices W and DW for the LMI optmization      %
% Inputs: N. Integer, Scalar, Number of Agents                            %
%         SystemDimension. Integer, Scalar, Dimension of Each Subsystem   %
% Output: File 'CreatorWandDW.m' with the code definifn W and DW          %
% Author: Humberto Stein Shiromoto                                        %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function PreProcessingW(N,SystemDimension)

fid = fopen('CreatorWandDW.m','w');

% Writing the matrix W

Variable_Wp = 'Wp';
Variable_Wc = 'Wc';
Variable_Wv = 'Wv';
Variable_W = 'W';
Variable_DWTemp = 'DWTemp';
Variable_DW = 'DW';

dimW = SystemDimension;

for n = 1:N
    
    % Writes the line of code
    % [Wpn11,Wcn11,Wvn11] = polynomial(qn,Wdegree,0);
    % Note W is written as a polynomial in the variable q
    fprintf(fid, '%% Creation of W%s and DW%s\n',num2str(n),num2str(n));
    
    for nr = 1:dimW
        
        for nc = 1:dimW
            
            if nc >= nr
                
                fprintf(fid, '[');
                fprintf(fid, [Variable_Wp '%s%s%s,'], num2str(n),num2str(nr),num2str(nc));
                fprintf(fid, [Variable_Wc '%s%s%s,'], num2str(n),num2str(nr),num2str(nc));
                fprintf(fid, [Variable_Wv '%s%s%s]'], num2str(n),num2str(nr),num2str(nc));
                fprintf(fid, ' = polynomial(');
                fprintf(fid, 'q%s,', num2str(n));
                fprintf(fid, 'Wdegree,0);\n');
            
            end
            
        end
    end
    
    % Writes the matrix W whose elements are the polynomials Wp
    fprintf(fid, '%% Creation of W%s\n',num2str(n));
    
    fprintf(fid, [Variable_W '%s = ['], num2str(n));
    
    for nr = 1:dimW
        
        if nr > 1
            
            fprintf(fid, '      ');
            
        end
        
        for nc = 1:dimW
            
            if nc >= nr
                
                if nc < dimW
                    
                    fprintf(fid, [Variable_Wp '%s%s%s, '], num2str(n),num2str(nr),num2str(nc));
                    
                else
                    
                    if nr == dimW
                        
                        fprintf(fid, [Variable_Wp '%s%s%s];\n'], num2str(n),num2str(nr),num2str(nc));
                        
                    else
                        
                        fprintf(fid, [Variable_Wp '%s%s%s;\n'], num2str(n),num2str(nr),num2str(nc));
                        
                    end
                    
                end
                
            else
                
                fprintf(fid, [Variable_Wp '%s%s%s, '], num2str(n),num2str(nc),num2str(nr));
                
            end
            
        end
    end
    
    fprintf(fid, '\n', num2str(n));
    
    % Writes the vector Wc whose elements are the coefficients Wc
    fprintf(fid, [Variable_Wc '%s = ['], num2str(n));
    for nr = 1:dimW
        
        for nc = 1:dimW
            
            if nc >= nr
                
                if nr*nc < dimW^2
                    
                    fprintf(fid, [Variable_Wc '%s%s%s;'], num2str(n),num2str(nr),num2str(nc));
                    
                else
                    
                    fprintf(fid, [Variable_Wc '%s%s%s];\n'], num2str(n),num2str(nr),num2str(nc));
                    
                end
                
            end
            
        end
    end
    
    % Writes the vector Wp whose elements are the polynomials Wp
    fprintf(fid, [Variable_Wp '%s = ['], num2str(n));
    for nr = 1:dimW
        
        for nc = 1:dimW
            
            if nc >= nr
                
                if nr*nc < dimW^2
                    
                    fprintf(fid, [Variable_Wp '%s%s%s;'], num2str(n),num2str(nr),num2str(nc));
                    
                else
                    
                    fprintf(fid, [Variable_Wp '%s%s%s];\n'], num2str(n),num2str(nr),num2str(nc));
                    
                end
                
            end
            
        end
    end
    
    fprintf(fid, '\n', num2str(n));
    
    % Writes the code to compute DW as the Jacobian of W
    fprintf(fid, '%% Creation of DW%s\n',num2str(n));
    
    fprintf(fid, 'DWTemp = jacobian(');
    fprintf(fid, [Variable_Wp '%s,'], num2str(n));
    fprintf(fid, 'q%s);\n', num2str(n));
    
    % Writes the matrix DW whose elements are the elements of the vector DWTemp
    fprintf(fid, [Variable_DW '%s = ['], num2str(n));
    
    counter = 1;
    RowCounter = 1;
    for nr = 1:dimW
        
        for nc = 1:dimW
            
            if nc >= nr
                
                if nc == dimW && nr < dimW
                    
                    fprintf(fid, [Variable_DWTemp '(%s);\n'], num2str(counter));
                    fprintf(fid,'       ');
                    
                elseif nr == dimW
                    
                    fprintf(fid, [Variable_DWTemp '(%s)];\n'], num2str(counter));
                    
                else
                    
                    if nc == nr
                        
                        fprintf(fid, [Variable_DWTemp '(%s), '], num2str(counter));
                        RowCounter = nr + 1;
                    
                    else
                        
                        fprintf(fid, [Variable_DWTemp '(%s), '], num2str(counter));
                        
                    end
                
                end
                
                counter = counter + 1;
                
            else
                
                fprintf(fid, [Variable_DWTemp '(%s), '], num2str(RowCounter));
                
            end
            
        end
        
        
    end
    
    fprintf(fid, [Variable_DW '%s = '], num2str(n));
    fprintf(fid, [Variable_DW '%s + transpose('], num2str(n));
    fprintf(fid, [Variable_DW '%s);\n'], num2str(n));
    fprintf(fid, '\n\n', num2str(n));
end

% Writes W as block-diagonal matrix composed of the Wn's
fprintf(fid, 'W = blkdiag(');
for n = 1:N
    
    if n < N
        fprintf(fid, [Variable_W '%s,'], num2str(n));
    else
        fprintf(fid, [Variable_W '%s);\n'], num2str(n));
    end
    
end

% Writes DW as block-diagonal matrix composed of the DWn's
fprintf(fid, 'DW = blkdiag(');
for n = 1:N
    
    if n < N
        fprintf(fid, [Variable_DW '%s,'], num2str(n));
    else
        fprintf(fid, [Variable_DW '%s);\n'], num2str(n));
    end
    
end

% Writes Wc a vector obtained by concatenating all Wc's
fprintf(fid, 'Wc = [');
for n = 1:N
    
    if n < N
        fprintf(fid, [Variable_Wc '%s;'], num2str(n));
    else
        fprintf(fid, [Variable_Wc '%s];\n'], num2str(n));
    end
    
end

fclose(fid);

