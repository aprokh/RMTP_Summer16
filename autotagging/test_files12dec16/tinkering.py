import tkinter
from tkinter import *
fields = 'First Name', 'Last Name', 'School'
tags = 'original word', 'suggested tag'

def fetch(entries):
   root.attributes("-topmost", False)
   for entry in entries:
      field = entry[0]
      text  = entry[1].get()
      print('%s: "%s"' % (field, text)) 

def makeform(root, fields):
   root.attributes("-topmost", True)
   entries = []
   for field in fields:
      row = Frame(root)
      lab = Label(row, width=15, text=field, anchor='w')
      ent = Entry(row)
      row.pack(side=TOP, fill=X, padx=5, pady=5)
      lab.pack(side=LEFT)
      ent.pack(side=RIGHT, expand=YES, fill=X)
      entries.append((field, ent))
   return entries
   
def suggest_tag(root, tags):
   root.attributes("-topmost", True)
   entries = []
   row1 = Frame(root)
   row2 = Frame(root)
   lab1 = Label(row1, width=15, text=tags[0], anchor='w')
   lab2 = Label(row2, width=15, text=tags[1], anchor='w')
   ent1 = Entry(row1)
   ent2 = Entry(row2)
   row1.pack(side=TOP, fill=X, padx=5, pady=5)
   row2.pack(side=TOP, fill=X, padx=5, pady=5)
   
   lab1.pack(side=LEFT)
   lab2.pack(side=LEFT)
   
   ent1.pack(side=RIGHT, expand=YES, fill=X)
   ent2.pack(side=RIGHT, expand=YES, fill=X)
   entries.append((tags, ent1, ent2))
   return entries



if __name__ == '__main__':
   root = Tk()
   root.attributes("-topmost", True)
   ents = suggest_tag(root, tags)
   root.bind('<Return>', (lambda event, e=ents: fetch(e)))   
   b1 = Button(root, text='Show',
          command=(lambda e=ents: fetch(e)))
   b1.pack(side=LEFT, padx=5, pady=5)
   b2 = Button(root, text='Quit', command=root.quit)
   b2.pack(side=LEFT, padx=5, pady=5)
   root.mainloop()










#import tkinter as tk
#from tkinter import *
#from tkinter import messagebox
#from tkinter import ttk

##---------------------------------------------------------------------------
## My Styles:

##---------------------------------------------------------------------------
## My Functions:

#def okay():
      #'''Shows some info'''
      #messagebox.showinfo( "Hello Python", "Hello friend")
      
#def click():
      #'''Prints a nice message.'''
      #print("Hey, you clicked me! You look nice today. :) ")    

##---------------------------------------------------------------------------


## Set up the root.
#root = tk.Tk()
#root.attributes("-topmost", True)

#def show_entry_fields():
      #firstname = e1.get()
      #lastname = e2.get()
      #print("First Name: %s\nLast Name: %s" % (e1.get(), e2.get()))
      #e1.delete(0,END)
      #e2.delete(0,END)

#Label(root, text="First Name").grid(row=0)
#Label(root, text="Last Name").grid(row=1)

#e1 = Entry(root)
#e2 = Entry(root)
#e1.insert(10,"First")
#e2.insert(10,"Last")

#e1.grid(row=0, column=1)
#e2.grid(row=1, column=1)

#Button(root, text='Quit', command=root.quit).grid(row=3, column=0, sticky=W, pady=4)
#Button(root, text='Show', command=show_entry_fields).grid(row=3, column=1, sticky=W, pady=4)


#mainloop( )

### Label and button tryouts
##label = Label(root, text='Click to begin.')
##button = Button(root, text='Click Me!', command = click, width = 40)
##label.pack()
##button.pack()

##L1 = Label(root, text="What's your username?")
##L1.pack( side = LEFT)
##entry = Entry(root, bd = 1)
##entry.pack(side = RIGHT)
##print(entry.get())

### Run the mainloop.
##root.mainloop()

