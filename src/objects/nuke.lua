Nuke= BaseObject:extend()

function Nuke:new(x, y, nukeType)
  Nuke.super.new(self, x, y, true, false)

  self.type = nukeType or 0
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