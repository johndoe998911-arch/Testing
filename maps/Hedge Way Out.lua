print("%lol%^")
task.wait(7)
local GoalPart = workspace["Hedge Way Out"].Goal:GetChildren()[1]
local Root = game.Players.LocalPlayer.Character.HumanoidRootPart

firetouchinterest(GoalPart, Root, 0)
task.wait(0.5)
firetouchinterest(GoalPart, Root, 1)
