local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    super.init(self, x, y, "bullets/ffroggiteye")

    self.physics.direction = dir
    self.physics.speed = speed

    self.timer = 0
    self.shootingtimer = 0
    self.circlingtimer = 0
    self.alpha = 0

    self.state = "SPAWNING"

end

function SmallBullet:update()
    self.timer = self.timer + DT
    if self.alpha < 1 and self.state == "SPAWNING" then
        self.alpha = self.alpha + DT
    elseif self.alpha >= 1 and self.state == "SPAWNING" then
        self.alpha = 1
        self.timer = 0
        self.state = "SHOOTING_"..self.eyecount
    end
    if self.eyecount == 3 then
        self.x = (math.sin(((math.pi*self.index) / (self.eyecount/2)) + (self.circlingtimer))) * 130 + (Game.battle.arena.left + Game.battle.arena.right)/2
        self.y = (math.cos(((math.pi*self.index) / (self.eyecount/2)) + (self.circlingtimer))) * 130 + (Game.battle.arena.top + Game.battle.arena.bottom)/2
    end
    if self.state == "SHOOTING_1" then
        self.shootingtimer = self.shootingtimer + DT
        self.x = (math.sin(self.timer*2)*50) + ((Game.battle.arena.left + Game.battle.arena.right)/2)
        if self.shootingtimer >= #Game.battle:getActiveEnemies() then
            self.shootingtimer = 0
            local angle = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle, 5)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle + math.rad(20), 5)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle + math.rad(40), 5)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle - math.rad(20), 5)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle - math.rad(40), 5)
            Assets.playSound("wing")
        end
    end
    if self.state == "SHOOTING_2" then
        self.shootingtimer = self.shootingtimer + DT
        if self.index == 1 then
            self.y = (math.sin(self.timer*2)*50) + ((Game.battle.arena.top + Game.battle.arena.bottom)/2)
        else
            self.y = (-math.sin(self.timer*2)*50) + ((Game.battle.arena.top + Game.battle.arena.bottom)/2)
        end
        if self.shootingtimer >= (#Game.battle:getActiveEnemies()/1.5) + self.index/10 then
            self.shootingtimer = 0
            local angle = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle, 5)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle + math.rad(20), 5)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle - math.rad(20), 5)
            Assets.playSound("wing")
        end
    end
    if self.state == "SHOOTING_3" then
        self.shootingtimer = self.shootingtimer + DT
        self.circlingtimer = self.circlingtimer + DT
        if self.shootingtimer >= (#Game.battle:getActiveEnemies()/4) + self.index/10 then
            self.shootingtimer = 0
            local angle = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
            self.wave:spawnBullet("arrowbullet", self.x, self.y, angle, 5)
            Assets.playSound("wing")
        end
    end

    super.update(self)
end

return SmallBullet