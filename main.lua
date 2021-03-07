require "engine.debug.vardump"

local shader

function love.load()
    local shaderCode = love.filesystem.read("shaders/fractal.glsl")
    shader = love.graphics.newShader(shaderCode)
end

function love.draw()
    love.graphics.setShader(shader)
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

function love.mousepressed(x, y)
    
end

function love.mousereleased(x, y)
    
end

function love.wheelmoved(x, y)
    
end

function love.update(dt)
    
end
