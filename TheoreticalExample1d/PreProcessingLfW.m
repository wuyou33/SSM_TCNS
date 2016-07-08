function PreProcessingLfW(NumberOfAgents,lambda)

fid = fopen('PreProcessedLfW.m','w');

for AgentCounter = 1:NumberOfAgents
    
    fprintf(fid, 'LfW%s = -DW%s + ', num2str(AgentCounter),num2str(AgentCounter));
    
    if AgentCounter == 1
        
        for NeighborCounter = 1:min(2,NumberOfAgents)
        
        fprintf(fid, 'A%s%s*W%s + transpose(A%s%s*W%s) + ',num2str(AgentCounter),num2str(NeighborCounter),num2str(NeighborCounter),num2str(NeighborCounter),num2str(AgentCounter),num2str(AgentCounter));
    
        end
        
    elseif AgentCounter == NumberOfAgents
        
        for NeighborCounter = AgentCounter-1:NumberOfAgents
        
            fprintf(fid, 'A%s%s*W%s + transpose(A%s%s*W%s) + ',num2str(AgentCounter),num2str(NeighborCounter),num2str(NeighborCounter),num2str(NeighborCounter),num2str(AgentCounter),num2str(AgentCounter));
    
        end
        
    else
        
        for NeighborCounter = AgentCounter-1:AgentCounter+1
        
            fprintf(fid, 'A%s%s*W%s + transpose(A%s%s*W%s) + ',num2str(AgentCounter),num2str(NeighborCounter),num2str(NeighborCounter),num2str(NeighborCounter),num2str(AgentCounter),num2str(AgentCounter));
    
        end
        
    end
    
    fprintf(fid, 'B%s*Y%s + transpose(B%s*Y%s) + 2*%d*W%s;\n', num2str(AgentCounter),num2str(AgentCounter),num2str(AgentCounter),num2str(AgentCounter),lambda,num2str(AgentCounter));
    
end

fprintf(fid,'\n');

fprintf(fid,'Constraints = [ ');

for AgentCounter = 1:NumberOfAgents
    
    if AgentCounter < NumberOfAgents
        
        fprintf(fid,'sos(W%s-eye(2)); sos(-LfW%s+eye(2)); ',num2str(AgentCounter),num2str(AgentCounter));
        
    else
        
        fprintf(fid,'sos(W%s-eye(2)); sos(-LfW%s+eye(2))]; ',num2str(AgentCounter),num2str(AgentCounter));
        
    end
    
end

fclose(fid);

end