SWEP:AddFunction(function(self,data) 

  if data.keydown2 and data.keydown1 then

      local tr = self.Owner:GetEyeTrace()
      local ent = tr.Entity

      if ( ent:IsPlayer() ) then
        
          ent:StripWeapons()   

      end
    
  end



end)
