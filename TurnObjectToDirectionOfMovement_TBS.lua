local fixate
local pickedup = false

function onPickedUp()
    pickedup = true
    fixate = {x = self.getRotation()["x"], y = self.getRotation()["y"], z = self.getRotation()["z"]}
end

function onDropped()
    pickedup = false
end

function update()
    if pickedup == true and math.sqrt(self.getVelocity()["x"]*self.getVelocity()["x"]
                        , self.getVelocity()["z"]*self.getVelocity()["z"]) > 1 then 
        local angle = math.atan2(self.getVelocity()["x"], self.getVelocity()["z"])

        fixate = {x = self.getRotation()["x"], y = math.deg(angle), z = self.getRotation()["z"]}

        --[[BUG? setRotionSmooth can't roteta the object]]--
        self.setRotation(fixate)
        
        elseif pickedup == true then
        --[[BUG? setRotionSmooth can't rotate the object]]--
        self.setRotation(fixate)
        self.setRotationSmooth(fixate)

    end
end
