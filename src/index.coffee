start_match = /^([a-z])/
newline_match = /\n([a-z])/g
sentence_match = /([\.!?>]\s*)([a-z])/g

correctCapitalization = (str) ->
    return str if not str.length
    str[0] = str[0].toUpperCase()
    str = str.replace start_match, (matched, letter) ->
        return letter.toUpperCase()
    str = str.replace newline_match, (matched, letter) ->
        return '\n' + letter.toUpperCase()
    str = str.replace sentence_match, (matched, punctuation, letter) ->
        return punctuation + letter.toUpperCase()
    return str

module.exports = tempah = (template, values, filters={}, options={}) ->
    variables = template.match /\$[a-zA-Z_]+(\|[a-zA-Z]+)?/g

    if not variables?.length
        return template

    templated = template.slice(0)
    for variable in variables
        [variable_name, filter_name] = variable.slice(1).split('|')
        value = values[variable_name]
        if not value?
            throw "No such value #{variable_name}"
        if filter_name?
            filter = filters[filter_name]
            if not filter?
                throw "No such filter #{filter_name}"
            value = filter(value)
        templated = templated.replace variable, value

    if options.correct_capitalization
        templated = correctCapitalization templated

    return templated
