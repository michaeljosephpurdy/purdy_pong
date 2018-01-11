Entity = Object:extend()

function Entity:new(x, y, speed, color)
  self.x = x
  self.y = y
  self.dx = 0
  self.dy = 0
  self.width = 0
  self.height = 0
  self.state = "idle"
  self.color = {255, 255, 255, 255} -- self:setColor(color)
  self.speed = speed
  entities:add(self)
end

function Entity:move(dt)
  self.x = self.x + (self.speed * self.dx) * dt
  self.y = self.y + (self.speed * self.dy) * dt
end

function Entity:update(dt)
  self:move(dt)
end

function Entity:setColor(color)
  if "white" == color then
    self.color = {255, 255, 255, 255}
  elseif "red" == color then
    self.color = {255, 0, 0, 255}
  elseif "blue" == color then
    self.color = {0, 0, 255, 255}
  end
end
