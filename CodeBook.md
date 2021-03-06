'Getting and Cleaning Data' Course Project

### Origin Of The Data

*Human Activity Recognition Using Smartphones Dataset Version 1.0*

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universita degli Studi di Genova
Via Opera Pia 11A, I-16145, Genoa, Italy
<activityrecognition@smartlab.ws>
www.smartlab.ws

------------------------------------------------------------------------

#### Experiments

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##### For each record in the base data the following is provided:

-   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
-   Triaxial Angular velocity from the gyroscope
-   Its activity label
-   An identifier of the subject who carried out the experiment (N = 30)
-   The acceleration signal from the smartphone accelerometer (X, Y and Z axis) in standard gravity units 'g'
-   The body acceleration signal obtained by subtracting the gravity from the total acceleration
-   The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

##### Notes:

-   Features are normalized and bounded within \[-1,1\].
-   Each feature vector is a row on the text file.

For more information about this dataset contact: <activityrecognition@smartlab.ws>

------------------------------------------------------------------------

#### Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

##### These signals were used to estimate variables of the feature vector for each pattern:

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

-   tBodyAcc-XYZ
-   tGravityAcc-XYZ
-   tBodyAccJerk-XYZ
-   tBodyGyro-XYZ
-   tBodyGyroJerk-XYZ
-   tBodyAccMag
-   tGravityAccMag
-   tBodyAccJerkMag
-   tBodyGyroMag
-   tBodyGyroJerkMag
-   fBodyAcc-XYZ
-   fBodyAccJerk-XYZ
-   fBodyGyro-XYZ
-   fBodyAccMag
-   fBodyAccJerkMag
-   fBodyGyroMag
-   fBodyGyroJerkMag

##### The set of variables that were estimated from these signals are:

-   mean(): Mean value
-   angle(): Angle between to vectors.

##### Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

-   gravityMean
-   tBodyAccMean
-   tBodyAccJerkMean
-   tBodyGyroMean
-   tBodyGyroJerkMean

------------------------------------------------------------------------

#### The final dataset

Name is *dataset2.csv*
For each of the variables mentioned above:
\* Extract the **Mean** and the **Standard Deviation**
\* Calculate the **Mean** for each of the Mean and Std columns mentioned above for each subject - activity combination

##### e.g.

<table style="width:78%;">
<colgroup>
<col width="20%" />
<col width="56%" />
</colgroup>
<thead>
<tr class="header">
<th>Column Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>tBodyAcc-mean()-X</td>
<td>The mean() of body acceleration measurements (X-axis) for this user-activity combination</td>
</tr>
<tr class="even">
<td>fBodyAccMag-std()</td>
<td>The mean() of body acceleration magnitude measurements for this user-activity combination</td>
</tr>
<tr class="odd">
<td>...</td>
<td>...</td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

#### License:

Use of this dataset in publications must be acknowledged by referencing the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
