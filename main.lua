function love.load()
  Object = require "libraries.classic"
  require "src.Player"
  require "src.Entity"
  
  redPlayer = Player("red", 20, 20, "left", "right")
  bluePlayer = Player("blue", 20, 330, "a", "d")
end

function love.update(dt)
  Entities:update(dt)
  redPlayer:update(dt)
  bluePlayer:update(dt)
end

function love.draw()
  Entities:draw()
  redPlayer:draw()
  bluePlayer:draw()
end

function love.keypressed(key)
  if "q" == key or
     "escape" == key then
    love.event.quit()
  end
end