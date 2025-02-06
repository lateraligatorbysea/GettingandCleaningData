# GettingandCleaningData# Getting and Cleaning Data Project

## Overview
This project processes the UCI HAR Dataset to create a tidy dataset with the average of each variable for each activity and each subject.

## Files
- `run_analysis.R`: Script for data processing.
- `CodeBook.md`: Describes variables, data transformations, and units.
- `tidy_data.txt`: Output tidy dataset.

## Steps Performed
1. Merged the training and test datasets.
2. Extracted mean and standard deviation for each measurement.
3. Replaced activity IDs with descriptive names.
4. Renamed columns to be more descriptive.
5. Created a tidy dataset with averages for each activity and subject.
