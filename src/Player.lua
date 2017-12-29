Player = class('Player')

function Player:initialize(x, y)
  self.x = x;
  self.y = y;
  self.speed = 20;
  self.moveLeft = false;
  self.moveRight = false
  self.moveUp = false;
  self.moveDown = false;
end

function Player:update(dt)
  if player.moveLeft then
    player.x = player.x - player.speed * dt;
  end

  if player.moveRight then
    player.x = player.x + player.speed * dt;
  end

  if player.moveUp then
    player.y = player.y - player.speed * dt;
  end

  if player.moveDown then
    player.y = player.y + player.speed * dt;
  end
end

function Player:pressedKeys(key)
  if "a" == key then
    player.moveLeft = true;
  end

  if "d" == key then
    player.moveRight = true;
  end

  if "w" == key then
    player.moveUp = true;
  end

  if "s" == key then
    player.moveDown = true;
  end
end

function Player:releasedKeys(key)
  if "a" == key then
    player.moveLeft = false
  end

  if "d" == key then
    player.moveRight = false;
  end

  if "w" == key then
    player.moveUp = false;
  end

  if "s" == key then
    player.moveDown = false;
  end
end
