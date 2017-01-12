function L=CyclicLaplacianGenerator(NAgents)

L = zeros(NAgents,NAgents);

for RowCounter = 1:NAgents
    
    for ColumnCounter = 1:NAgents
        
        if ColumnCounter >= RowCounter
            
            if ColumnCounter == RowCounter
                    
                    L(RowCounter,ColumnCounter) = 1;
                
            else
                
                if ColumnCounter == RowCounter - 1 || ColumnCounter == RowCounter + 1
                    L(RowCounter,ColumnCounter) = -1;
                end
                
                if RowCounter == 1 && ColumnCounter == NAgents
                    L(RowCounter,ColumnCounter) = -1;
                end
                
                if RowCounter == NAgents && ColumnCounter == 1
                    L(RowCounter,ColumnCounter) = -1;
                end
                
            end
            
        end
        
    end
    
end

L = L + transpose(L);


end