SWEP:AddFunction(function(self,data)
  if data.keydown2 and not data.keydown1 then
    local tr  = self.Owner:GetEyeTrace()
  	local e = tr.Entity

  	if IsValid(e) then
  		if e:IsNPC() then
  			self.Owner:ChatPrint( "Health: " .. e:Health() )
  		elseif e:IsPlayer() then
  			self.Owner:ChatPrint( "Health: " .. e:Health() )
  		end
  	end

  end
end)
