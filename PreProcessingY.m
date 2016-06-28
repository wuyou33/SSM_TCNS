%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Pre Processing Y                                                 %
% Description: Creates the matrix Y for the LMI optmization               %
% Inputs: nr. Integer, Scalar, Number of Rows                            %
%         nc. Integer, Scalar, Number of Columns   %
% Output: File 'CreatorWandDW.m' with the code definifn W and DW          %
% Author: Humberto Stein Shiromoto                                        %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note: input should be size(B')

function PreProcessingY(nr,nc)

fid = fopen('CreatorY.m','w');

Variable_Y = 'Y';
Variable_Yc = 'Yc';

% Writes the line of code
% [Yij,Ycij,Yvij] = polynomial(qn,Wdegree,0);
% Note Y is written as a polynomial in the variable q

for i = 1:nr
    
    fprintf(fid, '\n');
    
    for j = 1:nc
        
        fprintf(fid, '[');
        fprintf(fid, [Variable_Y '%s%s,'],  num2str(i),num2str(j));
        fprintf(fid, [Variable_Yc '%s%s,'], num2str(i),num2str(j));
        fprintf(fid, 'Yv%s%s]',              num2str(i),num2str(j));
        fprintf(fid, ' = polynomial(');
        fprintf(fid, 'q%s,', num2str(i));
        fprintf(fid, 'Ydegree,0);\n');
        
    end
    
end

% Writes the vector Yc = [Ycij];

fprintf(fid, '\n');
fprintf(fid, 'Yc = [');
for i = 1:nr
    
    if i > 1
        
        fprintf(fid,'      ');
    end
    
    for j = 1:nc
        
        if j < nc
            
            fprintf(fid, [Variable_Yc '%s%s; '], num2str(i),num2str(j));
            
        else
            
            if i == nr
                
                 fprintf(fid, [Variable_Yc '%s%s];\n'], num2str(i),num2str(j));
            
            else
                
                fprintf(fid, [Variable_Yc '%s%s;\n'], num2str(i),num2str(j));
                
            end
            
        end
        
    end
    
end

% Writes the matrix Y = [Yij];

fprintf(fid, '\n');
fprintf(fid, 'Y = [');
for i = 1:nr
    
    if i > 1
        
        fprintf(fid,'     ');
    end
    
    for j = 1:nc
        
        if j < nc
            
            fprintf(fid, [Variable_Y '%s%s, '], num2str(i),num2str(j));
            
        else
            
            if i == nr
                
                 fprintf(fid, [Variable_Y '%s%s];\n'], num2str(i),num2str(j));
            
            else
                
                fprintf(fid, [Variable_Y '%s%s;\n'], num2str(i),num2str(j));
                
            end
            
        end
        
    end
    
end


end