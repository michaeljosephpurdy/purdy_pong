player = {};

function love.load()
  player.x = 20;
  player.y = 20;
  player.speed = 20;
  player.moveLeft = false;
  player.moveRight = false;
  player.moveUp = false;
  player.moveDown = false;
end

function love.update(dt)
  if player.moveLeft then
    player.x = player.x - player.speed * dt;
  end

  if player.moveRight then
    player.x = player.x + player.speed * dt;
  end

  if player.moveDown then
    player.y = player.y + player.speed * dt;
  end

  if player.moveUp then
    player.y = player.y - player.speed * dt;
  end
end

function love.draw()
	love.graphics.print("Hello world!", player.x, player.y);
end

function love.keypressed(key)
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

function love.keyreleased(key)
  if "a" == key then
    player.moveLeft = false;
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
