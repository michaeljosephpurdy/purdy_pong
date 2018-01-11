function love.load()
  Object = require "libraries.classic"
  require "src.Entities"
  entities = Entities()
  require "src.Utils"
  utils = Utils()
  require "src.Entity"
  require "src.Player"
  require "src.Ball"
  
  redPlayer = Player("red", utils.midX, utils:getRedStart(), "left", "right")
  bluePlayer = Player("blue", utils.midX, utils:getBlueStart(), "a", "d")
  ball = Ball("white")
end

function love.update(dt)
  entities:update(dt)
  -- ball:update(dt)
end

function love.draw()
  redPlayer:draw()
  bluePlayer:draw()
  ball:draw()
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
