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
    ticketData = robot.brain.data.manager[ticket] ||= { people: [], updated_at: null }
    ticketData['people'].push msg.message.user.name
    ticketData['updated_at'] = new Date
    msg.reply "GOT IT"

  robot.respond /who is working on (\w+-\w+)/i, (msg) ->
    ticketNumber = msg.match[1]
    ticketData = robot.brain.data.manager[ticketNumber]
    if ticketData
      people = ticketData['people'][0..1]
      msg.reply "ticket #{ticketNumber} was last updated by #{people} at #{ticketData['updated_at'][0]}"
    else
      msg.reply "No one has updated that issue yet"
