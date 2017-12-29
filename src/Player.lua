local class = require 'middleclass'
Player = class('Player', 'Entity')

function Player:initialize(x, y)
  Entity.initialize(self, 20, 20)
end

function Player:update(dt)
  Entity.update(self, dt)
end

function Player:pressedKeys(key)
  if "a" == key then
    self.moveLeft = true
  end

  if "d" == key then
    self.moveRight = true
  end

  if "w" == key then
    self.moveUp = true
  end

  if "s" == key then
    self.moveDown = true
  end
end

function Player:releasedKeys(key)
  if "a" == key then
    self.moveLeft = false
  end

  if "d" == key then
    self.moveRight = false
  end

  if "w" == key then
    self.moveUp = false
  end

  if "s" == key then
    self.moveDown = false
  end
end
