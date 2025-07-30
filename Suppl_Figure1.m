%% Suppl_Figure 1.m
% v.0.0.0 - initial commit (ES: 07/30/2025)
% last ()
clc; clear all; close all;

load('Suppl_Figure1.mat')

% Supplementary Figure 1 - violin plots of differences between PRE, STIM, POST
% for first and last night separately
figure(1); clf; set(gcf, 'Position', [12 357 600 520], 'Visible', 'on')
hold on
all_d = [data.first.stim_pre*100 data.last.stim_pre*100 data.first.post_pre*100 data.last.post_pre*100 data.first.post_stim*100 data.last.post_stim*100];
all_d = all_d(:);
all_lab = [repmat({'a'},length(data.first.stim_pre),1) repmat({'b'},length(data.first.stim_pre),1) repmat({'c'},length(data.first.stim_pre),1) repmat({'d'},length(data.first.stim_pre),1) repmat({'e'},length(data.first.stim_pre),1) repmat({'f'},length(data.first.stim_pre),1)];
all_lab = all_lab(:);
vs = violinplot(all_d, all_lab);
for i = 1:2
    vs(i).ViolinPlot.FaceColor = [0.4 0.4 0.4];
    vs(i).ScatterPlot.MarkerEdgeColor = [0.6 0.6 0.6];
    vs(i).ScatterPlot.MarkerFaceColor = [0.6 0.6 0.6];
    vs(i).BoxPlot.FaceColor = [0.6 0.6 0.6];
    vs(i).BoxPlot.EdgeColor = [0.6 0.6 0.6];
    vs(i).WhiskerPlot.Color = [0.6 0.6 0.6];
end
for i = 3:4
    vs(i).ViolinPlot.FaceColor = [0.63 0.63 0.63];
    vs(i).ScatterPlot.MarkerEdgeColor = [0.7 0.7 0.7];
    vs(i).ScatterPlot.MarkerFaceColor = [0.7 0.7 0.7];
    vs(i).BoxPlot.FaceColor = [0.65 0.65 0.65];
    vs(i).BoxPlot.EdgeColor = [0.65 0.65 0.65];
    vs(i).WhiskerPlot.Color = [0.65 0.65 0.65];
end
for i = 5:6
    vs(i).ViolinPlot.FaceColor = [0.23 0.23 0.23];
    vs(i).ScatterPlot.MarkerEdgeColor = [0.5 0.5 0.5];
    vs(i).ScatterPlot.MarkerFaceColor = [0.5 0.5 0.5];
    vs(i).BoxPlot.FaceColor = [0.5 0.5 0.5];
    vs(i).BoxPlot.EdgeColor = [0.5 0.5 0.5];
    vs(i).WhiskerPlot.Color = [0.5 0.5 0.5];
end
for i = 1:6
    vs(i).ViolinPlot.EdgeColor = [0.2 0.2 0.2];
    vs(i).ViolinAlpha = {[0.2]};
    vs(i).ScatterPlot.LineWidth = 1;
    vs(i).ScatterPlot.SizeData = 30;
    vs(i).BoxWidth = 0.025;
    vs(i).WhiskerPlot.LineWidth = 1.5;
    vs(i).ShowMedian = 0;
    vs(i).ShowMean = 1;
    vs(i).MeanPlot.Color = [1 0 0];
    vs(i).MeanPlot.LineWidth = 2;
end
yline(0, 'linestyle', ':', 'linewidth', 2, 'color', [0.3 0.3 0.3])
xlim([0.4 6.6])
ylim([-10 25])
ylabel('\Delta %SWA')
xticklabels({'FIRST', 'LAST', 'FIRST', 'LAST', 'FIRST', 'LAST'});
title('  STIM-PRE      POST-PRE     POST-STIM  ')
fontsize(gcf, 25, 'points')
set(gca, 'fontweight', 'bold')