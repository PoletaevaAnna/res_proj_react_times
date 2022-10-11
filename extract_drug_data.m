function drug_data = extract_drug_data(data, d)
    drug_data = data((data.Drug_ID == d), :);
end