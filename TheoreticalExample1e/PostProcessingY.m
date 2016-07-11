function PostProcessingY(NumberOfAgents,prec)

fid = fopen('PostProcessedY.m','w');

for nr = 1:NumberOfAgents
        
        fprintf(fid, 'VerifiedY%s = ', num2str(nr));
        fprintf(fid, 'clean(replace(Y%s, coefList, double(coefList)), %s);\n', num2str(nr),num2str(prec));
        fprintf(fid, 'Y%s = ', num2str(nr));
        fprintf(fid, 'sdisplay(VerifiedY%s);\n\n', num2str(nr));
        
end
    
fclose(fid);
end