
# Create the dictionary file
output = open('./output.txt', 'w')
output_ae = open('./output_ae.txt', 'w')
output_aa = open('./output_aa.txt', 'w')

# Read from dictionary

words = open('./cmu_dictionary_basic', 'r')

count_aa = 0
count_ae = 0

for line in words:
	if "AA" in line: 
		# Split items into list items
		s = line.split()

		# See if "AA" is within word
		if s.count("AA") == 0:
			continue	
		else:
			ndx = s.index("AA")
			count_aa += 1

		# Format output to contain only surrounding phones

		# If "AA" is first phone
		if ndx==1:
			# If "AA" is only phone
			if len(s) == 2: 
				trunc = s[0] + ', ' + s[ndx] + '\n'

			# Else, take AA and following phone
			else: 
				trunc = s[0] + ', ' + s[ndx] + ', ' + s[ndx+1] + '\n'
		
		# If "AA" is last phone
		elif ndx==(len(s)-1):
			trunc = s[0] + ', ' + s[ndx-1] + ', ' + s[ndx] + '\n'

		# Somewhere in the middle but way more fresher
		else :
			trunc = s[0] + ', ' + s[ndx-1] + ', ' + s[ndx] + ', ' + s[ndx+1] + '\n'

		printAA = ''.join(trunc)
		output.write(printAA),
		output_aa.write(printAA),

	elif "AE" in line:
		r = line.split()

		if r.count("AE") == 0:
			continue	
		else:
			ndx2 = r.index("AE")
			count_ae += 1 

		# If "AE" is first phone
		if ndx2==1:
			# If "AE" is only phone
			if len(r) == 2: 
				trunc2 = r[0] + ', ' + r[ndx2] + '\n'

			# Else, take AA and following phone
			else: 
				trunc2 = r[0] + ', ' + r[ndx2] + ', ' + r[ndx2+1] + '\n'

		# If "AE" is last phone
		elif ndx2==(len(r)-1) :
			trunc2 = r[0] + ', ' + r[ndx2-1] + ', ' + r[ndx2] + '\n'

		else: 
			trunc2 = r[0] + ', ' + r[ndx2-1] + ', ' + r[ndx2] + ', ' + r[ndx2+1] + '\n'

		printAE = ''.join(trunc2)
		output.write(printAE),
		output_ae.write(printAE),

print("words with aa: ")
print(count_aa) 
print("\nwords with ae: ")
print(count_ae)


output.close()
output_aa.close()
output_ae.close()
words.close()


