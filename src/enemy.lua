Enemy = Object:extend()

function Enemy:new(x, y)
  self.x = x
  self.y = y
  self.direction = 0
  self.image = love.graphics.newImage("images/TANK.png")
  self.animationDuration = 1
  self.animationTimer = self.animationDuration + math.random(100)/100
end

function Enemy:draw()
  love.graphics.draw(self.image, love.graphics.newQuad(self.direction*gridSize,gridSize,gridSize,gridSize,self.image:getDimensions()), (self.x-1)*gridSize, (self.y-1)*gridSize)
end

function Enemy:update(dt)
  self.animationTimer = self.animationTimer -dt
  if self.animationTimer < 0 then
    local turn = math.random(20)
    if turn < 4 then
      self.direction = turn
    end
    self.animationTimer = self.animationDuration
  end
end