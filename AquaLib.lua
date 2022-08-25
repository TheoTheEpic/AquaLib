local ver = "BETA 1.0"

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local UserInputService = game:GetService("UserInputService")

local tabs = {}

local lib = {}

local defualt_tab = false

local function Tween(GuiObject, Dictionary)
	local TweenService = game:GetService("TweenService")
	local TweenBase = TweenService:Create(GuiObject, TweenInfo.new(0.1), Dictionary)
	TweenBase:Play()
	return TweenBase
end

local function RoundBox(CornerRadius, ButtonOrNot)
	local NewRoundBox = Instance.new(ButtonOrNot and "ImageButton" or "ImageLabel")
	NewRoundBox.BackgroundTransparency = 1
	NewRoundBox.Image = "rbxassetid://3570695787"
	NewRoundBox.SliceCenter = Rect.new(100,100,100,100)
	NewRoundBox.SliceScale = math.clamp((CornerRadius or 5) * 0.01, 0.01, 1)
	NewRoundBox.ScaleType = Enum.ScaleType.Slice
	NewRoundBox.ZIndex = 5
	return NewRoundBox
end

local function GetXY(GuiObject)
	local X, Y = mouse.X - GuiObject.AbsolutePosition.X, mouse.Y - GuiObject.AbsolutePosition.Y
	local MaxX, MaxY = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	X, Y = math.clamp(X, 0, MaxX), math.clamp(Y, 0, MaxY)
	return X, Y, X/MaxX, Y/MaxY
end

lib.createWindow = function(title, name, draggable)
	local window
	local mainframe
	local tabholder
	local tabbuttonholder

	local WindowLib = {}
	
	WindowLib.ImageFadeOut = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {ImageTransparency = 1}):Play()
	end
	WindowLib.ImageFadeIn = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {ImageTransparency = 0}):Play()
	end
	WindowLib.BackgroundFadeOut = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {BackgroundTransparency = 1}):Play()
	end
	WindowLib.BackgroundFadeIn = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {BackgroundTransparency = 0}):Play()
	end
	WindowLib.TextFadeOut = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {TextTransparency = 1}):Play()
	end
	WindowLib.TextFadeIn = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {TextTransparency = 0}):Play()
	end

	window = Instance.new("ScreenGui")
	window.Name = name
	window.ResetOnSpawn = false

	if game:GetService("RunService"):IsStudio() then
		syn = false
		window.Parent = player.PlayerGui
	else
		window.Parent = game.CoreGui
	end

	if syn then
		syn.protect_gui(window)
	end

	local NotificationList = Instance.new("Frame")
	NotificationList.Name = "NotificationList"
	NotificationList.Parent = window
	NotificationList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationList.BackgroundTransparency = 1.000
	NotificationList.BorderSizePixel = 0
	NotificationList.Position = UDim2.new(0.754748642, 0, 0.00597784482, 0)
	NotificationList.Size = UDim2.new(0.240573183, 0, 0.704264104, 0)
	
	local NotificationlistLayout = Instance.new("UIListLayout")
	NotificationlistLayout.Parent = NotificationList
	NotificationlistLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	NotificationlistLayout.SortOrder = Enum.SortOrder.LayoutOrder
	NotificationlistLayout.Padding = UDim.new(0, 2)
	
	local Notification = Instance.new("Frame")

	Notification.Name = "Notification"
	Notification.Parent = NotificationList
	Notification.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(0.821048677, 0, 0.0226460081, 0)
	Notification.Size = UDim2.new(0, 225, 0, 72)
	Notification.Visible = false
	Notification.BackgroundTransparency = 1
	
	local NotifCorner = Instance.new("UICorner")
	NotifCorner.CornerRadius = UDim.new(0, 5)
	NotifCorner.Parent = Notification
	
	local Counter = Instance.new("TextLabel")
	Counter.Name = "Counter"
	Counter.Parent = Notification
	Counter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Counter.BackgroundTransparency = 1.000
	Counter.BorderSizePixel = 0
	Counter.Position = UDim2.new(0.613333285, 0, 0, 0)
	Counter.Size = UDim2.new(0, 138, 0, 23)
	Counter.Font = Enum.Font.GothamBold
	Counter.Text = "(10)"
	Counter.TextColor3 = Color3.fromRGB(255, 255, 255)
	Counter.TextSize = 14.000
	Counter.TextTransparency = 1
	
	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Parent = Notification
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.0355554968, 0, 0, 0)
	Title.Size = UDim2.new(0, 138, 0, 23)
	Title.Font = Enum.Font.GothamBold
	Title.Text = "Title"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.TextTransparency = 1
	
	local Text = Instance.new("TextLabel")
	Text.Name = "Text"
	Text.Parent = Notification
	Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Text.BackgroundTransparency = 1.000
	Text.BorderSizePixel = 0
	Text.Position = UDim2.new(0.0355555564, 0, 0.319444448, 0)
	Text.Size = UDim2.new(0, 210, 0, 43)
	Text.Font = Enum.Font.Gotham
	Text.Text = "Text"
	Text.TextColor3 = Color3.fromRGB(255, 255, 255)
	Text.TextSize = 14.000
	Text.TextWrapped = true
	Text.TextXAlignment = Enum.TextXAlignment.Left
	Text.TextYAlignment = Enum.TextYAlignment.Top
	Text.TextTransparency = 1

	local ContainerFrame = Instance.new("Frame")
	ContainerFrame.Name = "ContainerFrame"
	ContainerFrame.Parent = window
	ContainerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ContainerFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	ContainerFrame.BackgroundTransparency = 1.000
	ContainerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContainerFrame.Position = UDim2.new(0.499127448, 0, 0.499993384, 0)
	ContainerFrame.Size = UDim2.new(0, 525, 0, 329)
	ContainerFrame.ZIndex = 2
	
	local Intro = Instance.new("Frame")

	Intro.Name = "Intro"
	Intro.Parent = ContainerFrame
	Intro.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Intro.BackgroundTransparency = 1.000
	Intro.BorderSizePixel = 0
	Intro.Position = UDim2.new(-0.796780586, 0, -0.775059104, 0)
	Intro.Size = UDim2.new(0, 1364, 0, 838)
	Intro.Visible = true

	local LibName = Instance.new("TextLabel")

	LibName.Name = "Name"
	LibName.Parent = Intro
	LibName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LibName.BackgroundTransparency = 1.000
	LibName.BorderSizePixel = 0
	LibName.Position = UDim2.new(0.426686227, 0, 0.48152563, 0)
	LibName.Size = UDim2.new(0, 200, 0, 50)
	LibName.Font = Enum.Font.GothamBold
	LibName.Text = "Aqua Lib"
	LibName.TextColor3 = Color3.fromRGB(255, 255, 255)
	LibName.TextSize = 25.000
	LibName.TextTransparency = 1

	local WelcomeTo = Instance.new("TextLabel")

	WelcomeTo.Name = "WelcomeTo"
	WelcomeTo.Parent = Intro
	WelcomeTo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WelcomeTo.BackgroundTransparency = 1.000
	WelcomeTo.BorderSizePixel = 0
	WelcomeTo.Position = UDim2.new(0.426686227, 0, 0.45887965, 0)
	WelcomeTo.Size = UDim2.new(0, 200, 0, 50)
	WelcomeTo.Font = Enum.Font.GothamBold
	WelcomeTo.Text = "Welcome to"
	WelcomeTo.TextColor3 = Color3.fromRGB(255, 255, 255)
	WelcomeTo.TextSize = 15.000
	WelcomeTo.TextTransparency = 1

	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ContainerFrame
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(47, 50, 53)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.Position = UDim2.new(0.499127448, 0, 0.499993384, 0)
	MainFrame.Size = UDim2.new(0, 525, 0, 329)
	MainFrame.ZIndex = 2
	MainFrame.BackgroundTransparency = 1

	mainframe = MainFrame

	local Close = Instance.new("ImageButton")

	Close.Name = "Close"
	Close.Parent = mainframe
	Close.BackgroundTransparency = 1
	Close.Image = "rbxassetid://3926307971"
	Close.ImageRectOffset = Vector2.new(324,364)
	Close.ImageRectSize = Vector2.new(36,36)
	Close.Size = UDim2.new(0,16,0,16)
	Close.Position = UDim2.new(0.956, 0, 0.018, 0)
	Close.ZIndex = 5

	Tween(Close, {Rotation = 135})

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = MainFrame

	local MenuBar = Instance.new("Frame")
	MenuBar.Name = "MenuBar"
	MenuBar.Parent = MainFrame
	MenuBar.BackgroundColor3 = Color3.fromRGB(40, 43, 45)
	MenuBar.Size = UDim2.new(0, 118, 0, 329)
	MenuBar.ZIndex = 2

	tabbuttonholder = MenuBar

	local UICorner_2 = Instance.new("UICorner")
	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = MenuBar

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = MenuBar
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	local Title_2 = Instance.new("TextLabel")
	Title_2.Name = "Title"
	Title_2.Parent = MenuBar
	Title_2.BackgroundTransparency = 1.000
	Title_2.Position = UDim2.new(0.0909315199, 0, 0, 0)
	Title_2.Size = UDim2.new(0.987628639, -20, 0.133877605, 0)
	Title_2.ZIndex = 3
	Title_2.Font = Enum.Font.GothamSemibold
	Title_2.Text = "Test"
	Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.TextSize = 22.000
	Title_2.TextXAlignment = Enum.TextXAlignment.Left

	local Display = Instance.new("Frame")
	Display.Name = "Display"
	Display.Parent = MainFrame
	Display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Display.BackgroundTransparency = 1.000
	Display.ClipsDescendants = true
	Display.Position = UDim2.new(0.225, 0, 0.088, 0)
	Display.Size = UDim2.new(0, 407, 0, 302)
	Display.ZIndex = 2

	tabholder = Display

	local Watermark = Instance.new("TextLabel")

	Watermark.Parent = mainframe
	Watermark.Name = "Watermark"
	Watermark.Text = "Aqua UI Library " .. tostring(ver)
	Watermark.BackgroundTransparency = 1
	Watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
	Watermark.Position = UDim2.new(0, 0, 0.932, 0)
	Watermark.Size = UDim2.new(0.2, 0, 0.008, 20)
	Watermark.TextSize = 9
	Watermark.ZIndex = 1000000000
	Watermark.Font = Enum.Font.Gotham
	Watermark.TextWrapped = true

	local CurrentTab = Instance.new("TextLabel")
	CurrentTab.Name = "CurrentTab"
	CurrentTab.Parent = MainFrame
	CurrentTab.BackgroundTransparency = 1.000
	CurrentTab.Position = UDim2.new(0.243312523, 0, 0, 0)
	CurrentTab.Size = UDim2.new(0.750782788, -20, 0.0882848948, 0)
	CurrentTab.ZIndex = 3
	CurrentTab.Font = Enum.Font.GothamSemibold
	CurrentTab.Text = "unloaded"
	CurrentTab.TextColor3 = Color3.fromRGB(255, 255, 255)
	CurrentTab.TextSize = 14.000
	CurrentTab.TextXAlignment = Enum.TextXAlignment.Left

	Close.MouseButton1Down:Connect(function()
		local decendants = MainFrame:GetDescendants()
		for _,decendant in pairs(decendants) do
			if decendant:IsA("TextButton") or decendant:IsA("TextBox") or decendant:IsA("TextLabel") then
				WindowLib.BackgroundFadeOut(decendant, 1.5)
				WindowLib.TextFadeOut(decendant, 1.5)
			elseif decendant:IsA("Frame") then
				WindowLib.BackgroundFadeOut(decendant, 1.5)
			elseif decendant:IsA("ImageLabel") or decendant:IsA("ImageFrame") or decendant:IsA("ImageButton") then
				WindowLib.ImageFadeOut(decendant, 1.5)
			end
		end
		WindowLib.BackgroundFadeOut(mainframe, 1.5)
		wait(1.6)
		window:Destroy()
	end)
	
	local decendants = MainFrame:GetDescendants()
	for _,decendant in pairs(decendants) do
		if decendant:IsA("TextButton") or decendant:IsA("TextBox") or decendant:IsA("TextLabel") then
			WindowLib.BackgroundFadeOut(decendant, .01)
			WindowLib.TextFadeOut(decendant, .01)
		elseif decendant:IsA("Frame") then
			WindowLib.BackgroundFadeOut(decendant, .01)
		elseif decendant:IsA("ImageLabel") or decendant:IsA("ImageFrame") or decendant:IsA("ImageButton") then
			WindowLib.ImageFadeOut(decendant, .01)
		end
	end
	
	wait(5)
	WindowLib.TextFadeIn(WelcomeTo, .5)
	wait(0.5)
	WindowLib.TextFadeIn(LibName, .5)
	wait(1)
	WindowLib.TextFadeOut(WelcomeTo, .5)
	wait(1)
	WindowLib.TextFadeOut(LibName, 1)
	wait(0.5)
	
	local decendants = MainFrame:GetDescendants()
	for _,decendant in pairs(decendants) do
		if decendant:IsA("TextButton") or decendant:IsA("TextBox") or decendant:IsA("TextLabel") then
			if decendant.BackgroundColor3 == Color3.fromRGB(255, 255, 255) or decendant.BackgroundColor3 == Color3.fromRGB(163, 162, 165) then
				WindowLib.TextFadeIn(decendant, 1.5)
			else
				WindowLib.BackgroundFadeIn(decendant, 1.5)
				WindowLib.TextFadeIn(decendant, 1.5)
			end
		elseif decendant:IsA("Frame") then
			if decendant.BackgroundColor3 == Color3.fromRGB(255, 255, 255) or decendant.BackgroundColor3 == Color3.fromRGB(163, 162, 165) then
			else
				WindowLib.BackgroundFadeIn(decendant, 1.5)
			end
		elseif decendant:IsA("ImageLabel") or decendant:IsA("ImageFrame") or decendant:IsA("ImageButton") then
			WindowLib.ImageFadeIn(decendant, 1.5)
		end
	end
	WindowLib.BackgroundFadeIn(MainFrame, 1.5)
	

	WindowLib.createTab = function(name)
		local TabLib = {}


		table.insert(tabs, name)
		local tab = Instance.new("ScrollingFrame")
		local tabbutton = Instance.new("TextButton")
		local tabpadding = Instance.new("UIPadding")
		local tablist = Instance.new("UIListLayout")

		tab.Name = name
		tab.Parent = tabholder
		tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tab.BackgroundTransparency = 1.000
		tab.ClipsDescendants = true
		tab.Position = UDim2.new(-0.002, 0,-0.002, 0)
		tab.Size = UDim2.new(0, 407, 0, 302)
		tab.ZIndex = 2
		tab.BottomImage = ""
		tab.MidImage = ""
		tab.TopImage = ""
		tab.BorderSizePixel = 0
		tab.CanvasSize = UDim2.new(0, 0, 100, 0)
		tab.ScrollBarThickness = 0

		tabpadding.Parent = tab
		tabpadding.PaddingBottom = UDim.new(0, 5)
		tabpadding.PaddingLeft = UDim.new(0, 5)
		tabpadding.PaddingRight = UDim.new(0, 5)
		tabpadding.PaddingTop = UDim.new(0, 5)

		tablist.Padding = UDim.new(0, 5)
		tablist.Parent = tab

		tabbutton.Name = name
		tabbutton.Parent = tabbuttonholder
		tabbutton.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
		tabbutton.BackgroundTransparency = 1.000
		tabbutton.BorderSizePixel = 0
		tabbutton.Position = UDim2.new(0.105097599, 0, 0.0804777294, 0)
		tabbutton.Size = UDim2.new(0, 88, 0, 23)
		tabbutton.ZIndex = 2
		tabbutton.AutoButtonColor = false
		tabbutton.Font = Enum.Font.GothamSemibold
		tabbutton.Text = name
		tabbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
		tabbutton.TextSize = 15.000
		tabbutton.TextXAlignment = Enum.TextXAlignment.Left

		if not defualt_tab then
			defualt_tab = tabbutton.Name
			CurrentTab.Text = defualt_tab
		else
			tab.Visible = false
		end

		TabLib.AddButton = function(text, name, callback, parent)
			if not parent then parent = tab end
			local button = Instance.new("TextButton")
			local buttonround = Instance.new("UICorner")
			button.Name = name
			button.Parent = parent
			button.Text = text
			button.BackgroundColor3 = Color3.fromRGB(71, 75, 80)
			button.BorderSizePixel = 0
			button.Size = UDim2.new(1, 0, 0, 25)
			button.TextColor3 = Color3.new(1, 1, 1)
			button.ZIndex = 4
			button.Font = Enum.Font.Gotham
			button.TextSize = 14

			buttonround.Parent = button
			buttonround.CornerRadius = UDim.new(0, 3)

			button.MouseButton1Down:Connect(function()
				callback()
			end)

			return button
		end

		TabLib.AddInput = function(pholdertext, text, name)
			local InputLib = {}
			local input = Instance.new("TextBox")
			local inputround = Instance.new("UICorner")
			input.Name = name
			input.Text = text
			input.Parent = tab
			input.PlaceholderText = pholdertext
			input.BackgroundColor3 = Color3.fromRGB(71, 75, 80)
			input.BorderSizePixel = 0
			input.Size = UDim2.new(1, 0, 0, 25)
			input.TextColor3 = Color3.new(1, 1, 1)
			input.ZIndex = 4
			input.Font = Enum.Font.Gotham
			input.TextSize = 14

			inputround.Parent = input
			inputround.CornerRadius = UDim.new(0, 3)

			InputLib.GetInput = function()
				return input.Text
			end

			InputLib.ClearInput = function()
				input.Text = ""
			end

			return InputLib
		end

		TabLib.AddLabel = function(text, name)
			local label = Instance.new("TextLabel")
			local labelround = Instance.new("UICorner")
			label.Name = name
			label.Parent = tab
			label.Text = text
			label.BackgroundColor3 = Color3.fromRGB(71, 75, 80)
			label.BorderSizePixel = 0
			label.Size = UDim2.new(1, 0, 0, 25)
			label.TextColor3 = Color3.new(1, 1, 1)
			label.ZIndex = 4
			label.Font = Enum.Font.Gotham
			label.TextSize = 14

			labelround.Parent = label
			labelround.CornerRadius = UDim.new(0, 3)
		end

		TabLib.AddToggle = function(text, name, defualt, callback)
			local toggled = defualt

			local toggleenabledcolour = Color3.fromRGB(73, 255, 85)
			local toggledisabledcolour = Color3.fromRGB(255, 160, 160)

			local togglebutton = Instance.new("TextButton")
			local togglebuttonround = Instance.new("UICorner")
			local toggleindicator = Instance.new("Frame")
			local toggleindicatorround = Instance.new("UICorner")

			togglebutton.Name = name
			togglebutton.Text = text
			togglebutton.Parent = tab
			togglebutton.BackgroundColor3 = Color3.fromRGB(71, 75, 80)
			togglebutton.BorderSizePixel = 0
			togglebutton.Size = UDim2.new(1, 0, 0, 25)
			togglebutton.TextColor3 = Color3.new(1, 1, 1)
			togglebutton.ZIndex = 4
			togglebutton.Font = Enum.Font.Gotham
			togglebutton.TextSize = 14

			togglebuttonround.Parent = togglebutton
			togglebuttonround.CornerRadius = UDim.new(0, 3)

			toggleindicator.Name = "Indicator"
			toggleindicator.Parent = togglebutton
			toggleindicator.BorderSizePixel = 0
			toggleindicator.Size = UDim2.new(0.03, 2, 0.6, 0)
			toggleindicator.Position = UDim2.new(1.01, -22, 0.2, 0)
			toggleindicator.ZIndex = 5

			if toggled == false then
				togglebutton.Text = text .. " (Disabled)"
				toggleindicator.BackgroundColor3 = toggledisabledcolour
			else
				togglebutton.Text = text .. " (Enabled)"
				toggleindicator.BackgroundColor3 = toggleenabledcolour
			end

			toggleindicatorround.Parent = toggleindicator
			toggleindicatorround.CornerRadius = UDim.new(0, 3)

			togglebutton.MouseButton1Down:Connect(function()
				if toggled == false then
					toggled = true
					toggleindicator.BackgroundColor3 = toggleenabledcolour
					togglebutton.Text = text .. " (Enabled)"
				else
					toggled = false
					toggleindicator.BackgroundColor3 = toggledisabledcolour
					togglebutton.Text = text .. " (Disabled)"
				end
				callback(toggled)
			end)
		end

		TabLib.AddDropdown = function(text, name, dropdownarray, callback)
			local selected = nil
			local isdown = true

			local container = Instance.new("Frame")
			local dropdownbutton = Instance.new("TextLabel")
			local dropdownbuttonround = Instance.new("UICorner")
			local dropdownframe = Instance.new("Frame")
			local dropdownlist = Instance.new("UIListLayout")
			local dropdownexpander = Instance.new("ImageButton")

			container.Parent = tab
			container.Name = name
			container.Size = UDim2.new(1,0,0,25)
			container.BackgroundTransparency = 1

			dropdownbutton.Name = "Dropdown"
			dropdownbutton.Text = text
			dropdownbutton.Parent = container
			dropdownbutton.BackgroundColor3 = Color3.fromRGB(71, 75, 80)
			dropdownbutton.BorderSizePixel = 0
			dropdownbutton.Size = UDim2.new(1, 0, 0, 25)
			dropdownbutton.TextColor3 = Color3.new(1, 1, 1)
			dropdownbutton.ZIndex = 4
			dropdownbutton.Font = Enum.Font.Gotham
			dropdownbutton.TextSize = 14

			dropdownbuttonround.Parent = dropdownbutton
			dropdownbuttonround.CornerRadius = UDim.new(0, 3)

			dropdownframe.Name = "Options"
			dropdownframe.Position = UDim2.new(0,0,0,30)
			dropdownframe.BackgroundTransparency = 1
			dropdownframe.Size = UDim2.new(1,0,0.208,#dropdownarray*40)
			dropdownframe.Parent = dropdownbutton

			dropdownlist.Parent = dropdownframe
			dropdownlist.Padding = UDim.new(0,4)

			dropdownexpander.Name = "DropdownIcon"
			dropdownexpander.Parent = dropdownbutton
			dropdownexpander.BackgroundTransparency = 1
			dropdownexpander.Image = "rbxassetid://3926307971"
			dropdownexpander.ImageRectOffset = Vector2.new(324,364)
			dropdownexpander.ImageRectSize = Vector2.new(36,36)
			dropdownexpander.Size = UDim2.new(0,16,0,16)
			dropdownexpander.Position = UDim2.new(0.997, -18, 0.08, 2)
			dropdownexpander.ZIndex = 5

			for optionlist,option in next, dropdownarray do
				local button = TabLib.AddButton(option, "DropdownOption", function()
					selected = option
					callback(option)
					dropdownbutton.Text = text..": "..option
				end, dropdownframe)
				button.Visible = false
				button.ZIndex = 5
				if selected == nil then
					selected = option
					dropdownbutton.Text = text..": "..option
				end
			end

			local spacer = Instance.new("TextLabel")
			spacer.Name = "Spacer"
			spacer.Text = ""
			spacer.Size = UDim2.new(1, 0, -0.104, 25)
			spacer.Parent = dropdownframe
			spacer.BackgroundTransparency = 1

			dropdownexpander.MouseButton1Down:Connect(function()
				Tween(dropdownexpander, {Rotation = isdown and 135 or 0})
				Tween(container, {Size = isdown and UDim2.new(1,0,0,25+(#dropdownarray+1*27)) or UDim2.new(1,0,0,25)})
				for _,child in pairs(dropdownframe:GetChildren()) do
					if child.Name == "DropdownOption" or child.Name == "Spacer" then
						if isdown == true then
							child.Visible = true
						else
							child.Visible = false
						end
					end
				end
				isdown = not isdown
			end)
		end

		TabLib.AddSlider = function(text, name, config, callback)
			local Configuration = config
			local Minimum = Configuration["min"]
			local Maximum = Configuration["max"]
			local Default = Configuration["defualt"]

			if Minimum > Maximum then
				local StoreValue = Minimum
				Minimum = Maximum
				Maximum = StoreValue
			end

			Default = math.clamp(Default, Minimum, Maximum)

			local DefaultScale = Default/Maximum

			local container = Instance.new("Frame")
			container.Parent = tab
			container.Name = name
			container.Size = UDim2.new(1,0,0,25)
			container.BackgroundTransparency = 1

			local SliderForeground = RoundBox(1)
			SliderForeground.Name = "SliderForeground"
			SliderForeground.ImageColor3 = Color3.fromRGB(71, 75, 80)
			SliderForeground.Size = UDim2.new(1,0,1,0)
			SliderForeground.Parent = container
			SliderForeground.BorderSizePixel = 0

			local SliderButton = Instance.new("TextButton")
			SliderButton.Text = text..": "..Default
			SliderButton.Size = UDim2.new(1,0,1,0)
			SliderButton.ZIndex = 6
			SliderButton.Parent = SliderForeground
			SliderButton.TextColor3 = Color3.new(1, 1, 1)
			SliderButton.ZIndex = 6
			SliderButton.Font = Enum.Font.Gotham
			SliderButton.TextSize = 14
			SliderButton.BorderSizePixel = 0
			SliderButton.BackgroundTransparency = 1

			local SliderFill = RoundBox(5)
			SliderFill.Size = UDim2.new(DefaultScale,0,1,0)
			SliderFill.ImageColor3 = Color3.fromRGB(54, 232, 96)
			SliderFill.ZIndex = 5
			SliderFill.ImageTransparency = 0.7
			SliderFill.Parent = SliderButton
			SliderFill.BorderSizePixel = 0

			SliderButton.MouseButton1Down:Connect(function()
				Tween(SliderFill, {ImageTransparency = 0.5})
				local X, Y, XScale, YScale = GetXY(SliderButton)
				local Value = math.floor(Minimum + ((Maximum - Minimum) * XScale))
				callback(Value)
				SliderButton.Text = text..": "..tostring(Value)
				local TargetSize = UDim2.new(XScale,0,1,0)
				Tween(SliderFill, {Size = TargetSize})
				local SliderMove, SliderKill
				SliderMove = mouse.Move:Connect(function()
					Tween(SliderFill, {ImageTransparency = 0.5})
					local X, Y, XScale, YScale = GetXY(SliderButton)
					local Value = math.floor(Minimum + ((Maximum - Minimum) * XScale))
					callback(Value)
					SliderButton.Text = text..": "..tostring(Value)
					local TargetSize = UDim2.new(XScale,0,1,0)
					Tween(SliderFill, {Size = TargetSize})
				end)
				SliderKill = UserInputService.InputEnded:Connect(function(UserInput)
					if UserInput.UserInputType == Enum.UserInputType.MouseButton1 then
						Tween(SliderFill, {ImageTransparency = 0.7})
						SliderMove:Disconnect()
						SliderKill:Disconnect()
					end
				end)
			end)
		end

		TabLib.RemoveInstance = function(name)
			if tab:FindFirstChild(name) then
				tab[name]:Destroy()
			else
				warn("Could not find instance")
				return
			end
		end

		return TabLib
	end

	WindowLib.deleteTab = function(name)
		if table.find(tabs, name) then
			table.remove(tabs, tabs[name])
			local tab = tabholder:WaitForChild(name)
			local tabbutton = tabbuttonholder:WaitForChild(name)
			tab:Destroy()
			tabbutton:Destroy()
		else
			warn("Tab not found")
			return
		end
	end

	local function TabHandle()
		local newscript = Instance.new('LocalScript', tabbuttonholder)
		newscript.Name = "Tab_Handler"

		wait(0.1)
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local tab = defualt_tab
		local unselected = {
			TextColor3 = Color3.fromRGB(190, 190, 190)
		}
		local selected = {
			TextColor3 = Color3.fromRGB(61, 133, 222)
		}
		local hover = {
			TextColor3 = Color3.fromRGB(235, 235, 235)
		}
		tweenservice:Create(tabbuttonholder[tab], info, selected):Play()
		local deb = false
		for i,v in pairs(tabbuttonholder:GetChildren())do
			if v:IsA("TextButton")then
				v.MouseEnter:Connect(function()
					if tab ~= v.Name then
						tweenservice:Create(v, info, hover):Play()
					end
				end)
				v.MouseLeave:Connect(function()
					if tab ~= v.Name then
						tweenservice:Create(v, info, unselected):Play()
					end
				end)
				if true then
					v.MouseButton1Down:Connect(function()
						if not deb then
							deb = true
							if tab ~= nil then
								tabholder[tab]:TweenSize(UDim2.new(0, 0, 0, 300), "Out", "Quint", .4, false)
								tweenservice:Create(tabbuttonholder[tab], info, unselected):Play()
								wait(.4)
								tabholder[tab].Visible = false
							end
							tab = v.Name
							CurrentTab.Text = v.Name
							tabholder[tab].Visible = true
							tweenservice:Create(tabbuttonholder[tab], info, selected):Play()
							tabholder[tab]:TweenSize(UDim2.new(0, 421,0, 300), "Out", "Quint", .4, false)
							wait(.3)
							deb = false
						end
					end)
				else
					v.MouseButton1Down:Connect(function()
						tweenservice:Create(v, info, selected):Play()
						wait(.5)
						tweenservice:Create(v, info, unselected):Play()
					end)
				end
			end
		end
	end
	coroutine.wrap(TabHandle)()

	local function DragScript()
		local newscript = Instance.new('LocalScript', mainframe)
		newscript.Name = "Drag"

		local uis = game:GetService('UserInputService')
		local frame = newscript.Parent
		local toggle
		local speed = 0.15
		local drag
		local pos
		frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				toggle = true
				drag = input.Position
				pos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						toggle = false
					end
				end)
			end
		end)
		uis.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if toggle then
					local delta = input.Position - drag
					local position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X,
						pos.Y.Scale, pos.Y.Offset + delta.Y)
					game:GetService('TweenService'):Create(frame, TweenInfo.new(speed), {Position = position}):Play()
				end
			end
		end)
	end

	WindowLib.HighlightText = function(v)
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local unselected = {
			TextColor3 = Color3.fromRGB(190, 190, 190)
		}
		local hover = {
			TextColor3 = Color3.fromRGB(235, 235, 235)
		}
		v.MouseEnter:Connect(function()
			tweenservice:Create(v, info, hover):Play()
		end)
		v.MouseLeave:Connect(function()
			tweenservice:Create(v, info, unselected):Play()
		end)	
	end


	WindowLib.Notification = function(title, text, duration)
		local card = window.NotificationList.Notification:Clone()
		card.Text.Text = text
		card.Title.Text = title
		card.Parent = window.NotificationList
		card.Visible = true
		WindowLib.BackgroundFadeIn(card)
		WindowLib.HighlightText(card.Text)
		WindowLib.TextFadeIn(card.Text)
		WindowLib.TextFadeIn(card.Title)
		WindowLib.TextFadeIn(card.Counter)
		if duration == nil then
			card.Counter.Text = "(5)"
			for i = 5,0,-1 do
				card.Counter.Text = "(" .. i .. ")"
				wait(1)
			end
			WindowLib.BackgroundFadeOut(card)
			WindowLib.TextFadeOut(card.Text)
			WindowLib.TextFadeOut(card.Title)
			WindowLib.TextFadeOut(card.Counter)
			wait(.4)
			card:Destroy()
		else
			card.Counter.Text = "(" .. duration .. ")"
			for i = duration,0,-1 do
				card.Counter.Text = "(" .. i .. ")"
				wait(1)
			end
			WindowLib.BackgroundFadeOut(card)
			WindowLib.TextFadeOut(card.Text)
			WindowLib.TextFadeOut(card.Title)
			WindowLib.TextFadeOut(card.Counter)
			wait(.4)
			card:Destroy()
		end
	end

	if not draggable then 
		draggable = false
	elseif draggable == true then
		coroutine.wrap(DragScript)()
	end


	return WindowLib
end

lib.deleteWindow = function(name)
	local ui = player.PlayerGui:WaitForChild(name)
	ui:Destroy()
end

return lib
