%% Table 3_Suppl Table 1.m
% v.0.0.0 - initial commit (ES: 07/30/2025)
% last ()
clc; clear all; close all;

load('Table3_Suppl_Table1.mat')

% Table3 - Sleep metrics across nights for TES-TI
sleepMetrics = fieldnames(all_sleep.testi.bl);
whichGrp = 'testi';

for iMetric = 1:numel(sleepMetrics)
    sleepMetric = sleepMetrics{iMetric};

    bl = all_sleep.(whichGrp).bl.(sleepMetric);
    first = all_sleep.(whichGrp).first.(sleepMetric);
    last = all_sleep.(whichGrp).last.(sleepMetric);

    fprintf('%s \n', sleepMetric)

    if strcmp(sleepMetrics{iMetric}, 'TSWP') | strcmp(sleepMetrics{iMetric}, 'TST')
        fprintf('Baseline: n= %g, mu= %g, sd= %g \n', length(bl), round(mean(bl) / 60, 2), round(std(bl) / 60, 2))
        fprintf('First: n= %g, mu= %g, sd= %g \n', length(first), round(mean(first) / 60, 2), round(std(first) / 60, 2))
        fprintf('Last: n= %g, mu= %g, sd= %g \n', length(last), round(mean(last) /60, 2), round(std(last) / 60, 2))
    else
        fprintf('Baseline: n= %g, mu= %g, sd= %g \n', length(bl), round(mean(bl), 2), round(std(bl), 2))
        fprintf('First: n= %g, mu= %g, sd= %g \n', length(first), round(mean(first), 2), round(std(first), 2))
        fprintf('Last: n= %g, mu= %g, sd= %g \n', length(last), round(mean(last), 2), round(std(last), 2))
    end

    fprintf('Using Friedman Test \n')
    d = [bl first last];
    [p, tbl, stats] = friedman(d, 1);

    fprintf('Chi-Squared=%g \n', round(tbl{2,5},3))
    fprintf('p=%g \n', round(p,3))
    fprintf('\n')
end

% Supplementary Table 1 - Sleep metrics across nights for TES
sleepMetrics = fieldnames(all_sleep.testi.bl);
whichGrp = 'tes';

for iMetric = 1:numel(sleepMetrics)
    sleepMetric = sleepMetrics{iMetric};

    bl = all_sleep.(whichGrp).bl.(sleepMetric);
    first = all_sleep.(whichGrp).first.(sleepMetric);
    last = all_sleep.(whichGrp).last.(sleepMetric);

    fprintf('%s \n', sleepMetric)

    if strcmp(sleepMetrics{iMetric}, 'TSWP') | strcmp(sleepMetrics{iMetric}, 'TST')
        fprintf('Baseline: n= %g, mu= %g, sd= %g \n', length(bl), round(mean(bl) / 60, 2), round(std(bl) / 60, 2))
        fprintf('First: n= %g, mu= %g, sd= %g \n', length(first), round(mean(first) / 60, 2), round(std(first) / 60, 2))
        fprintf('Last: n= %g, mu= %g, sd= %g \n', length(last), round(mean(last) /60, 2), round(std(last) / 60, 2))
    else
        fprintf('Baseline: n= %g, mu= %g, sd= %g \n', length(bl), round(mean(bl), 2), round(std(bl), 2))
        fprintf('First: n= %g, mu= %g, sd= %g \n', length(first), round(mean(first), 2), round(std(first), 2))
        fprintf('Last: n= %g, mu= %g, sd= %g \n', length(last), round(mean(last), 2), round(std(last), 2))
    end

    fprintf('Using Friedman Test \n')
    d = [bl first last];
    [p, tbl, stats] = friedman(d, 1);

    fprintf('Chi-Squared=%g \n', round(tbl{2,5},3))
    fprintf('p=%g \n', round(p,3))
    fprintf('\n')
end