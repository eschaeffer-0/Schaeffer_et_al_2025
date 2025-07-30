%% Suppl_Table 2.m
% v.0.0.0 - initial commit (ES: 07/30/2025)
% last ()
clc; clear all; close all;

load('Figure4.mat')

% Supplementary Table 2 - Statistics for TES-TI effects on other freq bands
% pre, stim, post data are PSD values (dim: subj x freq)

bandName = {'SWA', 'Theta', 'Alpha', 'LoSigma', 'HiSigma', 'Beta', 'Gamma'};
bandRanges = {[0.5 4], [4 8], [8 12], [9 12], [12 16], [16 25], [25 40]};

stim_ts = []; post_ts = [];
stim_ps = []; post_ps = [];
% for each band power, compare stim to pre, post to pre using paired t-test
for iBand = 1:numel(bandRanges)
    lb = bandRanges{iBand}(1);
    ub = bandRanges{iBand}(2);

    f_inds = find(f_ax > lb & f_ax <= ub);

    pre_short = mean(pre(:,f_inds),2);
    stim_short = mean(stim(:,f_inds),2);
    post_short = mean(post(:,f_inds),2);
    
    [~,p,~,stats] = ttest(stim_short, pre_short);
    stim_ts = [stim_ts stats.tstat];
    stim_ps = [stim_ps p];
    
    [~,p,~,stats] = ttest(post_short, pre_short);
    post_ts = [post_ts stats.tstat];
    post_ps = [post_ps p];
end

% correct for multiple comparisons using BY procedure
[h, crit_p, adj_ci_cvrg, adj_p] = fdr_bh([stim_ps post_ps], 0.05, 'dep', 'yes');

fprintf('\nSTIM-PRE \n')
fprintf('Band  T-stat P-Val Adj P-Val \n')
for i = 2:length(stim_ts)
    if adj_p(i) < 0.05
        fprintf('%s  %.2f  %.3f  %.3f*\n', bandName{i}, stim_ts(i), stim_ps(i), adj_p(i))
    else
        fprintf('%s  %.2f  %.3f  %.3f \n', bandName{i}, stim_ts(i), stim_ps(i), adj_p(i))
    end

end

fprintf('\nPOST-PRE \n')
fprintf('Band  T-stat P-Val AdjP-Val \n')
for i = 2:length(stim_ts)
    if adj_p(i+7) < 0.05
        fprintf('%s  %.2f  %.3f  %.3f* \n', bandName{i}, post_ts(i), post_ps(i), adj_p(i+7))
    else
        fprintf('%s  %.2f  %.3f  %.3f \n', bandName{i}, post_ts(i), post_ps(i), adj_p(i+7))
    end
end