##--------------------------------------------------------------------------
## NOTES
##--------------------------------------------------------------------------

## If this works, we need to make sure that the tagging list is ordered from 
## most words to least, to account for cases of films that might have the name 
## of a city in it, for example.

## We also need to make sure that names we add to the tagging dictionary are 
## also added to the conversion dictionary with all their cases/conjugations


##--------------------------------------------------------------------------
## FUNCTION
##--------------------------------------------------------------------------
def tag(text):
    '''    
    Author:             Margaret Swift, W&M '17
    Project:             Russian Movie Theater Project
    Created:            29 Sept 2016
    Latest Version:  08 Oct 2016
    
    This function was created to tag Russian texts with XML tags chosen by the researcher.  
    The function first converts Russian text into de-conjugated form, essentially stripping 
    it of all character so that the computer can compare words that are nominally the same, 
    but might be in different cases or conjugations.  Then, the function runs through a user-
    defined tagging dictionary, looking to see if each tag's 'marker' (the phrase in its 
    nominative/infinitive form) is in the given converted text. If it is, the program will tag 
    the word.  Finally, we change the whole text back to the original form, de-converted, 
    while keeping the tagged pieces intact.  Note that the markers are also de-converted 
    while still remaining within the tags.
    
    For reference, the tagging dictionary should be formatted as follows:
    "marker, <tag>, <\\tag>\n"
    
    '''
 
    ##------------------------------------------------------------------------
    ## STEP 1: CLEANUP
    ##------------------------------------------------------------------------ 
    ## First: Clean up the original text.

    import codecs
    punct_list = ['.', ',', '(', ')', '"', "'", ';', ':', '--']
    for i in range(0, len(punct_list)):
        punct = punct_list[i]
        text = text.replace(punct, " " + punct + " ")
    text = text.replace("ё", "е").replace('"', "'").split()
    
    # I've changed the above structure drastically--now we only have one text instead of 
    # a bunch of different intermediate texts.  Same thing, just easier to follow along with!
    

    ##------------------------------------------------------------------------
    ## STEP 2: CONVERSION
    ##------------------------------------------------------------------------ 
    ## This part is for the text to be run through rus_dict.txt. 

    for i in range(0, len(text)):
        word = text[i].lower()
        with codecs.open("rus_dict.txt", "r", "utf-16") as dictfile:
            
            # This for loop converts each word to dictionary form.
            for line in dictfile:
                line = line.replace("\n", "").split(', ')
                
                # If the word's in the dictionary, replace with a list of the orginal word and the
                # converted word, to keep track of things.
                if word == line[0]:
                    text[i] = [text[i], line[1]]
                    
        # If the word isn't in the dict, we haven't converted it & it's still a string.
        if isinstance(text[i], str):
            text[i] = ([text[i], text[i]])
        dictfile.close()
        
        
    ##------------------------------------------------------------------------
    ## STEP 3: TAGGING
    ##------------------------------------------------------------------------  
    ## At this point, we have a text that's a list of lists, each inner list containing the original
    ## word and the converted word. 
    
    #We create a string from the text list, to find whether the tagging dictionary's words are 
    # in the converted_text.

    converted_text = ""
    for i in range(0, len(text)):
        converted_text += text[i][1] + " "
        
    # Now tag the words in the converted_text. 
    with codecs.open("tag_dict.txt", 'r', 'utf-16') as tagfile:
        for line in tagfile:
            line = line.replace("\n", "").split(', ')
            
            # If the tagged word's marker is in the text, replace it with tagged text. 
            if line[0] in converted_text:
                tagged = line[-2] + line[0] + line[-1]
                converted_text = converted_text.replace(line[0], tagged)          
    tagfile.close()      
    
    
    ##------------------------------------------------------------------------
    ## STEP 4: SUBSTITUTION
    ##------------------------------------------------------------------------      
    ## This section will put tagged words back into the original text. Create  a mock 
    ## tagged_text that will have each value replaced by either a tagged word with the 
    ## original word inside the tags, or just the original word.
    
    tagged_text = converted_text.split()
    for i in range(0, len(tagged_text)):
        word = tagged_text[i]
        if word[0] != '<' and word[-1] != '>':
            tagged_text[i] = text[i][0]
        else:
            tagged_text[i] = tagged_text[i].replace(text[i][1], text[i][0])


    ##------------------------------------------------------------------------
    ## STEP 5: CLEANUP & OUTPUT
    ##------------------------------------------------------------------------
    ## Time to clean up again! Put all words into a final string and clean up the output.

    final = ""    
    for i in range(0, len(text)):
        final += tagged_text[i] + " "
        
    # Recall that punct_list = ['.', ',', '(', ')', '"', "'", ';', ':', '--']
    for i in range(0, len(punct_list)):
        punct = punct_list[i]
        to_be_replaced = " " + punct + " "
        if punct == '.' or ',' or ')' or ':' or ';':
            final = final.replace(to_be_replaced, punct + " ")
        elif punct == '(':
            final = final.replace(to_be_replaced, " " + punct)
        elif punct == '--':
            final = final.replace(to_be_replaced, punct)

    final= final.replace('refname=', 'ref name = ').replace("'<", " <").replace(">'", "> ").replace("'", "").replace(" ,", ",")
    
    return final 