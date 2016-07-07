function test

SystemStates = ['x','y','z'];
SystemInputs = ['u'];
Simulation = 1;
L = eye(10);
Sys(SystemStates,SystemInputs,Simulation,L)

end


function Sys(SystemStates,SystemInputs,Simulation,L)

fid = fopen('SysEquations.m','w');

NAgents  = size(L,1);
Counter = 1;

fprintf(fid, '%% Writing System States\n\n');

for SystemStatesCounter = 1:length(SystemStates)
    
    for AgentsCounter=1:NAgents
        
        if Simulation == 0
            
            fprintf(fid, '%s%s = sdpvar(1);\n', SystemStates(SystemStatesCounter),num2str(AgentsCounter));
            
        else
            
            fprintf(fid, '%s%s = states(%s);\n', SystemStates(SystemStatesCounter),num2str(AgentsCounter),num2str(Counter));
            Counter = Counter + 1;
            
        end
        
    end
end

fprintf(fid, '\n%% Writing System Inputs\n\n');
Counter = 1;

for SystemInputsCounter = 1:length(SystemInputs)
    
    for AgentsCounter=1:NAgents
        
        if Simulation == 0
            
            fprintf(fid, '%s%s = sdpvar(1);\n', SystemInputs(SystemInputsCounter),num2str(AgentsCounter));
            
        else
            
            fprintf(fid, '%s%s = inputs(%s);\n', SystemInputs(SystemInputsCounter),num2str(AgentsCounter),num2str(Counter));
            Counter = Counter + 1;
            
        end
        
    end
end

if Simulation == 0
    
    fprintf(fid, '\n%% Definition of the Variables q and inputs \n\n');
    
    for AgentsCounter=1:NAgents
        
        fprintf(fid, 'q%s = [', num2str(AgentsCounter));
                
        for SystemStatesCounter = 1:length(SystemStates)
            
            fprintf(fid, '%s%s', SystemStates(SystemStatesCounter),num2str(AgentsCounter));
            
            if SystemStatesCounter == length(SystemStates)
                
                fprintf(fid, '];\n');
                
            else
                
                fprintf(fid, '; ');
                
            end
            
        end
        
        fprintf(fid, 'input%s = [', num2str(AgentsCounter));
                
        for SystemInputsCounter = 1:length(SystemInputs)
            
            fprintf(fid, '%s%s', SystemInputs(SystemInputsCounter),num2str(AgentsCounter));
            
            if SystemInputsCounter == length(SystemInputs)
                
                fprintf(fid, '];\n\n');
                
            else
                
                fprintf(fid, '; ');
                
            end
            
        end
        
    end
    
    fprintf(fid, 'q = [');
    
    for AgentsCounter=1:NAgents
        
        fprintf(fid, 'q%s', num2str(AgentsCounter));
        
        if AgentsCounter == NAgents
            
            fprintf(fid, '];\n\n');
            
        else
            
            fprintf(fid, '; ');
            
        end
        
    end
    
    fprintf(fid, 'InputVector = [');
    
    for AgentsCounter=1:NAgents
        
        fprintf(fid, 'input%s', num2str(AgentsCounter));
        
        if AgentsCounter == NAgents
            
            fprintf(fid, '];\n\n');
            
        else
            
            fprintf(fid, '; ');
            
        end
        
    end
    
end

fclose(fid);

end