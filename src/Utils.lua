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

function Utils:offScreen(x, y)
 return (not self:notOffScreen(x, y))
end

function Utils:notOffScreen(x, y)
  return x >= self.minX and x <= self.maxX and y >= self.minY and y <= self.maxY
end

function Utils:isInTopLeftQuadrant(x, y)
  return self:isOnLeftSide(x) and self:isOnTopSide(y)
end 

function Utils:isInTopRightQuadrant(x, y)
  return self:isOnRightSide(x) and self:isOnTopSide(y)
end

function Utils:isInBottomLeftQuadrant(x, y)
  return self:isOnLeftSide(x) and self:isOnBottomSide(y)
end

function Utils:isInBottomRightQuadrant(x, y)
  return self:isOnRightSide(x) and self:isOnBottomSide(y)
end

function Utils:isOnLeftSide(x)
  return (x < self.midX)
end

function Utils:isOnRightSide(x)
  return (x > self.midX)
end

function Utils:isOnTopSide(y)
  return (y < self.midY)
end

function Utils:isOnBottomSide(y)
  return (y > self.midY)
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
