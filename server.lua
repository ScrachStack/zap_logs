local webhookUrl = "WEB_URL"
function checkWebhookUrl()
    if webhookUrl == nil or webhookUrl == "" then
        print("Error: Please set the WEB_URL variable in your script to use this resource.")
        return false
    end
    return true
end




function sendEmbedToDiscord(webhookUrl, title, description, footerText)
    local payload = {
        embeds = {{
            title = title,
            description = description,
            footer = {
                text = footerText
            }
        }}
    }

    PerformHttpRequest(webhookUrl, function(statusCode, response, headers)
        if statusCode == 204 then
            print("Embed sent to Discord successfully.")
        else
            print("Error sending embed to Discord. Status Code: " .. statusCode)
            print("Response: " .. response)
        end
    end, 'POST', json.encode(payload), { ['Content-Type'] = 'application/json' })
end

local footerText = "Made by discord.gg/cfxdev"

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local playerName = GetPlayerName(source)
    local playerSteam = GetPlayerIdentifier(source, 0) -- 0 corresponds to the player's Steam ID
    local playerLicense = GetPlayerIdentifier(source, 1) -- 1 corresponds to the player's license key
    local playerProfileLink = "https://steamcommunity.com/profiles/" .. playerSteam:gsub("steam:", "")
    
    local fields = {
        {
            name = "Steam ID",
            value = playerSteam,
            inline = true
        },
        {
            name = "License",
            value = playerLicense,
            inline = true
        }
    }

    local description = string.format("**%s** is connecting to the server.", playerName)
    local title = "Connect Log"
    
    sendEmbedToDiscord(webhookUrl, title, description, footerText, fields)
end)


AddEventHandler('playerDropped', function(Reason)
    local playerName = GetPlayerName(source)
    local description = string.format("**%s** has disconnected from the server.", playerName)
    local title = "Player Disconnect"
    
    sendEmbedToDiscord(webhookUrl, title, description, footerText)
end)
checkWebhookUrl()
