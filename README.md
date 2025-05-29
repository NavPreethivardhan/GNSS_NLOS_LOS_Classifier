# GNSS_NLOS_LOS_Classifier
this takes in parameters like signal to noise ratio, elevation, azimuth and classifies LOS or NLOS communication
📡 GNSS LOS vs NLOS Classification using SVM
📝 Project Description
This MATLAB-based project classifies GNSS signals into Line-of-Sight (LOS) and Non-Line-of-Sight (NLOS) categories using a Support Vector Machine (SVM) classifier. It uses signal features such as SNR, Elevation, and Azimuth. The model is trained on real data and evaluated for precision, accuracy, and robustness.

📁 Project Structure
File	Description
main.m	Main script — runs full pipeline
preprocess_data.m	Loads & filters LOS/NLOS data
extract_features.m	Extracts and normalizes feature sets
train_and_test_model.m	Trains and applies the SVM classifier
evaluate_performance.m	Calculates confusion matrix & performance metrics
svmModel.mat	Saved trained SVM model with normalization data
GNSS_LOS_NLOS_Final_Evaluation.csv	Output file with TP, FN, FP, TN, accuracy, etc.

✅ Requirements
MATLAB R2020b or later

Statistics and Machine Learning Toolbox

🚀 How to Run
Place all .m files in the same directory.

Ensure data files:

LOS DATA.xlsx - Sheet1.csv

NLOS DATA.xlsx - Sheet1.csv
are present in the directory.

Open MATLAB and run:

matlab
Copy
Edit
main
The script will:

Preprocess and clean data

Split into training and test sets

Train an SVM classifier with RBF kernel

Predict and evaluate

Save the model and output metrics

📤 Output
CSV Export: GNSS_LOS_NLOS_Final_Evaluation.csv

Contains: TP, FN, FP, TN, Accuracy, Precision, Recall, F1_Score

Trained Model: svmModel.mat

Visualization: Confusion matrix chart

🎯 Performance (Sample Result)
Metric	Value
Accuracy	99.91%
Precision	99.82%
Recall	100.00%
F1 Score	99.91%

📌 Notes
The model filters out noisy GNSS data using:

SNR ∈ [20, 60]

Elevation > 5°

Azimuth ∈ [0, 360]

Feature normalization is preserved for real-time use via mu and sigma.
