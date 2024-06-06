%% Get data into useful variables:

% select only male or only female students:
samplef = [60,67,64,65,65,63,65,64,65,66,66,65,66,65,66,68,68,69,65,63];
samplem = [75,70,68,77,74,74,69,72,70,69,74,74,67,75,72,72,72,74,69,74,69,69];

% sample mean and std
meanf = mean(samplef)
stdf = std(samplef)
meanm = mean(samplem)
stdm = std(samplem)

figure(2)
histogram(samplem)
hold on; histogram(samplef); hold off

%% Hypothesis test: paired sample? 
% no obvious pairing, so does not make sense in this context

%% Hypothesis test: two sample
[h2, p2, CI2, Stats2] = ttest2(samplef,samplem)

%% Hypothesis test: two sample, do not assume equal variance
[h3, p3, CI3, Stats3] = ttest2(samplef,samplem, 'VarType', 'unequal')


%% Is the assumption of equal variances good?
% use F test
s2f = var(samplef);
s2m = var(samplem);
nf = size(samplef,2);
nm = size(samplem,2);
f = s2f/s2m

%plot f dist for these degrees fo freedom
frange = 0:.05:6;
figure(3)
plot(frange,fpdf(frange, nf-1,nm-1),frange,fpdf(frange, nm-1,nf-1))

alpha = 0.05; % significance level
f1 = finv(alpha/2, nf-1, nm-1)
f2 = finv(1-alpha/2, nf-1, nm-1)

% could also calculate p = probability of getting a more extreme value of f
pf = 2*(1-fcdf(f, nf-1, nm-1))


