Nuke= Object:extend()

function Nuke:new(x, y, type)
  self.x = x
  self.y = y
  self.type = type
  if not self.type then
    self.type = 0
  end
  if type == 0 then
    self.proximity = false
  else
    self.proximity = true
  end
  self.image = love.graphics.newImage("images/NUKE.png")
end

function Nuke:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.type*gridSize,0,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end

function Nuke:update(dt)
end