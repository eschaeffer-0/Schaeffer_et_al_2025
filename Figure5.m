%% Figure 5.m
% v.0.0.0 - initial commit (ES: 07/30/2025)
% last ()
clc; clear all; close all;

% enter path to EEGLAB (e.g., /Users/name/code/eeglab2025.0.0)
path_to_eeglab = '';
addpath(genpath(fullfile(path_to_eeglab, 'functions')))

load('Figure5.mat')

whichPowMetrics = {'delta_stim_pre_swa', 'delta_post_pre_swa', 'delta_stim_pre_lo_sigma', 'delta_stim_pre_hi_sigma'};
powMetricLabels = {'\Delta %SWA STIM-PRE', '\Delta %SWA POST-PRE', '\Delta %Low Sigma STIM-PRE', '\Delta %High Sigma STIM-PRE'};

% Figure 5 (Left) - correlation plots for specific frequency bands
% Change in power v. change in overall REST-Q score
% using normalized power as in Fig 2b
for iComp = 1:numel(whichPowMetrics)
    whichPowMetric = whichPowMetrics{iComp};

    [R, p] = corr(correl_data.delta_overall_score', correl_data.(whichPowMetric)', 'Type', 'Spearman');

    figure(iComp); clf; set(gcf, 'Position', [14+(30*iComp) 427 443 350], 'Visible', 'on')
    plot(correl_data.delta_overall_score, correl_data.(whichPowMetric), 'o', 'MarkerSize', 14, 'Linewidth', 2, 'color', 'k')
    xline(0, ':', 'linewidth', 1.5)
    yline(0, ':', 'linewidth', 1.5)
    xlabel(['\Delta Overall REST-Q Score'])
    ylabel(powMetricLabels{iComp})
    text(0.03, 0.98, sprintf('R= %g\np=%g', round(R,3), round(p,3)), 'Units', 'normalized', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 14);
    fontsize(gcf, 18, 'points')
    set(gca, 'fontweight', 'bold')

    % Figure 5 (Right) - topographies of correlation values (Spearman's rho)
    figure(iComp+4); clf; set(gcf, 'Position', [59+(60*iComp) 307 837 591], 'Visible', 'on')
    hold on
    topoplot(topo_data.(whichPowMetric).contrast, chanInfo, 'headrad', 0.5,'plotrad',0.51,'numcontour',4,'maplimits', [-1 1]);

    if size(topo_data.(whichPowMetric).chclus,2) > 0
        d = zeros(1, numel(chanInfo));
        d(1,topo_data.(whichPowMetric).chclus) = 0.0005;
        topoplot(d, chanInfo, 'style', 'blank', 'plotdisk', 'on', 'emarkercolors', {[1 1 1]}, 'headrad', 0.5,'plotrad',0.51,'numcontour',4,'maplimits', [-1 1]);
    end
    cb = colorbar();
    ylabel(cb, 'r')
    colormap(brewermap([], '*RdYlBu')) 
    title([powMetricLabels{iComp} ' v. \Delta Overall REST-Q Score'])
    fontsize(gcf, 18, 'points')
    set(gca, 'fontweight', 'bold')
    set(gcf, 'Color', 'w');
end