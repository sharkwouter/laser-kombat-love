Tee = BaseObject:extend()

function Tee:new(x, y, teeType)
  Tee.super.new(self, x, y, true, false)
  self.type = teeType or 0
  self.image = love.graphics.newImage("images/TEE.png")
end

function Tee:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(gridSize*self.type,0,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end

function Tee:update(dt)
end