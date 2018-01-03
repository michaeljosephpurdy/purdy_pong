Player = Object:extend()

function Player:new(color, x, y, left, right)
  self.windowWidth = love.graphics.getWidth()
  self.windowHeight = love.graphics.getHeight()
  self:setColor(color)
  self.x = x
  self.y = y
  self.left = left
  self.right = right
  self.width = 120
  self.height = 40
  self.speed = 200
end

function Player:setColor(color)
  if "red" == color then
    self.color = {255, 0, 0, 255}
  elseif "blue" == color then
    self.color = {0, 0, 255, 255}
  end
end

function Player:update(dt)
  self:handleKeyboardInputs(dt)
  self:handleTouchInputs(dt)
end

function Player:handleKeyboardInputs(dt)
  if love.keyboard.isDown(self.left) then
    self:moveLeft(dt)
  elseif love.keyboard.isDown(self.right) then
    self:moveRight(dt)
  end
end

function Player:handleTouchInputs(dt)
    local touches = love.touch.getTouches()
    
    for i, id in ipairs(touches) do
      local x, y = love.touch.getPosition(id)
      if x > 0 and x < self.windowWidth / 2
        and y > 0 and y < self.windowHeight / 2 then
          self:moveLeft(dt)
      end
      if x > self.windowWidth / 2 and x < self.windowWidth
        and y > 0 and y < self.windowHeight / 2 then
          self:moveRight(dt)
      end
        
    end
end

function Player:moveLeft(dt)
  if self.x >= 0 then
    self.x = self.x - self.speed * dt
  end
end

function Player:moveRight(dt)
  if self.x + self.width <= self.windowWidth
   then
    self.x = self.x + self.speed * dt
  end
end

function Player:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end