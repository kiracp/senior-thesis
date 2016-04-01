'''
Takes in a phone from user input, generates output file and reads all words 
containing that phone, along with immediate phonemic context, from the CMU
phonetic dictionary into output file

Output file can be imported as CSV into a spreadsheet for analysis
'''

def context(token):

	# Open file to read
	words = open('./cmudict-0.7b', 'r')

	# Allowed phones in output
	filter_pre = ['T', 'K', 'B', 'S', 'P', 'D', 'F', 'CH', 'G'];
	filter_post = ['T', 'K', 'B', 'S', 'P', 'D', 'F', 'CH', 'G', 'M', 'N'];
	# Generate output file
	file_name = "./output/output_" + token + ".csv"
	output = open(file_name, 'w')

	# Initialize token instance counter
	count = 0
	count2 = 0
	for line in words:
		if token in line: 
			# Split items into list items
			s = line.split()

			# See if "AA" is within word
			if (s.count(token) == 0 ) :
				continue	

			else:
				ndx = s.index(token)

			# Format output to contain only surrounding phones

			
			if 'A' in s[0]:
				# If token is first phone
				if ndx==1:
					# If token is only phone
					if len(s) == 2: 
						trunc = s[0] + ',  ,' + s[ndx] + '\n'

					# Else, take token and following phone
					else: 
						# Do not output if following phone is not in list
						if (s[ndx+1] not in filter_post): continue
						trunc = s[0] + ',  ,' + s[ndx] + ', ' + s[ndx+1] + '\n'
				
				# If token is last phone
				elif ndx==(len(s)-1):
					# Do not output if preceding phone is not in list
					if (s[ndx-1] not in filter_pre): continue
					trunc = s[0] + ', ' + s[ndx-1] + ', ' + s[ndx] + '\n'

				# Somewhere in the middle but way more fresher
				else :
					# Make sure surrounding phones are in list
					if (s[ndx-1] not in filter_pre or s[ndx+1] not in filter_post): continue
					trunc = s[0] + ', ' + s[ndx-1] + ', ' + s[ndx] + ', ' + s[ndx+1] + '\n'

				count += 1
				print_phone = ''.join(trunc)
				output.write(print_phone)

	print("\nwords with " + token + ":")
	print(count) 
	print("\n words with " + token + " and 'a':")
	print (count2)

	output.close()
	words.close()

'''
Calls context with user-input token
'''

def main():
	# Initialize
	stop = False
	token_counter = 0

	while (stop == False):
		# Get input token from user
		token = raw_input("Enter phone to find (ex. AA1, AE2): ");
		# TODO: Check that phone is w/i list
		context(token)

		# Continue or break out of loop
		cont = raw_input("\nEnter X to exit, or any key to continue: ")
		if (cont == 'X'):
			stop = True
		else: 
			token_counter = token_counter + 1
			continue
	print("Done!")

main()