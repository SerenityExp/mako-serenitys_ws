local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character

if character then
    local humanoid = character:WaitForChild("Humanoid")
    local speed = 25

    game:GetService("RunService").RenderStepped:Connect(function()
        if humanoid then
            local velocity = humanoid.RootPart.Velocity
            local lookVector = (character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1)).LookVector

            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                velocity = Vector3.new(velocity.X + lookVector.X * speed * 0.1, velocity.Y, velocity.Z + lookVector.Z * speed * 0.1)
            elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                velocity = Vector3.new(velocity.X - lookVector.X * speed * 0.1, velocity.Y, velocity.Z - lookVector.Z * speed * 0.1)
            end

            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                velocity = Vector3.new(velocity.X + lookVector.Z * speed * 0.1, velocity.Y, velocity.Z - lookVector.X * speed * 0.1)
            elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                velocity = Vector3.new(velocity.X - lookVector.Z * speed * 0.1, velocity.Y, velocity.Z + lookVector.X * speed * 0.1)
            end

            humanoid.RootPart.Velocity = velocity
        end
    end)
end