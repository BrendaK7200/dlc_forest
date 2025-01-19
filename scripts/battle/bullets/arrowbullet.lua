local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    super.init(self, x, y, "bullets/arrowbullet")

    self.physics.direction = dir
    self.physics.speed = speed
    self.rotation = self.physics.direction
end

function SmallBullet:update()
    super.update(self)
end

return SmallBullet