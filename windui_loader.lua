-- WindUI Fishing Hub Script
-- Comprehensive fishing automation with WindUI interface
-- Based on STREE HUB design

-- Try multiple WindUI sources
local WindUISources = {
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua",
    "https://raw.githubusercontent.com/Footagesus/WindUI/releases/latest/download/main.lua",
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua"
}

local success, WindUI = false, nil

for i, source in ipairs(WindUISources) do
    print("🔄 Trying WindUI source " .. i .. ": " .. source)
    success, WindUI = pcall(function()
        return loadstring(game:HttpGet(source))()
    end)
    
    if success and WindUI then
        print("✅ WindUI loaded successfully from source " .. i)
        break
    else
        print("❌ Failed to load from source " .. i)
    end
end

if not success or not WindUI then
    warn("⚠️ UI failed to load!")
    print("Error details:", success, WindUI)
    return
else
    print("✓ UI loaded successfully!")
    print("WindUI type:", type(WindUI))
end

local Window = WindUI:CreateWindow({
    Title = "FISHING HUB",
    Icon = "rbxassetid://4483362458",
    Author = "Enhanced Scripts | Auto Fishing",
    Folder = "FISHING_HUB",
    Size = UDim2.fromOffset(260, 290),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
    HasOutline = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            WindUI:SetTheme("Dark")
        end,
    },
})

Window:Tag({
    Title = "v1.0.0",
    Color = Color3.fromRGB(0, 255, 0),
    Radius = 17,
})

Window:Tag({
    Title = "Auto Fishing",
    Color = Color3.fromRGB(0, 150, 255),
    Radius = 17,
})

WindUI:Notify({
    Title = "FISHING HUB Loaded",
    Content = "Auto fishing hub loaded successfully!",
    Duration = 3,
    Icon = "bell",
})

local Tab1 = Window:Tab({
    Title = "Info",
    Icon = "info",
})

local Section = Tab1:Section({
    Title = "Community Support",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab1:Button({
    Title = "Discord",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/example")
        end
    end
})

Tab1:Button({
    Title = "GitHub",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://github.com/enhanced-scripts")
        end
    end
})

local Section = Tab1:Section({
    Title = "Auto Fishing Features: Instant Fish, Auto Equip, Auto Sell, Teleport, and more!",
    TextXAlignment = "Left",
    TextSize = 17,
})

local Tab2 = Window:Tab({
    Title = "Players",
    Icon = "user",
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

_G.CustomJumpPower = 50

local Input = Tab2:Input({
    Title = "WalkSpeed",
    Desc = "Minimum 16 speed",
    Value = "16",
    InputIcon = "bird",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(input)
        local speed = tonumber(input)
        if speed and speed >= 16 then
            Humanoid.WalkSpeed = speed
            print("WalkSpeed set to: " .. speed)
        else
            Humanoid.WalkSpeed = 16
            print("⚠️ Invalid input, set to default (16)")
        end
    end
})

local Input = Tab2:Input({
    Title = "Jump Power",
    Desc = "Minimum 50 jump",
    Value = "50",
    InputIcon = "bird",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(input)
        local value = tonumber(input)
        if value and value >= 50 then
            _G.CustomJumpPower = value
            local humanoid = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.UseJumpPower = true
                humanoid.JumpPower = value
            end
            print("Jump Power set to: " .. value)
        else
            warn("⚠️ Must be number and minimum 50!")
        end
    end
})

local Button = Tab2:Button({
    Title = "Reset Jump Power",
    Desc = "Return Jump Power to normal (50)",
    Callback = function()
        _G.CustomJumpPower = 50
        local humanoid = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = 50
        end
        print("🔄 Jump Power reset to 50")
    end
})

Player.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.UseJumpPower = true
    humanoid.JumpPower = _G.CustomJumpPower or 50
end)

Tab2:Button({
    Title = "Reset Speed",
    Desc = "Return speed to normal (16)",
    Callback = function()
        Humanoid.WalkSpeed = 16
        print("WalkSpeed reset to default (16)")
    end
})

local UserInputService = game:GetService("UserInputService")

local Toggle = Tab2:Toggle({
    Title = "Infinite Jump",
    Desc = "activate to use infinite jump",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        _G.InfiniteJump = state
        if state then
            print("✅ Infinite Jump Active")
        else
            print("❌ Infinite Jump Inactive")
        end
    end
})

UserInputService.JumpRequest:Connect(function()
    if _G.InfiniteJump then
        local character = Player.Character or Player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local Toggle = Tab2:Toggle({
    Title = "Noclip",
    Desc = "Walk through walls",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        _G.Noclip = state
        task.spawn(function()
            local Player = game:GetService("Players").LocalPlayer
            while _G.Noclip do
                task.wait(0.1)
                if Player.Character then
                    for _, part in pairs(Player.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide == true then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end)
    end
})

local Tab3 = Window:Tab({
    Title = "Main",
    Icon = "landmark",
})

local Section = Tab3:Section({
    Title = "Auto Fishing",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab3:Toggle({
    Title = "Auto Equip Rod",
    Desc = "Selalu equip pancing otomatis",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(value)
        _G.AutoEquipRod = value
    end
})

local player = game.Players.LocalPlayer

spawn(function()
    while task.wait(1) do
        if _G.AutoEquipRod then
            pcall(function()
                local backpack = player:FindFirstChild("Backpack")
                if backpack then
                    local rod = backpack:FindFirstChild("Rod")
                        or backpack:FindFirstChild("FishingRod")
                        or backpack:FindFirstChild("OldRod")
                        or backpack:FindFirstChild("BasicRod")
                    if rod and not player.Character:FindFirstChild(rod.Name) then
                        player.Character.Humanoid:EquipTool(rod)
                    end
                end
            end)
        end
    end
end)

local player = game.Players.LocalPlayer
local RepStorage = game:GetService("ReplicatedStorage")
local net = RepStorage.Packages._Index["sleitnick_net@0.2.0"].net

_G.AutoFishing = false
_G.Delay = 0
_G.MaxSpeed = true

Tab3:Toggle({
    Title = "Auto Instant Fishing",
    Desc = "Automic Instant Fishing",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(value)
        _G.AutoFishing = value
        print("Auto Fishing: " .. tostring(value))
    end
})

local Input = Tab3:Input({
    Title = "Blast Delay",
    Desc = "Enter delay in seconds",
    Value = "",
    InputIcon = false,
    Type = "Input",
    Placeholder = "Enter delay...",
    Callback = function(input)
        local newDelay = tonumber(input)
        if newDelay and newDelay >= 0 then
            _G.Delay = newDelay
            print("Delay diubah menjadi: " .. _G.Delay .. " detik")
            _G.MaxSpeed = (newDelay == 0)
        else
            print("Input invalid, gunakan angka >= 0")
        end
    end
})

local function InstantFish()
    local char = player.Character or player.CharacterAdded:Wait()
    if char:FindFirstChild("!!!FISHING_VIEW_MODEL!!!") then
        net["RE/EquipToolFromHotbar"]:FireServer(1)
    end
    net["RF/ChargeFishingRod"]:InvokeServer(2)
    net["RF/RequestFishingMinigameStarted"]:InvokeServer(1, 1)
    net["RE/FishingCompleted"]:FireServer()
end

spawn(function()
    while wait() do
        if _G.AutoFishing and _G.MaxSpeed then
            while _G.AutoFishing do
                InstantFish()
                task.wait(0)
            end
        elseif _G.AutoFishing then
            InstantFish()
            if _G.Delay > 0 then
                wait(_G.Delay)
            end
        end
    end
end)

player.CharacterAdded:Connect(function(char)
    if _G.AutoFishing then
        InstantFish()
    end
end)

local RunService = game:GetService("RunService")    
local Workspace = game:GetService("Workspace")    
local VirtualInputManager = game:GetService("VirtualInputManager")    
local ReplicatedStorage = game:GetService("ReplicatedStorage")    
local camera = Workspace.CurrentCamera    
    
local REEquipToolFromHotbar = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/EquipToolFromHotbar"]    
local REFishingCompleted = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/FishingCompleted"]

local autoHoldEnabled = false
Toggle = Tab3:Toggle({
    Title = "Auto Fishing V2",
    Desc = "Automatic Auto Fishing with mouse simulation",
    Value = false,
    Callback = function(state)
        autoHoldEnabled = state
        if state then
            WindUI:Notify({
                Title = "Auto Fishing V2",
                Content = "Enabled",
                Duration = 3
            })
            task.spawn(function()
                local holdDuration = 0.4
                local loopDelay = 0.2
                while autoHoldEnabled do
                    pcall(function()
                        REEquipToolFromHotbar:FireServer(1)
                        local clickX = 5
                        local clickY = camera.ViewportSize.Y - 5
                        VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, true, game, 0)
                        task.wait(holdDuration)
                        VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, false, game, 0)
                    end)
                    task.wait(loopDelay)
                    RunService.Heartbeat:Wait()
                end
            end)
        else
            WindUI:Notify({
                Title = "Auto Fishing V2",
                Content = "Disabled",
                Duration = 3
            })
        end
    end
})

local Toggle = Tab3:Toggle({    
    Title = "Auto Sell",    
    Desc = "Automatic fish sales",    
    Icon = false,    
    Type = false,    
    Default = false,    
    Callback = function(state)    
        _G.AutoSell = state    
        task.spawn(function()    
            while _G.AutoSell do    
                task.wait(0.5)    
                local rs = game:GetService("ReplicatedStorage")    
                for _, v in pairs(rs:GetDescendants()) do    
                    if v:IsA("RemoteEvent") and v.Name:lower():find("sell") then    
                        v:FireServer()    
                    elseif v:IsA("RemoteFunction") and v.Name:lower():find("sell") then    
                        pcall(function()    
                            v:InvokeServer()    
                        end)    
                    end    
                end    
            end    
        end)    
    end    
})    
    
local Section = Tab3:Section({     
    Title = "Other",    
    TextXAlignment = "Left",    
    TextSize = 17,    
})

local autoInstantFishEnabled = true
local delayTime = 0.1

local function startAutoFish()
    task.spawn(function()
        while autoInstantFishEnabled do
            pcall(function()
                REFishingCompleted:FireServer()
            end)
            task.wait(delayTime)
        end)
    end)
end

Toggle = Tab3:Toggle({
    Title = "Auto Instant complete Fishing",
    Desc = "Instant Fishing (It is mandatory to turn it on if you want to use Auto Fishing V2)",
    Value = autoInstantFishEnabled,
    Callback = function(state)
        autoInstantFishEnabled = state
        if state then
            WindUI:Notify({
                Title = "Auto Instant Fish",
                Content = "Enabled (Delay: " .. delayTime .. "s)",
                Duration = 3
            })
            startAutoFish()
        else
            WindUI:Notify({
                Title = "Auto Instant Fish",
                Content = "Disabled",
                Duration = 3
            })
        end
    end
})
    
local Toggle = Tab3:Toggle({    
    Title = "Instant Catch",    
    Desc = "Get fish straight away",    
    Icon = false,    
    Type = false,    
    Default = false,    
    Callback = function(state)    
        _G.InstantCatch = state    
        if state then    
            print("✅ Instant Catch ON")    
        else    
            print("❌ Instant Catch OFF")    
        end    
    end    
})    

local Tab4 = Window:Tab({
    Title = "Shop",
    Icon = "badge-dollar-sign",
})

Tab4:Section({   
    Title = "Buy Rod",  
    TextXAlignment = "Left",  
    TextSize = 17,  
})  

local ReplicatedStorage = game:GetService("ReplicatedStorage")  
local RFPurchaseFishingRod = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseFishingRod"]  

local rods = {  
    ["Luck Rod"] = 79,  
    ["Carbon Rod"] = 76,  
    ["Grass Rod"] = 85,  
    ["Demascus Rod"] = 77,  
    ["Ice Rod"] = 78,  
    ["Lucky Rod"] = 4,  
    ["Midnight Rod"] = 80,  
    ["Steampunk Rod"] = 6,  
    ["Chrome Rod"] = 7,  
    ["Astral Rod"] = 5,  
    ["Ares Rod"] = 126,  
    ["Angler Rod"] = 168,
    ["Bamboo Rod"] = 258
}  

local rodNames = {  
    "Luck Rod (350 Coins)", "Carbon Rod (900 Coins)", "Grass Rod (1.5k Coins)", "Demascus Rod (3k Coins)",  
    "Ice Rod (5k Coins)", "Lucky Rod (15k Coins)", "Midnight Rod (50k Coins)", "Steampunk Rod (215k Coins)",  
    "Chrome Rod (437k Coins)", "Astral Rod (1M Coins)", "Ares Rod (3M Coins)", "Angler Rod (8M Coins)",
    "Bamboo Rod (12M Coins)"
}  

local rodKeyMap = {  
    ["Luck Rod (350 Coins)"]="Luck Rod",  
    ["Carbon Rod (900 Coins)"]="Carbon Rod",  
    ["Grass Rod (1.5k Coins)"]="Grass Rod",  
    ["Demascus Rod (3k Coins)"]="Demascus Rod",  
    ["Ice Rod (5k Coins)"]="Ice Rod",  
    ["Lucky Rod (15k Coins)"]="Lucky Rod",  
    ["Midnight Rod (50k Coins)"]="Midnight Rod",  
    ["Steampunk Rod (215k Coins)"]="Steampunk Rod",  
    ["Chrome Rod (437k Coins)"]="Chrome Rod",  
    ["Astral Rod (1M Coins)"]="Astral Rod",  
    ["Ares Rod (3M Coins)"]="Ares Rod",  
    ["Angler Rod (8M Coins)"]="Angler Rod",
    ["Bamboo Rod (12M Coins)"]="Bamboo Rod"
}  

local selectedRod = rodNames[1]  

Tab4:Dropdown({  
    Title = "Select Rod",  
    Values = rodNames,  
    Value = selectedRod,  
    Callback = function(value)  
        selectedRod = value
    end  
})  

Tab4:Button({  
    Title="Buy Rod",  
    Callback=function()  
        local key = rodKeyMap[selectedRod]  
        if key and rods[key] then  
            local success, err = pcall(function()  
                RFPurchaseFishingRod:InvokeServer(rods[key])  
            end)  
            if success then  
                WindUI:Notify({Title="Rod Purchase", Content="Purchased "..selectedRod, Duration=3})  
            else  
                WindUI:Notify({Title="Rod Purchase Error", Content=tostring(err), Duration=5})  
            end  
        end  
    end  
})

local Section = Tab4:Section({
    Title = "Buy Baits",
    TextXAlignment = "Left",
    TextSize = 17,
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")  
local RFPurchaseBait = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseBait"]  

local baits = {  
    ["Luck Bait"] = 1000,  
    ["Midnight Bait"] = 3000,  
    ["Nature Bait"] = 83500,  
    ["Chroma Bait"] = 290000,  
    ["Dark Matter Bait"] = 630000,  
    ["Corrupt Bait"] = 1150000,  
    ["Aether Bait"] = 3700000,  
    ["Floral Bait"] = 4000000  
}  

local baitNames = {  
    "Luck Bait (1k Coins)", "Midnight Bait (3k Coins)", "Nature Bait (83.5k Coins)",  
    "Chroma Bait (290k Coins)", "Dark Matter Bait (630k Coins)", "Corrupt Bait (1.15M Coins)",  
    "Aether Bait (3.7M Coins)", "Floral Bait (4M Coins)"  
}  

local baitKeyMap = {  
    ["Luck Bait (1k Coins)"] = "Luck Bait",  
    ["Midnight Bait (3k Coins)"] = "Midnight Bait",  
    ["Nature Bait (83.5k Coins)"] = "Nature Bait",  
    ["Chroma Bait (290k Coins)"] = "Chroma Bait",  
    ["Dark Matter Bait (630k Coins)"] = "Dark Matter Bait",  
    ["Corrupt Bait (1.15M Coins)"] = "Corrupt Bait",  
    ["Aether Bait (3.7M Coins)"] = "Aether Bait",  
    ["Floral Bait (4M Coins)"] = "Floral Bait"  
}  

local selectedBait = baitNames[1]  

Tab4:Dropdown({  
    Title = "Select Bait",  
    Values = baitNames,  
    Value = selectedBait,  
    Callback = function(value)  
        selectedBait = value  
    end  
})  

Tab4:Button({  
    Title = "Buy Bait",  
    Callback = function()  
        local key = baitKeyMap[selectedBait]  
        if key and baits[key] then  
            local success, err = pcall(function()  
                RFPurchaseBait:InvokeServer(baits[key])  
            end)  
            if success then  
                WindUI:Notify({Title = "Bait Purchase", Content = "Purchased " .. selectedBait, Duration = 3})  
            else  
                WindUI:Notify({Title = "Bait Purchase Error", Content = tostring(err), Duration = 5})  
            end  
        end  
    end  
})

local Tab5 = Window:Tab({
    Title = "Teleport",
    Icon = "map-pin",
})

local Section = Tab5:Section({ 
    Title = "Island",
    TextXAlignment = "Left",
    TextSize = 17,
})

local IslandLocations = {
    ["Ancient Junggle"] = Vector3.new(1252,7,-153),
    ["Coral Refs"] = Vector3.new(-2855, 47, 1996),
    ["Enchant Room"] = Vector3.new(3221, -1303, 1406),
    ["Esoteric Island"] = Vector3.new(1990, 5, 1398),
    ["Konoha"] = Vector3.new(-603, 3, 719),
    ["Treasure Room"] = Vector3.new(-3600, -267, -1575),
    ["Tropical Grove"] = Vector3.new(-2091, 6, 3703),
    ["Weather Machine"] = Vector3.new(-1508, 6, 1895),
}

local SelectedIsland = nil

local IslandDropdown = Tab5:Dropdown({
    Title = "Select Island",
    Values = (function()
        local keys = {}
        for name in pairs(IslandLocations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        SelectedIsland = Value
    end
})

Tab5:Button({
    Title = "Teleport to Island",
    Callback = function()
        if SelectedIsland and IslandLocations[SelectedIsland] and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(IslandLocations[SelectedIsland])
        end
    end
})

local Section = Tab5:Section({ 
    Title = "Fishing Spot",
    TextXAlignment = "Left",
    TextSize = 17,
})

local FishingLocations = {
    ["Coral Refs"] = Vector3.new(-2855, 47, 1996),
    ["Konoha"] = Vector3.new(-603, 3, 719),
    ["Levers 1"] = Vector3.new(1475,4,-847),
    ["Levers 2"] = Vector3.new(882,5,-321),
    ["levers 3"] = Vector3.new(1425,6,126),
    ["levers 4"] = Vector3.new(1837,4,-309),
    ["Sacred Temple"] = Vector3.new(1475,-22,-632),
    ["Spawn"] = Vector3.new(33, 9, 2810),
    ["Sysyphus Statue"] = Vector3.new(-3693,-136,-1045),
    ["Underground Cellar"] = Vector3.new(2135,-92,-695),
    ["Volcano"] = Vector3.new(-632, 55, 197),
}

local SelectedFishing = nil

local FishingDropdown = Tab5:Dropdown({
    Title = "Select Spot",
    Values = (function()
        local keys = {}
        for name in pairs(FishingLocations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        SelectedFishing = Value
    end
})

Tab5:Button({
    Title = "Teleport to Fishing Spot",
    Callback = function()
        if SelectedFishing and FishingLocations[SelectedFishing] and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(FishingLocations[SelectedFishing])
        end
    end
})

local Tab6 = Window:Tab({
    Title = "Settings",
    Icon = "settings",
})

local Toggle = Tab6:Toggle({
    Title = "AntiAFK",
    Desc = "Prevent Roblox from kicking you when idle",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        _G.AntiAFK = state
        local VirtualUser = game:GetService("VirtualUser")

        if state then
            task.spawn(function()
                while _G.AntiAFK do
                    task.wait(60)
                    pcall(function()
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    end)
                end
            end)

            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "AntiAFK loaded!",
                Text = "Coded By Enhanced Scripts",
                Button1 = "Okey",
                Duration = 5
            })
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "AntiAFK Disabled",
                Text = "Stopped AntiAFK",
                Duration = 3
            })
        end
    end
})

local Toggle = Tab6:Toggle({
    Title = "Auto Reconnect",
    Desc = "Automatic reconnect if disconnected",
    Icon = false,
    Default = false,
    Callback = function(state)
        _G.AutoReconnect = state
        if state then
            task.spawn(function()
                while _G.AutoReconnect do
                    task.wait(2)

                    local reconnectUI = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")
                    if reconnectUI then
                        local prompt = reconnectUI:FindFirstChild("promptOverlay")
                        if prompt then
                            local button = prompt:FindFirstChild("ButtonPrimary")
                            if button and button.Visible then
                                firesignal(button.MouseButton1Click)
                            end
                        end
                    end
                end
            end)
        end
    end
})

local Section = Tab6:Section({ 
    Title = "Server",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab6:Button({
    Title = "Rejoin Server",
    Desc = "Reconnect to current server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

Tab6:Button({
    Title = "Server Hop",
    Desc = "Switch to another server",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        
        local function GetServers()
            local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100"
            local response = HttpService:JSONDecode(game:HttpGet(url))
            return response.data
        end

        local function FindBestServer(servers)
            for _, server in ipairs(servers) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    return server.id
                end
            end
            return nil
        end

        local servers = GetServers()
        local serverId = FindBestServer(servers)

        if serverId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId, game.Players.LocalPlayer)
        else
            warn("⚠️ No suitable server found!")
        end
    end
})

Player.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.UseJumpPower = true
    humanoid.JumpPower = _G.CustomJumpPower or 50
end)

print("🎣 WindUI Fishing Hub loaded successfully!")
