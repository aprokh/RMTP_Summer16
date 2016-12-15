#Test files
from Russian_conversion import conversion
from Russian_tagging import tag


print("--------------------------------------------------------------")
print('CONVERTING TRIALS')
print()
practice_text_1 = u"Я люблю Россию и её людей (Маргарита)"
print("||Practice  text|| ", practice_text_1)
print("||Converted text||  " + str(conversion(practice_text_1)))

print()
practice_text_2 = u"Я люблю говорить с людьми! (Саша)"
print("||Practice  text|| ", practice_text_2)
print("||Converted text||  " + str(conversion(practice_text_2)))

print()
practice_text_3 = u"Лена предпочитает говорить с французкими людьми, а Саше больше нравится говорить с американскими людьми."
print("||Practice  text|| ", practice_text_3)
print("||Converted text||  " + str(conversion(practice_text_3)))

print()
print()
print("--------------------------------------------------------------")
print('TAGGING TRIALS')
print("--------------------------------------------------------------")
text = (u'Я очень люблю кино.  Мой любимый фильм "Французкие люди", о французких мужчинах в Москве.')
print(text)
print()
print(tag(text))