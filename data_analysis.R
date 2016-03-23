
### READ IN DATA
data <- read.csv("/Users/kiraprentice/Documents/College/Senior Honors Thesis/Data/data_for_r.csv", header=TRUE, fill=TRUE, row.names=NULL)

### PRINT COL NAMES
colnames(data)

### CREATE DATA FRAMES
# Group + Phone
data.xtabs = xtabs(~Group + Phone, data = data)

# Group + Phone + TokenLanguage	
data.xtabs2 = xtabs(~Token + Phone + TokenLanguage, data=data)

# Token + Phone 
data.xtabs3 = xtabs(~Token + Phone, data=data)

# Token + Rating
data.xtabs4 = xtabs(~Token + Rating, data=data)

# Phone + Experiment
data.xtabs5 = xtabs(~Phone + Experiment, data=data)

# Phone + Experiment + Group
data.xtabs6 = xtabs(~Phone + Experiment + Group, data=data)

# Token + Participant
data.xtabs7 = xtabs(~Token + Participant, data=data)

