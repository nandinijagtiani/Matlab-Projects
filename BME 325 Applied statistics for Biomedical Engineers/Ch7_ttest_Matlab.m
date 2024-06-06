% from height data survey

load Discussion1data.mat

height=Discussion1data.Height_in; %from the table, I'm defining the variable
%height as the height of everyone= population)

mu=mean(height); % population mean

% class average height was 67.2 in (population mean),we're interested in
% looking at a subpopulation: females

height_fem=height(Discussion1data.Sex=='female')


%We want to test the null hypothesis (Ho: mean of female=mean class)

% let's do t-statistics and caclulate a p value. Assume sigma is 0.05. 
%We had 17 data entries for females, therefore, I divide by the square root of n_female.

n_female=17; %n data points for females
tfemale=(mean(height_fem)-mu)/(std(height_fem)/sqrt(n_female))

% Let's calculate p-value
pfemale=tcdf(tfemale,16)+(1-tcdf(-tfemale,16))

% degrees of freedom is n-1, therefore we use 16
% claculated p was .0059 therefore we reject the null since the p-value <0.05.
% In other words the height of the female sample is significantly different than the
% general population

%Another option to calculate p-value
[h,p]=ttest(height_fem,mu); % this command performs a t-test on the height_fem 
%group and compares it with population mean, mu). Running this you'll get
%p=0.0059 as well. 

%% Question: Using the same generated data for female, what is the range 
% over which 95% of data will fall?

% We're using t-statistics since the population standard deviation for 
% females is unknown
range= std(height_fem)/sqrt(n_female)*tinv([0.025 .975],16)+mean(height_fem)


% [63.6736 66.5028] That is the range over which 95% data will fall






