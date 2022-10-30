widget = nil
local battery_id = nil

for i=0,10 do
    local st = io.open('/sys/class/power_supply/BAT' .. i)

    if st then
        battery_id = i
        break
    end
end

if battery_id ~= nil then
    widget = luastatus.require_plugin('battery-linux').widget{
        period = 2,
        dev = 'BAT' .. battery_id,
        cb = function(t)
            local symbol = ({
                Charging    = '↑',
                Discharging = '↓',
            })[t.status] or ' '
            local rem_seg
            if t.rem_time then
                local h = math.floor(t.rem_time)
                local m = math.floor(60 * (t.rem_time - h))
                rem_seg = {full_text = string.format('%2dh %02dm', h, m), color = '#595959'}
            end
            return {
                {full_text = string.format('%3d%%%s', t.capacity, symbol)},
                rem_seg,
            }
        end,
    }
else
    widget = {
        plugin = 'timer',
        opts = {},
        cb = function()
            return {
                full_text = 'AC',
                color = '#595959',
            }
        end,
        event = function(t) end,
}
end
