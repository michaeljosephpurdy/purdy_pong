Player = Object:extend()

function Player:new(color, x, y, left, right)
  self.name = color
  self:setColor(color)
  self.x = x
  self.y = y
  self.left = left
  self.right = right
  self.width = utils:getPaddleWidth()
  self.height = utils:getPaddleHeight()
  self.speed = utils.windowWidth / self.width * 50
  self.collidePoint = self.x + (self.width - self.x)
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

function Player:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:handleKeyboardInputs(dt)
  if love.keyboard.isDown(self.left) then
    self:moveLeft(dt)
  elseif love.keyboard.isDown(self.right) then
    self:moveRight(dt)
  end
end

function Player:moveLeft(dt)
  if self.x >= 0 then
    self.x = self.x - self.speed * dt
  end
end

function Player:moveRight(dt)
  if self.x + self.width <= utils.windowWidth
   then
    self.x = self.x + self.speed * dt
  end
end

function Player:handleTouchInputs(dt)
    local touches = love.touch.getTouches()
    
    for i, id in ipairs(touches) do
      local x, y = love.touch.getPosition(id)
      if utils:offScreen(x, y) then
        break
      end
      if "red" == self.name then
        self:handleTopInputs(dt, x, y)
      end
      if "blue" == self.name then
        self:handleBottomInputs(dt, x, y)
      end
    end
end

function Player:handleTopInputs(dt, x, y)
  if "red" == self.name then
    if utils:isInTopLeftQuadrant(x, y) then
      self:moveLeft(dt)
    end
    if utils:isInTopRightQuadrant(x, y) then
      self:moveRight(dt)
    end
  end
end

function Player:handleBottomInputs(dt, x, y)
  if "blue" == self.name then
    if utils:isInBottomLeftQuadrant(x, y) then
      self:moveLeft(dt)
    end
    if utils:isInBottomRightQuadrant(x, y) then
      self:moveRight(dt)
    end
  end
end
