months = {
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
}
widget = {
    plugin = 'timer',
    cb = function()
        local loc = os.date('*t')
        local gmt = os.date('!*t')
        return {
            {full_text = string.format('%d %s', loc.day, months[loc.month])},
            {full_text = string.format('%d:%02d', loc.hour, loc.min)},
            {full_text = string.format('%d:%02d', gmt.hour, gmt.min), color = '#9c9c9c'},
        }
    end,
}
