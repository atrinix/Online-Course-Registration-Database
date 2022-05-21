# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors
import json
import re

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")

def response(msg):
  db_response = None
  command_parts = msg.split()
  bot_command = command_parts[0]
  
  if (("#checkcourse" in bot_command) and (len(command_parts) == 2)):
    course = command_parts[1]
    response1 = findUnits(course)
    response2 = findDegreeFufill(course)

    if ((response1 == None) or (response2 == None)):
      db_response = "Invalid entry or class not found.\n (#2, #3)"
      return db_response
      
    db_response = combine(response1, response2)

    return db_response

  elif ("#degreepathway" in bot_command): 
    
    if (len(command_parts) == 2):
      degree = command_parts[1]
    elif (len(command_parts) == 3):
      d1 = command_parts[1]
      d2 = command_parts[2]
      degree = d1 + " " + d2
      
    response = degreeClassList(degree)

    if (response == None):
      db_response = "Invalid entry or degree not found (#17)"
      return db_response

    print(type(response))
    db_response = response
      
    return db_response

  elif (("#checkpaymentstatus" in bot_command) and (len(command_parts) == 3)):
    fn = command_parts[1]
    ln = command_parts[2]
    name = fn + " " + ln
    
    response = checkPay(name)

    if (response == None):
      db_response = "Invalid entry or name not entered (#17)"
      return db_response

    db_response = response
      
    return db_response
    
  elif (("#unitsleft" in bot_command) and (len(command_parts) == 3)):
    fn = command_parts[1]
    ln = command_parts[2]
    name = fn + " " + ln
    
    response = unitsLeftforDegree(name)

    if (response == None):
      db_response = "Invalid entry or name not found (#14)"
      return db_response

    db_response = response
      
    return db_response

  elif (("#completed" in bot_command) and (len(command_parts) == 4)):
    fn = command_parts[1]
    ln = command_parts[2]
    course = command_parts[3]
    name = fn + " " + ln
    
    response = completed(course, name)

    if (response == None):
      db_response = "Invalid entry or class not found (#10)"
      return db_response

    db_response = response
      
    return db_response
    
  elif (("#finishenrolling" in bot_command) and (len(command_parts) == 3)):
    fn = command_parts[1]
    ln = command_parts[2]
    name = fn + " " + ln
    
    response = checkUnitsInSche(name)

    if (response == None):
      db_response = "Invalid entry or name not found (#12)"
      return db_response

    db_response = response
      
    return db_response

  elif (("#checksection" in bot_command) and (len(command_parts) == 2)):
    course = command_parts[1]
    response = checkSeats(course)

    if (response == None):
      db_response = "Invalid entry or class does not have a section available (#6)"
      return db_response
    db_response = response
    return db_response

  elif (("#enroll" in bot_command) and (len(command_parts) == 4)):
                                       
    fn = command_parts[1]
    ln = command_parts[2]
    name = fn + " " + ln

    course = command_parts[3]
    
    spacer = "\n\n"
    response1 = exceedUnits(name, course)
    response2 = enrollSeating(name, course)
    response3 = enrollPay(name, course)
    response4 = checkRepeat(name, course)
    response5 = checkTime(name, course)
    
    if (response1 == None or response2 == None or response3 == None or response4 == None or response5 == None):
      db_response = "Invalid entry or class not found on catalog. (Rules involved: (#1), (#4), (#5), (#7), (#8), (#9), (#13), (#16)"
      return db_response

    chk = spacer + response1 + spacer + response2 + spacer + response3 + spacer + response4 + spacer + response5 + spacer

    valid = finalcheck(chk)

    db_response = chk + spacer + valid
    
    return db_response
    
  else:
    db_response = "Incorrect input. Please try again"
    
  return db_response

def combine(response1, response2):
  
  r1 = json.dumps(response1)
  r2 = json.dumps(response2)
  str = '\n\n'
  combined = r1 + str + r2
  
  return combined

  
def findUnits(course):

  results = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT units FROM course WHERE course_name =%s ORDER BY course_name ASC, units DESC")

  cursor.execute(query, (course))
  connection.commit()
  results = cursor.fetchone()
  print(results)

  connection.close()

  print(type(results))

  sr = json.dumps(results)
  s = re.findall(r'\d+', sr)
  if len(s) == 0:
    return None
  ss = str(s)
  ss = re.sub("[^0-9^]", "", ss)

  s1 = "The class " 
  s22 = " has "
  s2 = " units. (#2)"

  final = s1 + course + s22 + ss + s2
  print(final)

  return final

def findDegreeFufill(course):
  results = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT DegreePathway.degree_name FROM DegreePathway INNER JOIN course ON DegreePathway.idDegreePathway = course.DegreePathway_idDegreePathway where course.course_name =%s")

  cursor.execute(query, (course))
  connection.commit()
  results = cursor.fetchone()

  connection.close()

  if (results is None):
    return None

  n = ""
  s1= json.dumps(results)
  
  for ch in s1:
    if ch.isalpha():
        n += ch

  n = n.replace('degreename', '')
  
  s = " is the degree this class fufills. (#3)"
  final = n + s
  
  return final

def degreeClassList(degree):
  results = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT course.course_name FROM course INNER JOIN DegreePathway ON course.DegreePathway_idDegreePathway = DegreePathway.idDegreePathway where DegreePathway.degree_name = %s")

  cursor.execute(query, (degree))
  connection.commit()
  results = cursor.fetchall()
  print(results)
  
  connection.close()

  n = ""
  s1= json.dumps(results)
  print(len(s1))

  if (len(s1) == 2):
    return None

  o = 0
  for ch in s1:
    if ch.isalpha() or ch.isdigit():
        n += ch

  n = n.replace('coursename', '')

  m = ""
  for c in n:
    o += 1
    m += c
    if o % 6 == 0:
      m += ", "

  s = "The classes for the degree "
  ss = " are: "
  s1 = "\n (#17)"
  fs = s + degree + ss + m + s1
  return fs

def checkPay(student):

  results = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT bursar.isStanding, student.name FROM student INNER JOIN bursar ON student.idbursar = bursar.idbursar where student.name = %s")

  cursor.execute(query, (student))
  connection.commit()
  results = cursor.fetchone()
  print(results)

  connection.close()

  final = None
  s = " has a payment status in Good Standing. (#15)"
  s1 = " has a payment status in Bad standing (#15)"

  p = json.dumps(results)
  if ("Good" in p): 
    final = student + s
  else:
    final = student + s1
    
  return final

def unitsLeftforDegree(student):

  results = None
  results1 = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT name, unitsamount FROM student WHERE name = %s ORDER BY name ASC, unitsamount DESC")

  cursor.execute(query, (student))
  connection.commit()
  results = cursor.fetchone()
  print(results)

  query1 = (
   "SELECT Degree.degreeUnits, Degree.degreeName FROM Degree INNER JOIN student ON Degree.idDegree = student.Degree_idDegree where student.name = %s")

  cursor.execute(query1, (student))
  connection.commit()
  results1 = cursor.fetchone()

  list= [list[0] for list in cursor.fetchall()]
  print(list)
  
  connection.close()
  
  q = json.dumps(results)
  q1 = json.dumps(results1)
  print(q)
  print(q1)
  print(type(q))
  print(type(q1))

  if (len(q) == 0) or (len(q1) == 0):
    return None

  su = int ( ''.join(filter(str.isdigit, q) ) )
  du = int ( ''.join(filter(str.isdigit, q1) ) )

  sum = du - su
  ssum = str(sum)

  finalresponse = "The student " + student + " needs " + ssum + " units left to complete their education. (#14)"
  
  return finalresponse

def checkUnitsInSche(student):

  results = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT units FROM course INNER JOIN enrolled_class ON course.idcourse = enrolled_class.idcatalog INNER JOIN student ON enrolled_class.student_id = student.idstudent WHERE enrolled_class.isEnroll = 1 AND student.name = %s")

  cursor.execute(query, (student))
  connection.commit()
  results = cursor.fetchall()
  print(results)

  #list= [list[0] for list in cursor.fetchall()]
  #print(list)
  
  connection.close()
  
  if (type(results) == None):
    return None

  print("results")
  print(results)
  
  sr = json.dumps(results)
  print("sr")
  print(type(sr))
  if (len(sr) == 2):
    return None
  #su = int ( ''.join(filter(str.isdigit, q) ) )
  sumarr = re.findall(r'\d+', sr)

  print("sumarr")
  print(type(sumarr))
  print(sumarr)

  conv = [int(x) for x in sumarr]
  sum1 = sum(conv)

  s1 = "The student "
  s2 = " has " 
  s3 = " fully enrolled units, which is enough units to be eligible for full financial aid. (#12)" 
  s4 = " fully enrolled units, which is not enough units to be eligible for full financial aid. (#12)"
  sum2 = str(sum1)
  
  if (sum1 >= 12):
    finalresponse = s1 + student + s2 + sum2 + s3
  elif ( sum1 < 12):
    finalresponse = s1 + student + s2 + sum2 + s4
  #sum = du - su
  #ssum = str(sum)

  return finalresponse

def checkSeats(course):

  print("checkseats func")
  results = None
  results1 = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT section.seats, section.seats_filled FROM section INNER JOIN catalog ON section.catalog_idcatalog = catalog.idcatalog where catalog.coursename = %s")

  cursor.execute(query, (course))
  connection.commit()
  results = cursor.fetchall()
  print(results)

  query1 = ("SELECT section.sectionNum FROM section INNER JOIN catalog ON section.catalog_idcatalog = catalog.idcatalog where catalog.coursename = %s")

  cursor.execute(query1, (course))
  connection.commit()
  results1 = cursor.fetchall()
  print(results1)

  connection.close()

  if (results == None) or (results1 == None):
    return None

  print("results")
  print(type(results))
  print(results)

  
  sr = json.dumps(results)
  sr2 = json.dumps(results1)
  print("sr")
  print(type(sr))
  #su = int ( ''.join(filter(str.isdigit, q) ) )
  subarr = re.findall(r'\d+', sr)
  secarr = re.findall(r'\d+', sr2)

  print("sumarr")
  print(type(subarr))
  print(subarr)

  conv = [int(x) for x in subarr]
  conv2 = [int(x) for x in secarr]

  if (len(conv2) != 0):
    fsec = conv2[0]
    strsec =  str(fsec)
    subtract = conv[1] - conv[0]
  else:
    return None

  s1 = "This section "
  s2 = " for " 
  s22 = " has "
  s3 = " seats left, meaning that you can still enroll in it. (#6)" 
  s4 = " has zero seats left, meaning that you cannot enroll in it. (#6)"
  sub2 = str(subtract)
  
  if (subtract > 0):
    finalresponse = s1 + strsec + s2 + course + s22 + sub2 + s3
  elif (subtract <= 0):
    finalresponse = s1 + strsec + s2 + course + s4

  print(finalresponse)

  return finalresponse

def exceedUnits(student, course):
  
  results = None
  results1 = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT unitsPending FROM enrolled_class INNER JOIN student ON enrolled_class.student_id = student.idstudent WHERE enrolled_class.isEnroll = 1 AND student.name = %s")

  cursor.execute(query, (student))
  connection.commit()
  results = cursor.fetchall()
  print("results")
  print(results)

  query1 = (
   "SELECT units FROM course WHERE course_name =%s ORDER BY course_name ASC, units DESC")

  cursor.execute(query1, (course))
  connection.commit()
  results1 = cursor.fetchone()
  print("results1")
  print(results1)
  
  connection.close()

  print(type(results))
  print(type(results1))
  
  if (results == None or results1 == None):
    print("exceedunits none returned")
    return None

  print("results")
  print(results)
  
  sr = json.dumps(results)
  sr1 = json.dumps(results1)
  print("sr")
  print(type(sr))
  sumarr = re.findall(r'\d+', sr)
  unitsarr = re.findall(r'\d+', sr1)

  print("sumarr")
  print(type(sumarr))
  print(sumarr)

  conv = [int(x) for x in sumarr]
  conv2 = [int(x) for x in unitsarr]
  
  sum1 = sum(conv)
  usum = sum(conv2)

  finalsum = sum1 + usum

  s1 = "The student "
  s2 = " would have a total of " 
  s3 = " units if this class is added, meaning that the course "
  s4 = " may be added to their schedule. (#7)"
  s5 = " can not be added to their schedule because it exceeds 18 units. (#7)"
  sum2 = str(finalsum)
  
  if (finalsum < 18):
    finalresponse = s1 + student + s2 + sum2 + s3 + course + s4
  elif ( sum1 <= 18):
    finalresponse = s1 + student + s2 + sum2 + s3 + course + s5

  return finalresponse

def enrollSeating(student, course):

  wl = 1
  print("enrollseating function")
  finalresponse = None
  stringcheck = checkSeats(course)
  print("checkseats output")
  print(stringcheck)
  
  if (stringcheck == None):
    print("enrollseating none")
    return None
    
  if (stringcheck.find('zero') != -1):
    wl = 0
    response = " may not enroll in this course because there are no seats left in this section for "
  elif (stringcheck.find('zero') == -1):
    response = " can possibly enroll in this course because there are still seats left in this section for "
  else:
    return finalresponse

  adding = " (#1, #8, #9))"
  space = "\n\n"
  if wl == 0:
    wlc = waitlistCheck(course)
    finalresponse = student + response + course + space + wlc + adding
  else:
    finalresponse = student + response + course + adding

  print("enrollseating response")
  print(finalresponse)

  return finalresponse

# THIS IS TO FIND QUERY FOR WAITLIST
def waitlistCheck(course):
  w = "There is still space on the waitlist with "
  w1 = " seats left, therefore the student may be placed on the waitlist. (#9)"
  nw = "Also, there is no space on the waitlist with a max capacity of 5 seats, therefore the student may not be placed on the waitlist. (#9)"

  results = None
  connection = connect()
  cursor = connection.cursor()

  query = ("SELECT placement, TotalPlacement FROM waitlist INNER JOIN course ON waitlist.courseid = course.idcourse WHERE course.course_name =%s")

  cursor.execute(query, course)
  connection.commit()
  results = cursor.fetchall()
  print("results")
  print(results)
  
  g = json.dumps(results)
  wl = [int(s) for s in re.findall(r'\b\d+\b', g)]
  sub = wl[1] - wl[0]

  sub1 = str(sub)
  print(sub)
  finalres = None
  if sub == 0:
    finalres = nw
    print("sub 0")
  else :
    finalres = w + sub1 + w1
    print("sub yes")

  print("Sub none")
    
  return finalres

def enrollPay(student, course):

  response = None
  print("enrollpay function")
  sc = checkPay(student)
  sc2 = findUnits(course)

  if (sc == None or sc2 == None):
    print("enrollpay none")
    return None
      
  stringcheck = json.dumps(sc)
  print("enrollpay1")
  chck = "[ Pass ] "
  r1 = " may not enroll in "
  r11 = " can possibly enroll in "
  r2 = " this course because their payment status is not in good standing. (#4)"
  r3 = " this course because their payment status is in good standing. (#4)"
  finds = "Good"
  
  print("enrollpay2")
  print(stringcheck)
  if (stringcheck.find(finds) != -1):
    response = student + r11 + course + r3
  elif (stringcheck.find(finds) == -1):
    response = student + r1 + course + r2
  else:
    return response

  print("enrollpay3")
    
  print(response)

  return response

def finalcheck(msg):

  finds = "not"
  if (msg.find(finds) != -1):
    response = "**Because the student and course inputted does not pass all criteria check, this section can not be enrolled nor placed in the schedule.** (#16)"
  elif (msg.find(finds) == -1):
     response = "**Because the student and course inputted passes all criteria check, this section will be successfully updated in the schedule when they are fully enrolled.** (#16)"
    
  return response

def checkRepeat(student, course):

  results = None
  finalresponse = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT grade FROM classHistory INNER JOIN student ON classHistory.idclassHistory = student.classHistory_idclassHistory INNER JOIN course ON classHistory.courseid = course.idcourse WHERE course_name = %s AND student.name = %s")

  cursor.execute(query, (course, student))
  connection.commit()
  results = cursor.fetchall()
  connection.close()

  if type(results) == tuple:
    return "Class isn't repeated, therefore is eligible to be taken. (#5)"
  else:
    print("Not None")

  for i in range(0, len(results)):
     print(results[i])
     print(" + ")

  print(results[0])

  g = json.dumps(results)

  grade = g[12]
  print("length: ")
  print(len(g))

  print("grade")
  print(grade)

  s1 = " has already passed the class with a "
  s2 = ", therefore, they can not enroll in this class again. (#5)"
  s3 = " has a grade of"
  s4 = ", therefore, they are eligible to retake this class. (#5)"
  if (grade == 'A' or grade == 'B' or grade == 'C'):
    finalresponse = student + s1 + grade + s2
  elif (grade == 'D' or grade == 'F'):
    finalresponse = student + s3 + grade + s4

  return finalresponse

def completed(course, name):
  results = None
  connection = connect()
  cursor = connection.cursor()
  finalresponse = None

  query = (
   "SELECT course_name FROM course INNER JOIN classHistory ON course.idcourse = classHistory.courseid INNER JOIN stuent_has_classhistory ON classHistory.idclassHistory = stuent_has_classhistory.classhistory_id INNER JOIN student ON stuent_has_classhistory.student_id = student.idstudent WHERE course.course_name = %s AND student.name = %s")

  cursor.execute(query, (course, name))
  connection.commit()
  results = cursor.fetchone()
  print(results)
  connection.close()

  print(type(results))
  
  s = "The class "
  s1 = " is not found in the class history of " 
  s2 = ", therefore it shall not be marked as complete. (#10)"
  s3 = " has been found within the class history of "
  s4 = ", therefore, it can be marked as completed. (#10)"
  if results == None or type(results) == None:
    finalresponse = s + course + s1 + name + s2
  elif type(results) == dict:
    finalresponse = s + course + s3 + name + s4
  
  return finalresponse

def checkTime(name, course):

  results = None
  results1 = None
  connection = connect()
  cursor = connection.cursor()

  query = (
   "SELECT time FROM `section` INNER JOIN course ON section.catalog_idcatalog = course.idcourse WHERE course.course_name = %s")

  cursor.execute(query, (course))
  connection.commit()
  results1 = cursor.fetchall()
  print(results1)

  query1 = (
   "SELECT time FROM `section` INNER JOIN enrolled_class ON section.catalog_idcatalog = enrolled_class.idcatalog INNER JOIN student ON enrolled_class.student_id = student.idstudent WHERE student.name = %s")

  cursor.execute(query1, (name))
  connection.commit()
  results = cursor.fetchall()
  print(results)
  
  connection.close()
  
  if (type(results) == None or type(results1) == None):
    print("None here")
    return None
  
  sr = json.dumps(results)
  sr2 = json.dumps(results1)
  print("sr2")
  print(sr2)

  atime = re.findall(r'\d+', sr)
  stime = re.findall(r'\d+', sr2)

  print(atime)
  print("stime")
  print(stime)

  check = 1
  conv = [int(x) for x in atime]
  conv2 = [int(x) for x in stime]

  if(len(conv2) == 0):
    return None
    
  print(conv)
  print("conv2")
  print(conv2)

  i = conv2[0]
  print("here is i")
  print(i)

 
  for x in conv:
    if (i == x):
      print("Found conflict:")
      print(x)
      check = 0

  stringt = str(i)

  s = "The course "
  s1 = " has a conflicting time with another course sharing the same time of "
  s2 = ":00, therefore, the student "
  s3 = " can not enroll in this class. Another reason could be that the student already has this class on their schedule. (#13)"
  s4 = " doesn't have a conflicting time with other courses. (#13)"
  
  if (check == 0):
    finalresponse = s + course + s1 + stringt + s2 + name + s3
    print("choice 1")
  elif ( check == 1):
    finalresponse = s + course + s4
    print("choice2")

  print(finalresponse)

  return finalresponse