# Building our Tagging Dictionary

# The tagging dictionary should be formatted as follows:
#   "marker, <tag>, <\\tag>\n
    
# And, it should also be noted, that the tags must NOT have any spaces, 
# and the markers should be in nominative/infinitive case, with no capital
# letters.
    
# Be sure to add the marker to the regular dictionary in all its forms.

import codecs
with codecs.open("tag_dict.txt", "w", "utf-16") as file:   # or utf-8
    file.write(u'москва, <refname="Moscow">, <\\name>\n')
    file.write(u'французкий люди, <refname="FrenchPeople">, <\\name>\n')    
file.close()