function love.load()
  Object = require "libraries.classic"
  require "src.Player"
  
  redPlayer = Player("red", 20, 20, "left", "right")
  bluePlayer = Player("blue", 20, 330, "a", "d")
end

function love.update(dt)
  redPlayer:update(dt)
  bluePlayer:update(dt)
end

function love.draw()
  redPlayer:draw()
  bluePlayer:draw()
end

function love.keypressed(key)
  if "q" == key or
     "escape" == key then
    love.event.quit()
  end
end