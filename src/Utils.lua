Utils = Object:extend()

function Utils:new()
  self.windowWidth, self.windowHeight = love.graphics.getDimensions()
  self.minX = 0
  self.minY = 0
  self.midX = self.windowWidth / 2
  self.midY = self.windowHeight / 2
  self.maxX = self.windowWidth
  self.maxY = self.windowHeight
end

function Utils:isInTopLeftQuadrant(x, y)
  if self:notOffScreen(x, y) then
    if x < self.midX and y < self.midY then
      return true
    end
  end
  return false
end

function Utils:isInTopRightQuadrant(x, y)
  if self:notOffScreen(x, y) then
    if x > self.midX and y < self.midY then
      return true
    end
  end
  return false
end

function Utils:isInBottomLeftQuadrant(x, y)
  if self:notOffScreen(x, y) then
    if x < self.midX and y > self.midY then
      return true
    end
  end
  return false
end

function Utils:isInBottomRightQuadrant(x, y)
  if self:notOffScreen(x, y) then
    if x > self.midX and y > self.midY then
      return true
    end
  end
  return false
end

function Utils:getRedStart()
  return self:getPaddleHeight()
end

function Utils:getBlueStart()
  return self.windowHeight - self:getPaddleHeight() * 2
end

function Utils:getPaddleHeight()
  return self.windowHeight / 10
end

function Utils:getPaddleWidth()
  return self.windowWidth / 3
end

function Utils:notOffScreen(x, y)
  if x >= self.minX and 
     x <= self.maxX and 
     y >= self.minY and 
     y <= self.maxY then
    return true
  end
  return false
end
