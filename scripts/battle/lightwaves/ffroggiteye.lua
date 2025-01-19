local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)

    self.timer = 0
    self.bulletlist = {}

    self.time = 13
end

function Basic:onStart()
    Assets.playSound("spearappear_choppy")
    local attackersNumber = #self:getAttackers()
    if attackersNumber == 1 then
        local bullet = self:spawnBullet("ffroggiteye", (Game.battle.arena.left + Game.battle.arena.right)/2, Game.battle.arena.top - 40, math.rad(180), 0)
        bullet.eyecount = attackersNumber
        bullet.index = 1
    elseif attackersNumber == 2 then
        local bullet_1 = self:spawnBullet("ffroggiteye", Game.battle.arena.left - 40, (Game.battle.arena.top + Game.battle.arena.bottom)/2, math.rad(180), 0)
        local bullet_2 = self:spawnBullet("ffroggiteye", Game.battle.arena.right + 40, (Game.battle.arena.top + Game.battle.arena.bottom)/2, math.rad(180), 0)
        bullet_1.eyecount = attackersNumber
        bullet_1.index = 1
        bullet_2.eyecount = attackersNumber
        bullet_2.index = 2
    elseif attackersNumber == 3 then
        for i = 1, 3, 1 do
            local bullet = self:spawnBullet("ffroggiteye", Game.battle.arena.left, Game.battle.arena.top, math.rad(180), 0)
            bullet.eyecount = attackersNumber
            bullet.index = i
        end
    end
end

function Basic:update()super.update(self)
end

return Basic