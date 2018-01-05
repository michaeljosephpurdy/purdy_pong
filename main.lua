function love.load()
  Object = require "libraries.classic"
  require "src.Utils"
  require "src.Player"
  utils = Utils()
  
  redPlayer = Player("red", utils.midX, utils:getRedStart(), "left", "right")
  bluePlayer = Player("blue", utils.midX, utils:getBlueStart(), "a", "d")
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

love.resize = function(w, h)
  push:resize(w, h)
end
