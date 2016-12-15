def tag(text, tag_dictionary, ref_list):
    '''    
    Author:             Margaret Swift, W&M '17
    Project:             Russian Movie Theater Project
    Created:            29 Sept 2016
    Latest Version:  18 Oct 2016
    
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
 
    #===================================
    # STEP 1: CLEANUP
    # Clean up the original text.
    punct_list = ['.', ',', '(', ')', '"', "'", ';', ':', '--', '?']
    for i in range(0, len(punct_list)):
        punct = punct_list[i]
        text = text.replace(punct, " " + punct + " ")
    text = text.replace("ё", "е").replace('"', "'").split()


    #===================================
    # STEP 2: CONVERSION
    # At this point, we take any words that are in our tagging 
    # dictionary and convert them into dictionary form so the 
    # reference list can find them.

    for i in range(0, len(text)):
        word = text[i].lower()
        
        with codecs.open(tag_dictionary, "r", "utf-16") as dictfile:
            
            # This for loop converts each word that's in the dictionary 
            # to dictionary form.
            for line in dictfile:
                line = line.strip().split(', ')
                
                # If the word's in the dictionary, replace with a list of the 
                # orginal word and the converted word, to keep track of 
                # things.
                if word == line[0]:
                    text[i] = [text[i], line[1]]
        
        # Close the dictionary.
        dictfile.close()
                    
        # If the word isn't in the dict, we haven't converted it & it's still 
        # a string. Lowercase it.
        if isinstance(text[i], str):
            text[i] = ([text[i], text[i].lower()]) 
            
            
    #===================================
    # STEP 3: TAGGING
    # At this point, we have a text that's a list of lists, each inner 
    # list containing the original word and the converted word. 
    
    # We create a string from the text list, to find whether the 
    # tagging dictionary's words are in the converted_text.
    converted_text = ""
    for i in range(0, len(text)):
        converted_text += text[i][1] + " "
    
    # Now tag the words in the converted_text. 
    with codecs.open(ref_list, 'r', 'utf-16') as tagfile:
        for line in tagfile:
            line = line.strip().split(', ')
            
            # If the tagged word's marker is in the text, replace it 
            # with tagged text. 
            if line[0] in converted_text:
                tagged = line[-2] + line[0] + line[-1]
                converted_text = converted_text.replace(line[0], tagged)  
                
    # Close the tagging reference file.
    tagfile.close()
    
    
    #===================================
    # STEP 4: SUBSTITUTION
    # This section will put tagged words back into the original 
    # text. Create  a mock tagged_text that will have each value 
    # replaced by either a tagged word with the original word 
    # inside the tags, or just the original word.
    
    # Create a list called 'tagged_text'. Run through it.
    tagged_text = converted_text.split()
    try:
        for i in range(0, len(tagged_text)):
            word = tagged_text[i]
            
            # If word isn't tagged, re-insert original word from text.
            if '<' not in word:
                tagged_text[i] = text[i][0] + " "
            
            # If word is tagged, re-insert original word between tags
            else:
                tagged_text[i] = tagged_text[i].replace(text[i][1], " " + text[i][0] + " ")
                
            # If the tagged word is inside another word (ie 'выбор' 
            # would be tagged as the word 'вы' + 'бор'), then un-tag!
            if ('<' in word and word[0] != '<') or ('>' in word and word[-1] != '>'):
                tagged_text[i] = text[i][0] + " "
    except IndexError:
        print("Oh no! Error thrown for word", i, ": '", tagged_text[i], "' in interviewee's paragraph", len(para), ".  Looks like your list of references might have an error. Make sure the references are all inputted in the exact same manner: marker, <tag>, </tag>")
        print()

    #===================================
    # STEP 5: CLEANUP & OUTPUT
    # Time to clean up again! Put all words into a final string and 
    # clean up the output.

    # Create the final string to be filled. Concatinate 'tagged_text'.
    final = ""    
    for i in range(0, len(text)):
        final += tagged_text[i] + " "
        
    # Recall that punct_list = ['.', ',', '(', ')', '"', "'", ';', ':', '--']
    # Re-prettify punctuation.
    for i in range(0, len(punct_list)):
        punct = punct_list[i]
        to_be_replaced = "  " + punct + " "
        if punct == '.' or ',' or ')' or ':' or ';' or '?':
            final = final.replace(to_be_replaced, punct + " ")
        elif punct == '(':
            final = final.replace(to_be_replaced, " " + punct)
        elif punct == '--':
            final = final.replace(to_be_replaced, punct)
            
    # Replace various punctuation errors and insert spaces
    # in xml tags.
    final= final.replace("'", "").replace(" ,", ",").replace("  ", " ").replace('xml', ' xml').replace("rstype", "rs type").replace("subtype", " subtype").replace('"key', '" key')
    
    para.append(1)
    return final 


#=======================================================
#=======================================================
#=======================================================

def tag_text(readfile, writefile, metadata, tag_dictionary, ref_list, interviewer, interviewee):
    '''This function tags a text (readfile) using the function tag(), and outputs it into another 
    file (writefile)'''
    
    # Initialize the count to recognize paragraphs.
    count = 0
    
    # open both files.
    with codecs.open(readfile, "r", "utf-16") as readfile:
        with codecs.open(writefile, "w", "utf-16") as writefile: 
            
            # write some preliminary tags.
            writefile.write("<document>\n")
            writefile.write("<meta>\n")
            writefile.write(metadata)
            writefile.write('\n')
            writefile.write("<\\meta>\n")
            writefile.write("\n<text>\n<body>\n")
            
            for line in readfile:
                line = line.strip()
                
                # If it's the interviewer speaking, just tag the paragraph.      
                if count%4 == 0:
                    word = '<u xml:id="sp' + str(count//2 + 1) + '" who="' + interviewer +'">'
                    writefile.write(word)
                    writefile.write(line)
                    writefile.write('</u>')
                    
                # If it's the 2nd of each group of 4 lines,
                # it's the interviewee. Tag their lines.
                elif count%4 == 2:
                    word = '<u xml:id="sp' + str(count//2 + 1) + '" who="' + interviewee +'">'
                    writefile.write(word)                    
                    writefile.write(tag(line, tag_dictionary, ref_list))    
                    writefile.write('</u>')
                    
                # Add a newline character at the end of each
                # line and increase the paragraph count.
                writefile.write("\n")
                count += 1
                
            # Close all appropriate tags.
            writefile.write("</body>\n</text>\n</document>")    
        
        # Close all files.
        writefile.close()
    readfile.close()
    
#=======================================================
#=======================================================
#=======================================================

import codecs
readfile = 'astaikina.txt'                   #file to read from
writefile = 'astaikina_tagged.txt'      #file to write to
tag_dictionary = 'tag_dict.txt'          #list of word pairs
ref_list = 'tag_ref.txt'                       #list of xml tags
metadata = "This file was created by Maggie Swift!" #what to state at the beginning
interviewer = "orr"
interviewee = "astaikina"
para = []
tag_text(readfile, writefile, metadata, tag_dictionary, ref_list, interviewer, interviewee)