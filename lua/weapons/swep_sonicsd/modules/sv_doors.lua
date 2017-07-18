SWEP:AddFunction(function(self,data)

		local tr = self.Owner:GetEyeTrace()
        local ent = tr.Entity

		if data.keydown1 and not data.keydown2 then
			if IsValid(ent) then
				local class = ent:GetClass()
				local valid = true

				if class == "func_movelinear" then -- ???
					ent:Input("Open")
				elseif class == "prop_door_rotating" then -- HL2 door
					ent:Fire("unlock", "", 0.1)
					ent:Fire("open", "", 0.1)
				elseif ent.isFadingDoor and ent.fadeActivate then -- DarkRP door
					ent:fadeActivate()
				elseif class == "keypad" or class == "keypad_wire" then -- Nonwire keypad
					if ent.Process then ent:Process(true) end
				elseif class == "gmod_wire_keypad" and ent.IsWire and Wire_TriggerOutput then -- Wire keypad
					-- Ive not found any function similar to Process for wire keypad
					ent:SetNetworkedString("keypad_display", "y")
					Wire_TriggerOutput(ent, "Valid", 1)
					ent:EmitSound("buttons/button9.wav")
				else
					valid = false
				end
	
				if valid then
					sound.Play("doors/door_locked2.wav", ent:GetPos(), 60, 110)
				end
			end
		end
	
		if data.keydown2 and not data.keydown1 then
			if IsValid(ent) then
				local class = ent:GetClass()
				local valid = true

				if class == "func_movelinear" then -- ???
					ent:Input("Close")
				elseif class == "prop_door_rotating" then -- HL2 door
					ent:Fire("lock", "", 0.1)
					ent:Fire("close", "", 0.1)
				else
					valid = false
				end
	
				if valid then
					sound.Play("doors/door_locked2.wav", ent:GetPos(), 60, 110)
				end
			end
		end 
end)
