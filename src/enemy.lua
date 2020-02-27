Enemy = Object:extend()

function Enemy:new(x, y)
  self.x = x
  self.y = y
  self.direction = 0
  self.image = love.graphics.newImage("images/TANK.bmp")
end

function Enemy:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.direction*40,40,40,40,self.image:getDimensions()), (self.x-1)*40, (self.y-1)*40)
end

function Enemy:update(dt)
end