local serpent = require "lib.debug.serpent"

-- usage: vardump(x1, test, myVar) or vardump({ship = self, dt = dt})
vardump = function(...)
    local args = {...}
    print("================VARDUMP=====================")
    if #args == 1 then
        print(serpent.block(args))
    else
        for key, value in pairs(args) do
            if key then print(key..':') end
            print(serpent.block(value))
        end
    end
    print("============================================")
end
