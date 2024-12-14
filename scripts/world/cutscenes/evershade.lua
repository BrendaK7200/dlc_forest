return {
    ---@param cutscene WorldCutscene
    froggit = function(cutscene, event)
        local brenda = cutscene:getCharacter("brenda_lw")
        local susie = cutscene:getCharacter("susie_lw")
        local jamm = cutscene:getCharacter("jamm_lw") or cutscene:getCharacter("jammarcy_light")
        local leader = cutscene:getCharacter(Game.world.player.actor.id)
        local follower1 = nil
        local follower2 = nil
        if #Game.party >= 2 then
            follower1 = cutscene:getCharacter(Game.party[2].actor.id)
            if #Game.party == 3 then
                follower2 = cutscene:getCharacter(Game.party[3].actor.id)
            end
        end
        local froggit = cutscene:getCharacter("feralfroggit")
        cutscene:detachCamera()
        cutscene:detachFollowers()
        cutscene:walkTo(leader, 340, 520, 2, "up")
        if #Game.party >= 2 then
            if #Game.party == 3 then
                cutscene:walkTo(follower1, 300, 560, 2, "up")
                cutscene:walkTo(follower2, 380, 560, 2, "up")
            else
                cutscene:walkTo(follower1, 340, 560, 2, "up")
            end
            cutscene:walkTo(brenda, 340, 600, 2, "up")
        else
            cutscene:walkTo(brenda, 340, 560, 2, "up")
        end
        cutscene:panTo(340, 500, 2)
        cutscene:wait(2)
        brenda:alert()
        cutscene:wait(0.5)
        cutscene:showNametag("Brenda")
        cutscene:text("* Hey,[wait:5] is that a Froggit over there?", "shocked_b", "brenda_lw")
        cutscene:showNametag("Susie")
        cutscene:text("* Looks like it,[wait:5] but-", "neutral_side", "susie")
        cutscene:showNametag("Brenda")
        cutscene:text("* This is the perfect opportunity for an interview!", "happy", "brenda_lw")
        cutscene:hideNametag()
        cutscene:walkTo(brenda, 340, 460, 0.75, "up")
        cutscene:walkTo(leader, 300, 520, 0.5, "right", "right")
        if #Game.party == 2 then
            cutscene:walkTo(follower1, 380, 560, 0.3, "left", "left")
        end
        susie:alert()
        cutscene:wait(1)
        cutscene:walkTo(leader, 340, 520, 0.5, "up")
        if #Game.party == 2 then
            cutscene:walkTo(follower1, 340, 560, 0.3, "up")
        end
        cutscene:showNametag("Susie")
        cutscene:text("* H-hey![wait:5] Wait![wait:5] Brenda![wait:10]\n* That Froggit looks kinda-", "surprise_frown", "susie")
        cutscene:showNametag("Brenda")
        cutscene:text("* Excuse me,[wait:5] have you heard of any rumors regarding this forest?", "smile", "brenda_lw")
        cutscene:text("* I'm currently investigating claims of a...", "smile_b", "brenda_lw")
        cutscene:text("* ...[wait:10] hey are you doing alright?", "neutral", "brenda_lw")
        cutscene:hideNametag()
        froggit:shake(5)
        Assets.playSound("wing", 1, 1)
        cutscene:wait(1)
        froggit:setAnimation("croak")
        Assets.playSound("croak", 1, 0.7)
        cutscene:wait(1)
        cutscene:showNametag("Brenda")
        cutscene:text("* H-hey,[wait:5] w-what the hell are you doing?!", "shocked", "brenda_lw")
        cutscene:text("* S-stay back!", "shocked_b", "brenda_lw")
        cutscene:showNametag("Susie")
        cutscene:text("* Oh no...", "sad_frown", "susie")
        if #Game.party == 1 then
            cutscene:text("* C'mon,[wait:5] I have to do SOMETHING.", "angry", "susie")
            cutscene:text("* Hang on, Brenda![wait:10]\n* I'll take care of this!", "teeth", "susie")
        else
            cutscene:text("* C'mon guys,[wait:5] we have to save her!", "angry", "susie")
            cutscene:text("* Hang on, Brenda![wait:10]\n* We'll take care of this!", "teeth", "susie")
        end
        cutscene:hideNametag()
        local encounter = cutscene:startLightEncounter("feralfroggit", true)
        froggit:remove()

        local defeated_enemies = encounter:getDefeatedEnemies()

        local done_state = defeated_enemies[1].done_state

        cutscene:wait(1)
        if done_state == "KILLED" then
            cutscene:showNametag("Brenda")
            cutscene:text("* [speed:0.4]...", "shocked", "brenda_lw")
            cutscene:text("* D-did you just...", "shocked_b", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("* Hey,[wait:5] they were gonna attack you,[wait:5] we were just defending you.", "annoyed", "susie")
            cutscene:text("* I dunno why they didn't try to run away though...", "annoyed_down", "susie")
            if jamm and not Game:getFlag("dungeonkiller") then
                cutscene:showNametag("Jamm")
                cutscene:text("* Yeah, not that I'm proud of killing or anything...", "worried", "jamm")
                cutscene:text("* But what matters is that we're safe, right?", "worried", "jamm")
            end
            cutscene:showNametag("Brenda")
            cutscene:text("* [speed:0.4]...", "down", "brenda_lw")
            cutscene:text("* (Damnit...[wait:10] she's right...)", "down", "brenda_lw")
            cutscene:text("* (This is all my fault,[wait:5] maybe I startled them...)", "down_tears", "brenda_lw")
            cutscene:text("* (If I didn't rush towards them,[wait:5] maybe they'd...)", "down_tears", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("* Hey,[wait:5] Brenda,[wait:5] you doing okay?", "annoyed", "susie")
            cutscene:showNametag("Brenda")
            brenda:setFacing("down")
            cutscene:text("* H-huh?", "shocked", "brenda_lw")
            cutscene:text("* O-oh yeah,[wait:5] um,[wait:5] I'm fine.", "neutral", "brenda_lw")
            cutscene:text("* Let's uh,[wait:5] keep going.", "smile_b", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("* Alright.", "neutral", "susie")
            if jamm then
                cutscene:showNametag("Jamm")
                cutscene:text("* ...", "shaded_neutral", "jamm")
            end
            Assets.playSound("ominous", 1, 1)
            Game:setFlag("evershade_froggitkill", true)
        else
            cutscene:showNametag("Brenda")
            cutscene:text("* [speed:0.4]...", "shocked", "brenda_lw")
            cutscene:text("* U-um,[wait:5] thanks guys.", "neutral", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("* No problem!", "smile", "susie")
            if jamm and not Game:getFlag("dungeonkiller") then
                cutscene:showNametag("Jamm")
                cutscene:text("* Yeah, that was a piece of cake!", "smile", "jamm")
                cutscene:showNametag("Susie")
            end
            cutscene:text("* Geez,[wait:5] monsters aren't usually agressive like that.", "nervous", "susie")
            cutscene:showNametag("Brenda")
            cutscene:text("* M-maybe I startled them?", "down", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("* Maybe...", "annoyed_down", "susie")
            cutscene:text("* Well,[wait:5] in any case,[wait:5] we should probably keep our guards up.", "annoyed", "susie")
            cutscene:text("* Just in case more of those guys try to attack us.", "nervous_side", "susie")
            if jamm and not Game:getFlag("dungeonkiller") then
                cutscene:showNametag("Jamm")
                cutscene:text("* Couldn't agree more. We can't be too careful.", "worried", "jamm")
            end
            cutscene:showNametag("Brenda")
            cutscene:text("* Got it.", "neutral", "brenda_lw")
        end
        Game:setFlag("evershade_froggit", true)
        cutscene:hideNametag()
        cutscene:attachCamera()
        cutscene:interpolateFollowers()
        cutscene:wait(cutscene:attachFollowers())
    end
}
