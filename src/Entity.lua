local Entity = {}
Entity.__index = Entity

function Entity:new(x, y)
  local entity = {}
  setmetatable(entity, Entity)
  entity.x = x
  entity.y = y
  entity.speed= 20
  entity.moveLeft = false
  entity.moveRight = false
  entity.moveUp = false
  entity.moveDown = false
  return entity
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

return Entity