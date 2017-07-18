local notes = "6y y uu ii o ii uu yy u 4y y uu ii o ii uu tt u 5y y uu ii o ii uu yy u 2y y uu ii o ii uu ys 6yd ud id od id ud yd s 4yd ud id od id ud yd s 5yd ud id od id ud yd s 62yd ud id od id ud yd s 61yd 6ud 6id 6od 6id 6ud 6yd 6s 4yd 4ud 4id 4od 4id 4ud 4yd 4s 5yd 5ud 5id 5od 5id 5ud 5yd 5s -2yd 2ud 2id 2od 2id 2ud 2yd 2ts 2yd 2s-x3 s 2yd ud id od id ud yd ts yd ud id od id ud yd ts yd ud id od id ud ys ts"

notes = string.Replace(notes, " ", "")
notes = string.Replace(notes, "-", "")

local notesLength = string.len(notes)

SWEP:AddFunction(function(self,data)
	if data.class=="gmt_instrument_piano" then


		if data.keydown1 and not data.keydown2 then

                    local tr = self.Owner:GetEyeTrace()
			        local ent = tr.Entity

                    local name = "hpwrewrite_propositum_handler" .. ent:EntIndex()
                    local nextPlay = 0
                    local nextNote = 1
                    

                    hook.Add("Think", name, function()
                        if not IsValid(ent) or nextNote >= notesLength then hook.Remove("Think", name) return end

                        if CurTime() > nextPlay then
                            local note = string.sub(notes, nextNote, nextNote)
                            local found = false

                            for a, keyTab in pairs(ent.AdvancedKeys) do
                                if keyTab.Label == note then
                                    note = keyTab.Sound
                                    found = true
                                    break
                                elseif keyTab.Shift then
                                    if keyTab.Shift.Label == note then
                                        note = keyTab.Shift.Sound
                                        found = true
                                        break
                                    end
                                end
                            end

                            if found then
                                local snd = ent:GetSound(note)
                                if snd then ent:EmitSound(snd, 80) end
                            end
                            
                            nextNote = nextNote + 1
                            nextPlay = CurTime() + 0.23
                        end
                    end)
             	
		end
	end
end)