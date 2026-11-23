
-- Local Fireball Visual Script
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "LocalFireballs"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.fromOffset(150, 55)
button.Position = UDim2.new(0.5, -75, 0.8, 0)
button.Text = "🔥 FIREBALL"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(180, 55, 20)
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = gui

local function launchFireball()
    local character = player.Character
    if not character then return end

    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local camera = workspace.CurrentCamera
    local direction = camera.CFrame.LookVector

    local orb = Instance.new("Part")
    orb.Shape = Enum.PartType.Ball
    orb.Size = Vector3.new(2, 2, 2)
    orb.Material = Enum.Material.Neon
    orb.Color = Color3.fromRGB(255, 90, 10)
    orb.Anchored = true
    orb.CanCollide = false
    orb.CFrame = root.CFrame + direction * 4
    orb.Parent = workspace

    local fire = Instance.new("Fire")
    fire.Size = 8
    fire.Heat = 5
    fire.Parent = orb

    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(255, 100, 20)
    light.Brightness = 3
    light.Range = 12
    light.Parent = orb

    local destination = orb.Position + direction * 60

    local tween = TweenService:Create(
        orb,
        TweenInfo.new(1, Enum.EasingStyle.Linear),
        {Position = destination}
    )

    tween:Play()
    Debris:AddItem(orb, 1.2)
end

button.Activated:Connect(launchFireball)
