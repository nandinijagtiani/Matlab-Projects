%% Chapter 6: Estimation

%% Loading a file
% In the HOME tab, import data from discussion as a csv file

% Drag the table from the workspace into the current folder space and name
% the file. This allows to convert the raw data from .csv to .m

%Once .mat file is created, let's learn how to work with data in the file

load Discussion1data.mat

% I will define my variable to represent height data
h= Discussion1data.Height_in

% notice that after we run that line, we should have a variable h in the
% workspace

MeanHeight_in=mean(h)
Std_Dev_Height= std(h)

%% Sampling distribution
% if I define our class as the population and form groups of 5 as samples
%the mean height for each sample will be different than the population mean

sample1=h(1:5,1)
sample2=h(6:10,1)
sample3=h(11:15,1)
sample4=h(16:20,1)
sample5=h(21:25,1)

mean_sample1=mean(sample1)
mean_sample2=mean(sample2)
mean_sample3=mean(sample3)
mean_sample4=mean(sample4)
mean_sample5=mean(sample5)


%% Plotting

figure(1); %If I will be generating multiple figures that I want to 
% preserve is good to name them
histogram(h,8) % you may need to adjust the bin size as needed to represent data
xlabel Height(in)
ylabel Number-individuals

hold on % command use to add another plot on the same graph
plot(50:1:80,size(h,1)*3*normpdf(50:1:80,MeanHeight_in,Std_Dev_Height));
hold off
%% Shoe size plots

figure(2)
sh=Discussion1data.shoe_size
histogram(sh,10)
xlabel Shoe-size
ylabel Numb-Individuals
MeanShoe=mean(sh)
Std_Dev_Shoe=std(sh)

hold on % command use to add another plot on the same graph
plot(5:.5:13,size(sh,1)*normpdf(5:.5:13,MeanShoe,Std_Dev_Shoe));
hold off

%% Working with table
%Height is in inches, if it's more convenient to use 'cm', I can add data
%to table

Discussion1data.Height_cm=Discussion1data.Height_in.*2.54
%% Generating a random data set
%mean+sigma*randn(n,1)
n=100

Height_sim=MeanHeight_in+Std_Dev_Height*randn(n,1)

figure(3)
histogram(Height_sim,8)













