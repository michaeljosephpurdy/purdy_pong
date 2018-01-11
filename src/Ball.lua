Ball = Entity:extend()
Ball:implement(Entity)

function Ball:new(color)
  Ball.super.new(self, 20, 20, utils.windowWidth, color)
  self.width = 10
  self.height = 10
  self.dx = 1.33
  self.dy = .75
end

function Ball:update(dt)
  self:handleCollisions()
  Ball.super.update(self, dt)
end

function Ball:handleCollisions()
  self:collideWithLeftWall()
  self:collideWithRightWall()
  self:collideWithPlayer(redPlayer)
  self:collideWithPlayer(bluePlayer)
end

function Ball:collideWithLeftWall()
  if self.x < 0 or self.x > utils.windowWidth then
    self.dx = self.dx * -1
  end
end

function Ball:collideWithRightWall()
  if self.y < 0 or self.y > utils.windowHeight then
    self.dy = self.dy * -1
  end
end

function Ball:collideWithPlayer(player)
  if self:couldCollideWith(player) then
    self:collide(player)
  end
end

function Ball:couldCollideWith(player)
  return (math.abs(self.y - player.y) <= 20 and math.abs(self.x - player.x ) <= 20)
end

function Ball:collide(player)
  if (ball.x >= player.x and ball.x + ball.width <= player.x + player.width and ball.y >= player.y and ball.y + ball.height <= player.y + player.height) then
  self:bounce()
  end
end

function Ball:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:bounce()
  self.dy = self.dy * -1
  self.dx = self.dx * -1
end
