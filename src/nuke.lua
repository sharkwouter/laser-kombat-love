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
  self.image = love.graphics.newImage("images/NUKE.bmp")
end

function Nuke:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.type*40,0,40,40,self.image:getDimensions()), (self.x-1)*40, (self.y-1)*40)
end

function Nuke:update(dt)
end