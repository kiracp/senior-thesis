
### READ IN DATA
data <- read.csv("/Users/kiraprentice/Documents/College/Senior Honors Thesis/Data/data_for_r2.csv", header=TRUE, fill=TRUE, row.names=NULL)
data_tokens <-read.csv("/Users/kiraprentice/Documents/College/Senior Honors Thesis/Data/data_tokens.csv", header=TRUE, fill=TRUE, row.names=NULL)
data <- data_tokens
data <-read.csv("/Users/kiraprentice/Documents/College/Senior Honors Thesis/Data/data_binomial.csv", header=TRUE, fill=TRUE, row.names=NULL)
### PRINT COL NAMES
colnames(data)

### CREATE DATA FRAMES
# Group + Phone
data.xtabs = xtabs(~Phone + Group, data = data)

data.xtabs2 = xtabs(~Phone + Experiment, data = data)
data.xtabs2
data.xtabs2/sum(data.xtabs2)

colnames(data.xtabs)
data.xtabs
row.names(data.xtabs) <- c("/æ/", "/ɑ/")
data.xtabs
install.packages(data)
library(data.table)
(setattr(data.xtabs, "row.names", c("/æ/", "/ɑ/")))
data.xtabs = data.xtabs/sum(data.xtabs) 
install.packages(vcd)

mosaicplot(data.xtabs, color=TRUE, main="Phone by Participant Language", ylab="Participant language", y.arg=c("Non-Spanish", "Spanish"))

counts <- table(mtcars$vs, mtcars$gear)
barplot(data.xtabs, main="Phone distribution by participant language",
        xlab="Language group", names.arg=c("Non-Spanish","Spanish"), col=c("darkblue","red"),
         beside=TRUE, xpd=T)
legend("bottomright", legend = rownames(data.xtabs))

legend(x = 0.25, y = 35, c("seed match", "background"), bty="n", lty=c(1,1), col=c("red","black"), cex=0.8, inset=0)
legend(x = 0.25, y = 35, legend = rownames(data.xtabs), bty="n", lty=c(1,1), col=c("red","black"), cex=0.8, inset=0)

install.packages("ggplot2")
library("ggplot2")

qplot(factor(cyl), data=data, geom="bar", fill=factor(cyl))

useme = data.xtabs/sum(data.xtabs) 
par(mfrow = c(1,2))
barplot(data.xtabs, legend.text=c("ae", "a"))
barplot(data.xtabs, beside=T, xpd = T, main="Phone Freq by Language", ylab = "Phone count", legend.x = 10, legend.y = 100, legend.text=rownames(data.xtabs))
par (mfrow=c(1, 1))

## Make the frequencies numbers (rather than factors)
dat$freqs <- as.numeric(as.character(dat$freqs))
## Find a range of y's that'll leave sufficient space above the tallest bar
ylim <- c(0, 1.1*max(data.xtabs))
## Plot, and store x-coordinates of bars in xx
xx <- barplot(data.xtabs, beside=T, xaxt = 'n', xlab = '', width = 0.85, ylim = ylim,
              main = "Phone by freq language", 
              ylab = "Frequency", legend.text=rownames(data.xtabs))
## Add text at top of bars
text(x = xx, y = data.xtabs, label = data.xtabs, pos = 3, cex = 0.8)
## Add x-axis labels 
axis(1, at=xx, labels="NS", "S")

100* data.xtabs / sum(data.xtabs)

summary(data.xtabs)


library(lme4)
library(multcomp)
library(plyr)

summary(data)
colnames(data)

# aae ~ poncontext * group * langexp + order + (1|), family = binom, data = data

results <- glmer(Phone ~ TokenLanguage * Context +  (1|Participant) + (1|Token), family=binomial("logit"), data=data)
summary(results)
#This is the syntax that allows you to pick your reference category
data$Context <- relevel(vclsobs_all$precsegfeat, ref="vowel")
data$Context <- relevel(vclsobs_all$folsegfeat, ref="vowel")
data$phrpos <- relevel(vclsobs_all$phrpos, ref="medial")
data$wdpos <- relevel(vclsobs_all$wdpos, ref="medial")
data$obstype <- relevel(vclsobs_all$obstype, ref="fric")


resultsA <- glmer(cat_voice_bin ~ obstype * precsegfeat * wdpos +
                    (1|Word) + (1|Subj), family=binomial("logit"),data=vclsobs_all)

summary(resultsA)




## GLMER STUFF
data <- read.csv("/Users/kiraprentice/Documents/College/Senior Honors Thesis/Data/exp.csv", header=TRUE, fill=TRUE, row.names=NULL)
results <- glmer(Phone ~ Experiment +  (1|Participant) + (1|Token), family=binomial("logit"), data=data)
summary(results)

results <- glmer(Phone ~ TokenLanguage * Context +  (1|Participant) + (1|Token), family=binomial("logit"), data=data)
summary(results)

results2 <- glmer(Phone ~ TokenLanguage * Group +  (1|Participant) + (1|Token), family=binomial("logit"), data=kira)
summary(results2)
print(results2, corr=FALSE)
ranef(results2)$Participant
fitted(results)[1:4]
plot(results2)

data.xtabs111 = xtabs(~Group + Phone, data=data)
data.xtabs111
barplot(data.xtabs111)
barplot(data.xtabs/sum(data.xtabs))

# Group + Phone + TokenLanguage	
data.xtabs2 = xtabs(~Token + Phone + TokenLanguage, data=data)
data.xtabs2
# Token + Phone 
data.xtabs3 = xtabs(~Context + Phone, data=data)
100 * prop.table(data.xtabs3, 1)
# Token + Phone + Group
data.xtabs12 = xtabs(~Token + Phone + Group, data=data)
100*prop.table(data.xtabs12, 1)
# Token + Rating
data.xtabs4 = xtabs(~Token + Rating, data=data)

# Phone + Experiment
data.xtabs5 = xtabs(~Phone + Experiment, data=data)

# Phone + Experiment + Group
data.xtabs6 = xtabs(~Phone + Experiment + Group, data=data)

# Token + Participant
data.xtabs7 = xtabs(~Token + Participant, data=data)

# Plot representing distribution of Ratings of "snack names"
barplot(xtabs(~kira$Rating), xlab="Rating", col="blue")

colnames(kira)
data <-read.csv("/Users/kiraprentice/Documents/College/Senior Honors Thesis/Data/data_for_r4.csv", header=TRUE, fill=TRUE, row.names=NULL)
colnames(data)
kiraA <- subset(data, Filler == "Filler")
kiraP <- subset(data, Filler != "Filler")
barplot(xtabs(~kiraA$Rating), xlab="Rating", col="grey", ylab="Frequency", main="Rating for Filler Items")
barplot(xtabs(~kiraP$Rating), xlab="Rating", col="grey", ylab="Frequency", main="Rating for Experimental Items")
xtabs(~kiraA$Rating)
xtabs(~kiraP$Rating)

length(rownames(kira))

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

#########################################
##### WITH LISA #########################
#########################################

setwd("/Users/kiraprentice/Documents/College/Senior Honors Thesis/Data/")

library(lme4)
library(multcomp)
library(plyr)

kira <- read.csv(file.choose())
kira$Experiment <- as.factor(kira$Experiment)

summary(kira)

kira$Context <- relevel(kira$Context, ref="_D")
kira$Group <- relevel(kira$Group, ref="NS")
kira$Phone <- relevel(kira$Phone, ref="as")
kira$ConPlacePrev <- relevel(kira$ConPlacePrev, ref="coronal")
kira$ConPlaceFol <- relevel(kira$ConPlaceFol, ref="coronal")

kira.NS <- subset(kira, Group=="NS")
kira.S <- subset(kira, Group=="S")
kira.tlE <- subset(kira, TokenLanguage=="English")
kira.tlS <- subset(kira, TokenLanguage=="Spanish")

#Context by language exp
props <- with(kira.NS, ftable(Context, Phone))
table_contextNS <- round(prop.table(props, 1), 2)


#Context by language exp
props2 <- with(kira.S, ftable(Context, Phone))
table_contextS <- round(prop.table(props2, 1), 2)
table_contextS

write.csv(table_contextNS, file = "table_contextNS.csv")
write.csv(table_contextS, file = "table_contextS.csv")

props1 <- with(kira, ftable(Group,TokenLanguage,Phone))
table_contextNS <- round(prop.table(props1, 1), 2)
table_contextNS
write.csv(table_contextNS, file = "table_contextNS.csv")

props3 <- with(kira, ftable(Context, Phone))
table_contextAll <- round(prop.table(props3, 1), 2)
table_contextAll
write.csv(table_contextAll, file = "table_contextAll.csv")

colnames(kira)
props4 <- with(kira, ftable(ConPlacePrev, Phone))
table_contextPrev <- round(prop.table(props4, 1), 2)
table_contextPrev

props5 <- with(kira, ftable(ConPlaceFol, Phone))
table_contextFol <- round(prop.table(props5, 1), 2)
table_contextFol

colnames(kira)
props6 <- with(kira, ftable(ConManPrev, Phone))
table_manPrev <- round(prop.table(props6, 1), 2)
table_manPrev

props7 <- with(kira, ftable(ConManFol, Phone))
table_manFol <- round(prop.table(props7, 1), 2)
table_manFol


write.csv(table_contextAll, file = "table_contextAll.csv")



props2 <- with(kira, ftable(Group,TokenLanguage,Phone))
contextprop <- round(prop.table(props2, 1), 2)
contextprop
barplot(contextprop)

write.csv(contextprop, file = "context_prop.csv")

props3 <- with(kira, ftable(Group,Context,TokenLanguage,Phone))
round(prop.table(props3, 1), 2)

#Fully crossed model. Doesn't converge, and probably too many interactions to be interpretable anyway. 
resultsA <- glmer(Phone ~ Context * TokenLanguage * Group + Experiment +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira)

summary(resultsA)

#Main effects only model
resultsB <- glmer(Phone ~ Context + TokenLanguage + Group + Experiment +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira)

summary(resultsB)

#Take out Experiment
resultsC <- glmer(Phone ~ Context + TokenLanguage + Group + Context:TokenLanguage + Context:Group + Group:TokenLanguage +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira)

summary(resultsC)

resultsD <- glmer(Phone ~ Context + TokenLanguage * Group + 
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira)

summary(resultsD)

#contextD.glht <- glht(resultsD, linfct = mcp(Context = 'Tukey'))
#summary(contextD.glht)

########
#Attempt to reduce the number of factors

#Place model

resultsE <- glmer(Phone ~ TokenLanguage * Group + ConPlacePrev + ConPlaceFol + 
                    ConPlacePrev:TokenLanguage + ConPlacePrev:Group + ConPlacePrev:Group:TokenLanguage + 
                    ConPlaceFol:TokenLanguage + ConPlaceFol:Group + ConPlaceFol:Group:TokenLanguage +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira)

summary(resultsE)

resultsE.1 <- glmer(Phone ~ TokenLanguage * Group * ConPlacePrev + 
                      (1|Participant) + (1|Token), family=binomial("logit"),data=kira)

conplprevE1.glht <- glht(resultsE.1, linfct = mcp(ConPlacePrev = 'Tukey'))
summary(conplprevE1.glht)


summary(resultsE.1)

resultsE.2 <- glmer(Phone ~ TokenLanguage * Group * ConPlaceFol + 
                      (1|Participant) + (1|Token), family=binomial("logit"),data=kira)

summary(resultsE.2)



#Manner model



resultsF <- glmer(Phone ~ TokenLanguage * Group + ConManPrev + ConManFol + 
                    ConManPrev:TokenLanguage + ConManPrev:Group + ConManPrev:Group:TokenLanguage + 
                    ConManFol:TokenLanguage + ConManFol:Group + ConManFol:Group:TokenLanguage +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira)

summary(resultsF)



#subset models

#NS Group only, tested by phone context and language
# Esos sao bad
## FAILURES
resultsG <- glmer(ConManPrev ~ Phone * TokenLanguage + (1|Participant) + (1|Token), family=binomial("logit"),data=kira.S)
summary(resultsG)
resultsG <- glmer(ConPlacePrev ~ Phone * TokenLanguage + (1|Participant) + (1|Token), family=binomial("logit"),data=kira.S)
summary(resultsG)
resultsG <- glmer(ConPlaceFol ~ Phone * TokenLanguage + (1|Participant) + (1|Token), family=binomial("logit"),data=kira.S)
summary(resultsG)

contextG.glht <- glht(resultsG, linfct = mcp(Context = 'Tukey'))
summary(contextG.glht)

## More breakdowns by group
#failures go here
resultsA <- glmer(Phone ~ Context * TokenLanguage + Experiment +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira.S)
resultsA <- glmer(Phone ~ Context * TokenLanguage +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira.S)

# Within Spanish group, effect of token language on phone
resultsA <- glmer(Phone ~ TokenLanguage +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira.S)
summary(resultsA)
# Effect of token language on phone within English group
resultsB <- glmer(Phone ~ TokenLanguage +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira.NS)
summary(resultsB)

# For context/phone relation over all data, the production was not significant
resultsC <- glmer(Context ~ Phone +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira)
summary(resultsC)

# For context/phone relation over within S gourp, the production was not significant
resultsD <- glmer(Phone ~ Experiment  +
                    (1|Participant) + (1|Token), family=binomial("logit"),data=kira)
summary(resultsD)
