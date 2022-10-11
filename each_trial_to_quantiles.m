% The idea is to apply reaction_times_to_quantiles unction to each subject,
% separately and generate a table with reaction time medians for quantiles
% for each trial.
% The table will further be used to compute SEM for all trials.
function all_data = each_trial_to_quantiles(data, n_quant)
    empty_counter = 0;
    all_data = [];
    for ii = 1:25
        subj = extract_subj_data(data, ii);
        if isempty(subj)
            empty_counter = empty_counter + 1;
        continue
        else
            ind = ii - empty_counter;
            all_data(ind, 1) = ii;
            [RT_corr, RT_err, quant_ctr] = reaction_times_to_quantiles(subj, n_quant);
            all_data(ind, 2:2+n_quant-1) = quant_ctr;
            all_data(ind, 2+n_quant: 2 + 2 * n_quant - 1) = RT_corr;
            all_data(ind, 2 + 2 * n_quant:2 + 3 * n_quant - 1) = RT_err;
        end
    end
end