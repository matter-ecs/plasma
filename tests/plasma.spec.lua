local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Plasma = require(ReplicatedStorage.Plasma)

return function()
	describe("plasma", function()
		it("should create and destroy things", function()
			local folder = Instance.new("Folder")
			local root = Plasma.new(folder)

			Plasma.start(root, function()
				Plasma.button("hello")
			end)

			expect(folder:FindFirstChildWhichIsA("TextButton")).to.be.ok()

			Plasma.start(root, function() end)

			expect(folder:FindFirstChildWhichIsA("TextButton")).to.never.be.ok()
		end)

		it("should create and destroy from a single start point", function()
			local folder = Instance.new("Folder")
			local root = Plasma.new(folder)

			local function start(visible)
				Plasma.start(root, function()
					if visible then
						Plasma.button("hello")
					end
				end)
			end

			start(true)
			expect(folder:FindFirstChildWhichIsA("TextButton")).to.be.ok()

			start(false)

			expect(folder:FindFirstChildWhichIsA("TextButton")).to.never.be.ok()
		end)

		it("should support `useRefs` hook", function()
			local folder = Instance.new("Folder")
			local root = Plasma.new(folder)

			local refsTable

			local function DescendantComponent()
				return Plasma.create("Frame", {
					[Plasma.useRefs()] = "baz",
					BackgroundColor3 = Color3.fromHex("#00f"),
				})
			end

			local function AncestorComponent()
				local ref = Plasma.useRefs()
				refsTable = ref

				return Plasma.create("Frame", {
					[ref] = "foo",
					BackgroundColor3 = Color3.fromHex("#f00"),
					-- children
					Plasma.create("Frame", {
						BackgroundColor3 = Color3.fromHex("#0f0"),
						-- children
						DescendantComponent(),
					}),
				})
			end

			local frame = Plasma.beginFrame(root, function(tbl)
				expect(Plasma.useInstance(AncestorComponent)).to.equal(tbl)
			end, refsTable)

			Plasma.continueFrame(frame, function(refs, red, blue)
				expect(refs.foo).to.be.ok()
				expect(refs.bar).to.never.be.ok()
				expect(refs.baz).to.be.ok()

				expect(refs.foo.BackgroundColor3).to.equal(red)
				expect(refs.baz.BackgroundColor3).to.equal(blue)
			end, refsTable, Color3.fromHex("#f00"), Color3.fromHex("#00f"))

			Plasma.finishFrame(root)
		end)

		it("should disallow `useRefs` outside `useInstance`", function()
			local folder = Instance.new("Folder")
			local root = Plasma.new(folder)

			Plasma.start(root, function()
				Plasma.useInstance(function()
					return Plasma.create("Folder")
				end)

				expect(Plasma.useRefs).to.throw()
			end)
		end)

		it("should disallow mutating the returned refs table", function()
			local folder = Instance.new("Folder")
			local root = Plasma.new(folder)

			local refs

			Plasma.start(root, function()
				refs = Plasma.useInstance(function(ref)
					return Plasma.create("Folder", { [ref] = "test" })
				end)
			end)

			expect(function()
				refs.test = true
			end).to.throw()
		end)
	end)
end
