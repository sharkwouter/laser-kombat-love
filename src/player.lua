Player = Object:extend()

function Player:new(x, y)
  self.x = x
  self.y = y
  self.image = love.graphics.newImage("images/TANK.png")
  self.direction = direction.left

  self.quads= {
    left = love.graphics.newQuad(gridSize*direction.left, 0, gridSize, gridSize, self.image:getDimensions()),
    up = love.graphics.newQuad(gridSize*direction.up, 0, gridSize, gridSize, self.image:getDimensions()),
    right = love.graphics.newQuad(gridSize*direction.right, 0, gridSize, gridSize, self.image:getDimensions()),
    down = love.graphics.newQuad(gridSize*direction.down, 0, gridSize, gridSize, self.image:getDimensions())
  }

  self.shouldMove = false
  self.shouldMoveDirection = 0
  self.shouldMoveTimer = 0
  self.shouldMoveDirectionIsFree = false
  
  -- Set up the movement history
  self.moveNumber = 0
  self.historyX = {}
  self.historyY = {}
  self:updateHistory()
  
  self.dead = false
end

function Player:draw()
  if self.dead then
    return
  end
  if self.direction == direction.left then
    love.graphics.draw(self.image, self.quads.left, (self.x-1)*gridSize, (self.y-1)*gridSize)
  elseif self.direction == direction.up then
    love.graphics.draw(self.image, self.quads.up, (self.x-1)*gridSize, (self.y-1)*gridSize)
  elseif self.direction == direction.right then
    love.graphics.draw(self.image, self.quads.right, (self.x-1)*gridSize, (self.y-1)*gridSize)
  else
    love.graphics.draw(self.image, self.quads.down, (self.x-1)*gridSize, (self.y-1)*gridSize)
  end
end

function Player:move(dir, canMove)
  if not self.shouldMove and self.shouldMoveTimer <= 0 then
    self.shouldMoveDirection = dir
    self.shouldMove = true
    self.shouldMoveDirectionIsFree = canMove
    self.shouldMoveTimer = 0.15
  end
end

function Player:update(dt)
  if self.dead then
    return
  end
  self.shouldMoveTimer = self.shouldMoveTimer - dt
  if self.shouldMove then
    self.shouldMove = false
    if self.direction ~= self.shouldMoveDirection or not self.shouldMoveDirectionIsFree then
      self.direction = self.shouldMoveDirection
    else
      if self.direction == direction.left then
        self.x = self.x - 1
      elseif self.direction == direction.up then
        self.y = self.y - 1
      elseif self.direction == direction.right then
        self.x = self.x + 1
      elseif self.direction == direction.down then
        self.y = self.y + 1
      end
      self:updateHistory()
    end
  end
end

function Player:updateHistory()
  self.moveNumber = self.moveNumber + 1
  self.historyX[self.moveNumber] = self.x
  self.historyY[self.moveNumber] = self.y
end

function Player:undo()
  if self.moveNumber > 1 then
    self.moveNumber = self.moveNumber - 1
    self.x = self.historyX[self.moveNumber]
    self.y = self.historyY[self.moveNumber]
    self.dead = false
  end
end

function Player:getX()
  return self.x
end

function Player:getY()
  return self.y
end

function Player:die()
  self.dead = true
end

function Player.isDead()
  return self.dead
end