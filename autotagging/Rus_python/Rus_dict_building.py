# Building our Russian Dictionary
# Avenues:
# 1) We can see if someone has already done this
# 2) Try to strip information from Wikipedia, either through xowa or web 
#    scraping

# Wikipedia approach:
# Let's find a list of all words in Russian language.  
# To strip from the wiktionary page, 

# for word in word_list:
#     url = "https://ru.wiktionary.org/wiki/" + str(word)
#     somehow use this url to strip the data 
#     add this data to the master dictionary.

# For the future: create different text files for different letters of the alphabet

# !/usr/bin/env python2
# -*- coding: utf-8 -*-
# The above encoding declaration is required and the file must be saved as UTF-8











## Questions for Sasha and Lena:
# Do we want to make a difference between words like поехать and ехать? could
     # result in a problem with alphabetization; would have to scrap that.
     # Wait, maybe it wouldn't, if we reversed the order of our lists and 
     # alphabetized by first letter of the given word, not the outputted word!
     
     
## Ideas for markup:
# ---define paragraphs: for every other paragraph, paragraph = paragraph wrapped
     # in speaker tags
# ---de-russify words: for each word in the document, run through our conversion
     # script. We would have to put the words in our markup list into the dictionary!
# ---wrap words: for each word in document, run through list of markups we should
     # do. ie if word == tag, word = <tag>word</tag>

import codecs

with codecs.open("rus_dict.txt", "w", "utf-16") as file:   # or utf-8
    # Verbs
    file.write(u"говорить, говорить\n")
    file.write(u"говорю, говорить\n")
    file.write(u"говоришь, говорить\n")
    file.write(u"говорит, говорить\n")
    file.write(u"говорим, говорить\n")
    file.write(u"говорите, говорить\n")
    file.write(u"говорят, говорить\n")
    
    file.write(u"любить, любить\n")
    file.write(u"люблю, любить\n")
    file.write(u"любишь, любить\n")
    file.write(u"любит, любить\n")
    file.write(u"любим, любить\n")
    file.write(u"любите, любить\n")
    file.write(u"любят, любить\n")  
    
    file.write(u"предпочитать, предпочитать\n")
    file.write(u"предпочитаю, предпочитать\n")
    file.write(u"предпочитаешь, предпочитать\n")
    file.write(u"предпочитает, предпочитать\n")
    file.write(u"предпочитаем, предпочитать\n")
    file.write(u"предпочитаете, предпочитать\n")
    file.write(u"предпочитают, предпочитать\n")      
    
    file.write(u"нравиться, нравиться\n")
    file.write(u"нравлюсь, нравлюсь\n")
    file.write(u"нравишься, нравишься\n")
    file.write(u"нравится, нравится\n")
    file.write(u"нравимся, нравимся\n")
    file.write(u"нравитесь, нравитесь\n")
    file.write(u"нравятся, нравятся\n")      
    
    
    # Nouns
    file.write(u"саша, саша\n")
    file.write(u"саши, саша\n")
    file.write(u"сашу, саша\n")
    file.write(u"саше, саша\n")
    file.write(u"сашей, саша\n") 

    file.write(u"лена, лена\n")
    file.write(u"лены, лена\n")
    file.write(u"лену, лена\n")
    file.write(u"лене, лена\n")
    file.write(u"леной, лена\n") 
    
    file.write(u"москва, москва\n")
    file.write(u"москвы, москва\n")
    file.write(u"москву, москва\n")
    file.write(u"москве, москва\n")
    file.write(u"москвой, москва\n") 
    
    file.write(u"люди, люди\n")
    file.write(u"людей, люди\n")
    file.write(u"людям, люди\n")
    file.write(u"людьми, люди\n")
    file.write(u"людях, люди\n")
    
    file.write(u"я, я\n")
    file.write(u"меня, я\n")
    file.write(u"мне, я\n")
    file.write(u"мной, я\n")
    
    file.write(u"россия, россия\n")
    file.write(u"россии, россия\n")
    file.write(u"россий, россия\n")
    file.write(u"россиям, россия\n")
    file.write(u"россией, россия\n")
    file.write(u"россиями, россия\n")
    file.write(u"россию, россия\n")
    file.write(u"россиях, россия\n")
    
    
    #Adjectives/pronouns
    file.write(u"американский, американский\n")
    file.write(u"американская, американский\n")
    file.write(u"американские, американский\n")
    file.write(u"американское, американский\n")
    file.write(u"американскую, американский\n")
    file.write(u"американского, американский\n")
    file.write(u"американской, американский\n")
    file.write(u"американском, американский\n")    
    file.write(u"американскими, американский\n")
    file.write(u"американским, американский\n")
    file.write(u"американскому, американский\n")    
    file.write(u"американских, американский\n")     
    
    file.write(u"французкий, французкий\n")
    file.write(u"французкая, французкий\n")
    file.write(u"французкиое, французкий\n")
    file.write(u"французкие, французкий\n")
    file.write(u"французкую, французкий\n")
    file.write(u"французкого, французкий\n")
    file.write(u"французкой, французкий\n")
    file.write(u"французком, французкий\n")    
    file.write(u"французкими, французкий\n")
    file.write(u"французким, французкий\n")
    file.write(u"французкому, французкий\n")    
    file.write(u"французких, французкий\n")  
    
    file.write(u"свой, свой\n")
    file.write(u"своей, свой\n")
    file.write(u"своих, свой\n")
    file.write(u"свою, свой\n")
    file.write(u"своя, свой\n")
    file.write(u"свое, свой\n")
    file.write(u"своим, свой\n")
    file.write(u"своими, свой\n")
    
    file.write(u"больше, больше\n")
file.close()

with codecs.open("omit_dict.txt", "w", "utf-16") as file:
    file.write(u"я мы ты вы он они оно она ")
    file.write(u"мой наш ваш ее его их свой ")
    file.write(u"и а с о до про при по в на но")
    file.write(u"что кто как какой где куда сюда туда когда почему")
    file.write(u"вот это потому из-за то нибудь такой который по-моему")
file.close()