-- WindUI Loader for Roblox Player Names
-- Simple WindUI interface to get player names and execute external scripts

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- WindUI Library (Simplified)
local WindUI = {}
WindUI.__index = WindUI

function WindUI.new()
    local self = setmetatable({}, WindUI)
    self.connections = {}
    return self
end

-- Create main window
function WindUI:CreateWindow(title)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WindUILoader"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 450, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -225, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    -- Corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame
    
    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, -80, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = titleBar
    
    -- Close button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "×"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextScaled = true
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = titleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 4)
    closeCorner.Parent = closeButton
    
    -- Content area
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -60)
    contentFrame.Position = UDim2.new(0, 10, 0, 50)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    
-- WindUI Loader for Roblox Player Names
-- Simple WindUI interface to get player names and execute external scripts

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- WindUI Library (Simplified)
local WindUI = {}
WindUI.__index = WindUI

function WindUI.new()
    local self = setmetatable({}, WindUI)
    self.connections = {}
    return self
end

-- Create main window
function WindUI:CreateWindow(title)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WindUILoader"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 450, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -225, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    -- Corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame
    
    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, -80, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = titleBar
    
    -- Close button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "×"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextScaled = true
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = titleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 4)
    closeCorner.Parent = closeButton
    
    -- Content area
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -60)
    contentFrame.Position = UDim2.new(0, 10, 0, 50)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    
    -- Tab buttons
    local tabFrame = Instance.new("Frame")
    tabFrame.Name = "TabFrame"
    tabFrame.Size = UDim2.new(1, 0, 0, 30)
    tabFrame.Position = UDim2.new(0, 0, 0, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Parent = contentFrame
    
    local playersTab = Instance.new("TextButton")
    playersTab.Name = "PlayersTab"
    playersTab.Size = UDim2.new(0.5, -5, 1, 0)
    playersTab.Position = UDim2.new(0, 0, 0, 0)
    playersTab.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    playersTab.BorderSizePixel = 0
    playersTab.Text = "Players"
    playersTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    playersTab.TextScaled = true
    playersTab.Font = Enum.Font.GothamBold
    playersTab.Parent = tabFrame
    
    local executorTab = Instance.new("TextButton")
    executorTab.Name = "ExecutorTab"
    executorTab.Size = UDim2.new(0.5, -5, 1, 0)
    executorTab.Position = UDim2.new(0.5, 5, 0, 0)
    executorTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    executorTab.BorderSizePixel = 0
    executorTab.Text = "Executor"
    executorTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    executorTab.TextScaled = true
    executorTab.Font = Enum.Font.GothamBold
    executorTab.Parent = tabFrame
    
    local tabCorner1 = Instance.new("UICorner")
    tabCorner1.CornerRadius = UDim.new(0, 6)
    tabCorner1.Parent = playersTab
    
    local tabCorner2 = Instance.new("UICorner")
    tabCorner2.CornerRadius = UDim.new(0, 6)
    tabCorner2.Parent = executorTab
    
    -- Players tab content
    local playersContent = Instance.new("Frame")
    playersContent.Name = "PlayersContent"
    playersContent.Size = UDim2.new(1, 0, 1, -40)
    playersContent.Position = UDim2.new(0, 0, 0, 30)
    playersContent.BackgroundTransparency = 1
    playersContent.Parent = contentFrame
    
    -- Player list
    local playerList = Instance.new("ScrollingFrame")
    playerList.Name = "PlayerList"
    playerList.Size = UDim2.new(1, 0, 1, -50)
    playerList.Position = UDim2.new(0, 0, 0, 0)
    playerList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    playerList.BorderSizePixel = 0
    playerList.ScrollBarThickness = 6
    playerList.Parent = playersContent
    
    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 6)
    listCorner.Parent = playerList
    
    -- Get names button
    local getNamesButton = Instance.new("TextButton")
    getNamesButton.Name = "GetNamesButton"
    getNamesButton.Size = UDim2.new(1, 0, 0, 40)
    getNamesButton.Position = UDim2.new(0, 0, 1, -40)
    getNamesButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    getNamesButton.BorderSizePixel = 0
    getNamesButton.Text = "Get Player Names"
    getNamesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    getNamesButton.TextScaled = true
    getNamesButton.Font = Enum.Font.GothamBold
    getNamesButton.Parent = playersContent
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = getNamesButton
    
    -- Executor tab content
    local executorContent = Instance.new("Frame")
    executorContent.Name = "ExecutorContent"
    executorContent.Size = UDim2.new(1, 0, 1, -40)
    executorContent.Position = UDim2.new(0, 0, 0, 30)
    executorContent.BackgroundTransparency = 1
    executorContent.Visible = false
    executorContent.Parent = contentFrame
    
    -- URL input
    local urlInput = Instance.new("TextBox")
    urlInput.Name = "UrlInput"
    urlInput.Size = UDim2.new(1, 0, 0, 30)
    urlInput.Position = UDim2.new(0, 0, 0, 0)
    urlInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    urlInput.BorderSizePixel = 0
    urlInput.Text = "https://pastebin.com/raw/example"
    urlInput.PlaceholderText = "Enter script URL here..."
    urlInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    urlInput.TextScaled = true
    urlInput.Font = Enum.Font.Gotham
    urlInput.TextXAlignment = Enum.TextXAlignment.Left
    urlInput.Parent = executorContent
    
    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 6)
    inputCorner.Parent = urlInput
    
    -- Execute button
    local executeButton = Instance.new("TextButton")
    executeButton.Name = "ExecuteButton"
    executeButton.Size = UDim2.new(1, 0, 0, 40)
    executeButton.Position = UDim2.new(0, 0, 0, 40)
    executeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    executeButton.BorderSizePixel = 0
    executeButton.Text = "Execute Script"
    executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeButton.TextScaled = true
    executeButton.Font = Enum.Font.GothamBold
    executeButton.Parent = executorContent
    
    local executeCorner = Instance.new("UICorner")
    executeCorner.CornerRadius = UDim.new(0, 6)
    executeCorner.Parent = executeButton
    
    -- Status label
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, 0, 0, 30)
    statusLabel.Position = UDim2.new(0, 0, 0, 90)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Ready to execute..."
    statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.Parent = executorContent
    
    -- Store references
    self.screenGui = screenGui
    self.mainFrame = mainFrame
    self.playerList = playerList
    self.getNamesButton = getNamesButton
    self.closeButton = closeButton
    self.playersTab = playersTab
    self.executorTab = executorTab
    self.playersContent = playersContent
    self.executorContent = executorContent
    self.urlInput = urlInput
    self.executeButton = executeButton
    self.statusLabel = statusLabel
    
    -- Setup connections
    self:SetupConnections()
    
    return self
end

-- Setup button connections
function WindUI:SetupConnections()
    -- Close button
    self.closeButton.MouseButton1Click:Connect(function()
        self.screenGui:Destroy()
    end)
    
    -- Get names button
    self.getNamesButton.MouseButton1Click:Connect(function()
        self:GetPlayerNames()
    end)
    
    -- Tab switching
    self.playersTab.MouseButton1Click:Connect(function()
        self:SwitchTab("players")
    end)
    
    self.executorTab.MouseButton1Click:Connect(function()
        self:SwitchTab("executor")
    end)
    
    -- Execute button
    self.executeButton.MouseButton1Click:Connect(function()
        self:ExecuteScript()
    end)
    
    -- Make draggable
    self:MakeDraggable()
end

-- Make window draggable
function WindUI:MakeDraggable()
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    self.mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.mainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            self.mainFrame.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- Get player names and display them
function WindUI:GetPlayerNames()
    -- Clear existing list
    for _, child in pairs(self.playerList:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    local players = Players:GetPlayers()
    local yOffset = 0
    
    for i, player in pairs(players) do
        local playerFrame = Instance.new("Frame")
        playerFrame.Name = "PlayerFrame" .. i
        playerFrame.Size = UDim2.new(1, -10, 0, 30)
        playerFrame.Position = UDim2.new(0, 5, 0, yOffset)
        playerFrame.BackgroundColor3 = i % 2 == 0 and Color3.fromRGB(35, 35, 35) or Color3.fromRGB(30, 30, 30)
        playerFrame.BorderSizePixel = 0
        playerFrame.Parent = self.playerList
        
        local playerCorner = Instance.new("UICorner")
        playerCorner.CornerRadius = UDim.new(0, 4)
        playerCorner.Parent = playerFrame
        
        local playerLabel = Instance.new("TextLabel")
        playerLabel.Name = "PlayerLabel"
        playerLabel.Size = UDim2.new(1, -10, 1, 0)
        playerLabel.Position = UDim2.new(0, 5, 0, 0)
        playerLabel.BackgroundTransparency = 1
        playerLabel.Text = i .. ". " .. player.Name .. " (ID: " .. player.UserId .. ")"
        playerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerLabel.TextScaled = true
        playerLabel.Font = Enum.Font.Gotham
        playerLabel.TextXAlignment = Enum.TextXAlignment.Left
        playerLabel.Parent = playerFrame
        
        yOffset = yOffset + 35
    end
    
    -- Update canvas size
    self.playerList.CanvasSize = UDim2.new(0, 0, 0, yOffset)
    
    -- Update button text
    self.getNamesButton.Text = "Refresh Names (" .. #players .. " players)"
end

-- Switch between tabs
function WindUI:SwitchTab(tab)
    if tab == "players" then
        self.playersContent.Visible = true
        self.executorContent.Visible = false
        self.playersTab.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        self.executorTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    elseif tab == "executor" then
        self.playersContent.Visible = false
        self.executorContent.Visible = true
        self.playersTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        self.executorTab.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    end
end

-- Execute script from URL
function WindUI:ExecuteScript()
    local url = self.urlInput.Text
    if url == "" or url == "https://pastebin.com/raw/example" then
        self.statusLabel.Text = "Please enter a valid URL"
        self.statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    self.statusLabel.Text = "Loading script..."
    self.statusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    self.executeButton.Text = "Loading..."
    
    -- Create loadstring function
    local function loadstringFromUrl(url)
        local success, result = pcall(function()
            local response = HttpService:GetAsync(url)
            return loadstring(response)()
        end)
        
        if success then
            self.statusLabel.Text = "Script executed successfully!"
            self.statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        else
            self.statusLabel.Text = "Error: " .. tostring(result)
            self.statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
        
        self.executeButton.Text = "Execute Script"
    end
    
    -- Execute in a separate thread
    spawn(function()
        loadstringFromUrl(url)
    end)
end

-- Create and show the loader
local loader = WindUI.new()
local window = loader:CreateWindow("Roblox Executor")

-- Auto-get names on load
loader:GetPlayerNames()

print("WindUI Loader loaded! Use the tabs to switch between Players and Executor.")
    -- Tab buttons
    local tabFrame = Instance.new("Frame")
    tabFrame.Name = "TabFrame"
    tabFrame.Size = UDim2.new(1, 0, 0, 30)
    tabFrame.Position = UDim2.new(0, 0, 0, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Parent = contentFrame
    
    local playersTab = Instance.new("TextButton")
    playersTab.Name = "PlayersTab"
    playersTab.Size = UDim2.new(0.5, -5, 1, 0)
    playersTab.Position = UDim2.new(0, 0, 0, 0)
    playersTab.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    playersTab.BorderSizePixel = 0
    playersTab.Text = "Players"
    playersTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    playersTab.TextScaled = true
    playersTab.Font = Enum.Font.GothamBold
    playersTab.Parent = tabFrame
    
    local executorTab = Instance.new("TextButton")
    executorTab.Name = "ExecutorTab"
    executorTab.Size = UDim2.new(0.5, -5, 1, 0)
    executorTab.Position = UDim2.new(0.5, 5, 0, 0)
    executorTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    executorTab.BorderSizePixel = 0
    executorTab.Text = "Executor"
    executorTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    executorTab.TextScaled = true
    executorTab.Font = Enum.Font.GothamBold
    executorTab.Parent = tabFrame
    
    local tabCorner1 = Instance.new("UICorner")
    tabCorner1.CornerRadius = UDim.new(0, 6)
    tabCorner1.Parent = playersTab
    
    local tabCorner2 = Instance.new("UICorner")
    tabCorner2.CornerRadius = UDim.new(0, 6)
    tabCorner2.Parent = executorTab
    
    -- Players tab content
    local playersContent = Instance.new("Frame")
    playersContent.Name = "PlayersContent"
    playersContent.Size = UDim2.new(1, 0, 1, -40)
    playersContent.Position = UDim2.new(0, 0, 0, 30)
    playersContent.BackgroundTransparency = 1
    playersContent.Parent = contentFrame
    
    -- Player list
    local playerList = Instance.new("ScrollingFrame")
    playerList.Name = "PlayerList"
    playerList.Size = UDim2.new(1, 0, 1, -50)
    playerList.Position = UDim2.new(0, 0, 0, 0)
    playerList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    playerList.BorderSizePixel = 0
    playerList.ScrollBarThickness = 6
    playerList.Parent = playersContent
    
    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 6)
    listCorner.Parent = playerList
    
    -- Get names button
    local getNamesButton = Instance.new("TextButton")
    getNamesButton.Name = "GetNamesButton"
    getNamesButton.Size = UDim2.new(1, 0, 0, 40)
    getNamesButton.Position = UDim2.new(0, 0, 1, -40)
    getNamesButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    getNamesButton.BorderSizePixel = 0
    getNamesButton.Text = "Get Player Names"
    getNamesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    getNamesButton.TextScaled = true
    getNamesButton.Font = Enum.Font.GothamBold
    getNamesButton.Parent = playersContent
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = getNamesButton
    
    -- Executor tab content
    local executorContent = Instance.new("Frame")
    executorContent.Name = "ExecutorContent"
    executorContent.Size = UDim2.new(1, 0, 1, -40)
    executorContent.Position = UDim2.new(0, 0, 0, 30)
    executorContent.BackgroundTransparency = 1
    executorContent.Visible = false
    executorContent.Parent = contentFrame
    
    -- URL input
    local urlInput = Instance.new("TextBox")
    urlInput.Name = "UrlInput"
    urlInput.Size = UDim2.new(1, 0, 0, 30)
    urlInput.Position = UDim2.new(0, 0, 0, 0)
    urlInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    urlInput.BorderSizePixel = 0
    urlInput.Text = "https://pastebin.com/raw/example"
    urlInput.PlaceholderText = "Enter script URL here..."
    urlInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    urlInput.TextScaled = true
    urlInput.Font = Enum.Font.Gotham
    urlInput.TextXAlignment = Enum.TextXAlignment.Left
    urlInput.Parent = executorContent
    
    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 6)
    inputCorner.Parent = urlInput
    
    -- Execute button
    local executeButton = Instance.new("TextButton")
    executeButton.Name = "ExecuteButton"
    executeButton.Size = UDim2.new(1, 0, 0, 40)
    executeButton.Position = UDim2.new(0, 0, 0, 40)
    executeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    executeButton.BorderSizePixel = 0
    executeButton.Text = "Execute Script"
    executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeButton.TextScaled = true
    executeButton.Font = Enum.Font.GothamBold
    executeButton.Parent = executorContent
    
    local executeCorner = Instance.new("UICorner")
    executeCorner.CornerRadius = UDim.new(0, 6)
    executeCorner.Parent = executeButton
    
    -- Status label
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, 0, 0, 30)
    statusLabel.Position = UDim2.new(0, 0, 0, 90)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Ready to execute..."
    statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.Parent = executorContent
    
    -- Store references
    self.screenGui = screenGui
    self.mainFrame = mainFrame
    self.playerList = playerList
    self.getNamesButton = getNamesButton
    self.closeButton = closeButton
    self.playersTab = playersTab
    self.executorTab = executorTab
    self.playersContent = playersContent
    self.executorContent = executorContent
    self.urlInput = urlInput
    self.executeButton = executeButton
    self.statusLabel = statusLabel
    
    -- Setup connections
    self:SetupConnections()
    
    return self
end

-- Setup button connections
function WindUI:SetupConnections()
    -- Close button
    self.closeButton.MouseButton1Click:Connect(function()
        self.screenGui:Destroy()
    end)
    
    -- Get names button
    self.getNamesButton.MouseButton1Click:Connect(function()
        self:GetPlayerNames()
    end)
    
    -- Tab switching
    self.playersTab.MouseButton1Click:Connect(function()
        self:SwitchTab("players")
    end)
    
    self.executorTab.MouseButton1Click:Connect(function()
        self:SwitchTab("executor")
    end)
    
    -- Execute button
    self.executeButton.MouseButton1Click:Connect(function()
        self:ExecuteScript()
    end)
    
    -- Make draggable
    self:MakeDraggable()
end

-- Make window draggable
function WindUI:MakeDraggable()
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    self.mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.mainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            self.mainFrame.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- Get player names and display them
function WindUI:GetPlayerNames()
    -- Clear existing list
    for _, child in pairs(self.playerList:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    local players = Players:GetPlayers()
    local yOffset = 0
    
    for i, player in pairs(players) do
        local playerFrame = Instance.new("Frame")
        playerFrame.Name = "PlayerFrame" .. i
        playerFrame.Size = UDim2.new(1, -10, 0, 30)
        playerFrame.Position = UDim2.new(0, 5, 0, yOffset)
        playerFrame.BackgroundColor3 = i % 2 == 0 and Color3.fromRGB(35, 35, 35) or Color3.fromRGB(30, 30, 30)
        playerFrame.BorderSizePixel = 0
        playerFrame.Parent = self.playerList
        
        local playerCorner = Instance.new("UICorner")
        playerCorner.CornerRadius = UDim.new(0, 4)
        playerCorner.Parent = playerFrame
        
        local playerLabel = Instance.new("TextLabel")
        playerLabel.Name = "PlayerLabel"
        playerLabel.Size = UDim2.new(1, -10, 1, 0)
        playerLabel.Position = UDim2.new(0, 5, 0, 0)
        playerLabel.BackgroundTransparency = 1
        playerLabel.Text = i .. ". " .. player.Name .. " (ID: " .. player.UserId .. ")"
        playerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerLabel.TextScaled = true
        playerLabel.Font = Enum.Font.Gotham
        playerLabel.TextXAlignment = Enum.TextXAlignment.Left
        playerLabel.Parent = playerFrame
        
        yOffset = yOffset + 35
    end
    
    -- Update canvas size
    self.playerList.CanvasSize = UDim2.new(0, 0, 0, yOffset)
    
    -- Update button text
    self.getNamesButton.Text = "Refresh Names (" .. #players .. " players)"
end

-- Switch between tabs
function WindUI:SwitchTab(tab)
    if tab == "players" then
        self.playersContent.Visible = true
        self.executorContent.Visible = false
        self.playersTab.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        self.executorTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    elseif tab == "executor" then
        self.playersContent.Visible = false
        self.executorContent.Visible = true
        self.playersTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        self.executorTab.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    end
end

-- Execute script from URL
function WindUI:ExecuteScript()
    local url = self.urlInput.Text
    if url == "" or url == "https://pastebin.com/raw/example" then
        self.statusLabel.Text = "Please enter a valid URL"
        self.statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    self.statusLabel.Text = "Loading script..."
    self.statusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    self.executeButton.Text = "Loading..."
    
    -- Create loadstring function
    local function loadstringFromUrl(url)
        local success, result = pcall(function()
            local response = HttpService:GetAsync(url)
            return loadstring(response)()
        end)
        
        if success then
            self.statusLabel.Text = "Script executed successfully!"
            self.statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        else
            self.statusLabel.Text = "Error: " .. tostring(result)
            self.statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
        
        self.executeButton.Text = "Execute Script"
    end
    
    -- Execute in a separate thread
    spawn(function()
        loadstringFromUrl(url)
    end)
end

-- Create and show the loader
local loader = WindUI.new()
local window = loader:CreateWindow("Roblox Executor")

-- Auto-get names on load
loader:GetPlayerNames()

print("WindUI Loader loaded! Click 'Get Player Names' to refresh the list.")
