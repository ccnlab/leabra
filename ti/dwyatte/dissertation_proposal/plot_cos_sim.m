clear all;
close all;

LOG_ROOT = 'sims/';
LOG_FILE = 'objrec_ti_objrec_train_sphere_z0.00.trn_trl.dat';
TICKS_PER_TRIAL = 20;
SMOOTH_SPAN = 10;
COLORMAX = .8;
FILENAME = 'cos_sim.eps';

data = importdata([LOG_ROOT LOG_FILE]);

% for trn data
cos_sim = data.data(:,4);
cos_sim = reshape(cos_sim, TICKS_PER_TRIAL, length(cos_sim)/TICKS_PER_TRIAL);

% smooth
smoothed_idx = 1;
for i=1:SMOOTH_SPAN:size(cos_sim,2)
    cos_sim_smooth(:, smoothed_idx) = mean(cos_sim(:, i:i+SMOOTH_SPAN-1), 2);
    smoothed_idx = smoothed_idx + 1;
end

% plot
colors = linspace(0,COLORMAX,size(cos_sim_smooth,2));
figure;
grid on;
hold on;
for i=1:size(cos_sim_smooth,2)
    plot(cos_sim_smooth(:,i), 'Color', repmat(colors(i),1,3), 'LineWidth', 2);
end

hold off;
set(gca, 'YLim', [0 1]);
xlabel('Trial sequence');
ylabel('cos\theta(minus, plus)');
print('-depsc', FILENAME);

