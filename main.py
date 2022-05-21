#STARTER DISCORD CODE HERE PROVIDED BY JOSE ORTIZ
import os
import discord
import database as db

token = os.environ['DISCORD_TOKEN']
server = os.environ['DISCORD_GUILD']
server_id = os.environ['SERVER_ID']  # optional
channel_id = os.environ['CHANNEL_ID']  # optional

db_conn = db.connect()
client = discord.Client()


@client.event
async def on_ready():
    """
    This method triggers with the bot connects to the server
    Note that the sample implementation here only prints the
    welcome message on the IDE console, not on Discord
    :return: VOID
    """
    print("{} has joined the server".format(client.user.name))


@client.event
async def on_message(message):
    """
    This method triggers when a user sends a message in any of your Discord server channels
    :param message: the message from the user. Note that this message is passed automatically by the Discord API
    :return: VOID
    """
    response = None # will save the response from the bot
    if message.author == client.user:
        return # the message was sent by the bot
    if message.type is discord.MessageType.new_member:
        response = "Ayo Wassup {}".format(message.author) # a new member joined the server. Welcome him.
    else:
        # A message was send by the user.
        msg = message.content.lower()
        if "milestone3" in msg:
            response = "I am alive. Signed: 'your bot'"
        elif "#parameters" in msg:
            response = printParameters()
        elif "#help" in msg:
            response = printCommands()
        else:
          if ("#enroll" in msg):
            print("Hang tight! This is a hefty request and will take a few more seconds than usual, Results are now loading")
          try:
            response = db.response(msg)
          except:
            response = "Sorry, something went wrong."

        embed = discord.Embed(description=response)
        await message.channel.send(embed=embed)

def printParameters():
  pp = "**Command Parameters Help**\n\n*[studentid]* `Rick Sanchez`\n\n*[courseid]*`ENG100  |  ENG110  |  ENG160  |  ENG200  |  CSC220  |  CSC300  |  CSC317  |  CSC413`\n\n*[degreeid]*  `Computer Science  |  English`"
  return pp

def printCommands():
  pc = "**List of Commands help**\n`#enroll (studentID), (CourseID)`\n`#checkcourse (CourseID) `\n`#checkSection (sectioniD)`\n`#completed (studentID), (CourseID) `\n`#finishenrolling (studentID) `\n`#unitsleft (studentID)`\n`#checkpaymentstatus (studentID)`\n`#degreepathway (degreeID)`"
  return pc
  
try:
    # start the bot and keep the above methods listening for new events
  client.run(token)

except discord.errors.HTTPException:
    print("\n\nO COME ON NOT AGAIN, blocked and banned by discord.. AGAIN")

except:
    print("Bot is offline because your secret environment variables are not set. Head to the left panel, " +
          "find the lock icon, and set your environment variables. For more details, read the README file in your " +
          "milestone 3 repository")


  


  