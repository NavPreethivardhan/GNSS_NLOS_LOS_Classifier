function evaluate_performance(Y_test, Y_pred, filename)
    confMat = confusionmat(Y_test, Y_pred);
    confusionchart(confMat, {'LOS', 'NLOS'});

    TP = confMat(1,1);
    FN = confMat(1,2);
    FP = confMat(2,1);
    TN = confMat(2,2);

    accuracy = (TP + TN) / sum(confMat(:));
    precision = TP / (TP + FP);
    recall = TP / (TP + FN);
    f1 = 2 * (precision * recall) / (precision + recall);

    fprintf('\n--- Evaluation Results ---\n');
    fprintf('Accuracy:  %.2f%%\n', accuracy * 100);
    fprintf('Precision: %.2f%%\n', precision * 100);
    fprintf('Recall:    %.2f%%\n', recall * 100);
    fprintf('F1 Score:  %.2f%%\n', f1 * 100);

    % Export to CSV
    T = table(TP, FN, FP, TN, accuracy*100, precision*100, recall*100, f1*100, ...
        'VariableNames', {'TP', 'FN', 'FP', 'TN', 'Accuracy', 'Precision', 'Recall', 'F1_Score'});
    writetable(T, filename);
    fprintf('Results saved to %s\n', filename);
end
