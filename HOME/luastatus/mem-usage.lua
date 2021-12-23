function to_gig(val)
    return val / 1024 / 1024
end

function to_proc(total, used)
    return used * 100 / total
end

widget = luastatus.require_plugin('mem-usage-linux').widget{
    timer_opts = {period = 2},
    cb = function(t)
        local used_kb = t.total.value - t.avail.value
        local used_p = to_proc(t.total.value, used_kb)
        local color = '#af8ec3'

        if used_p >= 90 then
            color = '#ff0000'
        elseif used_p >= 80 then
            color = '#eab93d'
        end

        return {
            full_text = string.format(
                '[%3.2f/%3.2f GiB %3.0f%%]',
                to_gig(t.total.value),
                to_gig(used_kb),
                used_p
            ),
            color = color
        }
    end,
}
