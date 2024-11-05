local NormalWalkSpeed = 12
repeat task.wait() until game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 13 or 8.5
NormalWalkSpeed = 12
if workspace:FindFirstChild("SeekMovingNewClone") then
NormalWalkSpeed = 21
return
end
local SprintSpeed = 18
repeat task.wait() until game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 13 or 8.5
SprintSpeed = 18
if workspace:FindFirstChild("SeekMovingNewClone") then
SprintSpeed = 21
return
end
local CameraEffect = true
 
local cas = game:GetService("ContextActionService")
local Leftc = Enum.KeyCode.LeftControl
local RightC = Enum.KeyCode.RightControl
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local Humanoid = char:WaitForChild("Humanoid")
 
local Camera = game.Workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
 
UIS.InputBegan:Connect(function(key, gameProcessed)
	if gameProcessed then return end
	if key.KeyCode == Enum.KeyCode.LeftShift then
		if CameraEffect == true then
			TweenService:Create(Camera, TweenInfo.new(0.5), {FieldOfView = 70}):Play()
		end
		Humanoid.WalkSpeed = SprintSpeed
	end
end)
 
UIS.InputEnded:Connect(function(key, gameProcessed)
	if gameProcessed then return end
	if key.KeyCode == Enum.KeyCode.LeftShift then
		if CameraEffect == true then
			TweenService:Create(Camera, TweenInfo.new(0.5), {FieldOfView = 70}):Play()
		end
		Humanoid.WalkSpeed = NormalWalkSpeed
	end
end)
 
--------------------------------------------------- Mobile Button
 
local function handleContext(name, state, input)
	if state == Enum.UserInputState.Begin then
		if CameraEffect == true then
			TweenService:Create(Camera, TweenInfo.new(0.5), {FieldOfView = 71}):Play()
		end
		Humanoid.WalkSpeed = SprintSpeed
	else
		if CameraEffect == true then
			TweenService:Create(Camera, TweenInfo.new(0.5), {FieldOfView = 69}):Play()
		end
		Humanoid.WalkSpeed = NormalWalkSpeed
	end
end
 
cas:BindAction("Sprint", handleContext, true, Leftc, RightC)
cas:SetPosition("Sprint", UDim2.new(.30, 0, .40, 0))
cas:SetTitle("Sprint", "Sprint")
cas:GetButton("Sprint").Size = UDim2.new(.3, 0, .3, 0)
