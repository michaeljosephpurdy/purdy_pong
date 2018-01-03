Player = Object:extend()

function Player:new(color, x, y, left, right)
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
  if love.keyboard.isDown(self.left) then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown(self.right) then
    self.x = self.x + self.speed * dt
  end
end

function Player:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end