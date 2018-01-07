Ball = Object:extend()

function Ball:new(color)
  self.x = 50
  self.y = 50
  self:setColor(color)
  self.width = 10
  self.height = 10
  self.speed = utils.windowWidth / self.width * 10
  self.dx = 1.33
  self.dy = .75
end

function Ball:setColor(color)
  if "white" == color then
    self.color = {255, 255, 255, 255}
  elseif "red" == color then
    self.color = {255, 0, 0, 255}
  elseif "blue" == color then
    self.color = {0, 0, 255, 255}
  end
end

function Ball:bounce()
  self.dy = self.dy * -1
  self.dx = self.dx * -1
end

function Ball:move(dt)
  self.x = self.x + (self.speed * self.dx) * dt
  self.y = self.y + (self.speed * self.dy) * dt
end

function Ball:couldCollideWith(player)
  print("self.y" .. self.y .. "self.x" .. self.x .. "player.y" .. player.y .. "player.x" .. player.x)
  return math.abs(self.y - player.y) <= 20 and math.abs(self.x - player.x ) <= 20
end

function Ball:update(dt)
  self:move(dt)
  if utils:offScreen(self.x, self.y) then
    self.dx = self.dx * -1
  end
  if self:couldCollideWith(redPlayer) or self:couldCollideWith(bluePlayer) then
    print("couldBounce")
    self:bounce()
  end
end

function Ball:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:string()
  return "self.x  " .. self.x ..
         "self.y  " .. self.y ..
         "self.dx " .. self.dx ..
         "self.dy " .. self.dy
end