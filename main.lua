local x, y, dx, dy, width, height, radius
local bounce
local bounceSound
local bounceSpeed = 0.05
local radius = 50
local dx = 0
local dy = 0
local bounce = 0


function love.load()
    width, height = love.graphics.getDimensions()
    x = width / 2
    y = height / 2
    bounceSound = love.audio.newSource("bounce.wav", "static")
end

function love.update()
    bounce = bounce - bounceSpeed
    x = x + dx
    y = y + dy

    if bounce < 0 then
        bounce = 0
    end

    if (x + radius) > width or (x - radius) < 0 then
        dx = -dx
        bounce = 1
        bounceSound:seek(0)
        bounceSound:play()
    end

    if (y + radius) > height or (y - radius) < 0 then
        dy = -dy
        bounce = 1
        bounceSound:seek(0)
        bounceSound:play()
    end
end

function love.keypressed(key)
    if key == "left" then
        dx = dx - 1
    end

    if key == "right" then
        dx = dx + 1
    end

    if key == "up" then
        dy = dy - 1
    end

    if key == "down" then
        dy = dy + 1
    end

    if key == "escape" then
        love.event.quit()
    end

    if key == "z" then
        radius = radius - 1
    end

    if key == "x" then
        radius = radius + 1
    end
end

function love.draw()
    local r = bounce / 2 + 0.5
    local g = 1 - bounce
    local b = 0
    love.graphics.setColor(r,g,b)
    love.graphics.circle("fill", x, y, radius)
end