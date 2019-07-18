function [max_num, maximum]= combpcas(a)
    c=randi([0, 9], [10,10]);
    % d=randi([0, 9], [10,5]);
    n=1;
    CT = comb1(a);
    if a==1;
        y=11;
    elseif a==2;
        y=45;
    elseif a==3;
        y=121;
    elseif a==4;
        y=211;
    elseif a==5;
        y=253;
    end
   while n < y %as there are 10 possible combinations with 9 variables]
    F = CT{n,:};
    b=[c(:,F)];
    %b=[g,c]%select only variables specified by nth combination and exclude all others
    [coefff, score, latent, tsqaured, explained]=pca(b); %perform pca
    CombLabel=['comb' num2str(n)];
    PCAstruct(a).(CombLabel)= (explained);
    AddMatrix=PCAstruct(a).(CombLabel)(1:2,:);
    SumLabel=['sum' num2str(n)];
    PCAstruct(a).(SumLabel)= sum(AddMatrix);
    n=n+1;
   end
    Cell = struct2cell(PCAstruct(a)); %transform structure to a cell
    SumCell = Cell(2:2:end,:); % extract all the even rows (sum rows)
    SumMatrix = [SumCell{:}]; %generate a matrix
    [max_num,max_idx] = max(SumMatrix(:)) %determine max value in the matrix
    maximum=CT(max_idx,:) %display the combination that resulted in the max value
end