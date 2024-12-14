local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)

    self.timer = 0
    self.bulletlist = {}

    self.state = "CIRCLING" -- CIRCLING, SHOOTING
    self.shotflies = 0

    self.time = 13
end

function Basic:onStart()
    local totalbullets = (24/#Game.battle:getActiveEnemies()) * #self:getAttackers()
    for i = 1, totalbullets, 1 do
        local bullet = self:spawnBullet("flycircle", Game.battle.arena.left, Game.battle.arena.top, math.rad(180), 0)
        bullet.index = i
        bullet.total = totalbullets
        table.insert(self.bulletlist, bullet)
    end
end

function Basic:update()
    self.timer = self.timer + DT
    if self.timer > 1.5 and self.state == "CIRCLING" then
        self.timer = 0
        self.state = "SHOOTING"
    end
    if self.timer > 10/#self.bulletlist and self.state == "SHOOTING" then
        self.timer = 0
        self.shotflies = self.shotflies + 1
        if self.shotflies <= #self.bulletlist then
            local angle = Utils.angle(self.bulletlist[self.shotflies].x, self.bulletlist[self.shotflies].y, Game.battle.soul.x, Game.battle.soul.y)
            self.bulletlist[self.shotflies].state = "SHOT"
            self.bulletlist[self.shotflies].physics.direction = angle
            self.bulletlist[self.shotflies].physics.speed = 4
        end
    end

    super.update(self)
end

return Basic