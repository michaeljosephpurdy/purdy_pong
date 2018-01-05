Utils = Object:extend()

function Utils:new()
  self.windowWidth = love.graphics.getWidth()
  self.windowHeight = love.graphics.getHeight()
  self.minX = 0
  self.minY = 0
  self.midX = windowWidth / 2
  self.midY = windowWidth / 2
  self.maxX = self.windowWidth
  self.maxY = self.windowHeight
end

function Utils:isInTopLeftQuadrant(x, y)
  if notOffScreen(x, y) then
    if x <= self.midX and y <= self.midY then
      return true
    end
    end
  return false
end

function Utils:isInTopRightQuadrant(x, y)
  if notOffScreen(x, y) then
    if x >= self.midX and y <= self.midY then
      return true
    end
    end
  return false
end

function Utils:isInBottomLeftQuadrant(x, y)
  if notOffScreen(x, y) then
    if x <= self.midX and y > self.midY then
      return true
    end
    end
  return false
end

function Utils:isInBottomRightQuadrant(x, y)
  if notOffScreen(x, y) then
    if x > self.midX and y >= self.midY then
      return true
    end
    end
  return false
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