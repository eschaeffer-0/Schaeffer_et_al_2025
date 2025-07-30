%% Table 2.m
% v.0.0.0 - initial commit (ES: 07/30/2025)
% last ()
clc; clear all; close all;

load('Table2.mat')

% Table2 - Sleep metrics baseline night
sleepMetrics = fieldnames(bl_sleep.testi);

for iMetric = 1:numel(sleepMetrics)
    sleepMetric = sleepMetrics{iMetric};

    testi = bl_sleep.testi.(sleepMetric);
    tes = bl_sleep.tes.(sleepMetric);

    if strcmp(sleepMetrics{iMetric}, 'TSWP') | strcmp(sleepMetrics{iMetric}, 'TST')
        fprintf('TES-TI BL: n= %g, mu= %g, sd= %g \n', length(testi), round(mean(testi) / 60,2), round(std(testi) / 60,2))
        fprintf('TES BL: n= %g, mu= %g, sd= %g \n', length(tes), round(mean(tes) / 60,2), round(std(tes) / 60,2))
    else
        fprintf('TES-TI BL: n= %g, mu= %g, sd= %g \n', length(testi), round(mean(testi),2), round(std(testi),2))
        fprintf('TES BL: n= %g, mu= %g, sd= %g \n', length(tes), round(mean(tes),2), round(std(tes),2))
    end

    fprintf('Using Wilcoxon rank sum test \n')
    [p,~,stats] = ranksum(testi, tes);
    fprintf('W=%g, p=%g \n', stats.ranksum, round(p,3))
    fprintf('\n')
end