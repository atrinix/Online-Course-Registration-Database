#import database as db

#A main menu I used primarily to have output go out in Console, because I kept on getting rate limited by discord
  
def on_message():

  print("\nWelcome to the Non-discord output, because Rate Limit Errors are a bitch to deal with")
  val = None
  while (val != "stop"):
    val = input("\nEnter your command: ") 
    val = val.lower()
    if ("#enroll" in val):
        print("Hang tight! This is a hefty request, Results are loading")

    if val == "help":
      ph = printhelp()
      print(ph)
    elif (val != "help"):
      response = db.response(val)
      print("\n\n------------------\n")
      print(response)
      print("\n------------------\n")

  print("Program end")

#Used for my own reference to help streamline the debugging process

def printhelp():
  h = "[studentid]:  Rick Sanchez`\n[courseid]\n`ENG100  |  ENG110  |  ENG160  |  ENG200  |  CSC220  |  CSC300  |  CSC317  |  CSC413`\n\n[degreeid] `Computer Science  |  English\n\nList of Commands\n\n`#enroll (studentID), (CourseID)`\n`#checkcourse (CourseID) `\n` #checkSection (sectioniD)`\n` #completed (studentID), (CourseID) `\n`#finishenrolling (studentID) `\n`#unitsleft (studentID)`\n`#checkpaymentstatus (studentID)`\n`#degreepathway (degreeID)`"
  return h
  
#db_conn = db.connect()
#on_message()
