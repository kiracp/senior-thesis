import random

stimuli = [
'Kano', 'Kami', 'Dano', 'Sanu',
'Pani', 'Tanu', 'Kapi', 'Katu',
'Taku', 'Bani', 'Astu', 'Kaso',
'Apet', 'Aktu', 'Anto', 'Dami',
'Bato', 'Pati', 'Baku', 'Admi']

filler = [
'Toka', 'Doba', 'Poti', 'Bobi', 'Kota', 
'Puto', 'Duka', 'Ubit', 'Buto', 'Puda',
'Peka','Deno','Chebo','Kepa', 'Bebu', 
'Onat', 'Epak', 'Odab','Upat','Inap']

spanish = []
english = []

# Generate 4 randomized lists
random.shuffle(stimuli)
random.shuffle(filler)

# half of stimuli
rand_stimuli1 = stimuli[0:len(stimuli)/2]
rand_stimuli2 = stimuli[len(stimuli)/2:]

# half of filler
rand_filler1 = filler[0:len(filler)/2]
rand_filler2 = filler[len(filler)/2:]

# Randomly splice together: half filler, half stimuli
spanish = rand_stimuli1 + rand_filler1
english = rand_stimuli2 + rand_filler2

random.shuffle(spanish)
random.shuffle(english)

# Terminal output
print "Random Spanish:", spanish
print "Random English:", english

# Write to output files
spanish_tokens = open('./output/spanish_tokens.txt', 'wb')
english_tokens = open('./output/english_tokens.txt', 'wb')

for i in range(0, len(spanish)):
	writing = spanish[i] + '\n'
	spanish_tokens.write(writing)

for i in range(0, len(english)):
	writing = english[i] + '\n'
	english_tokens.write(writing)

spanish_tokens.close()
english_tokens.close()

