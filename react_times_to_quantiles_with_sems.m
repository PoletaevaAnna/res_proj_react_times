% The fucntion derives reaction times for quantiles of all trials. Then, it
% generates a table of reaction times for individual trials and computes
% SEMs. All these values are further plotted by a fucntion
% plot_react_times_and_sem_quantiles.

function [RT_corr, RT_err, quant_cntr, sems] = react_times_to_quantiles_with_sems(data, n_quant)
    [RT_corr, RT_err, quant_cntr] = reaction_times_to_quantiles(data, n_quant);
    all_data = each_trial_to_quantiles(data, n_quant);
    sems = SEM_bars(all_data(:, 6:13));
    sems = reshape(sems, [2, 4]);
end