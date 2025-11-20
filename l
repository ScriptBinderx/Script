-- Loading Screen Script
-- Works in StarterPlayerScripts (LocalScript)

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create blur effect
local blur = Instance.new("BlurEffect")
blur.Size = 20
blur.Parent = game.Lighting

-- Create loading frame (center box)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 120)
frame.Position = UDim2.new(0.5, -125, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = frame

-- Text label inside the box
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "Loading..."
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Parent = frame

-- Fade function
local function fadeOut()
	for i = 0, 1, 0.02 do
		frame.BackgroundTransparency = i
		label.TextTransparency = i
		blur.Size = 20 - (i * 20)
		wait(0.03)
	end
	blur:Destroy()
	screenGui:Destroy()
end

-- WAIT 10 MINUTES
wait(600)

-- Fade loading screen
fadeOut()
