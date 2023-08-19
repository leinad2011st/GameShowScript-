local Function = {}

local MainEspManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/leinad2011st/doors-utilites/main/UNNAMEDDOORS/EspManager.lua"))()

local Esps = {}


function Function:CreateEsp(Item, EspTable)
    if  EspTable.EspEnabled then
        EspManager:AddEsp(Item, EspTable.EspColor, EspTable.EspText, true)
    -- end  
end



-- function Function:ChangeEspColor(EspName)
--     if Esps[EspName] then
    
--     end
-- end


return Function