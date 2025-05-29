function cleanedData = preprocess_data(losFile, nlosFile)
    losData = readtable(losFile);
    nlosData = readtable(nlosFile);

    losData.Label = repmat("LOS", height(losData), 1);
    nlosData.Label = repmat("NLOS", height(nlosData), 1);

    combinedData = [losData; nlosData];

    % Filter based on signal quality
    valid_idx = combinedData.SNR >= 20 & combinedData.SNR <= 60 & ...
                combinedData.Elevation > 5 & ...
                combinedData.Azimuth >= 0 & combinedData.Azimuth <= 360;

    cleanedData = combinedData(valid_idx, :);

    fprintf('Filtered data: %d samples (LOS: %d, NLOS: %d)\n', ...
        height(cleanedData), sum(cleanedData.Label == "LOS"), sum(cleanedData.Label == "NLOS"));
end
