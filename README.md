# tempah

Tempah is a tiny templating module. It does simple replacement of `$variable` values in a string, with support for `|filters` to transform those values.

## Usage

`tempah(template: String, values: Map<String, String>, filters: Map<String, Function>): String`

## Example

```coffeescript
tempah = require 'tempah'
moment = require 'moment' # For the relative date example

template = "Hi there $name, what's on your $organ? Did you do that task from $date|relative?"

values = {
    name: "Joey"
    organ: "mind"
    date: "2018-04-05T14:48:00.000Z"
}

filters = {
    relative: (date) -> moment(date).fromNow()
}

console.log tempah template, values, filters
```

Result:

`"Hi there Joey, what's on your mind? Did you do that task from 2 months ago?"`
