tempah = require './src'
moment = require 'moment' # For the relative date example

template = """hi there $name, what's on your $organ? did you do that task from $date|relative?

no actually I didn't and I'm not $name.
"""

values = {
    name: "Joey"
    organ: "mind"
    date: "2018-04-05T14:48:00.000Z"
}

filters = {
    relative: (date) -> moment(date).fromNow()
}

console.log tempah template, values, filters, {correct_capitalization: true}

