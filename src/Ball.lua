Ball = Entity:extend()
Ball:implement(Entity)

function Ball:new(color)
  Ball.super.new(self, 20, 20, utils.windowWidth, color)
  self.width = 10
  self.height = 10
  self.dx = 1.33
  self.dy = .75
end

function Ball:bounce()
  self.dy = self.dy * -1
  self.dx = self.dx * -1
end

function Ball:couldCollideWith(player)
  return (math.abs(self.y - player.y) <= 20 and math.abs(self.x - player.x ) <= 20)
end

function Ball:update(dt)
  self:move(dt)
  if self.x < 0 or self.x > utils.windowWidth then
    self.dx = self.dx * -1
  end
  if self.y < 0 or self.y > utils.windowHeight then
    self.dy = self.dy * -1
  end
  if self:couldCollideWith(redPlayer) or self:couldCollideWith(bluePlayer) then
    self:bounce()
  end
end

function Ball:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end