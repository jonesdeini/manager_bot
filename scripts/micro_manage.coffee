# Description
#   WHO IS WORKING ON WHAT????
#
# Dependencies:
#   None
#
# Commands:
#   hubot I am working on [A-z]-[A-z] - tell hubot what you're working on
#   hubot who is working on [A-z]-[A-z] - ask hubot who is working on a certain issue
#
# Author:
#   jonesdeini
#

module.exports = (robot) ->
  robot.brain.data.manager ||= {}

  robot.hear /i am working on (\w+-\w+)/i, (msg) ->
    ticket = msg.match[1]
    ticketData = robot.brain.data.manager[ticket] ||= {people: [], updated_at: null }
    ticketData[people] += msg.message.user.name
    ticketData[updated_at] = new Date
    msg.reply "GOT IT"

  robot.respond /who is working on (\w+-\w+)/i, (msg) ->
    ticketData = robot.brain.data.manager[msg.match[1]]
    if ticketData
      for i in ticketData
        msg.reply ticketData[people[i]]
    else
      msg.reply "zobar is working on it"
