Step 1: Import the library
```lua
local lib = loadstring(game:HttpGet('https://www.floppa.dev/AquaLib.lua'))()
```
Step 2: Create a window
```lua
local window = lib.createWindow("This Is A Window", "TestWindow", true) -- lib.createWindow(title, name, draggable)
```
Step 3: Create a tab
```lua
local tab = window.createTab("This Is A Tab") -- window.createTab(name)
```
Step 4: Add components 
```lua
tab.AddButton("This Is A Button", "TestButton", function() -- tab.AddButton(text, name, callback)
	print("I have been clicked!")
end)
tab.AddButton("Delete This Button", "TestButton2", function() -- tab.AddButton(text, name, callback)
	tab.RemoveInstance("TestButton2") -- tab.RemoveInstance(instance name)
end)
tab.AddButton("Delete This Tab", "TestButton3", function() -- tab.AddButton(text, name, callback)
	window.deleteTab("This Is A Tab") -- window.deleteTab(tab name)
end)
tab.AddButton("Delete This Window", "TestButton4", function() -- tab.AddButton(text, name, callback)
	lib.deleteWindow("TestWindow") -- lib.deleteWindow(window name)
end)
tab.AddButton("Create A Notification", "TestButton5", function() -- tab.AddButton(text, name, callback)
	window.Notification("This Is A Notification!", "Nice", 10) -- window.Notification(title, description, durtion(optional))
end)
tab.AddLabel("This Is Text", "TestLabel")  -- tab.AddLabel(text, name)
tab.AddToggle("This Is A Toggle", "TestToggle", false, function(Value) -- tab.AddToggle(text, name, defualt value, callback)
	print(Value)
end)
tab.AddDropdown("This Is A Dropdown", "TestDropdown", {"This Is An Option 1", "This Is An Option 2", "This Is An Option 3"}, function(Value) -- tab.AddDropdown(text, name, values, callback)
	print(Value)
end)
tab.AddSlider("This Is A Slider", "TestSlider", {min = 1, max = 200, defualt = 20}, function(Value) -- tab.AddSlider(text, name, config(min, max, defualt), callback)
	print(Value)
end)
```
And your done! You can repeat this process to add more tabs

Full Example:
```lua
local lib = loadstring(game:HttpGet('https://www.floppa.dev/AquaLib.lua'))()

local window = lib.createWindow("This Is A Window", "TestWindow", true) -- lib.createWindow(title, name, draggable)
local tab = window.createTab("This Is A Tab") -- window.createTab(name)
tab.AddButton("This Is A Button", "TestButton", function() -- tab.AddButton(text, name, callback)
	print("I have been clicked!")
end)
tab.AddButton("Delete This Button", "TestButton2", function() -- tab.AddButton(text, name, callback)
	tab.RemoveInstance("TestButton2") -- tab.RemoveInstance(instance name)
end)
tab.AddButton("Delete This Tab", "TestButton3", function() -- tab.AddButton(text, name, callback)
	window.deleteTab("This Is A Tab") -- window.deleteTab(tab name)
end)
tab.AddButton("Delete This Window", "TestButton4", function() -- tab.AddButton(text, name, callback)
	lib.deleteWindow("TestWindow") -- lib.deleteWindow(window name)
end)
tab.AddButton("Create A Notification", "TestButton5", function() -- tab.AddButton(text, name, callback)
	window.Notification("This Is A Notification!", "Nice", 10) -- window.Notification(title, description, durtion(optional))
end)
tab.AddLabel("This Is Text", "TestLabel")  -- tab.AddLabel(text, name)
tab.AddToggle("This Is A Toggle", "TestToggle", false, function(Value) -- tab.AddToggle(text, name, defualt value, callback)
	print(Value)
end)
tab.AddDropdown("This Is A Dropdown", "TestDropdown", {"This Is An Option 1", "This Is An Option 2", "This Is An Option 3"}, function(Value) -- tab.AddDropdown(text, name, values, callback)
	print(Value)
end)
tab.AddSlider("This Is A Slider", "TestSlider", {min = 1, max = 200, defualt = 20}, function(Value) -- tab.AddSlider(text, name, config(min, max, defualt), callback)
	print(Value)
end)
```
