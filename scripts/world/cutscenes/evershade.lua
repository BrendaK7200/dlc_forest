return {
    ---@param cutscene WorldCutscene
    froggit = function(cutscene, event)
        local brenda = cutscene:getCharacter("brenda_lw")
        local leader = Game.world.player
        local froggit = cutscene:getCharacter("feralfroggit")
        cutscene:detachCamera()
        cutscene:detachFollowers()
        cutscene:walkTo(leader, 340, 520, 2, "up")
        cutscene:panTo(340, 500, 2)
        if Game:isDessMode() then
            cutscene:walkTo(brenda, 340, 560, 2, "up")
            cutscene:wait(2)
            brenda:alert()
            cutscene:wait(0.5)
            cutscene:showNametag("Brenda")
            cutscene:text("* Hey,[wait:5] is that a Froggit over there?", "shocked_b", "brenda_lw")
            cutscene:showNametag("Dess")
            cutscene:text("* yeah mhm yup looks like one to me", "genuine", "dess")
            cutscene:showNametag("Brenda")
            cutscene:text("* This is the perfect opportunity for an interview!", "happy", "brenda_lw")
            cutscene:hideNametag()
            cutscene:walkTo(brenda, 340, 460, 0.75, "up")
            cutscene:walkTo(leader, 300, 520, 0.5, "right", "right")
            cutscene:wait(1)
            cutscene:walkTo(leader, 340, 520, 0.5, "up")
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
            Assets.playSound("wing", 1, 1)
            cutscene:wait(cutscene:slideTo(froggit, froggit.x, froggit.y + 60, 1, "out-cubic"))
            cutscene:showNametag("Brenda")
            cutscene:text("* H-hey,[wait:5] w-what the hell are you doing?!", "shocked", "brenda_lw")
            cutscene:text("* S-stay back!", "shocked_b", "brenda_lw")
            cutscene:showNametag("Dess")
            cutscene:text("* Do I have to help her...", "annoyed", "dess")
            cutscene:text("* ugh fine", "angry", "dess")
            cutscene:text("* step aside,[wait:5] i'll handle this", "calm_b", "dess")
            cutscene:text("* I AM THE ANGRY PUMPKIN!!!", "angry", "dess")
            cutscene:hideNametag()
            local encounter = cutscene:startLightEncounter("feralfroggit_scripted", true)
            froggit:remove()
    
            local defeated_enemies = encounter:getDefeatedEnemies()
    
            local done_state = defeated_enemies[1].done_state
    
            cutscene:wait(1)
            if done_state == "KILLED" then
                cutscene:showNametag("Brenda")
                cutscene:text("* [speed:0.4]...", "shocked", "brenda_lw")
                cutscene:text("* D-did you just...", "shocked_b", "brenda_lw")
                cutscene:showNametag("Dess")
                cutscene:text("* hey i was just uhhhh", "neutral_b", "dess")
                cutscene:text("* defending you", "neutral", "dess")
                cutscene:text("* yeah this was self-defense,[wait:5] no homicide here", "condescending", "dess")
                cutscene:showNametag("Brenda")
                cutscene:text("* (I...[wait:10] don't like the way she phrased that...)", "down", "brenda_lw")
                cutscene:text("* (But still...[wait:10] this feels like it's all my fault...)", "down", "brenda_lw")
                cutscene:text("* (Maybe I just startled them...)", "down_tears", "brenda_lw")
                cutscene:text("* (If I didn't rush towards them,[wait:5] maybe they'd...)", "down_tears", "brenda_lw")
                cutscene:showNametag("Dess")
                cutscene:text("* hey are we gonna keep going or what", "annoyed", "dess")
                cutscene:showNametag("Brenda")
                brenda:setFacing("down")
                cutscene:text("* H-huh?", "shocked", "brenda_lw")
                cutscene:text("* O-oh yeah,[wait:5] um...", "neutral", "brenda_lw")
                cutscene:text("* Let's uh,[wait:5] keep going.", "smile_b", "brenda_lw")
                cutscene:showNametag("Dess")
                cutscene:text("* swag", "swag", "dess")
                Assets.playSound("ominous", 1, 1)
                Game:setFlag("evershade_froggitkill", true)
            else
                cutscene:showNametag("Brenda")
                cutscene:text("* [speed:0.4]...", "shocked", "brenda_lw")
                cutscene:text("* U-um,[wait:5] thanks.", "neutral", "brenda_lw")
                cutscene:showNametag("Dess")
                cutscene:text("* no problemo", "heckyeah", "dess")
                cutscene:text("* dunno why that guy wanted to kill you tho", "neutral_b", "dess")
                cutscene:showNametag("Brenda")
                cutscene:text("* M-maybe I startled them?", "down", "brenda_lw")
                cutscene:showNametag("Dess")
                cutscene:text("* ehhh it doesn't matter", "condescending", "dess")
                cutscene:text("* lets keep going", "heckyeah", "dess")
                cutscene:showNametag("Brenda")
                cutscene:text("* Got it.", "neutral", "brenda_lw")
            end
        else
            local susie = cutscene:getCharacter("susie_lw")
            local jamm = cutscene:getCharacter("jamm_lw") or cutscene:getCharacter("jammarcy_light")
            local ceroba = cutscene:getCharacter("ceroba")
            local follower1
            local follower2
            if #Game.party >= 2 then
                follower1 = cutscene:getCharacter(Game.party[2].id)
                if #Game.party == 3 then
                    follower2 = cutscene:getCharacter(Game.party[3].id)
                end
            end
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
            cutscene:wait(2)
            brenda:alert()
            cutscene:wait(0.5)
            cutscene:showNametag("Brenda")
            if ceroba then
                cutscene:text("* Hey,[wait:5] is that a Froggit over there?[react:1]", "shocked_b", "brenda_lw", {reactions={{"What are they doing all\nthe way out here?", "mid", "bottom", "question", "ceroba"}}})
            else
                cutscene:text("* Hey,[wait:5] is that a Froggit over there?", "shocked_b", "brenda_lw")
            end
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
            if ceroba then
                ceroba:alert()
            else
                susie:alert()
            end
            cutscene:wait(1)
            cutscene:walkTo(leader, 340, 520, 0.5, "up")
            if #Game.party == 2 then
                cutscene:walkTo(follower1, 340, 560, 0.3, "up")
            end
            if ceroba then
                cutscene:showNametag("Ceroba")
                cutscene:text("* H-[wait:5]hey![wait:5] Wait![wait:5] That doesn't look like a normal-", "confounded", "ceroba")
            else
                cutscene:showNametag("Susie")
                cutscene:text("* H-hey![wait:5] Wait![wait:5] Brenda![wait:10]\n* That Froggit looks kinda-", "surprise_frown", "susie")
            end
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
            if jamm and not Game:getFlag("dungeonkiller") then
                cutscene:showNametag("Jamm")
                cutscene:text("* Uh...[wait:10]\n* Brenda?", "worried", "jamm")
            end
            Assets.playSound("wing", 1, 1)
            cutscene:wait(cutscene:slideTo(froggit, froggit.x, froggit.y + 60, 1, "out-cubic"))
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
                    cutscene:text("* Yeah,[wait:5] not that I'm proud of killing or anything...", "worried", "jamm")
                    cutscene:text("* But what matters is that we're safe,[wait:5] right?", "worried", "jamm")
                end
                if ceroba then
                    cutscene:showNametag("Ceroba")
                    cutscene:text("* I have to admit,[wait:5] I do feel bad for killing them.", "dissapproving", "ceroba")
                    cutscene:text("* But...[wait:5] You were in danger.[wait:5] So we had to do something.", "closed_eyes", "ceroba")
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
                if ceroba then
                    cutscene:showNametag("Ceroba")
                    cutscene:text("* ...", "dissapproving", "ceroba")
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
                    cutscene:text("* Yeah,[wait:5] that was a piece of cake!", "smug", "jamm")
                    cutscene:showNametag("Susie")
                end
                cutscene:text("* Geez,[wait:5] monsters aren't usually agressive like that.", "nervous", "susie")
                if ceroba then
                    cutscene:showNametag("Ceroba")
                    cutscene:text("* Can confirm.[wait:5] Especially not Froggits.", "closed_eyes", "ceroba")
                end
                cutscene:showNametag("Brenda")
                cutscene:text("* M-maybe I startled them?", "down", "brenda_lw")
                cutscene:showNametag("Susie")
                cutscene:text("* Maybe...", "annoyed_down", "susie")
                cutscene:text("* Well,[wait:5] in any case,[wait:5] we should probably keep our guards up.", "annoyed", "susie")
                cutscene:text("* Just in case more of those guys try to attack us.", "nervous_side", "susie")
                if jamm and not Game:getFlag("dungeonkiller") then
                    cutscene:showNametag("Jamm")
                    cutscene:text("* Couldn't agree more.[wait:10] We can't be too careful.", "worried", "jamm")
                end
                cutscene:showNametag("Brenda")
                cutscene:text("* Got it.", "neutral", "brenda_lw")
            end
        end
        Game:setFlag("evershade_froggit", true)
        cutscene:hideNametag()
        cutscene:attachCamera()
        cutscene:interpolateFollowers()
        cutscene:wait(cutscene:attachFollowers())
    end,

    butnobodycame = function(cutscene, event)
        cutscene:wait(3)
        cutscene:showNametag("Brenda")
        cutscene:text("[speed:0.5]* ...", "down", "brenda_lw")
        cutscene:text("* This...[wait:10] This forest is so empty now...", "suspicious_b", "brenda_lw")
        cutscene:text("* Why...[wait:10] did you do that...?", "suspicious", "brenda_lw")
        cutscene:text("* I mean sure,[wait:5] maybe it was self-defense,[wait:5] but...", "down", "brenda_lw")
        cutscene:text("* At a certain point it felt like you were hunting them down...", "suspicious", "brenda_lw")
        cutscene:text("* Is all of this really necessary...?", "down", "brenda_lw")
        cutscene:hideNametag()
        local choice = cutscene:choicer({"I was just\ngetting stronger", "I don't\nknow"})
        if choice == 1 then
            cutscene:showNametag("Susie")
            cutscene:text("* I...[wait:10] I was just...", "annoyed_down", "susie")
            cutscene:text("* Getting stronger.", "bangs_neutral", "susie")
            cutscene:showNametag("Brenda")
            cutscene:text("* Getting stronger?", "shocked", "brenda_lw")
            cutscene:text("* You...", "angry", "brenda_lw")
            cutscene:text("* What the hell is wrong with you?!", "enraged", "brenda_lw")
            cutscene:text("* You go around killing everything and for what?", "angry", "brenda_lw")
            cutscene:text("* Because you think it'll make you \"stronger\"?!", "angry_b", "brenda_lw")
            cutscene:text("* What if...", "down", "brenda_lw")
            cutscene:text("* What if those monsters weren't always like that?", "down_tears", "brenda_lw")
            cutscene:text("* What if the forest turned them into those things?!", "enraged_tears", "brenda_lw")
            cutscene:text("* WHAT IF THEY HAD FRIENDS AND FAMILIES?!", "furious_b", "brenda_lw")
            cutscene:text("* AND YOU JUST...", "enraged_tears", "brenda_lw")
            cutscene:text("* You just...", "down_tears", "brenda_lw")
            cutscene:text("[speed:0.5]* ...", "sad", "brenda_lw")
            cutscene:text("* Let's keep going...", "suspicious", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("[speed:0.5]* ...", "bangs_neutral", "susie")
            cutscene:text("* (Why the hell did I say that?)", "annoyed_down", "susie")
            cutscene:text("* (\"Getting stronger\"?[wait:10] What the hell does that even mean?)", "bangs_neutral", "susie")
            cutscene:text("* (I...)", "bangs/down", "susie")
        else
            cutscene:showNametag("Susie")
            cutscene:text("* I...[wait:10] I don't know...", "annoyed_down", "susie")
            cutscene:showNametag("Brenda")
            cutscene:text("* You...[wait:10] don't know?", "dissapointed", "brenda_lw")
            cutscene:text("* Then...", "down", "brenda_lw")
            cutscene:text("* Please stop.", "dissapointed", "brenda_lw")
            cutscene:text("* Just...[wait:5] try and chill out,[wait:5] okay?", "down", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("[speed:0.5]* ...", "bangs_neutral", "susie")
            cutscene:text("* (Why can't I stop myself from killing?)", "annoyed_down", "susie")
            cutscene:text("* (This...[wait:5] this voice telling me what to do...)", "bangs_neutral", "susie")
            cutscene:text("* (Why can't I not listen to it...?)", "bangs/down", "susie")
            cutscene:text("* I'll...[wait:10] I'll try to.", "annoyed_down", "susie")
            cutscene:text("* Let's go...", "shy_down", "susie")
        end
        cutscene:hideNametag()
        Assets.playSound("ominous")
    end,
}
