CreateConVar("sonic_moneytime", 5, true)
CreateConVar("sonic_amount", 50000, true)


SWEP:AddFunction(function(self,data) 

  if data.keydown2 and data.keydown1 then

      local tr = self.Owner:GetEyeTrace()
      local ent = tr.Entity

      if  (ent:GetClass() == "sent_arc_atm") then

        if (self.Owner:GetNWBool("arcatm") == true) then return end

          local pos = ent:GetPos()
          pos:Add(Vector(0, 0, 20))

          print( GetConVar("sonic_moneytime") )

          DarkRP.createMoneyBag( pos, GetConVarNumber("sonic_amount") )
          self.Owner:SetNWBool("arcatm", true)

          timer.Create( "money", GetConVarNumber("sonic_moneytime"), 1, function ()
            self.Owner:SetNWBool("arcatm", false)
            self.Owner:ChatPrint("You can re-use ARC Bank money Hack!")
          end)

      end
    
  end



end)
