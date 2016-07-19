function L=RandomLaplacianGenerator(NAgents)

L = randi([-1,0],NAgents);

for RowCounter = 1:NAgents
    
    for ColumnCounter = 1:NAgents
        
        if ColumnCounter <= RowCounter
            
            L(RowCounter,ColumnCounter) = 0;
            
        end
        
    end
    
end

L = L + transpose(L);

for Counter = 1:NAgents
    
    L(Counter,Counter) = max(1,-sum(L(Counter,:)) + L(Counter,Counter));
    
end

end