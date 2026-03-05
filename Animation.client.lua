// starter character scripts
local ts = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local noob = workspace:WaitForChild("alexcota1")
local noobHumanoid = noob:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://117951187904653"

local animation2 = Instance.new("Animation")
animation2.AnimationId = "rbxassetid://124088452290167"

local animator = noobHumanoid:FindFirstChildOfClass("Animator")
local animTrack = animator:LoadAnimation(animation)

local animator2 = noobHumanoid:FindFirstChildOfClass("Animator")
local animTrack2 = animator2:LoadAnimation(animation2)

print("Animation started")
-- set anim track speed
animTrack:Play()
animTrack:AdjustSpeed(0.75)

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Sounds
local wind = script.Wind
local clear = script.Clear
local helicopter = script.Helicopter

-- Cameras
local cam1 = workspace.Project1:WaitForChild("Cam1")
local cam2 = workspace.Project1:WaitForChild("Cam2")
--local cam3 = workspace.Project1:WaitForChild("Cam3")
--local cam4 = workspace.Project1:WaitForChild("Cam4")

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

repeat
	task.wait()
	camera.CameraType = Enum.CameraType.Scriptable
until camera.CameraType == Enum.CameraType.Scriptable

-- Tween 1: cam1 se misca usor
local tween1 = ts:Create(cam1, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	Position = cam1.Position + Vector3.new(-0.5, 0, 0.1),
})

local connection
connection = RunService.RenderStepped:Connect(function()
	if camera.CameraType == Enum.CameraType.Scriptable then
		camera.CFrame = cam1.CFrame
	else
		connection:Disconnect()
	end
end)

-- Repeat loop
wind.Looped = true
wind.Volume = 0.1
wind:Play()

-- Stop wind
task.spawn(function()
	task.wait(1)
	wind:Stop()
	clear.Volume = 5
	clear:Play()
end)
wind:Resume()
helicopter:Play()

tween1:Play()
tween1.Completed:Wait()
connection:Disconnect()
print("tween1 gata")

-- Tween 2: camera snap la cam2
local tween2 = ts:Create(camera, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	CFrame = cam2.CFrame
})

tween2:Play()
-- destroy cam1
cam1:Destroy()
animTrack2:Play()
animTrack2:AdjustSpeed(1.5)
tween2.Completed:Wait()
print("tween2 gata")
task.wait(4)
noob:Destroy()

-- animation bat id: 92820692184807
-- animation bata id: 112744644207067

camera.CameraType = Enum.CameraType.Custom
camera.CameraSubject = humanoid 