c=randi([0, 9], [10,10]);
%generating all possible combinations for 9
comb1(9);
n=1; %n is the row number/ variable combination number to be applied
to the data
CT=ans;
%applying combinations to matrix through a structure
%combpcas(9,11,setsofnine)
while n<11 %as there are 10 possible combinations with 9 variables
F = CT{n,:};
b=c;
b=b(:,F); %select only variables specified by nth combination and
exclude all others
[coefff, score, latent, tsqaured, explained]=pca(b); %perform pca
SetLabel=['set' num2str(n)];
setsofnine.(SetLabel)= (explained); %store explained values
structure setsofnine for each combination
AddMatrix=setsofnine.(SetLabel)(1:2,:); %extract first two columns
(first two explained values)
SumLabel=['sum' num2str(n)];
setsofnine.(SumLabel)= sum(AddMatrix); %add first columns
n=n+1;
end
%find max
Cell = struct2cell(setsofnine); %transform structure to a cell
SumCell = Cell(2:2:end,:); % extract all the even rows (sum rows)
SumMatrix = [SumCell{:}]; %generate a matrix
[max_num,max_idx] = max(SumMatrix(:)) %determine max value in the
matrix
Max=CT(max_idx,:) %display the combination that resulted in the max
value