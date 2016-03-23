
### READ IN DATA
data <- read.csv("/Users/kiraprentice/Documents/College/Senior Honors Thesis/Data/data_for_r2.csv", header=TRUE, fill=TRUE, row.names=NULL)

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

# Plot representing distribution of Ratings of "snack names"
barplot(xtabs(~data$Rating), xlab="Rating", col="blue")

## Plot Experiment Number + Phone

# Get only the Spanish tokens
data.noblank = subset(data, Phone == "ae" | Phone =="as" | Phone=="ai")
data.xtabs0 = xtabs(~Group + Phone, data = data.noblank)

# Plotting
par(mfrow = c(1,2))
barplot(data.xtabs0, legend.text=c("group", "phone"))
barplot(data.xtabs0, beside = T, legend.text= rownames(data.xtabs0))
par(mfrow=c(1,1))



install.packages("ggplot2")
library(ggplot2)

# Clusters of phone vs group
qplot(data$Phone, data$Group, data=data, geom=c("boxplot", "jitter"), xlab="phone", ylab="group", main="testing")

# Plot so to speak of phone and group
pg <- table(data$Phone, data$TokenLanguage)
plot(pg, main="Phone/Group", xlab="Phone", col=c("darkblue","red"), legend = rownames(pg))

## Install MASS package 
install.packages("MASS")
library("MASS")

# Generate a histogram of ratings data
truehist(data$Rating, xlab="Rating", col="green")


