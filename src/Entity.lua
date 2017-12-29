local class = require 'middleclass'
Entity = class('Entity')

function Entity:initialize(x, y)
  self.x = x
  self.y = y
  self.speed = 20
  self.moveLeft = false
  self.moveRight = false
  self.moveUp = false
  self.moveDown = false
end

function Entity:update(dt)
  if self.moveLeft then
    self.x = self.x - self.speed * dt
  end

  if self.moveRight then
    self.x = self.x + self.speed * dt
  end

  if self.moveUp then
    self.y = self.y - self.speed * dt
  end

  if self.moveDown then
    self.y = self.y + self.speed * dt
  end
end
