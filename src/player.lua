Player = Object:extend()

function Player:new(x, y)
  self.x = x
  self.y = y
  self.image = love.graphics.newImage("images/TANK.bmp")
  self.directions = {
    left = 0,
    up = 1,
    right = 2,
    down = 3
  }
  self.direction = self.directions.left

  self.quads= {
    left = love.graphics.newQuad(40*self.directions.left, 0, 40, 40, self.image:getDimensions()),
    up = love.graphics.newQuad(40*self.directions.up, 0, 40, 40, self.image:getDimensions()),
    right = love.graphics.newQuad(40*self.directions.right, 0, 40, 40, self.image:getDimensions()),
    down = love.graphics.newQuad(40*self.directions.down, 0, 40, 40, self.image:getDimensions())
  }

  self.respawn = {
      x = self.x,
      y = self.y
    }
end

function Player:draw()
  if self.direction == self.directions.left then
    love.graphics.draw(self.image, self.quads.left, (self.x-1)*40, (self.y-1)*40)
  elseif self.direction == self.directions.up then
    love.graphics.draw(self.image, self.quads.up, (self.x-1)*40, (self.y-1)*40)
  elseif self.direction == self.directions.right then
    love.graphics.draw(self.image, self.quads.right, (self.x-1)*40, (self.y-1)*40)
  else
    love.graphics.draw(self.image, self.quads.down, (self.x-1)*40, (self.y-1)*40)
  end
end

function Player:update(dt)
  thing = dt
end

function Player:getX()
  return self.x
end

function Player:getY()
  return self.y
end