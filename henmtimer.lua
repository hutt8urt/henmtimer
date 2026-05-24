addon.author   = 'toogood'
addon.name     = 'henm_timer'
addon.version  = '2.1'

require('common')
local imgui = require('imgui')

-------------------------------------------------
-- Timer State
-------------------------------------------------
local active = false
local interval = { 30 }
local next_cycle = 0

-------------------------------------------------
-- Message Buffer
-------------------------------------------------
local message = { 'ADDS' }

-------------------------------------------------
-- Countdown Warnings
-------------------------------------------------
local warnings = {
    [10] = false,
    [3]  = false,
    [2]  = false,
}

local function resetWarnings()

    warnings[10] = false
    warnings[3]  = false
    warnings[2]  = false
end

-------------------------------------------------
-- UI
-------------------------------------------------
ashita.events.register('d3d_present', 'henm_ui', function ()

    imgui.SetNextWindowSize(
        {260, 170},
        ImGuiCond_FirstUseEver
    )

    if (imgui.Begin('HENM Timer', true)) then

        -------------------------------------------------
        -- Timer Input
        -------------------------------------------------
        imgui.Text('Timer (seconds)')
        imgui.PushItemWidth(100)
        imgui.InputInt('##timer', interval)

        if (interval[1] < 1) then
            interval[1] = 1
        end

        -------------------------------------------------
        -- Message Input
        -------------------------------------------------
        imgui.Text('Message')
        imgui.PushItemWidth(180)
        imgui.InputText('##message', message, 64)

        -------------------------------------------------
        -- Start
        -------------------------------------------------
        if (imgui.Button('Start Timer', {115, 25})) then

            active = true
            next_cycle = os.clock() + interval[1]

            resetWarnings()

            print(string.format(
                '[HENM Timer] Started (%ds): %s',
                interval[1],
                message[1]
            ))
        end

        imgui.SameLine()

        -------------------------------------------------
        -- Stop
        -------------------------------------------------
        if (imgui.Button('Stop Timer', {115, 25})) then

            active = false

            print('[HENM Timer] Stopped.')
        end

        -------------------------------------------------
        -- Display
        -------------------------------------------------
        imgui.Spacing()
        imgui.Separator()

        if (active) then

            local remaining = math.max(
                0,
                math.floor(next_cycle - os.clock())
            )

            imgui.Text(string.format(
                'Next Add: %ds',
                remaining
            ))

        else

            imgui.Text('Timer Inactive')
        end
    end

    imgui.End()
end)

-------------------------------------------------
-- Timer Tick
-------------------------------------------------
ashita.events.register('d3d_present', 'henm_tick', function ()

    if (not active) then
        return
    end

    local now = os.clock()
    local remaining = math.floor(next_cycle - now)

    -------------------------------------------------
    -- Countdown Warnings
    -------------------------------------------------
    local countdowns = {10, 3, 2}

    for _, t in ipairs(countdowns) do

        if (remaining <= t and not warnings[t]) then

            warnings[t] = true

            AshitaCore:GetChatManager():QueueCommand(
                1,
                string.format(
                    '/p >>> %s IN %ds <<<',
                    message[1],
                    t
                )
            )
        end
    end

    -------------------------------------------------
    -- NOW
    -------------------------------------------------
    if (now >= next_cycle) then

        AshitaCore:GetChatManager():QueueCommand(
            1,
            string.format(
                '/p >>> %s NOW! <<<',
                message[1]
            )
        )

        next_cycle = now + interval[1]

        resetWarnings()
    end
end)