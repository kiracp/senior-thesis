import random

stimuli = ['Cano','Pani','Tacu','Aplo','Bato','Canu','Pano',
'Tacto','Apso','Bati','Cami','Tana','Bani','Actu','Pati',
'Cama','Tano','Bana','Acta','Pata','Dano','Capi','Astu',
'Anto','Baco','Dani','Capu','Asca','Anco','Baca','Sanu',
'Catu','Casu','Damo','Admi','Sana','Cata','Caso','Dami',
'Admo','Tamo','Tama','Samo','Sama' ]

filler = [ 'Choca', 'Doba', 'Poti', 'Boto', 'Cota', 'Chato', 
'Pota', 'Duca', 'Chupo', 'Buto', 'Puda', 'Pidi', 'Teca', 
'Deno', 'Chebo', 'Coba', 'Bebu', 'Chipa', 'Ondo', 'Edri',
 'Ocru', 'Piga', 'Bipo', 'Tona', 'Beni', 'Inti', 'Bica', 
 'Doma', 'Onti', 'Cumo', 'Tosa', 'Coso', 'Dega', 'Godi', 'Gumo']

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

filename = raw_input('File name should be:');
spanishname = './spanish' + filename + '_tokens.txt'
englishname = './english' + filename + '_tokens.txt'
# Write to output files
spanish_tokens = open(spanishname, 'wb')
english_tokens = open(englishname, 'wb')

for i in range(0, len(spanish)):
	writing = spanish[i] + '\r\n'
	spanish_tokens.write(writing)
	rating = "Rating? \t 1   .   .   .   5\r\n"
	spanish_tokens.write(rating)

for i in range(0, len(english)):
	writing = english[i] + '\r\n'
	english_tokens.write(writing)

spanish_tokens.close()
english_tokens.close()

