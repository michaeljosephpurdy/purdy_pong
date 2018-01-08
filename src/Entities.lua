Entities = Object:extend()

function Entities:new()
  self.entities = {}
end

function Entities:add(entity)
  table.insert(self.entities, entity)
end

function Entities:update(dt)
  for i, v in ipairs(self.entities) do
     v:update(dt)
   end
 end

function Entities:draw()
  for entity in self.entities do
     Entity.draw(entityt)
   end
end
