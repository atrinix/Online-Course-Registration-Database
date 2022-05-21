# Online-Course-Registration-Database

A relational Database to store information in a school course regisration system.

Includes a Semantic Conceptual Model, ERD, and EER, forward engineereded using MySQL

**I implemented a discord bot in the python code, which can be interacted with in this Discord Server. 
However, the bot would need to be put online since it's not online 24/7**
Discord Server Link: https://discord.gg/yMP7uN5SP5

**Python Code can also be found here, which can be used to turn on the bot when ran.**
Replit: https://replit.com/join/vlklkaendi-ariraysfsu

**Online Course Management Discord Rules

“Enroll a student into the seating list only if seating capacity hasn’t been reached. #enroll (studentID), (CourseID)

“For each course, find the number of units.” #checkcourse (CourseID)

“For each course, find its degree fulfillments.” #checkcourse (CourseID)

“Enroll a student, only if their payment status is in good standing.” #enroll (studentID), (sectioniD)(CourseID)

“Do not enroll a student if they have already passed the selected class with a C or better.” #enroll (studentID), (CourseID)

“For each section, find the number of available seats.” #checkSection (CourseID)

“Do not enroll a student if they exceed 18 units.” #enroll (studentID), (CourseID)

Enroll a student on a Waitlist if seat capacity has been reached.” #enroll (studentID), (CourseID)

“Do not enroll a student into a section that has reached max capacity in both seats and waitlist.” #enroll (studentID), (CourseID)

“For each class finished by a student, mark it as complete.” #completed (studentID), (CourseID)

“Update automatically students eligible for a degree if all classes on their degreePathway have been completed.” #completed (studentID), (CourseID)

“For each student that enrolls in less than 12 units, notify financial aid to not give max aid.” #finishenrolling (studentID)

“Do not allow a student to enroll if the section they choose has a time which clashes with their other section times on their schedule.” #enroll (studentID), (CourseID)

“Find the number of units left needed to fulfill the graduation requirement.” #unitsleft (studentID)

“For each student, check if their payment status is in good standing.” #checkpaymentstatus (studentID)

“Update the schedule with the new section when that section is successfully enrolled.” #enroll (studentID(CourseID)

“Create a function that can return a list of courses from degreePathway with a degree passed as a parameter.” #degreepathway (degreeID)

“Update section list of students to add a student first in the queue in a waitlist if a space opens up in the section list.” #enroll (studentID), (CourseID)

degreeID = name of a degree 
studentID = name of a student 
courseID = name of a course

*Specific parameters listed in the server.*
