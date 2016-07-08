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

% Note: Works only for Linear Graphs!

function PreProcessingY(NumberOfAgents,NumberOfLinesBi,Ydegree,Option)

fid = fopen('PreProcessedY.m','w');

for AgentCounter = 1:NumberOfAgents
    
    fprintf(fid, '\n');
    
    for ComponentCounter = 1:NumberOfLinesBi
            
            fprintf(fid, '[Yp%s%s,Yc%s%s,Yv%s%s] = polynomial', num2str(AgentCounter),num2str(ComponentCounter), num2str(AgentCounter),num2str(ComponentCounter), num2str(AgentCounter),num2str(ComponentCounter));
            
            if strcmp(Option,'General')
                
                fprintf(fid, '(q,%f,0);\n', Ydegree);
                
            elseif strcmp(Option,'Decentralized')
                
                fprintf(fid, '(q%s,%f,0);\n', num2str(AgentCounter),Ydegree);
                
            else 
                
                if AgentCounter == 1
                    
                    fprintf(fid, '([q%s;q%s],%f,0);\n', num2str(AgentCounter),num2str(AgentCounter+1),Ydegree);
                    
                elseif AgentCounter == NumberOfAgents
                    
                    fprintf(fid, '([q%s;q%s],%f,0);\n', num2str(AgentCounter-1),num2str(AgentCounter),Ydegree);
                    
                else
                    
                    fprintf(fid, '([q%s;q%s;q%s],%f,0);\n', num2str(AgentCounter-1),num2str(AgentCounter),num2str(AgentCounter+1),Ydegree);
                    
                end
            
            end
            
        
    end
    
end

fprintf(fid, '\n');

for AgentCounter = 1:NumberOfAgents
    
    fprintf(fid, '\n');
    fprintf(fid, 'Y%s = [', num2str(AgentCounter));
    
    for ComponentCounter = 1:NumberOfLinesBi
        
        fprintf(fid, 'Yp%s%s', num2str(AgentCounter),num2str(ComponentCounter));
        
        if ComponentCounter == NumberOfLinesBi
            
            fprintf(fid, '];');
            
        else
            
            fprintf(fid, ', ');
            
        end
        
    end
    
end

fprintf(fid, '\n\n');
fprintf(fid, 'Yc = [');

for AgentCounter = 1:NumberOfAgents
    
    for ComponentCounter = 1:NumberOfLinesBi
        
        fprintf(fid, 'Yc%s%s', num2str(AgentCounter),num2str(ComponentCounter));
        
        if ComponentCounter == NumberOfLinesBi && AgentCounter == NumberOfAgents
            
            fprintf(fid, '];');
            
        else
            
            fprintf(fid, '; ');
            
        end
        
    end
    
end

fclose(fid);

end