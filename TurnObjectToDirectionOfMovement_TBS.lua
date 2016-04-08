--[[set speed treshold for changing direction when dragging, need to spawn new object to take effect]]--
local speedTreshold = 1 

--[[local values]]--
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
    if pickedup == true then
         if math.sqrt(self.getVelocity()["x"]*self.getVelocity()["x"]
            , self.getVelocity()["z"]*self.getVelocity()["z"]) > speedTreshold then 
            local angle = math.atan2(self.getVelocity()["x"], self.getVelocity()["z"])

            fixate = {x = self.getRotation()["x"], y = math.deg(angle), z = self.getRotation()["z"]}

        
        else
            --[[BUG? the rotation is reset to original orintation unless setRotationSmooth is called]]--
            self.setRotationSmooth(fixate)
        end

        --[[BUG? setRotionSmooth can't rotate the object]]--
            self.setRotation(fixate)
    end
end
