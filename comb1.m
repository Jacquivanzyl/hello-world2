function [CT]=comb1(a)
    v=1:10;
    A = nchoosek(v,a);
    rownames = cellstr(string(1:size(A,1)));
    CT =array2table(A,'RowNames',rownames); %convert array to table and label rows
end