'''This script should run through an interview and automatically tag it for us!'''

# This will be tricky for multi-word mentions (Moscow Nights, etc) but we could
# possibly get around this by only comparing each word to the first word of the
# tag in the tag dictionary, and then comparing the next word to the next word,
# and so on. Hopefully, this works!

#----------------------------------------------------------------------------
# PART 1:  DEFINING OUR FUNCTION
#----------------------------------------------------------------------------


# We need to redefine our conversion slightly differently, so we don't get 
# rid of the smaller words or actually 'convert' any of the text, just use
# it to check against the tagging dictionary.

def tag(text):
    '''Our main function.  It's pretty simple--take every word from the
     practice text, run it through the dictionary and replace it with its 
     infinitive / nominative version, add it to the final string, and move on 
     to the next word. At the end, we'll print the converted text.'''
    
    # I've split our practice text into individual words through the 'split' 
    # method, removed punctuation through 'join', and initialized our 
    # 'converted_text' and 'tagged_text' as empty strings to be filled.

    import codecs
    punct_list = ['.', ',', '(', ')', '"', "'", ';', ':']
    for i in range(0, len(punct_list)):
        punct = punct_list[i]
        text = text.replace(punct, " " + punct + " ")
    text = text.split()
    converted_text = []
    tagged_text = u""
     
    # This part is for converted text to be run through the tagging dictionary.
    for word in text: 
        new_word = word.replace("ё", "е")
        new_word = word.lower()
        in_dict = False
        with codecs.open("rus_dict.txt", "r", "utf-16") as dictfile:
            for line in dictfile:
                # For each word set, if the word is in that list of conjugations
                # or cases, replace it with the infinitive/nominative and set 
                # in_dict = True.
                line = "".join(c for c in line if c not in ('\n'))
                line = line.split(', ')
                if new_word == line[0]:
                    converted_text.append([word, line[1]])
                    in_dict = True
        if in_dict == False:
            converted_text.append([word, word])
        dictfile.close()
        
    # Now for the tagging part!   
    for i in range(0, len(converted_text)):
        key = converted_text[i][0]
        value = converted_text[i][1]
        in_file = False
        with codecs.open("tag_dict.txt", 'r', 'utf-16') as tagfile:
            for line in tagfile:
                line = "".join(c for c in line if c not in ('\n'))
                line = line.split(', ')
                if value == line[0]:
                    tagged_word = line[-2] + key + line[-1]
                    in_file = True
        if in_file == True:
            tagged_text += tagged_word + " "
        else:
            tagged_text += key + " " 
            
        
    # Finally, return the tagged text
    return tagged_text

print()
print("--------------------------------------------------------------")
print('TAGGING TRIALS')
print("--------------------------------------------------------------")
text = (u"Я очень люблю Москву.  Это очень красивый город, с многими разних людей.  В Москве находятся много старых здании.")
print(text)
print()
print(tag(text))