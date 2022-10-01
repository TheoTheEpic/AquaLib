Step 1: Import the library
```lua
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheoTheEpic/AquaLib/main/AquaLib.lua'))()
```
Step 2: Create a window
```lua
local window = lib.createWindow("Aqua", "Aqua Library", true) 
```
Step 3: Create a tab
```lua
local tab1 = window.createTab("Test Tab")
```
Step 4: Add components 
```lua
tab1.createButton("Test Button", function()
	print("Button Pressed!")
end)
tab1.createButton("Create Notification", function() 
	window.notification("Test Notification", "Hello World")
end)
tab1.createToggle("Test Toggle", false, function(value)
	print(value)
end)
tab1.createText("Test Text")
tab1.createDropdown("Test Dropdown", {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10"}, "Option 7", function(value)
	print(value)
end)
tab1.createSlider("Test Slider", {defualt = 50, max = 100, min = 1}, function(value)
	print(value)
end)
local textbox = tab1.createTextBox("Test TextBox", "Test")
wait(5)
print(textbox.getText())
textbox.clearText()
```
And your done! You can repeat this process to add more tabs

Full Example:
```lua
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheoTheEpic/AquaLib/main/AquaLib.lua'))()

local window = lib.createWindow("This Is A Window", "TestWindow", true) -- lib.createWindow(title, name, draggable)
local tab1 = window.createTab("This Is A Tab") -- window.createTab(name)
tab1.createButton("Test Button", function()
	print("Button Pressed!")
end)
tab1.createButton("Create Notification", function() 
	window.notification("Test Notification", "Hello World")
end)
tab1.createToggle("Test Toggle", false, function(value)
	print(value)
end)
tab1.createText("Test Text")
tab1.createDropdown("Test Dropdown", {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10"}, "Option 7", function(value)
	print(value)
end)
tab1.createSlider("Test Slider", {defualt = 50, max = 100, min = 1}, function(value)
	print(value)
end)
local textbox = tab1.createTextBox("Test TextBox", "Test")
wait(5)
print(textbox.getText())
textbox.clearText()
```

Function documentation:

Lib:
lib.createWindow, Usage:
```lua
local window = lib.createWindow("Aqua", "Aqua Library", true) -- lib.createWindow(name, title, draggable)
```

Window:
window.createTab, Usage:
```lua
local tab = window.createTab("This Is A Tab") -- window.createTab(name)
```
window.deleteTab, Usage:
```lua
window.deleteTab("This Is A Tab") -- window.createTab(name)
```
window.notification, Usage:
```lua
window.notification("This Is A Notification!", "Nice") -- window.notification(title, description)
```
window.deleteWindow, Usage:
```lua
window.deleteWindow("TestWindow") -- lib.deleteWindow(window name)
```

Tab:
tab.createButton, Usage:
```lua
tab.createButton("Test Button", function() -- tab.AddButton(text, callback)
    print("Button Pressed!")
end)
```
tab.createText, Usage:
```lua
tab.createText("Test Text")  -- tab.createText(text)
```
tab.createToggle, Usage:
```lua
tab.createToggle("Test Toggle", false, function(value) -- tab.createToggle(text, defualt value, callback)
	print(value)
end)
```
tab.createDropdown, Usage:
```lua
tab.createDropdown("Test Dropdown", {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10"}, "Option 7", function(value) -- tab.createDropdown(name, options, callback)
	print(value)
end)
```
tab.createSlider, Usage:
```lua
tab.createSlider("Test Slider", {min = 1, max = 200, defualt = 20}, function(Value) -- tab.createSlider(text, config(min, max, defualt), callback)
	print(Value) -- Will be a number between min and max
end)
```
tab.createTextBox, Usage:
```lua
local input = tab.createTextBox("Test TextBox", "Test") -- tab.createTextBox(text, placeholder)
```
tab.removeInstance, Usage:
```lua
tab.removeInstance("Test TextBox") -- tab.removeInstance(Instance name)
```

Text:
text.getText, Usage:
```lua
local value = input.getText() -- input.getText()
print(value)
```
text.clearText, Usage:
```lua
input.clearText() -- input.clearText
```
