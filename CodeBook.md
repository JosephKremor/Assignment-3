# Code Book
This code book describes the code in this repo.

## Data Overview
The data are a series of sensor reading that have been taken from a mobile phone when the carrier has been moving in different ways.
More information about the data can be found at the data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Variables 

#### Features in the Data
<blockquote>
<h2>This description of the features is directly quoted from the data file which is available from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</h2>

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ <br />
tGravityAcc-XYZ <br />
tBodyAccJerk-XYZ <br />
tBodyGyro-XYZ <br />
tBodyGyroJerk-XYZ <br />
tBodyAccMag <br />
tGravityAccMag <br />
tBodyAccJerkMag <br />
tBodyGyroMag <br />
tBodyGyroJerkMag <br />
fBodyAcc-XYZ <br />
fBodyAccJerk-XYZ <br />
fBodyGyro-XYZ <br />
fBodyAccMag <br />
fBodyAccJerkMag <br />
fBodyGyroMag <br />
fBodyGyroJerkMag <br />

The set of variables that were estimated from these signals are: 

mean(): Mean value <br />
std(): Standard deviation <br />
mad(): Median absolute deviation  <br />
max(): Largest value in array <br />
min(): Smallest value in array <br />
sma(): Signal magnitude area <br />
energy(): Energy measure. Sum of the squares divided by the number of values.  <br />
iqr(): Interquartile range  <br />
entropy(): Signal entropy <br />
arCoeff(): Autorregresion coefficients with Burg order equal to 4 <br />
correlation(): correlation coefficient between two signals <br />
maxInds(): index of the frequency component with largest magnitude <br />
meanFreq(): Weighted average of the frequency components to obtain a mean frequency <br />
skewness(): skewness of the frequency domain signal  <br />
kurtosis(): kurtosis of the frequency domain signal  <br />
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. <br />
angle(): Angle between to vectors. <br />

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean <br />
tBodyAccMean <br />
tBodyAccJerkMean <br />
tBodyGyroMean <br />
tBodyGyroJerkMean <br />

</blockquote>
Reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.


### Transformations
The test_Data and train_Data coumns were labelled with the features variable. The activity class is denoted by the Class column which was generated via a merging of the activity labels variable and the test_labels vairable for test_Data and a merging of the activity labels variable and the train_labels vairable for train_Data. All_Data is then created by appending test_Data to train_Data. which is then saved as tidy_data.rds.

All in All_Data columns are then removed  Class and the columns that contain mean() or std() and this is assigned the name Data_subset. Mean_data is a table that contains the means of each column according to the Class. Mean_data is saved as mean_data.txt.
