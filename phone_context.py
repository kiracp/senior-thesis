'''
Takes in a phone from user input, generates output file and reads all words 
containing that phone, along with immediate phonemic context, from the CMU
phonetic dictionary into output file

Output file can be imported as CSV into a spreadsheet for analysis
'''

def context(token):

	# Open file to read
	words = open('./cmudict-0.7b', 'r')

	# Generate output file
	file_name = "./output_" + token + ".txt"
	output = open(file_name, 'w')

	# Initialize token instance counter
	count = 0

	for line in words:
		if token in line: 
			# Split items into list items
			s = line.split()

			# See if "AA" is within word
			if (s.count(token) == 0) :
				continue	

			else:
				ndx = s.index(token)
				count += 1

			# Format output to contain only surrounding phones

			# If token is first phone
			if ndx==1:
				# If token is only phone
				if len(s) == 2: 
					trunc = s[0] + ', ' + s[ndx] + '\n'

				# Else, take token and following phone
				else: 
					trunc = s[0] + ', ' + s[ndx] + ', ' + s[ndx+1] + '\n'
			
			# If token is last phone
			elif ndx==(len(s)-1):
				trunc = s[0] + ', ' + s[ndx-1] + ', ' + s[ndx] + '\n'

			# Somewhere in the middle but way more fresher
			else :
				trunc = s[0] + ', ' + s[ndx-1] + ', ' + s[ndx] + ', ' + s[ndx+1] + '\n'

			print_phone = ''.join(trunc)
			output.write(print_phone)

	print("\nwords with " + token + ":")
	print(count) 

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