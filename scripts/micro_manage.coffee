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
  robot.hear /i am working on \w+-\w+/i, (msg) ->
    # store it!
    msg.reply "GOT IT"

  robot.respond /who is working on \w+-\w+/i, (msg) ->
    #query redis brain
    msg.reply "zobar is working on it"
