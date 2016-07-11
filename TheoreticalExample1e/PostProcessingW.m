function PostProcessingW(NumberOfAgents,prec)

fid = fopen('PostProcessedWandDW.m','w');

for nr = 1:NumberOfAgents
        
        fprintf(fid, 'VerifiedW%s = ', num2str(nr));
        fprintf(fid, 'clean(replace(W%s, coefList, double(coefList)), %s);\n', num2str(nr),num2str(prec));
        fprintf(fid, 'W%s = ', num2str(nr));
        fprintf(fid, 'sdisplay(VerifiedW%s);\n\n', num2str(nr));
        
end

fclose(fid);
    

end