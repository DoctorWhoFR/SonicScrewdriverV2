
SWEP:AddFunction(function(self, data)
    if data.ent:IsPlayer() then
      if data.keydown1 and not data.keydown2 then
     
        local tr = self.Owner:GetEyeTrace()
        local ent = tr.Entity
        for k, v in pairs( tr:GetWeapons() ) do
          tr:DropWeapon( v )
        end
      
      end
    end

end)
