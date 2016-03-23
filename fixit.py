def fixIt(filename, ct):
	getFrom = open(filename, 'r')

	newFileName = './tokens_excel' + str(ct) + '.txt'

	print newFileName
	spanish_tokens = open(newFileName, 'wb')

	line_ct = 0
	for line in getFrom:
		if (line_ct%3 ==0):
			writing = line + '\n'
			spanish_tokens.write(writing)
			++line_ct
		else:
			++line_ct
			break


	spanish_tokens.close()
	getFrom.close()

def fixIt2(filename, ct):
	getFrom = open(filename, 'r')
	newFileName = './spanish_v' + str(ct) + '.txt'
	print newFileName

	newFile = open(newFileName, 'wb');

	for line in getFrom:
		if any(char.isdigit() for char in line):
			continue
		else:
			line.strip()
			print line
			writeTo = line + '\n'
			newFile.write(line)


def main():
	
	fixIt2('./spanishNEW1_tokens.txt', 1)
	fixIt2('./spanishNEW2_tokens.txt', 2)
	fixIt2('./spanishNEW3_tokens.txt', 3)


main()
