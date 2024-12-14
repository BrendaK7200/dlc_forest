local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    super.init(self, x, y, "bullets/flybullet")

    self.physics.direction = dir
    self.physics.speed = speed

    self.timer = 0

    self.state = "CIRCLING"
end

function SmallBullet:update()
    self.timer = self.timer + DT
    if self.state == "CIRCLING" then
        self.x = (math.sin(((math.pi*self.index) / (self.total/2)) + (self.timer))) * 60 + (Game.battle.arena.left + Game.battle.arena.right)/2
        self.y = (math.cos(((math.pi*self.index) / (self.total/2)) + (self.timer))) * 60 + (Game.battle.arena.top + Game.battle.arena.bottom)/2
    end

    super.update(self)
end

return SmallBullet