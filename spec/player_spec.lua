local class = require 'middleclass'
local player = require 'Player'

describe('player', function()
 describe('has Super Class - Entity values', function()
    it('has moveLeft', function()
      assert.equals('false', player.moveLeft)
    end)
  end)
end)
