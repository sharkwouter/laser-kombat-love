BaseObject = Object:extend()

function BaseObject:new(x, y, movable, destructable)
  self.x = x
  self.y = y
  self.destructable = destructable or false
  self.movable = movable or false
end

function BaseObject:update(dt)
end

function BaseObject:getX()
  return self.x
end

function BaseObject:getY()
  return self.y
end

function BaseObject:setMovable(value)
  self.movable = value
end

function BaseObject:setDestructable(value)
  self.destructable = value
end


function BaseObject:isMovable()
  return self.movable
end

function BaseObject:isDestructable()
  return self.destructable
end