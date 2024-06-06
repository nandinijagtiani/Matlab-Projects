% Chapter 7 

%% Bias
% simulate birthweight data (in Kg)
n= 100; % 1 sample with 5 subjects
mu = 3.5; % true mean birthweight (population mean)
sigma = 1; % population standard deviation

% simulate a random sample:
bw = mu + sigma*randn(n,1);

mean(bw)

% now try repeating this m times
m = 1000;
bw = mu + sigma*randn(n,m);
mean(bw)
mean(mean(bw,1),2) % mean of sample means, the 2 represents that we're 
% taking the mean of the second dimension. In other words, the mean of the 
%new array that forms with all sample means.
% M = mean(A,dim) returns the mean along dimension dim. For example, 
% if A is a matrix, then mean(A,2) is a column vector containing the mean 
% of each row.


mean(std(bw,0,1),2) % mean of std using n-1

mean(std(bw,1,1),2) % mean of std using n
