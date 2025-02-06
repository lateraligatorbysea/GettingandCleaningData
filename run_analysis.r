path <- "/home/rstudio/GettingAndCleaningData"

# Read feature names and activity labels
features <- read.table(paste0(path, "features.txt"), col.names = c("index", "feature"))
activity_labels <- read.table(paste0(path, "activity_labels.txt"), col.names = c("activity_id", "activity_name"))

# Read training data
x_train <- read.table(paste0(path, "train/X_train.txt"))
y_train <- read.table(paste0(path, "train/y_train.txt"), col.names = "activity_id")
subject_train <- read.table(paste0(path, "train/subject_train.txt"), col.names = "subject")

# Read test data
x_test <- read.table(paste0(path, "test/X_test.txt"))
y_test <- read.table(paste0(path, "test/y_test.txt"), col.names = "activity_id")
subject_test <- read.table(paste0(path, "test/subject_test.txt"), col.names = "subject")
# Merge datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Assign column names
colnames(x_data) <- features$feature

# Combine into one dataset
complete_data <- cbind(subject_data, y_data, x_data)
# Extract mean and std measurements
selected_features <- grep("mean\\(\\)|std\\(\\)", features$feature)
selected_data <- complete_data[, c(1, 2, selected_features + 2)]
selected_data <- merge(selected_data, activity_labels, by = "activity_id")
selected_data <- selected_data %>% select(subject, activity_name, everything(), -activity_id)
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))
tidy_data <- selected_data %>%
  group_by(subject, activity_name) %>%
  summarise(across(everything(), mean))

# Write the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

