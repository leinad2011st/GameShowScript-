local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local MainEspManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/leinad2011st/doors-utilites/main/UNNAMEDDOORS/EspManager.lua"))()
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/leinad2011st/GameShowScript-/main/functions.lua"))

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()



local Esps = {}



function playSound(Id)
    local notif = Instance.new("Sound");
    notif.Parent = game.SoundService;
    notif.SoundId = "rbxassetid://"..tostring(Id);
    notif.Volume = 1;
    notif:Play();
    notif.Stopped:Wait();
    notif:Destroy()
end


function message(title, text, timee)
	task.spawn(function()
        playSound(4590657391)
	end)
	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "default"}
	)
end 



if game.PlaceId ~= 14123135692 then 
    print("NOT IN GAME SHOW")

    message("WRONG GAME", "you are not in gameshow")

    return
end


if getgenv().GameShowMainGUI==true then
    message("Gui Already Loaded")

    return
end 

pcall(function() getgenv().GameShowMainGUI = true end)


local flags = {
    --ESP
    PlayerEsp = false

}


local Window = Library:CreateWindow({
    Title = 'UNNAMED GameShow',
    Center = true,
    AutoShow = true,
    TabPadding = 8
})


local Tabs = {
    Main = Window:AddTab('Main'),
    Server = Window:AddTab('Server'),
    Visuals = Window:AddTab('Visuals'),
}


function MakeGroupBox(Name, Left,TabName)
    local GroupBOXXY

    if Left then
        GroupBOXXY = Tabs[TabName]:AddLeftGroupbox(Name)
    else
        GroupBOXXY = Tabs[TabName]:AddRightGroupbox(Name)
    end
    
    return GroupBOXXY
end


function initializeMain()
    
end

function initializeServer()
    
end

function AddEspTop(Name, Text, Left, INFO)
    local GroupBox = MakeGroupBox(Name,Left,"Visuals")
    GroupBox:AddToggle(Name,{
        Text = Text,
        Default = INFO["EspEnabled"],
        Tooltip = '',
        Callback = function(Value)
            if Value == true then 
                local ESPTable = {}

                ESPTable.EspText = INFO["EspText"]
                ESPTable.EspColor = INFO["EspColor"]

                Esps[Name] = ESPTable

            end
        end
    })
    return INFO
end

function initializeVisuals()
    local BallonEsp = AddEspTop("BallonEsp","BallonEsp",true,{["EspText"]="Ballon", ["EspColor"] = Color3.fromRGB(255,0,255), ["EspEnabled"] = false })

    spawn(function()
        while wait(0.5) do
            for x,i in pairs(game.Workspace:GetDescendants()) do 
                -- BALLON ESP
                if i.Name == "CommonBalloon" or i.Name == "ExplodingBalloon" or i.Name == "MysteryBalloon" or i.Name == "RareBalloon" or i.Name == "SuperRareBalloon" then 
                    Function:CreateEsp(i,BallonEsp)
                end
            end
        end
    end)

end

initializeVisuals()