
# Load libraries# 
library(data.table)

# Read in Testing Data 

test_labels = as.data.table(read.table('getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/y_test.txt'))
test_Data = as.data.table(read.table('getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt'))

features = as.data.table(read.table('getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt'),row.names = F)

# Rean in activity data# 
activity_labels = as.data.table(read.table('getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt'))

# Set the column names
labels = as.character(features$V2)
colnames(test_Data) = as.character(labels)


# Set the Activity Class
test_labels = merge(test_labels,activity_labels,by = 'V1')
test_Data$Class = test_labels[,2]







# Read in Training Data 
train_labels = as.data.table(read.table('getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/y_train.txt'))
train_Data = as.data.table(read.table('getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt'))
features = as.data.table(read.table('getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt'),row.names = F)

# Set the column names
labels = as.character(features$V2)
colnames(train_Data) = as.character(labels)

# Set the Activity Class
train_labels = merge(train_labels,activity_labels,by = 'V1')
train_Data$Class = train_labels[,2]




# merge the data sets
All_Data = rbind(train_Data,test_Data)

# Remove duplicated columns# 
All_Data = All_Data[,which(duplicated(names(All_Data))):=NULL]

# Save the tidy data# 
saveRDS(All_Data,'tidy_data.rds')


# Only keep the mean and std columns, remove the others# 
mean_columns = colnames(All_Data)[which(grepl("mean()",colnames(All_Data),fixed=TRUE))]
std_columns = colnames(All_Data)[which(grepl('std()',colnames(All_Data),fixed=TRUE))]
keep_cols = c(mean_columns,std_columns,'Class')
Data_subset = copy(All_Data)[,paste(setdiff(colnames(All_Data),keep_cols)):=NULL]

# Calculate the mean of each column by class# 
Mean_data = Data_subset[,lapply(.SD,mean),by=Class,.SDcols=setdiff(colnames(Data_subset),'Class')]

write.table(Mean_data,'mean_data.txt',row.names = FALSE)
