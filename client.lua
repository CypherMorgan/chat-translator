local translateApiKey = 'YOUR_GOOGLE_TRANSLATE_API_KEY'
local playerLang = GetConvar('locale', 'en')

RegisterNetEvent('chat:translateMessage')
AddEventHandler('chat:translateMessage', function(playerName, message)
    TranslateMessage(message, playerLang, function(translatedText)
        TriggerEvent('chat:addMessage', {
            color = {255, 255, 255},
            multiline = true,
            args = {playerName, translatedText}
        })
    end)
end)

function TranslateMessage(text, targetLang, callback)
    PerformHttpRequest('https://translation.googleapis.com/language/translate/v2?key=' .. translateApiKey, function(statusCode, response, headers)
        if statusCode == 200 then
            local jsonResponse = json.decode(response)
            local translatedText = jsonResponse.data.translations[1].translatedText
            callback(translatedText)
        else
            print('Translation error: ' .. statusCode)
            callback(text)
        end
    end, 'POST', json.encode({
        q = text,
        target = targetLang,
        format = 'text'
    }), {['Content-Type'] = 'application/json'})
end
