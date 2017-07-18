
SWEP:AddFunction(function(self, data)
   
    if data.keydown1 and not data.keydown2 then
		
		local tr = self.Owner:GetEyeTrace()
		local ent = tr.Entity

		if IsValid(ent) then
			if ent:GetClass() == "item_healthcharger" then
				local new = ents.Create("item_healthcharger")
					new:SetPos(ent:GetPos())
					new:SetAngles(ent:GetAngles())
					new:Spawn()
					new:Activate()
					new:EmitSound("items/suitchargeok1.wav")

					undo.ReplaceEntity(ent, new)
					cleanup.ReplaceEntity(ent, new)

					ent:Remove()
		elseif ent:GetClass() == "item_suitcharger" then
			ent:Fire("Recharge")
		end
	end
       
    end

end)
