class = require "libraries/middleclass"
require "src/Entity"
require "src/Player"

function love.load()
  player = Player:new(20, 20)
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
	love.graphics.print("Hello world!", player.x, player.y)
end

function love.keypressed(key)
  player:pressedKeys(key)
  if "q" == key then
    love.event.quit()
  end
end

function love.keyreleased(key)
  player:releasedKeys(key)
end
