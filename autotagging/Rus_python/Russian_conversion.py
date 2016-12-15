##---------------------------------------------------------------------------
## NOTES
##---------------------------------------------------------------------------

## How should we handle words like поеду?  Should it point towards поехать
## or ехать?

##---------------------------------------------------------------------------
## FUNCTION
##---------------------------------------------------------------------------
def conversion(text):
    '''
    Author:  Margaret Swift, W&M '17
    Date:    29 Sept 2016
    Project: Russian Movie Theater Project
    
    This function serves to de-conjugate and de-decline words in a Russian 
    text.  This allows any textual analylsis program, such as word frequency
    counts, to accurately analyze a Russian text. That is, it won't be tricked
    into thinking that говорить and говорю are fundamentally different words, 
    as with собака, собаки, собаку, etc. '''
    
    
    ##------------------------------------------------------------------------
    ## STEP 1: CLEANUP
    ##------------------------------------------------------------------------ 
    ## First: Clean up the original text and create converted_text to hold the 
    ## converted text after all's said and done.

    import codecs
    text = "".join(c for c in text if c not in ('!','.',':', ',', '"', '(', ')'))
    text = text.lower().replace(u"ё", "е").split()
    converted_text = u""
    
    
    ##------------------------------------------------------------------------
    ## STEP 2: CONVERSION
    ##------------------------------------------------------------------------ 
    ## This part is for converted text to be run through rus_dict.txt.
    ## Initialize in_dict to return verbatim any words not in the dictionary.    
    ## Now we iterate through the text we provided. 
         
    for word in text:    
        # We initialize in_dict to be false, used later to make sure words not 
        # in the dictionary aren't passed through without warning.        
        in_dict = False
        
        with codecs.open("rus_dict.txt", "r", "utf-16") as file1:
            for line in file1:
                # For each word set, if the word is in the list of cases or 
                # conjugations, replace it with the infinitive/nominative and  
                # set in_dict = True.
                line = "".join(c for c in line if c not in ('\n'))
                line = line.split(', ')
                if word == line[0]:
                    word = line[1]
                    in_dict = True
        file1.close()
        
        # Get rid of small words that we don't want, make sure string in dict
        with codecs.open("omit_dict.txt", "r", "utf-16") as file2:
            for line in file2:
                if word in line:
                    word = ""
                else:
                    word = word + " "
                    if in_dict == False:
                        word = "[" + str(word) + " is not in dict!] "
        file2.close()
        
        # Add the word to the converted text string.
        converted_text += word
        
        
    ##------------------------------------------------------------------------
    ## STEP 3: RETURN
    ##------------------------------------------------------------------------   
    ## :)  WE DID IT!  No need for cleanup, computer doesn't care about that!      
    return converted_text























# The following is leftover code from the code I copied from, saved just in case
# we want to write this to a file (which we will eventually).


# !/usr/bin/env python2
# -*- coding: utf-8 -*-
# The above encoding declaration is required and the file must be saved as UTF-8

#import codecs

#with codecs.open("Converted_file.txt", "r+", "utf-16") as stream:   # or utf-8
#    stream.write(p + u"\n")
#    stream.write(p2 + u"\n")
