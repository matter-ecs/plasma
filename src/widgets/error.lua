local Runtime = require(script.Parent.Parent.Runtime)
local create = require(script.Parent.Parent.create)

return Runtime.widget(function(text)
	local refs = Runtime.useInstance(function(ref)
		return create("Frame", {
			[ref] = "error",
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(231, 76, 60),
			Name = "Error",
			AutomaticSize = Enum.AutomaticSize.XY,

			create("UICorner"),

			create("UIPadding", {
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10),
			}),

			create("UIListLayout", {
				Padding = UDim.new(0, 10),
			}),

			create("TextLabel", {
				Font = Enum.Font.GothamBold,
				BackgroundTransparency = 1,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 20,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = "⚠️  An Error Occurred",
			}),

			create("TextLabel", {
				Name = "error",
				Font = Enum.Font.GothamMedium,
				BackgroundTransparency = 1,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 16,
				LineHeight = 1.2,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
			}),
		})
	end)

	local instance = refs.error

	instance.error.Text = text
end)
