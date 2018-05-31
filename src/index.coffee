module.exports = tempah = (template, values, filters) ->
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

    return templated
