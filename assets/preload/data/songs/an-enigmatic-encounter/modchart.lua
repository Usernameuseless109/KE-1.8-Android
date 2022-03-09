local normal1 = false
local normal2 = false

local lockzoom = false
local swayingsmall = false
local swayinglarge = false
local swayingbigger = false
local swayingbiggest = false
local suckmydick = false
local wavy = false
local spinCrazy = false

local background = nil
local BlackFade = nil
local whiteBruh = nil

function start (song)
	background = makeSprite('Gaster wake up','gaster wake up', true)
	BlackFade = makeSprite('BlackFade','blackfade', false)
	whiteBruh = makeSprite('whiteBruh','whitebruh', false)
	setActorX(-25,'gaster wake up')
	setActorY(360,'gaster wake up')
	setActorAlpha(0,'gaster wake up')
	setActorScale(3,'gaster wake up')
	setActorX(200,'blackfade')
	setActorY(500,'blackfade')
	setActorAlpha(0,'blackfade')
	setActorScale(4,'blackfade')
	setActorX(200,'whitebruh')
	setActorY(500,'whitebruh')
	setActorAlpha(0,'whitebruh')
	setActorScale(4,'whitebruh')
end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/60)
	if lockzoom then
		setCamZoom(1)
		setHudZoom(1)
	end
	if suckmydick then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
	end
	if swayingsmall then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
		end
	end
	if swayinglarge then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0)), i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
		end
	end
	if swayingbigger then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*5) * math.pi) ,i)
		end
	end
	if swayingbiggest then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
    end
	if wavy then -- not spinning crazy
        camHudAngle = 5 * math.sin(currentBeat * math.pi)
    end
	if spinCrazy then -- spinning crazy
        camHudAngle = 10 * math.sin(currentBeat * math.pi)
        if getHudX() < 320 then
            setHudPosition(getHudX() + 4, 32 * math.cos(currentBeat * math.pi))
        else
            setHudPosition(-640, 32 * math.cos(currentBeat * math.pi))
        end
    end
end

function beatHit (beat)
	if camerabeat then
		setCamZoom(1)
	end
end

function stepHit (step)
	if step == 1 then
		changeDadCharacter('notYetCorruptsans')
	end
	if step == 896 then
		setCamZoom(2)
		swayingsmall = true
		tweenFadeIn(background,0,0.01)
		tweenFadeIn(BlackFade,0.75,0.01)
		tweenFadeIn(whiteBruh,0,0.01)
		setHudZoom(0.5, 3)
		changeDadCharacter('corruptsans')

	end
	if step == 832 then
		tweenFadeIn(background,1, 0.5)
	end
	if step == 870 then
		tweenCameraZoom(2, 1.3)
		tweenCamPos(30, 500, 0.5)
	end
	if step == 880 then
		tweenFadeIn(whiteBruh,1,0.5)
	end
	if step == 577 then
		setCamZoom(2)
	end
	if step == 609 then
		setCamZoom(2)
	end
	if step == 641 then
		setCamZoom(2)
	end
	if step == 705 then
		setCamZoom(2)
	end
	if step == 737 then
		setCamZoom(2)
	end
	if step == 769 then
		setCamZoom(2)
	end
	if step == 3030 then
		tweenFadeIn(background,1,1)
	end
	if step == 3432 then
		tweenFadeIn(background,0,1)
	end
	if step == 1442 then
		setCamZoom(2)
		swayingsmall = false	
		swayinglarge = true	
	end
	if step == 1473 then
		setCamZoom(2)
		cameraAngle = cameraAngle + 180
		camHudAngle = camHudAngle + 180
	
	end
	if step == 1505 then
		setCamZoom(2)
		cameraAngle = cameraAngle - 180
		camHudAngle = camHudAngle - 180
	
	end
	if step == 1538 then
		setCamZoom(2)
		cameraAngle = cameraAngle + 180
		camHudAngle = camHudAngle + 180
	
	end
	if step == 1571 then
		setCamZoom(2)
		camHudAngle = camHudAngle - 180
		cameraAngle = cameraAngle - 180
	
	end
	if step == 1698 then
		setCamZoom(2)
		swayinglarge = false	
		swayingbigger = true	
		wavy = true
	end
	if step == 1954 then
		setCamZoom(2)
		swayingbigger = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
		wavy = false
		camHudAngle = 0
	end
	if step == 2082 then
		setCamZoom(2)
		camHudAngle = camHudAngle + 180
		cameraAngle = cameraAngle + 180
	end
	if step == 2208 then
		setCamZoom(2)
		camHudAngle = camHudAngle - 180
		cameraAngle = cameraAngle - 180
	end
	if step == 2338 then
		setCamZoom(2)	
		swayinglarge = true	
	end
	if step == 2720 then
		setCamZoom(2)	
		swayinglarge = false	
		swayingbigger = true
		wavy = true
	end
	if step == 2977 then	
		swayingbigger = false
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
		wavy = false
		camHudAngle = 0
	end
	if step == 3104 then	
        spinCrazy = true
		camerabeat = true
	end
	if step == 3435 then	
		spinCrazy = false
		camerabeat = false
		camHudAngle = 0
		setHudPosition(hudX,hudY)
		swayinglarge = true
	end
	if step == 3724 then	
		swayinglarge = false
		tweenFadeIn(whiteBruh,1,0.01)
		changeDadCharacter('notYetCorruptsans')
	end
	if step == 3725 then	
		tweenFadeIn(whiteBruh,0,0.5)
		tweenFadeIn(BlackFade,0,0.5)

	end
	if step == 4480 then	
		changeDadCharacter('sansDead')
	end
	if step == 4570 then	
		tweenFadeIn('dad',0,4)
	end
	
	
end