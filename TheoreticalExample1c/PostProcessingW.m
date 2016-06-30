function PostProcessingW(NumberOfAgents,SystemDimension)

fid = fopen('PostProcessedWandDW.m','w');

SysDim = SystemDimension;
NAgen  = NumberOfAgents;

Variable_W = 'W';
Variable_VerifiedW = 'VerifiedW';


fprintf(fid, '%% Rewriting the matrix W\n');

for nr = 1:NAgen*SysDim
    
    for nc = 1:NAgen*SysDim
        
            
            fprintf(fid, 'VerifiedW%s%s = ', num2str(nr),num2str(nc));
            fprintf(fid, 'clean(replace(W(%s,%s), coefList, double(coefList)), eps);\n', num2str(nr),num2str(nc));
            fprintf(fid, 'W%s%s = ', num2str(nr),num2str(nc));
            fprintf(fid, 'sdisplay(VerifiedW%s%s);\n\n', num2str(nr),num2str(nc));
            
        
    end
end

fprintf(fid, 'W = [');

for nr = 1:NAgen*SysDim
    
    for nc = 1:NAgen*SysDim
        
             if nc == NAgen*SysDim && nr == NAgen*SysDim
                 
                 fprintf(fid, 'W%s%s];\n', num2str(nr),num2str(nc));
                 
             elseif nc == NAgen*SysDim
            
                 fprintf(fid, 'W%s%s;\n', num2str(nr),num2str(nc));
                 fprintf(fid, '     ');
                 
             else
                 
                 fprintf(fid, 'W%s%s, ', num2str(nr),num2str(nc));
                 
             end
            
        
    end
end
    

end