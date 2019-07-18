c=randi([0, 9], [10,10]);
n=1;
a=3;
CT= comb1(a)
   while n < 121 %as there are 10 possible combinations with 9 variables]
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