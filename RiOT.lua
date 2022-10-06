local pCitizen = {
	['createThread'] = Citizen['CreateThread'],
	['wait'] = Citizen['Wait'],
	['invokeNative'] = Citizen['InvokeNative'],
	['resultAsString'] = Citizen['ResultAsString'],
	['resultAsInteger'] = Citizen['ResultAsInteger'],
	['resultAsVector'] = Citizen['ResultAsVector'],
	['resultAsObject'] = Citizen['ResultAsObject'],
	['returnResultAnyway'] = Citizen['ReturnResultAnyway'],
	['pointerValueInt'] = Citizen['PointerValueInt'],
	['pointerValueIntInitialized'] = Citizen['PointerValueIntInitialized'],
	['pointerValueFloat'] = Citizen['PointerValueFloat'],
	['pointerValueFloatInitialized'] = Citizen['PointerValueFloatInitialized'],
	['pointerValueVector'] = Citizen['PointerValueVector'],
	['keys'] = {
		['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
		['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163,
		['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177, ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246,
		['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18, ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23,
		['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182, ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29,
		['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81, ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70, ['HOME'] = 213, ['PAGEUP'] = 10,
		['PAGEDOWN'] = 11, ['DELETE'] = 178, ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['UP'] = 172, ['DOWN'] = 173, ['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60,
		['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118, ['MOUSE1'] = 24,
		
		['SCROLLWHEEL_UP'] = 241, ['SCROLLWHEEL_DOWN'] = 242,
	},
	['_n_tostring'] = function(num)
		if (num == 0 or not num) then
			return nil
		end
		return tostring(num)
	end
}

--[[Menu Primary Table]]
local RiOT_var = {
	n_obf_req = 'RiOT_var',
	_version = '1.4.9.6',
	shouldShowMenu = true,
	shouldBlockInput = false,
	natives = {
		getCurrentServerEndpoint = function() --[[GetCurrentServerEndpoint]]
			return (pCitizen['invokeNative'](' 0xea11bfba ', pCitizen['returnResultAnyway'](), pCitizen['resultAsString']()))
		end,
		getCurrentResourceName = function() --[[GetCurrentResourceName]]
			return (pCitizen['invokeNative'](' 0xe5e9ebbb ', pCitizen['returnResultAnyway'](), pCitizen['resultAsString']()))
		end,
		getActivePlayers = function() --[[GetActivePlayers]]
			return (msgpack.unpack(pCitizen['invokeNative'](' 0xcf143fb9 ', pCitizen['returnResultAnyway'](), pCitizen['resultAsObject']())))
		end,
		clearPedTasksImmediately = function(ped) --[[ClearPedTasksImmediately]]
			return (pCitizen['invokeNative'](' 0xAAA34F8A7CB32098 ', ped))
		end,
		addTextComponentSubstringPlayerName = function(text) --[[AddTextComponentSubstringPlayerName]]
			return (pCitizen['invokeNative'](' 0x6C188BE134E074AA ', pCitizen['_n_tostring'](text)))
		end,
		beginTextCommandDisplayText = function(text) --[[BeginTextCommandDisplayText / SetTextEntry]]
			return (pCitizen['invokeNative'](' 0x25FBB336DF1804CB ', pCitizen['_n_tostring'](text)))
		end,
		endTextCommandDisplayText = function(x, y) --[[EndTextCommandDisplayText / DrawText]]
			return (pCitizen['invokeNative'](' 0xCD015E5BB0D96A57 ', x, y))
		end,
		loadResourceFile = function(resourceName, fileName) --[[LoadResourceFile]]
			return (pCitizen['invokeNative'](' 0x76a9ee1f ', pCitizen['_n_tostring'](resourceName), pCitizen['_n_tostring'](fileName), pCitizen['returnResultAnyway'](), pCitizen['resultAsString']()))
		end,
		createObject = function(modelHash, x, y, z, isNetwork, netMissionEntity, dynamic) --[[CreateObject]]
			return (pCitizen['invokeNative'](' 0x509D5878EB39E842 ', modelHash, x, y, z, isNetwork, thisScriptCheck, dynamic, pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']()))
		end,
		drawRect = function(x, y, width, height, r, g, b, a) --[[DrawRect]]
			return (pCitizen['invokeNative'](' 0x3A618A217E5154F0 ', x, y, width, height, r, g, b, a))
		end,
		drawLine = function(x1, y1, z1, x2, y2, z2, red, green, blue, alpha) --[[DrawLine]]
			return (pCitizen['invokeNative'](' 0x6B7256074AE34680 ', x1, y1, z1, x2, y2, z2, red, green, blue, alpha))
		end,
		drawSprite = function(textureDict, textureName, screenX, screenY, width, height, heading, red, green, blue, alpha)
			return (pCitizen['invokeNative'](' 0xE7FFAE5EBF23D890 ', pCitizen['_n_tostring'](textureDict), pCitizen['_n_tostring'](textureName), screenX, screenY, width, height, heading, red, green, blue, alpha))
		end,
		addExplosion = function(x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake) --[[AddExplosion]]
			return (pCitizen['invokeNative'](' 0xE3AD2BDBAEE269AC ', x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake))
		end,
		networkExplodeVehicle = function(vehicle, isAudible, isInvisible, p3) --[[NetworkExplodeVehicle]]
			return (pCitizen['invokeNative'](' 0x301A42153C9AD707 ', vehicle, isAudible, isInvisible, p3, pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']()))
		end,
		giveWeaponToPed = function(ped, weaponHash, ammoCount, isHidden, equipNow) --[[GiveWeaponToPed]]
			return (pCitizen['invokeNative'](' 0xBF0FD6E56C964FCB ', ped, weaponHash, ammoCount, isHidden, equipNow))
		end,
		addTextEntry = function(entryKey, entryText) --[[AddTextEntry]]
			return (pCitizen['invokeNative'](' 0x32ca01c3 ', pCitizen['_n_tostring'](entryKey), pCitizen['_n_tostring'](entryText)))
		end,
		displayOnscreenKeyboard = function(p0, windowTitle, p2, defaultText, defaultConcat1, defaultConcat2, defaultConcat3, maxInputLength) --[[DisplayOnscreenKeyboard]]
			return (pCitizen['invokeNative'](' 0x00DC833F2568DBF6 ', p0, pCitizen['_n_tostring'](windowTitle), pCitizen['_n_tostring'](p2), pCitizen['_n_tostring'](defaultText), pCitizen['_n_tostring'](defaultConcat1), pCitizen['_n_tostring'](defaultConcat2), pCitizen['_n_tostring'](defaultConcat3), maxInputLength))
		end,
		updateOnscreenKeyboard = function() --[[UpdateOnscreenKeyboard]]
			return (pCitizen['invokeNative'](' 0x0CF2B696BBF945AE ', pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']()))
		end,
		getVehicleXenonLightsColour = function(vehicle) --[[GetVehicleXenonLightsColour]]
			return (pCitizen['invokeNative'](' 0x3DFF319A831E0CDB ', vehicle, pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']()))
		end,
		setVehicleXenonLightsColour = function(vehicle, color) --[[SetVehicleXenonLightsColour]]
			return (pCitizen['invokeNative'](' 0xE41033B25D003A07 ', vehicle, color))
		end,
		doesExtraExist = function(vehicle, extraId) --[[DoesExtraExist]]
			return (pCitizen['invokeNative'](' 0x1262D55792428154 ', vehicle, extraId, pCitizen['returnResultAnyway']()))
		end,
		setEntityVisible = function(entity, toggle, unk) --[[SetEntityVisible]]
			return (pCitizen['invokeNative'](' 0xEA1C610A04DB6BBB ', entity, toggle, unk))
		end,
		createVehicle = function(modelHash, x, y, z, heading, isNetwork, thisScriptCheck) --[[CreateVehicle]]
			return (pCitizen['invokeNative'](' 0xAF35D0D2583051B0 ', modelHash, x, y, z, heading, isNetwork, thisScriptCheck, pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']()))
		end,
		setEntityCoords = function(entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea) --[[SetEntityCoords]]
			return (pCitizen['invokeNative'](' 0x06843DA7060A026B ', entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea))
		end,
		setEntityCoordsNoOffset = function(entity, xPos, yPos, zPos, xAxis, yAxis, zAxis) --[[SetEntityCoordsNoOffset]]
			return (pCitizen['invokeNative'](' 0x239A3351AC1DA385 ', entity, xPos, yPos, zPos, xAxis, yAxis, zAxis))
		end,
		shootSingleBulletBetweenCoords = function(x1, y1, z1, x2, y2, z2, damage, p7, weaponHash, ownerPed, isAudible, isInvisible, speed) --[[ShootSingleBulletBetweenCoords]]
			return (pCitizen['invokeNative'](' 0x867654CBC7606F2C ', x1, y1, z1, x2, y2, z2, damage, p7, weaponHash, ownerPed, isAudible, isInvisible, speed))
		end,
		setEntityHealth = function(entity, health) --[[SetEntityHealth]]
			return (pCitizen['invokeNative'](' 0x6B76DC1F3AE6E6A3 ', entity, health))
		end,
		setPedArmour = function(ped, amount) --[[SetPedArmour]]
			return (pCitizen['invokeNative'](' 0xCEA04D83135264CC ', ped, amount))
		end,
		setTextFont = function(fontType) --[[SetTextFont]]
			return (pCitizen['invokeNative'](' 0x66E0276CC5F6B9DA ', fontType))
		end,
		setTextColour = function(red, green, blue, alpha) --[[SetTextColour]]
			return (pCitizen['invokeNative'](' 0xBE6B23FFA53FB442 ', red, green, blue, alpha))
		end,
		setTextScale = function(scale, size) --[[SetTextScale]]
			return (pCitizen['invokeNative'](' 0x07C837F9A01C34C9 ', scale, size))
		end,
		setTextDropShadow = function() --[[SetTextDropShadow]]
			return (pCitizen['invokeNative'](' 0x1CA3E9EAC9D93E5E '))
		end,
		playSoundFrontend = function(soundId, audioName, audioRef, p3) --[[PlaySoundFrontend]]
			return (pCitizen['invokeNative'](' 0x67C540AA08E4A6F5 ', soundId, pCitizen['_n_tostring'](audioName), pCitizen['_n_tostring'](audioRef), p3))
		end,
		requestStreamedTextureDict = function(textureDict, p1) --[[RequestStreamedTextureDict]]
			return (pCitizen['invokeNative'](' 0xDFA2EF8E04127DD5 ', pCitizen['_n_tostring'](textureDict), p1))
		end,
		setTextProportional = function(p0) --[[SetTextProportional]]
			return (pCitizen['invokeNative'](' 0x038C1F517D7FDCF8 ', p0))
		end,
		setTextOutline = function() --[[SetTextOutline]]
			return (pCitizen['invokeNative'](' 0x2513DFB0FB8400FE '))
		end,
		isDisabledControlPressed = function(inputGroup, control) --[[IsDisabledControlPressed]]
			return (pCitizen['invokeNative'](' 0xE2587F8CBBD87B1D ', inputGroup, control, pCitizen['returnResultAnyway']()))
		end,
		setFocusPosAndVel = function(x, y, z, offsetX, offsetY, offsetZ) --[[SetFocusPosAndVel/SetFocusArea]]
			return pCitizen['invokeNative'](' 0xBB7454BAFF08FE25 ', x, y, z, offsetX, offsetY, offsetZ)
		end,
		startShapeTestRay = function(x1, y1, z1, x2, y2, z2, flags, entity, p8) --[[StartShapeTestRay/CastRayPointToPoint]]
			return pCitizen['invokeNative'](' 0x377906D8A31E5586 ', x1, y1, z1, x2, y2, z2, flags, entity, p8, pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']())
		end,
		getShapeTestResult = function(rayHandle) --[[GetShapeTestResult/GetRaycastResult]]
			return pCitizen['invokeNative'](' 0x3D87450E15D98694 ', rayHandle, pCitizen['pointerValueInt'](), pCitizen['pointerValueVector'](), pCitizen['pointerValueVector'](), pCitizen['pointerValueInt'](), pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']())
		end,
		displayRadar = function(toggle) --[[DisplayRadar]]
			return (pCitizen['invokeNative'](' 0xA0EBB943C300E693 ', toggle, pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']()))
		end,
		setPlayerWeaponDamageModifier = function(player, modifier) --[[SetPlayerWeaponDamageModifier]]
			return (pCitizen['invokeNative'](' 0xCE07B9F7817AADA3 ', player, modifier))
		end,
		setPlayerMeleeWeaponDamageModifier = function(player, modifier) --[[SetPlayerMeleeWeaponDamageModifier]]
			return (pCitizen['invokeNative'](' 0x4A3DC7ECCC321032 ', player, modifier))
		end,
		networkGetPlayerIndexFromPed = function(ped) --[[NetworkGetPlayerIndexFromPed]]
			return (pCitizen['invokeNative'](' 0x6C0E2E0125610278 ', ped, pCitizen['returnResultAnyway'](), pCitizen['resultAsInteger']()))
		end,
		networkSetNetworkIdDynamic = function(netID, toggle) --[[NetworkSetNetworkIdDynamic]]
			return pCitizen['invokeNative'](' 0x2B1813ABA29016C5 ', netID, toggle)
		end,
		setNetworkIdExistsOnAllMachines = function(netId, toggle) --[[SetNetworkIdExistsOnAllMachines]]
			return pCitizen['invokeNative'](' 0xE05E81A888FA63C8 ', netId, toggle)
		end,
		setNetworkIdCanMigrate = function(netId, toggle) --[[SetNetworkIdCanMigrate]]
			return pCitizen['invokeNative'](' 0x299EEB23175895FC ', netId, toggle)
		end,
		setNetworkIdSyncToPlayer = function(netId, player, toggle) --[[SetNetworkIdSyncToPlayer]]
			return pCitizen['invokeNative'](' 0xA8A024587329F36A ', netId, player, toggle)
		end,
		getGameplayCamRot = function(rotationOrder) --[[GetGameplayCamRot]]
			return pCitizen['invokeNative'](' 0x837765A25378F0BB ', rotationOrder, pCitizen['returnResultAnyway'](), pCitizen['resultAsVector']())
		end,
		getGameplayCamCoord = function() --[[GetGameplayCamCoord]]
			return pCitizen['invokeNative'](' 0x14D6F5678D8F1B37 ', pCitizen['returnResultAnyway'](), pCitizen['resultAsVector']())
		end,
		getCamRot = function(cam, rotationOrder) --[[GetCamRot]]
			return pCitizen['invokeNative'](' 0x7D304C1C955E3E12 ', cam, rotationOrder, pCitizen['returnResultAnyway'](), pCitizen['resultAsVector']())
		end,
		getCamCoord = function(cam) --[[GetCamCoord]]
			return pCitizen['invokeNative'](' 0xBAC038F7459AE5AE ', cam, pCitizen['returnResultAnyway'](), pCitizen['resultAsVector']())
		end,
		doesEntityExist = function(entity) --[[DoesEntityExist]]
			return pCitizen['invokeNative'](' 0x7239B21A38F536BA ', entity, pCitizen['returnResultAnyway']())
		end,
		getEntityCoords = function(entity, alive) --[[GetEntityCoords]]
			return pCitizen['invokeNative'](' 0x3FEF770D40960D5A ', entity, alive, pCitizen['returnResultAnyway'](), pCitizen['resultAsVector']())
		end,
		forceVehicleEngineAudio = function(vehicle, audioName) --[[ForceVehicleEngineAudio]]
			return pCitizen['invokeNative'](' 0x4F0C413926060B38 ', vehicle, pCitizen['_n_tostring'](audioName))
		end,
		getGroundZFor_3dCoord = function(x, y, z, unk) --[[GetGroundZFor_3dCoord]]
			return pCitizen['invokeNative'](' 0xC906A7DAB05C8D2B ', x, y, z, pCitizen['pointerValueFloat'](), unk, pCitizen['returnResultAnyway']())
		end,
		setDiscordAppId = function(appId) --[[SetDiscordAppId]]
			return pCitizen['invokeNative'](' 0x6a02254d ', pCitizen['_n_tostring'](appId))
		end,
		setDiscordRichPresenceAsset = function(assetName) --[[SetDiscordRichPresenceAsset]]
			return pCitizen['invokeNative'](' 0x53dfd530 ', pCitizen['_n_tostring'](assetName))
		end,
		setDiscordRichPresenceAssetSmall = function(assetName) --[[SetDiscordRichPresenceAssetSmall]]
			return pCitizen['invokeNative'](' 0xf61d04c4 ', pCitizen['_n_tostring'](assetName))
		end,
		setDiscordRichPresenceAssetSmallText = function(text) --[[SetDiscordRichPresenceAssetSmallText]]
			return pCitizen['invokeNative'](' 0x35e62b6a ', pCitizen['_n_tostring'](text))
		end,
		setDiscordRichPresenceAssetText = function(text) --[[SetDiscordRichPresenceAssetText]]
			return pCitizen['invokeNative'](' 0xb029d2fa ', pCitizen['_n_tostring'](text))
		end,
	},
	menus_list = {},
	menu_properties = {
		debugMode = false,
		menus = {},
		keys = { 
			up = pCitizen['keys']['UP'], 
			down = pCitizen['keys']['DOWN'], 
			left = pCitizen['keys']['LEFT'], 
			right = pCitizen['keys']['RIGHT'], 
			select = pCitizen['keys']['NENTER'], 
			back = 202,
			bind = pCitizen['keys']['LEFTSHIFT']
		},
	
		optionCount = 0,
	
		currentKey = nil,
		currentMenu = nil,
		
		titleHeight = 0.11,
		
		titleYOffset = 0.05,
		titleXOffset = 0.5,
		titleScale = 1.0,
		titleSpacing = 2,
	
		buttonHeight = 0.038,
		buttonFont = 0,
		buttonScale = 0.365,
		buttonTextXOffset = 0.005,
		buttonTextYOffset = 0.005,
	},
	watermark = {
		size = 0,
		text = '',
	},
	mainColor = {
		r = 50, 
		g = 255, 
		b = 25,
		a = 255
	},
	creditsYeet = {
		'~m~Author:',
		'Nertigel#5391',
		'/id/nertigel',
		'shoppy.gg/@pnertigel',
		'd0pamine.xyz',
		'five_3_nine_1',
		'~m~Others:',
		'watermalone',
		'warxander',
	},

	datastore = {
		es_extended_lookup = 0,
		triggerServerEvents = '',
		exploitableTriggerServerEvents = '',
		selectedWeaponLoadoutHandle = nil,
		selectedWeaponLoadoutDeleteHandle = nil,
		selectedVehicleModification = nil,
		aspectRatio = GetAspectRatio(true),
		pLocal = {
			pId = 0,
			vehicle = 0,
			pedId = 0,
			lastLocation = nil,
			isInSpectatorMode = false,
			spectateLastLocation = nil,
			savedVehiclesOptionsHandle = nil,
			savedVehiclesOptionsDeleteHandle = nil,
			selectedKeybindHandle = nil,
			selectedAnimationListHandle = nil,
			selectedTeleportLocationHandle = nil,
			selectedTeleportLocationDeleteHandle = nil,
			savedVehicles = {
				{name = 'Nertigel\'s Elegy Retro Custom', props = {['modDashboard'] = 1,['modTransmission'] = 2,['modLivery'] = 4,['modFrame'] = 4,['modWindows'] = 0,['modTank'] = 1,['dirtLevel'] = 10.8,['modArmor'] = 4,['wheels'] = 0,['modFrontWheels'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modBrakes'] = 2,['modPlateHolder'] = 0,['modArchCover'] = -1,['wheelColor'] = 134,['pearlescentColor'] = 12,['modVanityPlate'] = 2,['modStruts'] = 11,['bodyHealth'] = 1000.0,['modAirFilter'] = 1,['modEngineBlock'] = 1,['modRightFender'] = -1,['modFender'] = 1,['modHydrolic'] = -1,['modAerials'] = 6,['modSpeakers'] = -1,['modSuspension'] = 3,['modTrimA'] = 0,['modEngine'] = 3,['modShifterLeavers'] = -1,['modSteeringWheel'] = 9,['modSeats'] = 0,['model'] = 196747873,['color1'] = 12,['modRearBumper'] = 1,['modDoorSpeaker'] = 4,['modSpoilers'] = 2,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['windowTint'] = 1,['plateIndex'] = 1,['modGrille'] = 0,['modTrunk'] = -1,['modAPlate'] = -1,['engineHealth'] = 1000.0,['modXenon'] = 1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modHorns'] = -1,['modHood'] = 4,['fuelLevel'] = 65.0,['modTurbo'] = 1,['modBackWheels'] = -1,['modRoof'] = 0,['modOrnaments'] = -1,['extras'] = { } ,['modTrimB'] = 0,['modFrontBumper'] = -1,['modExhaust'] = 2,['color2'] = 12,['modDial'] = 2,['xenonColor'] = 255,['modSideSkirt'] = 4}},
				{name = 'Nertigel\'s Jester Classic', props = {['sound']='elegy',['modFrame'] = 2,['modTransmission'] = 2,['modRoof'] = 0,['modLivery'] = 1,['color1'] = 12,['modWindows'] = -1,['modTank'] = -1,['modSideSkirt'] = 0,['modSpeakers'] = -1,['wheels'] = 0,['modAerials'] = -1,['dirtLevel'] = 6.2,['modArchCover'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modStruts'] = -1,['modBackWheels'] = -1,['engineHealth'] = 1000.0,['modSuspension'] = 4,['modTurbo'] = 1,['modAirFilter'] = -1,['modEngineBlock'] = -1,['modHydrolic'] = -1,['modOrnaments'] = -1,['modEngine'] = 3,['modHood'] = 2,['fuelLevel'] = 65.0,['modTrunk'] = -1,['modRightFender'] = -1,['modTrimB'] = -1,['modFrontBumper'] = 8,['modShifterLeavers'] = -1,['wheelColor'] = 12,['model'] = -214906006,['modFrontWheels'] = 8,['windowTint'] = 1,['bodyHealth'] = 1000.0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSeats'] = -1,['modHorns'] = -1,['modRearBumper'] = -1,['modDoorSpeaker'] = -1,['modBrakes'] = 2,['modDial'] = -1,['modSmokeEnabled'] = 1,['modGrille'] = -1,['modFender'] = 0,['modTrimA'] = -1,['modVanityPlate'] = -1,['modPlateHolder'] = -1,['plateIndex'] = 1,['modSteeringWheel'] = -1,['modXenon'] = 1,['color2'] = 12,['modArmor'] = 4,['modDashboard'] = -1,['pearlescentColor'] = 12,['extras'] = { } ,['modExhaust'] = 3,['modAPlate'] = -1,['xenonColor'] = 255,['modSpoilers'] = 0,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,}}},
				{name = 'Nertigel\'s Schwartzer', props = {['sound']='schafter3',['color2'] = 12,['modBackWheels'] = -1,['bodyHealth'] = 1000.0,['modLivery'] = -1,['modArchCover'] = -1,['wheelColor'] = 12,['modTank'] = -1,['modXenon'] = 1,['modAerials'] = -1,['modOrnaments'] = -1,['modWindows'] = -1,['modStruts'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modAirFilter'] = -1,['modEngineBlock'] = -1,['modHydrolic'] = -1,['modFender'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['dirtLevel'] = 5.1,['modArmor'] = 4,['modHorns'] = -1,['modAPlate'] = -1,['modTrunk'] = -1,['modShifterLeavers'] = -1,['modPlateHolder'] = -1,['model'] = -746882698,['modSpeakers'] = -1,['extras'] = { ['10'] = false,['12'] = false,} ,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modHood'] = -1,['modRoof'] = -1,['modEngine'] = 3,['modTrimA'] = -1,['modFrame'] = 0,['modFrontBumper'] = 1,['modExhaust'] = 2,['modSteeringWheel'] = -1,['modFrontWheels'] = 25,['color1'] = 12,['modTrimB'] = -1,['modSmokeEnabled'] = 1,['windowTint'] = 1,['modSeats'] = -1,['fuelLevel'] = 65.0,['modSpoilers'] = 0,['modSuspension'] = 2,['modTransmission'] = 2,['plateIndex'] = 1,['modBrakes'] = 2,['modDashboard'] = -1,['modRightFender'] = -1,['wheels'] = 7,['modSideSkirt'] = 0,['modDial'] = -1,['modRearBumper'] = 0,['modGrille'] = 0,['modVanityPlate'] = -1,['modDoorSpeaker'] = -1,['pearlescentColor'] = 12,['xenonColor'] = 255,['modTurbo'] = 1,['engineHealth'] = 1000.0}},
				{name = 'Nertigel\'s Kamacho', props = {['plateIndex'] = 1,['modArchCover'] = -1,['extras'] = { ['1'] = true,},['modArmor'] = 4,['suspensionRaise'] = 0.0,['modTank'] = -1,['modWindows'] = -1,['modLivery'] = -1,['modSmokeEnabled'] = 1,['modFender'] = 0,['modAerials'] = -1,['modFrontBumper'] = 8,['modStruts'] = -1,['modEngine'] = 3,['bodyHealth'] = 1000.0,['fuelLevel'] = 60.0,['modHydrolic'] = -1,['modFrontWheels'] = 6,['modTrunk'] = -1,['modHorns'] = 0,['modEngineBlock'] = -1,['wheels'] = 4,['modShifterLeavers'] = -1,['modSpoilers'] = 3,['modXenon'] = 1,['modSeats'] = -1,['tyreSmokeColor'] = { [1] = 41,[2] = 36,[3] = 33,['n'] = 3,} ,['modRearBumper'] = 7,['modDoorSpeaker'] = -1,['modBackWheels'] = -1,['modTransmission'] = 2,['modDashboard'] = -1,['xenonColor'] = 255,['modFrame'] = 0,['modTrimA'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modVanityPlate'] = -1,['modGrille'] = 1,['modAirFilter'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSteeringWheel'] = -1,['modTrimB'] = -1,['modTurbo'] = 1,['dirtLevel'] = 0.1,['modSuspension'] = 3,['modRightFender'] = -1,['modRoof'] = -1,['modSpeakers'] = -1,['modExhaust'] = 0,['windowTint'] = 1,['modPlateHolder'] = -1,['engineHealth'] = 1000.0,['pearlescentColor'] = 12,['modOrnaments'] = -1,['model'] = -121446169,['color1'] = 12,['modBrakes'] = 2,['color2'] = 0,['wheelColor'] = 12,['modSideSkirt'] = 3,['modHood'] = 0,['modAPlate'] = -1}},
				{name = 'Nertigel\'s Neon', props = {['modSeats'] = -1,['modHorns'] = 0,['modLivery'] = -1,['modBrakes'] = 2,['modAPlate'] = -1,['modDial'] = -1,['plateIndex'] = 1,['modWindows'] = -1,['modFrame'] = -1,['xenonColor'] = 255,['modTank'] = -1,['modDoorSpeaker'] = -1,['modEngineBlock'] = -1,['color1'] = 12,['modTrimB'] = -1,['modDashboard'] = -1,['modAerials'] = -1,['pearlescentColor'] = 12,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modHydrolic'] = -1,['modSmokeEnabled'] = 1,['windowTint'] = 1,['modTrimA'] = -1,['modPlateHolder'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 0,['n'] = 3,} ,['dirtLevel'] = 5.5,['modTrunk'] = -1,['modArchCover'] = -1,['modVanityPlate'] = -1,['modRightFender'] = -1,['modRoof'] = -1,['modStruts'] = -1,['modOrnaments'] = -1,['modShifterLeavers'] = -1,['modSteeringWheel'] = -1,['suspensionRaise'] = -0.03999999910593,['modSpeakers'] = -1,['modAirFilter'] = -1,['modBackWheels'] = -1,['wheelColor'] = 89,['modTurbo'] = 1,['modFrontWheels'] = 23,['modExhaust'] = -1,['modArmor'] = 4,['color2'] = 89,['modSuspension'] = 2,['fuelLevel'] = 60.0,['modEngine'] = 3,['engineHealth'] = 1000.0,['modTransmission'] = -1,['modFender'] = -1,['modRearBumper'] = 0,['bodyHealth'] = 1000.0,['model'] = -1848994066,['wheels'] = 0,['modSpoilers'] = 1,['modHood'] = 1,['modGrille'] = -1,['extras'] = { } ,['modXenon'] = 1,['modSideSkirt'] = 7,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modFrontBumper'] = 1}},
				{name = 'Nertigel\'s GB200', props = {['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['fuelLevel'] = 60.0,['modLivery'] = 0,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modExhaust'] = 0,['modEngine'] = 3,['modTransmission'] = 2,['modTrimA'] = -1,['modAerials'] = -1,['modSideSkirt'] = 0,['xenonColor'] = 255,['modArchCover'] = -1,['modStruts'] = -1,['bodyHealth'] = 1000.0,['modArmor'] = 4,['modSpoilers'] = -1,['modTrunk'] = -1,['modRightFender'] = -1,['modEngineBlock'] = -1,['modDashboard'] = -1,['modFrontBumper'] = 3,['modSpeakers'] = -1,['modSteeringWheel'] = -1,['modHood'] = 5,['modSmokeEnabled'] = false,['modVanityPlate'] = -1,['modAPlate'] = -1,['modTrimB'] = -1,['engineHealth'] = 1000.0,['modPlateHolder'] = -1,['modSeats'] = -1,['modBackWheels'] = -1,['modDoorSpeaker'] = -1,['extras'] = { },['modFrontWheels'] = -1,['modDial'] = -1,['modHydrolic'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['color1'] = 12,['modFrame'] = 4,['modFender'] = 0,['modShifterLeavers'] = -1,['modRoof'] = 0,['modXenon'] = 1,['modTurbo'] = 1,['modSuspension'] = 4,['modHorns'] = 0,['modTank'] = -1,['plateIndex'] = 1,['color2'] = 121,['modOrnaments'] = -1,['modGrille'] = 0,['modWindows'] = -1,['wheelColor'] = 121,['modRearBumper'] = 2,['suspensionRaise'] = -0.089999996125698,['model'] = 1909189272,['windowTint'] = 1,['pearlescentColor'] = 12,['wheels'] = 7,['modBrakes'] = 2,['dirtLevel'] = 7.9,['modAirFilter'] = -1,}},
				{name = 'Nertigel\'s Savestra', props = {['modEngineBlock'] = -1,['modEngine'] = 3,['fuelLevel'] = 60.0,['xenonColor'] = 255,['suspensionRaise'] = -0.0099999997764826,['modTurbo'] = 1,['modPlateHolder'] = -1,['wheels'] = 7,['modDoorSpeaker'] = -1,['modLivery'] = 5,['modRightFender'] = -1,['modWindows'] = -1,['modFrontWheels'] = 4,['color1'] = 12,['modTrimB'] = -1,['model'] = 903794909,['modAerials'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSpoilers'] = 3,['modShifterLeavers'] = -1,['modTank'] = -1,['modXenon'] = 1,['modExhaust'] = 4,['modStruts'] = -1,['modAirFilter'] = -1,['modHydrolic'] = -1,['modBrakes'] = 2,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modDashboard'] = -1,['pearlescentColor'] = 12,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['dirtLevel'] = 8.9,['modTrunk'] = -1,['modBackWheels'] = -1,['modAPlate'] = -1,['modSteeringWheel'] = -1,['extras'] = { } ,['modArmor'] = 4,['modFender'] = 6,['modSeats'] = -1,['modSideSkirt'] = 0,['modVanityPlate'] = -1,['color2'] = 12,['modDial'] = -1,['modRoof'] = -1,['modFrontBumper'] = 11,['modSuspension'] = 2,['wheelColor'] = 12,['modTrimA'] = -1,['modSpeakers'] = -1,['windowTint'] = 1,['modArchCover'] = -1,['modSmokeEnabled'] = false,['modTransmission'] = 2,['modOrnaments'] = -1,['plateIndex'] = 1,['modRearBumper'] = 3,['modHorns'] = 0,['modHood'] = 5,['engineHealth'] = 1000.0,['modGrille'] = 8,['modFrame'] = 0,['bodyHealth'] = 1000.0,}},
				{name = 'Nertigel\'s Schlagen', props = {['modSuspension'] = 4,['modBackWheels'] = -1,['modHorns'] = 0,['modOrnaments'] = -1,['suspensionRaise'] = -0.03999999910593,['bodyHealth'] = 1000.0,['modEngineBlock'] = -1,['modGrille'] = 2,['modTrimB'] = -1,['modTank'] = -1,['wheelColor'] = 12,['modRightFender'] = 1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['plateIndex'] = 1,['fuelLevel'] = 60.0,['modFrame'] = 2,['modWindows'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modAerials'] = -1,['modExhaust'] = 3,['modTrunk'] = -1,['modEngine'] = 3,['modArchCover'] = -1,['modVanityPlate'] = -1,['modAirFilter'] = -1,['windowTint'] = 1,['modHydrolic'] = -1,['engineHealth'] = 1000.0,['modStruts'] = -1,['modPlateHolder'] = -1,['modRoof'] = 2,['modSpeakers'] = -1,['modFender'] = 2,['modDoorSpeaker'] = -1,['modShifterLeavers'] = -1,['modArmor'] = 4,['modSteeringWheel'] = -1,['modSeats'] = -1,['modSmokeEnabled'] = 1,['modAPlate'] = -1,['modDial'] = -1,['modDashboard'] = -1,['modXenon'] = 1,['modTrimA'] = -1,['tyreSmokeColor'] = { [1] = 41,[2] = 36,[3] = 33,['n'] = 3,} ,['modFrontWheels'] = -1,['modSideSkirt'] = 2,['modTransmission'] = 3,['modBrakes'] = 2,['color2'] = 12,['modRearBumper'] = 3,['wheels'] = 7,['modLivery'] = -1,['modTurbo'] = 1,['modFrontBumper'] = 6,['model'] = -507495760,['modHood'] = 8,['extras'] = { } ,['xenonColor'] = 255,['modSpoilers'] = 4,['color1'] = 134,['pearlescentColor'] = 12}},
				{name = 'Nertigel\'s Entity XXR', props = { ['suspensionRaise'] = -0.03999999910593,['modLivery'] = -1,['dirtLevel'] = 2.8,['modTrimB'] = -1,['bodyHealth'] = 1000.0,['pearlescentColor'] = 12,['model'] = -2120700196,['modWindows'] = -1,['xenonColor'] = 255,['modGrille'] = -1,['modRightFender'] = -1,['color1'] = 134,['plateIndex'] = 1,['modBrakes'] = 2,['modTank'] = -1,['wheelColor'] = 12,['extras'] = { } ,['modHorns'] = -1,['modSeats'] = -1,['modSteeringWheel'] = -1,['modAirFilter'] = -1,['modDoorSpeaker'] = -1,['modSpoilers'] = 4,['modSmokeEnabled'] = false,['modBackWheels'] = -1,['modHydrolic'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modExhaust'] = 1,['modTrunk'] = -1,['modSpeakers'] = -1,['modEngineBlock'] = -1,['modHood'] = 2,['modShifterLeavers'] = -1,['modStruts'] = -1,['modDashboard'] = -1,['modDial'] = -1,['modFender'] = -1,['fuelLevel'] = 60.0,['color2'] = 89,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modOrnaments'] = -1,['modFrontBumper'] = 6,['modTrimA'] = -1,['modPlateHolder'] = -1,['modEngine'] = 3,['modVanityPlate'] = -1,['modFrontWheels'] = 16,['modXenon'] = 1,['modSuspension'] = 3,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modSideSkirt'] = -1,['modTurbo'] = 1,['modArmor'] = 4,['modArchCover'] = -1,['modRoof'] = -1,['modAerials'] = -1,['engineHealth'] = 1000.0,['modAPlate'] = -1,['modFrame'] = -1,['modRearBumper'] = 2,['modTransmission'] = 2,['windowTint'] = 1,['wheels'] = 7}},
				{name = 'Nertigel\'s Sultan RS', props = {['windowTint'] = 1,['modStruts'] = 1,['modRoof'] = 1,['modBrakes'] = 2,['bodyHealth'] = 1000.0,['modLivery'] = -1,['modWindows'] = 0,['modAirFilter'] = 5,['modTrimB'] = 0,['modSpoilers'] = 14,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modArchCover'] = 0,['modTrimA'] = 0,['modPlateHolder'] = -1,['suspensionRaise'] = -0.050000000745058,['modTank'] = -1,['modDoorSpeaker'] = 4,['modHydrolic'] = -1,['modTrunk'] = -1,['wheels'] = 0,['wheelColor'] = 12,['tyreSmokeColor'] = { [1] = 0,[2] = 0,[3] = 255,['n'] = 3,} ,['color1'] = 83,['model'] = -295689028,['modAPlate'] = -1,['modTurbo'] = 1,['modSteeringWheel'] = 12,['modFrontBumper'] = 7,['modSeats'] = 9,['pearlescentColor'] = 12,['modSuspension'] = 3,['xenonColor'] = 255,['plateIndex'] = 1,['modHood'] = 8,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modFrame'] = 4,['modArmor'] = 4,['modSideSkirt'] = 2,['modEngineBlock'] = 1,['dirtLevel'] = 2.0,['modDial'] = 4,['modDashboard'] = 2,['modVanityPlate'] = -1,['modRearBumper'] = -1,['fuelLevel'] = 60.0,['modOrnaments'] = 20,['modBackWheels'] = -1,['modAerials'] = 0,['color2'] = 83,['modExhaust'] = 3,['modXenon'] = 1,['modGrille'] = 3,['modEngine'] = 4,['modShifterLeavers'] = -1,['modHorns'] = -1,['modSmokeEnabled'] = 1,['modTransmission'] = 3,['modRightFender'] = -1,['modFender'] = 5,['modFrontWheels'] = 23,['extras'] = { } ,['modSpeakers'] = -1}},
			
				{name = 'Alfa Romeo Giulia QV', props = {['modLivery'] = 0,['xenonColor'] = 255,['model'] = 433374210,['extras'] = { ['11'] = true,} ,['modTurbo'] = 1,['suspensionRaise'] = 2.2351741291171e-10,['dirtLevel'] = 6.8,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = -1,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 4,['modFrame'] = -1,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 31,['wheels'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 3,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = -1,['color1'] = 12,['modExhaust'] = -1,['modRoof'] = -1,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = -1,['plateIndex'] = 1,['wheelColor'] = 156,['modEngineBlock'] = -1,['modRearBumper'] = -1,['modVanityPlate'] = -1,['modFrontBumper'] = -1,}},
				
				{name = 'Aston Martin DBS 2008', props = {['modLivery'] = -1,['xenonColor'] = 255,['model'] = -1131896028,['extras'] = { } ,['modTurbo'] = 1,['suspensionRaise'] = -0.019999995827675,['dirtLevel'] = 3.8,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = -1,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = 9,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 1,['modFrame'] = -1,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 2,['wheels'] = 7,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 3,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = -1,['color1'] = 83,['modExhaust'] = -1,['modRoof'] = -1,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = -1,['plateIndex'] = 1,['wheelColor'] = 12,['modEngineBlock'] = -1,['modRearBumper'] = -1,['modVanityPlate'] = -1,['modFrontBumper'] = -1,}},
				
				{name = 'Bentley Bentayga 2017', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 1,['suspensionRaise'] = -0.060000006109476,['fuelLevel'] = 60.0,['modLivery'] = -1,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 1,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 12.2,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = 1728797204,['modAPlate'] = -1,['modHood'] = 0,['wheelColor'] = 156,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = -1,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['1'] = false,['2'] = false,['10'] = false,['3'] = false,['4'] = true,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 12,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 3,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = -1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = 1,['color2'] = 2,['modFrame'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = -1,['modAerials'] = -1,}},
				{name = 'Bentley Continental GT 2013', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = -1,['suspensionRaise'] = -0.03999999910593,['fuelLevel'] = 60.0,['modLivery'] = -1,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = -1,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 8.0,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = 899312186,['modAPlate'] = -1,['modHood'] = -1,['wheelColor'] = 122,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = -1,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['1'] = true,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 12,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = -1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = 0,['color2'] = 88,['modFrame'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 0,['modAerials'] = -1,}},
				
				{name = 'Audi A4 Quattro', props = {['modLivery'] = -1,['xenonColor'] = 255,['model'] = -985643932,['extras'] = { } ,['modTurbo'] = 1,['suspensionRaise'] = -0.019999999552965,['dirtLevel'] = 6.1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = -1,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 1,['modFrame'] = -1,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 0,['wheels'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 3,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = -1,['color1'] = 14,['modExhaust'] = 0,['modRoof'] = 0,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = -1,['plateIndex'] = 4,['wheelColor'] = 156,['modEngineBlock'] = -1,['modRearBumper'] = 0,['modVanityPlate'] = -1,['modFrontBumper'] = 0,}},
				{name = 'Audi A6 2020', props = {['modLivery'] = -1,['xenonColor'] = 255,['model'] = -494839908,['extras'] = { } ,['modTurbo'] = 1,['suspensionRaise'] = -0.059999998658895,['dirtLevel'] = 0.0,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = 3,['modHood'] = 4,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = 2,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = 2,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 1,['modFrame'] = 4,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 112,['wheels'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 3,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = 5,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = 5,['color1'] = 134,['modExhaust'] = 1,['modRoof'] = 1,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = 1,['plateIndex'] = 4,['wheelColor'] = 12,['modEngineBlock'] = -1,['modRearBumper'] = 1,['modVanityPlate'] = -1,['modFrontBumper'] = 3,}},
				{name = 'Audi Q8 2020', props = {['modLivery'] = -1,['xenonColor'] = 255,['model'] = -2006731729,['extras'] = { } ,['modTurbo'] = 1,['suspensionRaise'] = -0.019999995827675,['dirtLevel'] = 0.0,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = -1,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 1,['modFrame'] = 0,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 2,['wheels'] = 3,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 4,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = -1,['color1'] = 134,['modExhaust'] = -1,['modRoof'] = -1,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = -1,['plateIndex'] = 4,['wheelColor'] = 112,['modEngineBlock'] = -1,['modRearBumper'] = -1,['modVanityPlate'] = -1,['modFrontBumper'] = -1,}},
				{name = 'Audi R8 2020', props = {['modSteeringWheel'] = -1,['suspensionRaise'] = -0.079999998211861,['bodyHealth'] = 1000.0,['modFrontBumper'] = 1,['modLivery'] = -1,['modVanityPlate'] = -1,['modAPlate'] = -1,['extras'] = { } ,['modWindows'] = -1,['xenonColor'] = 255,['modTrimB'] = -1,['pearlescentColor'] = 12,['modTank'] = -1,['modTurbo'] = 1,['color1'] = 134,['modAirFilter'] = -1,['windowTint'] = 1,['modSideSkirt'] = 0,['color2'] = 28,['modSpeakers'] = -1,['fuelLevel'] = 60.0,['modArchCover'] = -1,['wheels'] = 7,['dirtLevel'] = 7.3,['modEngineBlock'] = -1,['modStruts'] = -1,['modSpoilers'] = 3,['modPlateHolder'] = -1,['modXenon'] = 1,['modRearBumper'] = 0,['modRightFender'] = 1,['modDial'] = -1,['modFrontWheels'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['modTrunk'] = -1,['modFrame'] = 0,['modAerials'] = -1,['modSmokeEnabled'] = 1,['modDashboard'] = -1,['modDoorSpeaker'] = -1,['modSeats'] = -1,['modSuspension'] = 4,['modTransmission'] = 2,['plateIndex'] = 4,['modShifterLeavers'] = -1,['wheelColor'] = 12,['modArmor'] = 4,['modTrimA'] = -1,['modFender'] = -1,['modBackWheels'] = -1,['modOrnaments'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['model'] = -143695728,['modHorns'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modRoof'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['engineHealth'] = 1000.0,['modHood'] = 3,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modExhaust'] = -1,}},
				{name = 'Audi R8 V10', props = {['modLivery'] = -1,['xenonColor'] = 255,['model'] = -1183566390,['extras'] = { } ,['modTurbo'] = 1,['suspensionRaise'] = -0.070000000298023,['dirtLevel'] = 6.4,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = -1,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 1,['modFrame'] = 0,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 89,['wheels'] = 7,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 2,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = -1,['color1'] = 89,['modExhaust'] = -1,['modRoof'] = -1,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = 1,['plateIndex'] = 1,['wheelColor'] = 12,['modEngineBlock'] = -1,['modRearBumper'] = -1,['modVanityPlate'] = -1,['modFrontBumper'] = 1,}},
				{name = 'Audi RS3', props = {['modSteeringWheel'] = -1,['suspensionRaise'] = -0.050000004470348,['bodyHealth'] = 1000.0,['modFrontBumper'] = 4,['modLivery'] = -1,['modVanityPlate'] = -1,['modAPlate'] = -1,['extras'] = { } ,['modWindows'] = -1,['xenonColor'] = 255,['modTrimB'] = -1,['pearlescentColor'] = 12,['modTank'] = -1,['modTurbo'] = 1,['color1'] = 12,['modAirFilter'] = -1,['windowTint'] = 1,['modSideSkirt'] = 0,['color2'] = 27,['modSpeakers'] = -1,['fuelLevel'] = 60.0,['modArchCover'] = -1,['wheels'] = 0,['dirtLevel'] = 10.3,['modEngineBlock'] = -1,['modStruts'] = -1,['modSpoilers'] = -1,['modPlateHolder'] = -1,['modXenon'] = 1,['modRearBumper'] = -1,['modRightFender'] = -1,['modDial'] = -1,['modFrontWheels'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['modTrunk'] = -1,['modFrame'] = -1,['modAerials'] = -1,['modSmokeEnabled'] = 1,['modDashboard'] = -1,['modDoorSpeaker'] = -1,['modSeats'] = -1,['modSuspension'] = 3,['modTransmission'] = 2,['plateIndex'] = 4,['modShifterLeavers'] = -1,['wheelColor'] = 27,['modArmor'] = 4,['modTrimA'] = -1,['modFender'] = -1,['modBackWheels'] = -1,['modOrnaments'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['model'] = -1029368191,['modHorns'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modRoof'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['engineHealth'] = 1000.0,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modExhaust'] = 2,}},
				{name = 'Audi RS3 2018', props = {['modSteeringWheel'] = -1,['suspensionRaise'] = -0.029999995604157,['bodyHealth'] = 1000.0,['modFrontBumper'] = 0,['modLivery'] = -1,['modVanityPlate'] = -1,['modAPlate'] = -1,['extras'] = { ['6'] = true,} ,['modWindows'] = -1,['xenonColor'] = 255,['modTrimB'] = -1,['pearlescentColor'] = 12,['modTank'] = -1,['modTurbo'] = 1,['color1'] = 134,['modAirFilter'] = -1,['windowTint'] = 1,['modSideSkirt'] = 2,['color2'] = 12,['modSpeakers'] = -1,['fuelLevel'] = 60.0,['modArchCover'] = -1,['wheels'] = 0,['dirtLevel'] = 9.3,['modEngineBlock'] = -1,['modStruts'] = -1,['modSpoilers'] = -1,['modPlateHolder'] = -1,['modXenon'] = 1,['modRearBumper'] = 0,['modRightFender'] = -1,['modDial'] = -1,['modFrontWheels'] = -1,['modGrille'] = 1,['modHydrolic'] = -1,['modTrunk'] = -1,['modFrame'] = 2,['modAerials'] = -1,['modSmokeEnabled'] = 1,['modDashboard'] = -1,['modDoorSpeaker'] = -1,['modSeats'] = -1,['modSuspension'] = 4,['modTransmission'] = 2,['plateIndex'] = 1,['modShifterLeavers'] = -1,['wheelColor'] = 28,['modArmor'] = 4,['modTrimA'] = -1,['modFender'] = -1,['modBackWheels'] = -1,['modOrnaments'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['model'] = 216350205,['modHorns'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modRoof'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['engineHealth'] = 1000.0,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modExhaust'] = 0,}},
				{name = 'Audi RS4 Avant', props = {['modLivery'] = -1,['xenonColor'] = 255,['model'] = -2019421579,['extras'] = { ['3'] = true,} ,['modTurbo'] = 1,['suspensionRaise'] = -0.029999999329448,['dirtLevel'] = 10.1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = 1,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['pearlescentColor'] = 0,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 1,['modFrame'] = -1,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 12,['wheels'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 4,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = -1,['color1'] = 12,['modExhaust'] = -1,['modRoof'] = 0,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = 2,['plateIndex'] = 1,['wheelColor'] = 12,['modEngineBlock'] = -1,['modRearBumper'] = -1,['modVanityPlate'] = -1,['modFrontBumper'] = 3,}},
				{name = 'Audi RS5 2014', props = {['modLivery'] = 0,['xenonColor'] = 255,['model'] = -1362824500,['extras'] = { } ,['modTurbo'] = 1,['suspensionRaise'] = -0.03999999538064,['dirtLevel'] = 4.1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = 0,['modHood'] = 2,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = 2,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = -1,['modFrame'] = 1,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 29,['wheels'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 2,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = -1,['color1'] = 23,['modExhaust'] = -1,['modRoof'] = -1,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = -1,['plateIndex'] = 4,['wheelColor'] = 27,['modEngineBlock'] = -1,['modRearBumper'] = 1,['modVanityPlate'] = -1,['modFrontBumper'] = 2,}},
				{name = 'Audi RS6', props = {['modLivery'] = 0,['xenonColor'] = 255,['model'] = -1379807831,['extras'] = { } ,['modTurbo'] = 1,['suspensionRaise'] = -0.03999999910593,['dirtLevel'] = 4.2,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = -1,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = 1,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 1,['modFrame'] = 0,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 28,['wheels'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 2,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = 0,['color1'] = 12,['modExhaust'] = -1,['modRoof'] = -1,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = -1,['plateIndex'] = 1,['wheelColor'] = 12,['modEngineBlock'] = -1,['modRearBumper'] = 1,['modVanityPlate'] = -1,['modFrontBumper'] = 2,}},
				{name = 'Audi RS7 2016', props = {['modLivery'] = 0,['xenonColor'] = 255,['model'] = -1071770374,['extras'] = { } ,['modTurbo'] = 1,['suspensionRaise'] = -0.03999999910593,['dirtLevel'] = 8.2,['modWindows'] = -1,['bodyHealth'] = 1000.0,['modTransmission'] = 2,['modSideSkirt'] = -1,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSmokeEnabled'] = 1,['modArchCover'] = -1,['modTrimA'] = -1,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modTrimB'] = -1,['modAerials'] = -1,['modStruts'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['pearlescentColor'] = 12,['modTrunk'] = -1,['modSpeakers'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modSeats'] = -1,['fuelLevel'] = 60.0,['modArmor'] = 4,['modSteeringWheel'] = -1,['modShifterLeavers'] = -1,['modFrontWheels'] = -1,['modAPlate'] = -1,['modXenon'] = 1,['windowTint'] = 1,['modFrame'] = -1,['modDashboard'] = -1,['modOrnaments'] = -1,['color2'] = 28,['wheels'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modBackWheels'] = -1,['modSuspension'] = 3,['modPlateHolder'] = -1,['modDoorSpeaker'] = -1,['modRightFender'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modFender'] = -1,['color1'] = 12,['modExhaust'] = -1,['modRoof'] = -1,['modHorns'] = -1,['modTank'] = -1,['modSpoilers'] = -1,['plateIndex'] = 4,['wheelColor'] = 0,['modEngineBlock'] = -1,['modRearBumper'] = -1,['modVanityPlate'] = -1,['modFrontBumper'] = 0,}},
				{name = 'Audi RSQ7 2016', props = {['modSteeringWheel'] = -1,['suspensionRaise'] = 0.0,['bodyHealth'] = 1000.0,['modFrontBumper'] = 0,['modLivery'] = -1,['modVanityPlate'] = -1,['modAPlate'] = -1,['extras'] = { ['1'] = true,['4'] = false,['3'] = false,} ,['modWindows'] = -1,['xenonColor'] = 255,['modTrimB'] = -1,['pearlescentColor'] = 12,['modTank'] = -1,['modTurbo'] = 1,['color1'] = 12,['modAirFilter'] = -1,['windowTint'] = 1,['modSideSkirt'] = -1,['color2'] = 3,['modSpeakers'] = -1,['fuelLevel'] = 65.0,['modArchCover'] = -1,['wheels'] = 3,['dirtLevel'] = 4.5,['modEngineBlock'] = -1,['modStruts'] = -1,['modSpoilers'] = 0,['modPlateHolder'] = -1,['modXenon'] = 1,['modRearBumper'] = 0,['modRightFender'] = 0,['modDial'] = -1,['modFrontWheels'] = -1,['modGrille'] = -1,['modHydrolic'] = -1,['modTrunk'] = -1,['modFrame'] = 0,['modAerials'] = -1,['modSmokeEnabled'] = 1,['modDashboard'] = -1,['modDoorSpeaker'] = -1,['modSeats'] = -1,['modSuspension'] = 3,['modTransmission'] = 2,['plateIndex'] = 1,['modShifterLeavers'] = -1,['wheelColor'] = 1,['modArmor'] = 4,['modTrimA'] = -1,['modFender'] = 0,['modBackWheels'] = -1,['modOrnaments'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['model'] = 119794591,['modHorns'] = -1,['modBrakes'] = 2,['modEngine'] = 3,['modRoof'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['engineHealth'] = 1000.0,['modHood'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modExhaust'] = -1,}},
			
				{name = 'BMW 850 CSi', props = { ['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 1,['suspensionRaise'] = -0.019999999552965,['fuelLevel'] = 60.0,['modLivery'] = 0,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 0,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 2.0,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = 444286472,['modAPlate'] = -1,['modHood'] = 0,['wheelColor'] = 28,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 0,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { } ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 112,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = 0,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 4,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 28,['modFrame'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 0,['modAerials'] = -1,}},
				{name = 'BMW M3 F80', props = {['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['fuelLevel'] = 60.0,['suspensionRaise'] = -0.03999999538064,['modLivery'] = -1,['modWindows'] = -1,['modDashboard'] = -1,['bodyHealth'] = 1000.0,['windowTint'] = -1,['xenonColor'] = 255,['wheels'] = 0,['color1'] = 12,['modOrnaments'] = -1,['modXenon'] = 1,['modTrimB'] = -1,['modSeats'] = -1,['modAerials'] = 0,['modArchCover'] = 2,['modStruts'] = -1,['modArmor'] = 4,['modTransmission'] = 2,['extras'] = { ['2'] = false,['1'] = false,} ,['pearlescentColor'] = 12,['modSideSkirt'] = 0,['modTrunk'] = -1,['modAirFilter'] = -1,['modFrontWheels'] = -1,['modVanityPlate'] = 1,['modHydrolic'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modBackWheels'] = -1,['modSteeringWheel'] = -1,['modSpeakers'] = -1,['modSpoilers'] = 0,['modExhaust'] = 0,['modAPlate'] = -1,['color2'] = 28,['modDial'] = -1,['modRoof'] = 1,['modPlateHolder'] = 0,['modTank'] = -1,['modTrimA'] = -1,['modEngineBlock'] = 0,['modEngine'] = 3,['plateIndex'] = 1,['modRearBumper'] = 2,['modDoorSpeaker'] = -1,['modSmokeEnabled'] = 1,['modGrille'] = 1,['modTurbo'] = 1,['dirtLevel'] = 8.4,['modSuspension'] = 3,['modHorns'] = -1,['modHood'] = 1,['modBrakes'] = 2,['model'] = -580610645,['modShifterLeavers'] = -1,['modFender'] = -1,['wheelColor'] = 0,['modRightFender'] = -1,['engineHealth'] = 1000.0,['modFrame'] = 0,['modFrontBumper'] = 2,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,}}},
				{name = 'BMW M4 F82', props = {['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['fuelLevel'] = 60.0,['suspensionRaise'] = -0.049999997019768,['modLivery'] = 0,['modWindows'] = -1,['modDashboard'] = -1,['bodyHealth'] = 1000.0,['windowTint'] = 1,['xenonColor'] = 255,['wheels'] = 0,['color1'] = 134,['modOrnaments'] = -1,['modXenon'] = 1,['modTrimB'] = -1,['modSeats'] = -1,['modAerials'] = -1,['modArchCover'] = -1,['modStruts'] = -1,['modArmor'] = 4,['modTransmission'] = 3,['extras'] = { } ,['pearlescentColor'] = 134,['modSideSkirt'] = -1,['modTrunk'] = -1,['modAirFilter'] = -1,['modFrontWheels'] = -1,['modVanityPlate'] = -1,['modHydrolic'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modBackWheels'] = -1,['modSteeringWheel'] = -1,['modSpeakers'] = -1,['modSpoilers'] = 0,['modExhaust'] = 0,['modAPlate'] = -1,['color2'] = 111,['modDial'] = -1,['modRoof'] = -1,['modPlateHolder'] = -1,['modTank'] = -1,['modTrimA'] = -1,['modEngineBlock'] = -1,['modEngine'] = 3,['plateIndex'] = 1,['modRearBumper'] = 1,['modDoorSpeaker'] = -1,['modSmokeEnabled'] = 1,['modGrille'] = -1,['modTurbo'] = 1,['dirtLevel'] = 3.3,['modSuspension'] = 3,['modHorns'] = -1,['modHood'] = 0,['modBrakes'] = 3,['model'] = 909765281,['modShifterLeavers'] = -1,['modFender'] = -1,['wheelColor'] = 156,['modRightFender'] = -1,['engineHealth'] = 1000.0,['modFrame'] = -1,['modFrontBumper'] = 0,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,}}},
				{name = 'BMW M5 E60', props = { ['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 0,['suspensionRaise'] = -0.0099999997764826,['fuelLevel'] = 60.0,['modLivery'] = 2,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = -1,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = 0,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 9.0,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = 0,['model'] = 1969115674,['modAPlate'] = -1,['modHood'] = -1,['wheelColor'] = 134,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 0,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['12'] = true,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 134,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = -1,['modPlateHolder'] = 0,['modRearBumper'] = -1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = 3,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = 0,['color2'] = 0,['modFrame'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = -1,['modAerials'] = 0,}},
				{name = 'BMW M5 F90', props = {['suspensionRaise'] = -0.059999998658895,['modSpoilers'] = 6,['modShifterLeavers'] = -1,['modTank'] = -1,['modXenon'] = 1,['modBackWheels'] = -1,['windowTint'] = 1,['modWindows'] = -1,['modRearBumper'] = 1,['modDashboard'] = -1,['color1'] = 134,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modArchCover'] = -1,['modStruts'] = -1,['modAerials'] = -1,['modEngineBlock'] = -1,['modHydrolic'] = -1,['extras'] = { ['1'] = true,} ,['modSeats'] = -1,['modTrunk'] = -1,['modFender'] = -1,['model'] = 1093697054,['engineHealth'] = 1000.0,['modDial'] = -1,['color2'] = 2,['dirtLevel'] = 8.2,['modSpeakers'] = -1,['modAPlate'] = -1,['modDoorSpeaker'] = -1,['modSuspension'] = 3,['modSteeringWheel'] = -1,['modBrakes'] = 2,['pearlescentColor'] = 12,['modHorns'] = -1,['fuelLevel'] = 60.0,['modFrontBumper'] = 3,['modOrnaments'] = -1,['modGrille'] = 1,['modAirFilter'] = -1,['modRightFender'] = -1,['modPlateHolder'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modExhaust'] = 0,['modTrimA'] = -1,['modVanityPlate'] = -1,['modFrame'] = -1,['modTrimB'] = -1,['xenonColor'] = 255,['modSmokeEnabled'] = 1,['wheelColor'] = 89,['modArmor'] = 4,['modTransmission'] = 2,['bodyHealth'] = 1000.0,['modFrontWheels'] = -1,['modHood'] = 2,['modSideSkirt'] = 1,['modRoof'] = 0,['modLivery'] = -1,['modTurbo'] = 1,['wheels'] = 0,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modEngine'] = 3,['plateIndex'] = 1,}},
				{name = 'BMW M6 F13', props = {['modHydrolic'] = -1,['modFender'] = -1,['modLivery'] = -1,['modFrontBumper'] = -1,['windowTint'] = 1,['modTrimB'] = -1,['modAerials'] = -1,['wheelColor'] = 156,['fuelLevel'] = 59.9,['modTrimA'] = -1,['pearlescentColor'] = 12,['modVanityPlate'] = -1,['modFrame'] = -1,['suspensionRaise'] = -0.079999998211861,['modRearBumper'] = -1,['wheels'] = 0,['modEngine'] = 3,['modDoorSpeaker'] = -1,['modShifterLeavers'] = -1,['modAPlate'] = -1,['modSteeringWheel'] = -1,['modSeats'] = -1,['modRoof'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modDial'] = -1,['modTurbo'] = 1,['dirtLevel'] = 3.9,['modSmokeEnabled'] = 1,['modDashboard'] = -1,['modBrakes'] = 2,['modRightFender'] = -1,['modBackWheels'] = -1,['modExhaust'] = -1,['model'] = 1897898727,['color2'] = 8,['modArchCover'] = -1,['xenonColor'] = 255,['engineHealth'] = 1000.0,['modAirFilter'] = -1,['modPlateHolder'] = -1,['modOrnaments'] = -1,['modFrontWheels'] = -1,['modXenon'] = 1,['extras'] = { ['1'] = false,['2'] = false,} ,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['color1'] = 12,['modSpoilers'] = -1,['modArmor'] = 4,['modSuspension'] = 3,['modHorns'] = -1,['bodyHealth'] = 1000.0,['modTank'] = -1,['modSpeakers'] = -1,['modTrunk'] = -1,['modGrille'] = -1,['modEngineBlock'] = -1,['modSideSkirt'] = -1,['modWindows'] = -1,['plateIndex'] = 1,['modTransmission'] = 2,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['modHood'] = -1,['modStruts'] = -1,}},
				{name = 'BMW M8', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = -1,['suspensionRaise'] = 0.0049999998882413,['fuelLevel'] = 60.0,['modLivery'] = 0,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = -1,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 3.6,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = -1404319008,['modAPlate'] = -1,['modHood'] = -1,['wheelColor'] = 28,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = -1,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['10'] = true,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 12,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = -1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = 3,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 28,['modFrame'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = -1,['modAerials'] = -1,}},
				{name = 'BMW X6M', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 0,['suspensionRaise'] = -0.12999999523163,['fuelLevel'] = 60.0,['modLivery'] = 1,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 0,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 3.6,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = -506359117,['modAPlate'] = -1,['modHood'] = 0,['wheelColor'] = 12,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 1,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['1'] = true,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 12,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 3,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = 0,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 28,['modFrame'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 0,['modAerials'] = -1,}},
				
				{name = 'Chevrolet Corvette C7', props =  {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 1,['suspensionRaise'] = -0.059999998658895,['fuelLevel'] = 60.0,['modLivery'] = 0,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 0,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 6.4,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = 874739883,['modAPlate'] = -1,['modHood'] = 0,['wheelColor'] = 12,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = -1,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['1'] = true,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 134,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = 0,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 4,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 134,['modFrame'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 2,['modAerials'] = -1,}},
				
				{name = 'Dodge Challenger 2016', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 5,['suspensionRaise'] = 0.0,['fuelLevel'] = 60.0,['modLivery'] = 0,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 0,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = 0,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 7.5,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = -216150906,['modAPlate'] = -1,['modHood'] = 4,['wheelColor'] = 12,['modRightFender'] = 0,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 0,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['1'] = false,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 28,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = 2,['modPlateHolder'] = -1,['modRearBumper'] = -1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 4,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = 0,['color2'] = 28,['modFrame'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 4,['modAerials'] = -1,}},
				{name = 'Dodge Charger 2016', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 6,['suspensionRaise'] = 0.0,['fuelLevel'] = 60.0,['modLivery'] = 4,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 0,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 5.2,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = -1513691047,['modAPlate'] = -1,['modHood'] = 0,['wheelColor'] = 12,['modRightFender'] = 1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 2,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { } ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 12,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = 1,['modPlateHolder'] = -1,['modRearBumper'] = -1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 28,['modFrame'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 0,['modAerials'] = -1,}},
				{name = 'Dodge Viper 1999', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = -1,['suspensionRaise'] = -0.0099999997764826,['fuelLevel'] = 60.0,['modLivery'] = 0,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = -1,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 10.2,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = 726460559,['modAPlate'] = -1,['modHood'] = 0,['wheelColor'] = 28,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 0,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { } ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 12,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = -1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 28,['modFrame'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 1,['modAerials'] = -1,}},
				
				{name = 'Ford Mustang 1995', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 2,['suspensionRaise'] = 0.0,['fuelLevel'] = 60.0,['modLivery'] = -1,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 0,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 89,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = 0,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 3.2,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = 688884119,['modAPlate'] = -1,['modHood'] = 3,['wheelColor'] = 12,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 0,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['1'] = true,['2'] = true,['3'] = true,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 138,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 7,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = 1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 89,['modFrame'] = 1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 5,['modAerials'] = -1,}},
				{name = 'Ford Mustang 2019', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 6,['suspensionRaise'] = 0.0,['fuelLevel'] = 60.0,['modLivery'] = 5,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 0,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = 1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 3,['modTrunk'] = -1,['dirtLevel'] = 10.1,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = 1311724675,['modAPlate'] = -1,['modHood'] = 1,['wheelColor'] = 156,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 0,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { } ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 12,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 1,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = -1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 89,['modFrame'] = 0,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 5,['modAerials'] = -1,}},
				
				{name = 'Honda S2000 AP2', props = {['modOrnaments'] = -1,['modTrimB'] = -1,['modTank'] = -1,['modFrontBumper'] = 1,['suspensionRaise'] = -0.070000000298023,['fuelLevel'] = 60.0,['modLivery'] = -1,['modBrakes'] = 2,['windowTint'] = 1,['modSideSkirt'] = 0,['modEngineBlock'] = -1,['tyreSmokeColor'] = { [1] = 255,[2] = 255,[3] = 255,['n'] = 3,} ,['pearlescentColor'] = 12,['modDoorSpeaker'] = -1,['modTransmission'] = 2,['modRoof'] = -1,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modSuspension'] = 2,['modTrunk'] = -1,['dirtLevel'] = 5.2,['modSteeringWheel'] = -1,['xenonColor'] = 255,['modArchCover'] = -1,['model'] = -1549019518,['modAPlate'] = -1,['modHood'] = 0,['wheelColor'] = 12,['modRightFender'] = -1,['modXenon'] = 1,['modWindows'] = -1,['bodyHealth'] = 1000.0,['engineHealth'] = 1000.0,['modHydrolic'] = -1,['modExhaust'] = 0,['modSmokeEnabled'] = 1,['modShifterLeavers'] = -1,['modSeats'] = -1,['extras'] = { ['2'] = false,} ,['modArmor'] = 4,['modTurbo'] = 1,['modTrimA'] = -1,['color1'] = 12,['modEngine'] = 3,['modVanityPlate'] = -1,['wheels'] = 0,['modFender'] = -1,['modPlateHolder'] = -1,['modRearBumper'] = 1,['modHorns'] = -1,['modFrontWheels'] = -1,['modBackWheels'] = -1,['modAirFilter'] = -1,['modDashboard'] = -1,['plateIndex'] = 1,['modDial'] = -1,['modStruts'] = -1,['modGrille'] = -1,['color2'] = 0,['modFrame'] = 1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['modSpeakers'] = -1,['modSpoilers'] = 1,['modAerials'] = -1,}},

				{name = 'Range Rover Vogue ST', props = {['fuelLevel'] = 60.0,['modRightFender'] = 0,['suspensionRaise'] = -0.029999995604157,['modLivery'] = -1,['modDial'] = -1,['color1'] = 134,['modDashboard'] = -1,['modOrnaments'] = -1,['modFrontBumper'] = 1,['modSuspension'] = 3,['modAPlate'] = -1,['modTransmission'] = 2,['modTrimB'] = -1,['modAerials'] = -1,['modArchCover'] = -1,['modBackWheels'] = -1,['neonColor'] = { [1] = 255,[2] = 0,[3] = 255,['n'] = 3,} ,['plateIndex'] = 0,['modBrakes'] = 2,['windowTint'] = 1,['modAirFilter'] = -1,['modStruts'] = -1,['extras'] = { ['1'] = false,['2'] = true,} ,['modFrontWheels'] = -1,['wheels'] = 3,['modTrunk'] = -1,['modSpeakers'] = -1,['modSteeringWheel'] = -1,['modTrimA'] = -1,['modExhaust'] = 1,['modSideSkirt'] = -1,['pearlescentColor'] = 12,['modRoof'] = -1,['modSpoilers'] = 0,['modSeats'] = -1,['modRearBumper'] = -1,['modHood'] = 1,['modDoorSpeaker'] = -1,['modTurbo'] = 1,['modSmokeEnabled'] = 1,['tyreSmokeColor'] = { [1] = 255,[2] = 0,[3] = 0,['n'] = 3,} ,['modWindows'] = -1,['modTank'] = -1,['modXenon'] = 1,['modVanityPlate'] = -1,['engineHealth'] = 1000.0,['wheelColor'] = 111,['modPlateHolder'] = -1,['modEngineBlock'] = -1,['modEngine'] = 3,['bodyHealth'] = 1000.0,['modArmor'] = 4,['color2'] = 150,['modHorns'] = -1,['modShifterLeavers'] = -1,['modHydrolic'] = -1,['modFrame'] = 0,['xenonColor'] = 255,['model'] = 1993609528,['modFender'] = 0,['neonEnabled'] = { [1] = false,[2] = false,[3] = false,[4] = false,} ,['modGrille'] = 1,['dirtLevel'] = 4.0,}},
			},
		},
		pTarget = {
			handle = 0,
			data = {
				whoIsBeingSpectated = 0,
				spectateCameraHandle = nil,
			},
			friendlies = {},
			frozenTargets = {},
			explosionLoopTargets = {},
			fakeExplosionLoopTargets = {},
		},
		rainbowValue = {r = 255, g = 255, b = 255, a = 225},
		
		spawnedObjects = {
			_selected = {},
		},

		sprite = {
			handle = nil,
			background = {},
		},
		
		cameras = {
			freecam = {
				handle = nil,
			},
		},

		developerMode = {
			enabled = true,
			count = 7,
			key = '187sb1337',
		},
		keybinds = {},
		bulletTracers = {},
		movementTrails = {},
		bulletImpacts = {},
		weaponLoadouts = {
			[1] = {
				name = 'Golden Set', 
				weapons = {
					['WEAPON_APPISTOL'] = {
						attachments = {[1] = 899381934, [2] = -1686714580, [3] = -1023114086}
					},
					['WEAPON_ASSAULTRIFLE'] = {
						attachments = {[1] = 202788691, [2] = 1319990579, [3] = -1489156508, [4] = -1657815255}
					},
					['WEAPON_MICROSMG'] = {
						attachments = {[1] = 1215999497, [2] = -1489156508, [3] = -1657815255}
					}
				}
			},
			[2] = {
				name = 'Terrorist', 
				weapons = {
					['WEAPON_ASSAULTRIFLE'] = {
						attachments = {[1] = 202788691, [2] = -1657815255}
					},
					['WEAPON_COMBATMG'] = {
						attachments = {[1] = 202788691, [2] = -1596416958}
					},
					['WEAPON_STICKYBOMB'] = {
						attachments = {}
					},
					['WEAPON_RPG'] = {
						attachments = {}
					}
				}
			},
		},
		keyboardInputs = {},
	},
	
	features = {},
	functions = {
		strings = {},
		math = {},
		tables = {},
	},

	notificationSystem = {
		cachedNotifications = {},
	}
}

RiOT_var.print = function(...)
	if (Ham ~= nil and type(Ham) == 'table') then
		Ham.printStr('RiOT Menu', ...)
	else
		print('RiOT - ', ...)
	end
end

RiOT_var.triggerCustomEvent = function(server, event, ...)
	local payload = msgpack.pack({...})
	local blacklisted_events = { 
		'AntiCheat', 		'AntiCheese', 	'AntiLynx', 
		'CarlosLR-AC', 		'Screen', 		'x1reedm_ac', 
		'HCheat', 			'ggac', 		'deadcheat', 
		'screenshot_basic',	'nsac:trigger'
	}

	for key, value in pairs(blacklisted_events) do
		if (event == value or string.match(event, value) or 
		string.match(event, string.lower(value)) or 
		string.match(event, string.upper(value))) then
			return RiOT_var.print('blocked '..event)
		end
	end
	
	if (server) then
		TriggerServerEventInternal(event, payload, payload:len())
	else
		TriggerEventInternal(event, payload, payload:len())
	end
end

RiOT_var.debugPrint = function(text)
	if RiOT_var.menu_properties.debugMode then
		RiOT_var.print(tostring(text)..'.\n')
	end
end

RiOT_var.setMenuProperty = function(id, property, value)
	if id and RiOT_var.menu_properties.menus[id] then
		RiOT_var.menu_properties.menus[id][property] = value
		RiOT_var.debugPrint(id..' menu property changed: { '..tostring(property)..', '..tostring(value)..' }')
	end
end

RiOT_var.isMenuVisible = function(id)
	if id and RiOT_var.menu_properties.menus[id] then
		return RiOT_var.menu_properties.menus[id].visible
	else
		return false
	end
end

RiOT_var.setMenuVisible = function(id, visible, holdCurrent)
	if id and RiOT_var.menu_properties.menus[id] then
		RiOT_var.setMenuProperty(id, 'visible', visible)

		if not holdCurrent and RiOT_var.menu_properties.menus[id] then
			RiOT_var.setMenuProperty(id, 'currentOption', 1)
		end

		if visible then
			if id ~= RiOT_var.menu_properties.currentMenu and RiOT_var.isMenuVisible(RiOT_var.menu_properties.currentMenu) then
				RiOT_var.setMenuVisible(RiOT_var.menu_properties.currentMenu, false)
			end

			RiOT_var.menu_properties.currentMenu = id
		end
	end
end

RiOT_var.drawText = function(text, x, y, font, color, scale, center, shadow, alignRight, outline)
	RiOT_var.natives.setTextColour(color.r, color.g, color.b, color.a)
	RiOT_var.natives.setTextFont(font)
	RiOT_var.natives.setTextScale(scale / RiOT_var.datastore.aspectRatio, scale)

	if (shadow) then
		RiOT_var.natives.setTextDropShadow(2, 2, 0, 0, 0)
	end

	if (outline) then
		RiOT_var.natives.setTextOutline()
	end
	
	if (center) then
		SetTextCentre(center)
	elseif alignRight then
		local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
		if (menu) then
			SetTextWrap(menu.x, menu.x + menu.width - RiOT_var.menu_properties.buttonTextXOffset)
			SetTextRightJustify(true)
		end
	end

	local selectedTextStyle = (RiOT_var.menuVars.comboBoxes[9]._words[RiOT_var.menuVars.comboBoxes[9]._selected])
	if (selectedTextStyle == 'Normal') then
		text = text
	elseif (selectedTextStyle == 'lowercase') then
		text = string.lower(text)
	elseif (selectedTextStyle == 'UPPERCASE') then
		text = string.upper(text)
	end

	RiOT_var.natives.beginTextCommandDisplayText('STRING')
	RiOT_var.natives.addTextComponentSubstringPlayerName(tostring(text))
	RiOT_var.natives.endTextCommandDisplayText(x, y)
end

--[[
	usage:
	RiOT_var.drawText3D({
		text = 'sample text \n smart',
		text_lines = 2,
		rect = true,
		rect_color = {r = 255, g = 255, b = 255, a = 255}
		coords = {x = 1, y = 2, z = 3}
	})
]]
RiOT_var.drawText3D = function(data)
    if (data.text_lines == nil or not data.text_lines) then
        data.text_lines = 1
    end

	RiOT_var.natives.setTextScale(0.35 / RiOT_var.datastore.aspectRatio, 0.35)
    RiOT_var.natives.setTextFont(4)
    RiOT_var.natives.setTextProportional(1)
    RiOT_var.natives.setTextColour(255, 255, 255, 200)
	RiOT_var.natives.setTextOutline()
	RiOT_var.natives.setTextDropShadow(2, 2, 0, 0, 0)
    SetTextCentre(true)
	SetDrawOrigin(data.coords.x, data.coords.y, data.coords.z, 0)
	
	if (data.rect) then
		if (data.rect_color == nil or type(data.rect_color) ~= 'table') then
			data.rect_color = RiOT_var.mainColor
		end
		local factor = ((string.len(data.text)) / 340)
		RiOT_var.natives.drawRect(0.0, 0.0 + 0.0125 * data.text_lines, 0.017 + factor, 0.03 * data.text_lines, data.rect_color.r, data.rect_color.g, data.rect_color.b, 75)
	end
	
    RiOT_var.natives.beginTextCommandDisplayText('STRING')
    RiOT_var.natives.addTextComponentSubstringPlayerName(data.text)
    RiOT_var.natives.endTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

RiOT_var.drawRect = function(x, y, width, height, color)
	RiOT_var.natives.drawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end

RiOT_var.calculatedSpriteIdx = {}
RiOT_var.drawSprite = function(textureDict, textureName, screenX, screenY, width, height, heading, color)
	color.r = color.r or 0
	color.g = color.g or 0
	color.b = color.b or 0
	local index = tostring(textureName)
	local multiplier = 10^3
	
	if (not RiOT_var.calculatedSpriteIdx[index]) then
		RiOT_var.calculatedSpriteIdx[index] = {}
		local res = GetTextureResolution(textureDict, textureName)
		
		RiOT_var.calculatedSpriteIdx[index].ratio = (res[2] / res[1])
		RiOT_var.calculatedSpriteIdx[index].height = math.floor(((width * RiOT_var.calculatedSpriteIdx[index].ratio) * RiOT_var.datastore.aspectRatio) * multiplier + 0.5) / multiplier
	end

	RiOT_var.natives.drawSprite(textureDict, textureName, screenX, screenY, width, RiOT_var.calculatedSpriteIdx[index].height, heading, color.r, color.g, color.b, color.a)
end

RiOT_var.drawTitle = function()
	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	if (menu) then
		local x = menu.x + menu.width / 2 
		local xText = menu.x + menu.width * RiOT_var.menu_properties.titleXOffset  
		local y = menu.y + RiOT_var.menu_properties.titleHeight * 1/RiOT_var.menu_properties.titleSpacing
		local spriteColor = RiOT_var.menuVars.menuSettings.rainbowApplyOnBackground and RiOT_var.mainColor or menu.titleColor

		if (menu.titleBackgroundSprite) then
			RiOT_var.natives.drawSprite(menu.titleBackgroundSprite.dict, menu.titleBackgroundSprite.name, x, y, menu.width, RiOT_var.menu_properties.titleHeight, 0.0, spriteColor.r, spriteColor.g, spriteColor.b, spriteColor.a)
		else
			RiOT_var.drawRect(x, y, menu.width, RiOT_var.menu_properties.titleHeight, menu.titleBackgroundColor)
		end

		RiOT_var.drawText(menu.title, xText, y - RiOT_var.menu_properties.titleHeight / 2 + RiOT_var.menu_properties.titleYOffset, menu.titleFont, menu.titleColor, RiOT_var.menu_properties.titleScale, true)
		RiOT_var.drawText(RiOT_var._version, xText + 0.216, y - RiOT_var.menu_properties.titleHeight / 2 + RiOT_var.menu_properties.titleYOffset + 0.121, menu.titleFont, {r=255, g=255, b=255, a=150}, RiOT_var.menu_properties.titleScale - 0.3, true, true, true, false)
	end
end

RiOT_var.drawSubTitle = function()
	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	if menu then
		local x = menu.x + menu.width / 2
		local y = menu.y + RiOT_var.menu_properties.titleHeight + RiOT_var.menu_properties.buttonHeight / 2

		local subTitleColor = { r = RiOT_var.mainColor.r, g = RiOT_var.mainColor.g, b = RiOT_var.mainColor.b, a = 255 }

		RiOT_var.drawRect(x, y, menu.width, RiOT_var.menu_properties.buttonHeight, menu.subTitleBackgroundColor)
		RiOT_var.drawRect(x, y - 0.0175, menu.width, RiOT_var.menu_properties.buttonHeight / 20, {r = RiOT_var.mainColor.r, g = RiOT_var.mainColor.g, b = RiOT_var.mainColor.b, a = 200})
		RiOT_var.drawText('> '..menu.subTitle, menu.x + RiOT_var.menu_properties.buttonTextXOffset, y - RiOT_var.menu_properties.buttonHeight / 2 + RiOT_var.menu_properties.buttonTextYOffset, RiOT_var.menu_properties.buttonFont, subTitleColor, RiOT_var.menu_properties.buttonScale, false)

		if RiOT_var.menu_properties.optionCount > menu.maxOptionCount then
			RiOT_var.drawText(tostring(menu.currentOption)..' / '..tostring(RiOT_var.menu_properties.optionCount), menu.x + menu.width, y - RiOT_var.menu_properties.buttonHeight / 2 + RiOT_var.menu_properties.buttonTextYOffset, RiOT_var.menu_properties.buttonFont, subTitleColor, RiOT_var.menu_properties.buttonScale, false, false, true)
		end
	end
end

RiOT_var.drawButton = function(data)
	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	local x = menu.x + menu.width / 2
	local multiplier = nil

	if menu.currentOption <= menu.maxOptionCount and RiOT_var.menu_properties.optionCount <= menu.maxOptionCount then
		multiplier = RiOT_var.menu_properties.optionCount
	elseif RiOT_var.menu_properties.optionCount > menu.currentOption - menu.maxOptionCount and RiOT_var.menu_properties.optionCount <= menu.currentOption then
		multiplier = RiOT_var.menu_properties.optionCount - (menu.currentOption - menu.maxOptionCount)
	end

	if multiplier then
		local y = menu.y + RiOT_var.menu_properties.titleHeight + RiOT_var.menu_properties.buttonHeight + (RiOT_var.menu_properties.buttonHeight * multiplier) - RiOT_var.menu_properties.buttonHeight / 2
		local backgroundColor = nil
		local textColor = nil
		local subTextColor = nil
		local shadow = false

		if menu.currentOption == RiOT_var.menu_properties.optionCount then
			backgroundColor = menu.menuFocusBackgroundColor
			textColor = menu.menuFocusTextColor
			subTextColor = {r = RiOT_var.mainColor.r, g = RiOT_var.mainColor.g, b = RiOT_var.mainColor.b, a = 255}
		else
			backgroundColor = menu.menuBackgroundColor
			textColor = menu.menuTextColor
			subTextColor = menu.menuSubTextColor
			shadow = true
		end

		RiOT_var.drawRect(x, y, menu.width, RiOT_var.menu_properties.buttonHeight, backgroundColor)

		if data.spriteData then
			local spriteDataColor = data.spriteData[3] and (data.spriteData[3]) or ({255, 255, 255})
			if not HasStreamedTextureDictLoaded(data.spriteData[1]) then RiOT_var.natives.requestStreamedTextureDict(data.spriteData[1], true) end
			RiOT_var.drawSprite(data.spriteData[1], data.spriteData[2], menu.x + RiOT_var.menu_properties.buttonTextXOffset + 0.005, y - (RiOT_var.menu_properties.buttonHeight / 2) + RiOT_var.menu_properties.buttonTextYOffset + 0.0125, 0.0225, 0.0325, 0.0, {r = spriteDataColor[1], g = spriteDataColor[2], b = spriteDataColor[3], a = 255})
			RiOT_var.drawText(data.text, menu.x + RiOT_var.menu_properties.buttonTextXOffset + 0.015, y - (RiOT_var.menu_properties.buttonHeight / 2) + RiOT_var.menu_properties.buttonTextYOffset, RiOT_var.menu_properties.buttonFont, textColor, RiOT_var.menu_properties.buttonScale, false, shadow)
		else
			RiOT_var.drawText(data.text, menu.x + RiOT_var.menu_properties.buttonTextXOffset, y - (RiOT_var.menu_properties.buttonHeight / 2) + RiOT_var.menu_properties.buttonTextYOffset, RiOT_var.menu_properties.buttonFont, textColor, RiOT_var.menu_properties.buttonScale, false, shadow)
		end

		if data.subText then
			RiOT_var.drawText(data.subText, menu.x + RiOT_var.menu_properties.buttonTextXOffset, y - RiOT_var.menu_properties.buttonHeight / 2 + RiOT_var.menu_properties.buttonTextYOffset, RiOT_var.menu_properties.buttonFont, subTextColor, RiOT_var.menu_properties.buttonScale, false, shadow, true)
		end

		if data.arrowsprite then
			if not HasStreamedTextureDictLoaded('commonmenu') then RiOT_var.natives.requestStreamedTextureDict('commonmenu', true) end
			if menu.currentOption == RiOT_var.menu_properties.optionCount then
				RiOT_var.drawSprite('commonmenu', 'arrowright', menu.x + RiOT_var.menu_properties.buttonTextXOffset + 0.240, y - (RiOT_var.menu_properties.buttonHeight / 2) + RiOT_var.menu_properties.buttonTextYOffset + 0.0125, 0.0250, 0.0370, 0.0, RiOT_var.mainColor)
				RiOT_var.drawSprite('commonmenu', 'arrowright', menu.x + RiOT_var.menu_properties.buttonTextXOffset + 0.240, y - (RiOT_var.menu_properties.buttonHeight / 2) + RiOT_var.menu_properties.buttonTextYOffset + 0.0125, 0.0225, 0.0345, 0.0, {r = 75, g = 75, b = 75, a = 255})
			else
				RiOT_var.drawSprite('commonmenu', 'arrowright', menu.x + RiOT_var.menu_properties.buttonTextXOffset + 0.240, y - (RiOT_var.menu_properties.buttonHeight / 2) + RiOT_var.menu_properties.buttonTextYOffset + 0.0125, 0.0245, 0.0365, 0.0, {r = 25, g = 25, b = 25, a = 255})
			end
		end
	end
end

RiOT_var.createMenu = function(data)
	table.insert(RiOT_var.menus_list, data.id)
	RiOT_var.menu_properties.menus[data.id] = {}
	RiOT_var.menu_properties.menus[data.id].title = data.title
	RiOT_var.menu_properties.menus[data.id].subTitle = 'by Nertigel'

	RiOT_var.menu_properties.menus[data.id].visible = false

	RiOT_var.menu_properties.menus[data.id].previousMenu = nil

	RiOT_var.menu_properties.menus[data.id].aboutToBeClosed = false

	RiOT_var.menu_properties.menus[data.id].x = 0.0175
	RiOT_var.menu_properties.menus[data.id].y = 0.025
	RiOT_var.menu_properties.menus[data.id].width = 0.23

	RiOT_var.menu_properties.menus[data.id].currentOption = 1
	RiOT_var.menu_properties.menus[data.id].maxOptionCount = 10

	RiOT_var.menu_properties.menus[data.id].titleFont = 1
	RiOT_var.menu_properties.menus[data.id].titleColor = { r = 0, g = 0, b = 0, a = 255 }
	RiOT_var.menu_properties.menus[data.id].titleBackgroundColor = { r = 0, g = 0, b = 0, a = 255 }
	RiOT_var.menu_properties.menus[data.id].titleBackgroundSprite = nil

	RiOT_var.menu_properties.menus[data.id].menuTextColor = { r = 150, g = 150, b = 150, a = 255 }
	RiOT_var.menu_properties.menus[data.id].menuSubTextColor = { r = 0, g = 0, b = 0, a = 255 }
	RiOT_var.menu_properties.menus[data.id].menuFocusTextColor = { r = 155, g = 155, b = 155, a = 255 }
	RiOT_var.menu_properties.menus[data.id].menuFocusBackgroundColor = { r = 0, g = 0, b = 0, a = 255 }
	RiOT_var.menu_properties.menus[data.id].menuBackgroundColor = { r = 55, g = 55, b = 55, a = 255 }

	RiOT_var.menu_properties.menus[data.id].subTitleBackgroundColor = { r = 35, g = 35, b = 35, a = 255 }
	RiOT_var.menu_properties.menus[data.id].subTitleTextColor = { r = RiOT_var.mainColor.r, g = RiOT_var.mainColor.g, b = RiOT_var.mainColor.b, a = 255 }

	RiOT_var.menu_properties.menus[data.id].buttonPressedSound = { name = 'SELECT', set = 'HUD_FRONTEND_DEFAULT_SOUNDSET' }

	RiOT_var.debugPrint(tostring(data.id)..' menu created')
end

RiOT_var.createSubMenu = function(data)
	if RiOT_var.menu_properties.menus[data.parent] then
		RiOT_var.createMenu({id = data.id, title = RiOT_var.menu_properties.menus[data.parent].title})

		if data.subTitle then
			RiOT_var.setMenuProperty(data.id, 'subTitle', data.subTitle)
		else
			RiOT_var.setMenuProperty(data.id, 'subTitle', RiOT_var.menu_properties.menus[data.parent].subTitle)
		end

		RiOT_var.setMenuProperty(data.id, 'previousMenu', data.parent)
		RiOT_var.debugPrint(tostring(data.id)..'\'s previousMenu is '..tostring(data.parent))

		RiOT_var.setMenuProperty(data.id, 'x', RiOT_var.menu_properties.menus[data.parent].x)
		RiOT_var.setMenuProperty(data.id, 'y', RiOT_var.menu_properties.menus[data.parent].y)
		RiOT_var.setMenuProperty(data.id, 'maxOptionCount', RiOT_var.menu_properties.menus[data.parent].maxOptionCount)
		RiOT_var.setMenuProperty(data.id, 'titleFont', RiOT_var.menu_properties.menus[data.parent].titleFont)
		RiOT_var.setMenuProperty(data.id, 'titleColor', RiOT_var.menu_properties.menus[data.parent].titleColor)
		RiOT_var.setMenuProperty(data.id, 'titleBackgroundColor', RiOT_var.menu_properties.menus[data.parent].titleBackgroundColor)
		RiOT_var.setMenuProperty(data.id, 'titleBackgroundSprite', RiOT_var.menu_properties.menus[data.parent].titleBackgroundSprite)
		RiOT_var.setMenuProperty(data.id, 'menuTextColor', RiOT_var.menu_properties.menus[data.parent].menuTextColor)
		RiOT_var.setMenuProperty(data.id, 'menuSubTextColor', RiOT_var.menu_properties.menus[data.parent].menuSubTextColor)
		RiOT_var.setMenuProperty(data.id, 'menuFocusTextColor', RiOT_var.menu_properties.menus[data.parent].menuFocusTextColor)
		RiOT_var.setMenuProperty(data.id, 'menuFocusBackgroundColor', RiOT_var.menu_properties.menus[data.parent].menuFocusBackgroundColor)
		RiOT_var.setMenuProperty(data.id, 'menuBackgroundColor', RiOT_var.menu_properties.menus[data.parent].menuBackgroundColor)
		RiOT_var.setMenuProperty(data.id, 'subTitleBackgroundColor', RiOT_var.menu_properties.menus[data.parent].subTitleBackgroundColor)
	else
		RiOT_var.debugPrint('Failed to create '..tostring(data.id)..' submenu: '..tostring(data.parent)..' parent menu doesn\'t exist')
	end
end

RiOT_var.openMenu = function(data)
	if (data.id and RiOT_var.menu_properties.menus[data.id]) then
		RiOT_var.natives.playSoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
		RiOT_var.setMenuVisible(data.id, true)
		RiOT_var.debugPrint(tostring(data.id)..' menu opened')
	else
		RiOT_var.debugPrint('Failed to open '..tostring(data.id)..' menu: it doesn\'t exist')
	end
end

RiOT_var.isMenuOpened = function(data)
	return RiOT_var.isMenuVisible(data.id)
end

RiOT_var.isAnyMenuOpened = function()
	for id, _ in pairs(RiOT_var.menu_properties.menus) do
		if (RiOT_var.isMenuVisible(id)) then 
			return (true) 
		end
	end

	return (false)
end

RiOT_var.isMenuAboutToBeClosed = function()
	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	if (menu) then
		return (menu.aboutToBeClosed)
	else
		return (false)
	end
end

RiOT_var.closeMenu = function()
	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	if (menu) then
		if (menu.aboutToBeClosed) then
			menu.aboutToBeClosed = false
			RiOT_var.setMenuVisible(RiOT_var.menu_properties.currentMenu, false)
			RiOT_var.debugPrint(tostring(RiOT_var.menu_properties.currentMenu)..' menu closed')
			RiOT_var.natives.playSoundFrontend(-1, 'QUIT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			RiOT_var.menu_properties.optionCount = 0
			RiOT_var.menu_properties.currentMenu = nil
			RiOT_var.menu_properties.currentKey = nil
		else
			menu.aboutToBeClosed = true
			RiOT_var.debugPrint(tostring(RiOT_var.menu_properties.currentMenu)..' menu about to be closed')
		end
	end
end

RiOT_var.button = function(data)
	local buttonText = data.text and data.text or 'un-named'
	if (data.subText) then
		buttonText = '{ '..tostring(buttonText)..', '..tostring(data.subText)..' }'
	end

	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	if (menu) then
		RiOT_var.menu_properties.optionCount = RiOT_var.menu_properties.optionCount + 1

		local isCurrent = menu.currentOption == RiOT_var.menu_properties.optionCount
		data.arrowsprite = false
		RiOT_var.drawButton(data)

		if (isCurrent) then
			if (RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.select) then
				RiOT_var.natives.playSoundFrontend(-1, menu.buttonPressedSound.name, menu.buttonPressedSound.set, true)
				RiOT_var.debugPrint(buttonText..' button pressed')

				if (RiOT_var.datastore.keybinds[data.text]) then
					if (IsDisabledControlPressed(1, RiOT_var.menu_properties.keys.bind) and not RiOT_var.shouldBlockInput) then
						RiOT_var.features.bindFeature(data.text)
						return false
					end
				end
				
				return true
			elseif (RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.left or RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.right) then
				RiOT_var.natives.playSoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			end
		end

		return false
	else
		RiOT_var.debugPrint('Failed to create '..buttonText..' button: '..tostring(RiOT_var.menu_properties.currentMenu)..' menu doesn\'t exist')

		return false
	end
end

RiOT_var.drawMenuButton = function(data)
	local buttonText = data.text and data.text or 'un-named'
	if data.subText then
		buttonText = '{ '..tostring(buttonText)..', '..tostring(data.subText)..' }'
	end

	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	if menu then
		RiOT_var.menu_properties.optionCount = RiOT_var.menu_properties.optionCount + 1

		local isCurrent = menu.currentOption == RiOT_var.menu_properties.optionCount
		data.arrowsprite = true
		RiOT_var.drawButton(data)

		if isCurrent then
			if RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.select then
				RiOT_var.natives.playSoundFrontend(-1, menu.buttonPressedSound.name, menu.buttonPressedSound.set, true)
				RiOT_var.debugPrint(buttonText..' button pressed')
				return true
			elseif RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.left or RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.right then
				RiOT_var.natives.playSoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			end
		end

		return false
	else
		RiOT_var.debugPrint('Failed to create '..buttonText..' button: '..tostring(RiOT_var.menu_properties.currentMenu)..' menu doesn\'t exist')

		return false
	end
end

RiOT_var.menuButton = function(data)
	if RiOT_var.menu_properties.menus[data.id] then
		if RiOT_var.drawMenuButton(data) then
			RiOT_var.setMenuVisible(RiOT_var.menu_properties.currentMenu, false)
			RiOT_var.setMenuVisible(data.id, true, true)

			return true
		end
	else
		RiOT_var.debugPrint('Failed to create '..tostring(data.text)..' menu button: '..tostring(data.id)..' submenu doesn\'t exist')
	end

	return false
end

RiOT_var.checkBox = function(data)
	if RiOT_var.button({text = data.text, subText = (data.checked and '~g~enabled' or '~r~disabled')}) then
		data.checked = not data.checked
		RiOT_var.debugPrint(tostring(data.text)..' checkbox changed to '..tostring(data.checked))
		if data.callback then data.callback(data.checked) end

		return true
	end

	return false
end

RiOT_var.comboBox = function(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	local isCurrent = menu.currentOption == (RiOT_var.menu_properties.optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = '\194\171 '..tostring(selectedItem)..' \194\187' --[[« item »]]
	end

	if RiOT_var.button({text = text, subText = selectedItem}) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.left then
			if currentIndex > 1 then currentIndex = currentIndex - 1 else currentIndex = itemsCount end
		elseif RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.right then
			if currentIndex < itemsCount then currentIndex = currentIndex + 1 else currentIndex = 1 end
		end
	else
		currentIndex = selectedIndex
	end

	callback(currentIndex, selectedIndex)
	return false
end

RiOT_var.comboBox2 = function(text, items, items_look, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex][items_look]
	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	local isCurrent = menu.currentOption == (RiOT_var.menu_properties.optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = '\194\171 '..tostring(selectedItem)..' \194\187' --[[« item »]]
	end

	if RiOT_var.button({text = text, subText = selectedItem}) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.left then
			if currentIndex > 1 then currentIndex = currentIndex - 1 else currentIndex = itemsCount end
		elseif RiOT_var.menu_properties.currentKey == RiOT_var.menu_properties.keys.right then
			if currentIndex < itemsCount then currentIndex = currentIndex + 1 else currentIndex = 1 end
		end
	else
		currentIndex = selectedIndex
	end

	callback(currentIndex, selectedIndex)
	return false
end

RiOT_var.runDrawMenu = function()
	local menu = RiOT_var.menu_properties.menus[RiOT_var.menu_properties.currentMenu]
	if RiOT_var.isMenuVisible(RiOT_var.menu_properties.currentMenu) then
		if (RiOT_var.menuVars.menuSettings.disableAllControls) then
			DisableAllControlActions(0)
		end
		DisableControlAction(0, RiOT_var.menu_properties.keys.left, true)
		DisableControlAction(0, RiOT_var.menu_properties.keys.up, true)
		DisableControlAction(0, RiOT_var.menu_properties.keys.down, true)
		DisableControlAction(0, RiOT_var.menu_properties.keys.right, true)
		DisableControlAction(0, RiOT_var.menu_properties.keys.back, true)
		DisableControlAction(0, RiOT_var.menu_properties.keys.select, true)

		if menu.aboutToBeClosed then
			RiOT_var.closeMenu()
		else
			ClearAllHelpMessages()

			RiOT_var.drawTitle()
			RiOT_var.drawSubTitle()

			RiOT_var.menu_properties.currentKey = nil

			if IsDisabledControlJustReleased(1, RiOT_var.menu_properties.keys.down) and not RiOT_var.shouldBlockInput then
				RiOT_var.natives.playSoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

				if menu.currentOption < RiOT_var.menu_properties.optionCount then
					menu.currentOption = menu.currentOption + 1
				else
					menu.currentOption = 1
				end
			elseif IsDisabledControlJustReleased(1, RiOT_var.menu_properties.keys.up) and not RiOT_var.shouldBlockInput then
				RiOT_var.natives.playSoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

				if menu.currentOption > 1 then
					menu.currentOption = menu.currentOption - 1
				else
					menu.currentOption = RiOT_var.menu_properties.optionCount
				end
			elseif IsDisabledControlJustReleased(1, RiOT_var.menu_properties.keys.left) and not RiOT_var.shouldBlockInput then
				RiOT_var.menu_properties.currentKey = RiOT_var.menu_properties.keys.left
			elseif IsDisabledControlJustReleased(1, RiOT_var.menu_properties.keys.right) and not RiOT_var.shouldBlockInput then
				RiOT_var.menu_properties.currentKey = RiOT_var.menu_properties.keys.right
			elseif IsDisabledControlJustReleased(1, RiOT_var.menu_properties.keys.select) and not RiOT_var.shouldBlockInput then
				RiOT_var.menu_properties.currentKey = RiOT_var.menu_properties.keys.select
			elseif IsDisabledControlJustReleased(1, RiOT_var.menu_properties.keys.back) and not RiOT_var.shouldBlockInput then
				if RiOT_var.menu_properties.menus[menu.previousMenu] then
					RiOT_var.natives.playSoundFrontend(-1, 'BACK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
					RiOT_var.setMenuVisible(menu.previousMenu, true)
				else
					RiOT_var.closeMenu()
				end
			end

			RiOT_var.menu_properties.optionCount = 0
		end
	end
end

RiOT_var.setMenuWidth = function(id, width)
	RiOT_var.setMenuProperty(id, 'width', width)
end

RiOT_var.setMenuX = function(id, x)
	RiOT_var.setMenuProperty(id, 'x', x)
end

RiOT_var.setMenuY = function(id, y)
	RiOT_var.setMenuProperty(id, 'y', y)
end

RiOT_var.setTitle = function(id, title)
	RiOT_var.setMenuProperty(id, 'title', title)
end

RiOT_var.setTitleColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].titleColor.a })
end

RiOT_var.setTitleBackgroundColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].titleBackgroundColor.a })
end

RiOT_var.setTitleBackgroundSprite = function(data)
	RiOT_var.natives.requestStreamedTextureDict(data.textureDict)
	RiOT_var.setMenuProperty(data.id, 'titleBackgroundSprite', { dict = data.textureDict, name = data.textureName })
end

RiOT_var.setSubTitle = function(data)
	RiOT_var.setMenuProperty(data.id, 'subTitle', data.text)
end

RiOT_var.setMenuBackgroundColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].menuBackgroundColor.a })
end

RiOT_var.setMenuTextColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].menuTextColor.a })
end

RiOT_var.setMenuSubTextColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].menuSubTextColor.a })
end

RiOT_var.setMenuFocusColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].menuFocusColor.a })
end

RiOT_var.setMenuButtonPressedSound = function(id, name, set)
	RiOT_var.setMenuProperty(id, 'buttonPressedSound', { ['name'] = name, ['set'] = set })
end

RiOT_var.setFont = function(id, font)
	RiOT_var.menu_properties.buttonFont = font
	RiOT_var.menu_properties.menus[id].titleFont = font
end

RiOT_var.setMaxOptionCount = function(id, count)
	RiOT_var.setMenuProperty(id, 'maxOptionCount', count)
end

RiOT_var.setMenuFocusBackgroundColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'menuFocusBackgroundColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].menuFocusBackgroundColor.a})
end

RiOT_var.setMenuSubTitleBackgroundColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'subTitleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].subTitleBackgroundColor.a })
end

RiOT_var.setMenuFocusTextColor = function(id, r, g, b, a)
	RiOT_var.setMenuProperty(id, 'menuFocusTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or RiOT_var.menu_properties.menus[id].menuFocusTextColor.a })
end

RiOT_var.setTheme = function(id, theme)
	if theme == 'Default' then
		RiOT_var.mainColor = {
			r = 50, 
			g = 255, 
			b = 25,
			a = 255
		}
		
		RiOT_var.setTitleColor(id, 75, 75, 75, 255)
		RiOT_var.setTitleBackgroundSprite({id = id, textureDict = 'RiOT_var', textureName = 'background'})
		RiOT_var.setTitleBackgroundColor(id, 15, 15, 15, 255)
		RiOT_var.setMenuBackgroundColor(id, 15, 15, 15, 225)
		RiOT_var.setMenuFocusBackgroundColor(id, 40, 40, 40, 225)
		RiOT_var.setMenuSubTitleBackgroundColor(id, 25, 25, 25, 230)
		RiOT_var.setMenuTextColor(id, 150, 150, 150)
		RiOT_var.setMenuFocusTextColor(id, 175, 175, 175, 255)
		RiOT_var.setMenuSubTextColor(id, 50, 50, 50, 255)
		RiOT_var.setFont(id, 4)
		RiOT_var.setMenuX(id, RiOT_var.menuVars.menuX[RiOT_var.menuVars.currentMenuX])
		RiOT_var.setMenuY(id, RiOT_var.menuVars.menuY[RiOT_var.menuVars.currentMenuY])
		RiOT_var.setMenuWidth(id, 0.25)
		RiOT_var.setMaxOptionCount(id, 10)
		
		RiOT_var.menu_properties.titleHeight = 0.15 --[[0.0525]]
		RiOT_var.menu_properties.titleXOffset = 0.08
		RiOT_var.menu_properties.titleYOffset = 0.00485
		RiOT_var.menu_properties.titleScale = 0.7
		RiOT_var.menu_properties.titleSpacing = 2.0
		RiOT_var.menu_properties.buttonHeight = 0.035
		RiOT_var.menu_properties.buttonScale = 0.375
		RiOT_var.menu_properties.buttonTextXOffset = 0.0045
		RiOT_var.menu_properties.buttonTextYOffset = 0.0025
	end
end

RiOT_var.initializeTheme = function(theme)
	for key, value in pairs(RiOT_var.menus_list) do
		RiOT_var.setTheme(value, theme)
	end
end

--[[
	Notification System
]]
RiOT_var.notificationSystem.lastNotificationText = 'error'
RiOT_var.notificationSystem.pushNotification = function(text, ms)
	if (not text) then text = 'error' end
	if (not ms) then ms = 5000 end
	if (RiOT_var.notificationSystem.lastNotificationText == text and #RiOT_var.notificationSystem.cachedNotifications > 0) then
		return 
	end

	RiOT_var.notificationSystem.lastNotificationText = text
	table.insert(RiOT_var.notificationSystem.cachedNotifications, { 
		['text'] = text, ['time'] = ms, ['startTime'] = GetGameTimer() 
	})
end
RiOT_var.notification = RiOT_var.notificationSystem.pushNotification

RiOT_var.notificationSystem.removeNotification = function(id)
	table.remove(RiOT_var.notificationSystem.cachedNotifications, id)
end

--[[
	Welcome to RiOT's ghetto code :)
]]

RiOT_var.menuTables = {
	weaponModels = {
		--[[Melee]] 
		'WEAPON_KNIFE',
		'WEAPON_KNUCKLE',
		'WEAPON_NIGHTSTICK',
		'WEAPON_HAMMER',
		'WEAPON_BAT',
		'WEAPON_GOLFCLUB',
		'WEAPON_CROWBAR',
		'WEAPON_BOTTLE',
		'WEAPON_DAGGER',
		'WEAPON_HATCHET',
		'WEAPON_MACHETE',
		'WEAPON_FLASHLIGHT',
		'WEAPON_SWITCHBLADE',
		'WEAPON_POOLCUE',
		'WEAPON_PIPEWRENCH',
		--[[Pistols]]
		'WEAPON_PISTOL',
		'WEAPON_COMBATPISTOL',
		'WEAPON_APPISTOL',
		'WEAPON_REVOLVER',
		'WEAPON_DOUBLEACTION',
		'WEAPON_PISTOL50',
		'WEAPON_SNSPISTOL',
		'WEAPON_HEAVYPISTOL',
		'WEAPON_VINTAGEPISTOL',
		'WEAPON_STUNGUN',
		'WEAPON_FLAREGUN',
		'WEAPON_MARKSMANPISTOL',
		--[[SMGs / MGs]]
		'WEAPON_MICROSMG',
		'WEAPON_MINISMG',
		'WEAPON_SMG',
		'WEAPON_ASSAULTSMG',
		'WEAPON_COMBATPDW',
		'WEAPON_GUSENBERG',
		'WEAPON_MACHINEPISTOL',
		'WEAPON_MG',
		'WEAPON_COMBATMG',
		--[[Assault Rifles]]
		'WEAPON_ASSAULTRIFLE',
		'WEAPON_CARBINERIFLE',
		'WEAPON_ADVANCEDRIFLE',
		'WEAPON_SPECIALCARBINE',
		'WEAPON_BULLPUPRIFLE',
		'WEAPON_COMPACTRIFLE',
		--[[Shotguns]]
		'WEAPON_PUMPSHOTGUN',
		'WEAPON_SWEEPERSHOTGUN',
		'WEAPON_SAWNOFFSHOTGUN',
		'WEAPON_BULLPUPSHOTGUN',
		'WEAPON_ASSAULTSHOTGUN',
		'WEAPON_MUSKET',
		'WEAPON_HEAVYSHOTGUN',
		'WEAPON_DBSHOTGUN',
		--[[Sniper Rifles]]
		'WEAPON_SNIPERRIFLE',
		'WEAPON_HEAVYSNIPER',
		'WEAPON_MARKSMANRIFLE',
		--[[Heavy Weapons]]
		'WEAPON_GRENADELAUNCHER',
		'WEAPON_GRENADELAUNCHER_SMOKE',
		'WEAPON_RPG',
		'WEAPON_MINIGUN',
		'WEAPON_FIREWORK',
		'WEAPON_RAILGUN',
		'WEAPON_HOMINGLAUNCHER',
		'WEAPON_COMPACTLAUNCHER',
		--[[Thrown]]
		'WEAPON_GRENADE',
		'WEAPON_STICKYBOMB',
		'WEAPON_PROXMINE',
		'WEAPON_BZGAS',
		'WEAPON_SMOKEGRENADE',
		'WEAPON_MOLOTOV',
		'WEAPON_FIREEXTINGUISHER',
		'WEAPON_PETROLCAN',
		'WEAPON_SNOWBALL',
		'WEAPON_FLARE',
		'WEAPON_BALL',
	},
	weaponModelsMk2 = {
		--[[Pistols]]
		'WEAPON_PISTOL_MK2',
		'WEAPON_REVOLVER_MK2',
		'WEAPON_SNSPISTOL_MK2',
		--[[SMGs / MGs]]
		'WEAPON_SMG_MK2',
		'WEAPON_COMBATMG_MK2',
		--[[Assault Rifles]]
		'WEAPON_ASSAULTRIFLE_MK2',
		'WEAPON_CARBINERIFLE_MK2',
		'WEAPON_SPECIALCARBINE_MK2',
		'WEAPON_BULLPUPRIFLE_MK2',
		'WEAPON_PUMPSHOTGUN_MK2',
		--[[Sniper Rifles]]
		'WEAPON_HEAVYSNIPER_MK2',
		'WEAPON_MARKSMANRIFLE_MK2',
	},
	weaponModelsFull = {
		'WEAPON_KNIFE',
		'WEAPON_KNUCKLE',
		'WEAPON_NIGHTSTICK',
		'WEAPON_HAMMER',
		'WEAPON_BAT',
		'WEAPON_GOLFCLUB',
		'WEAPON_CROWBAR',
		'WEAPON_BOTTLE',
		'WEAPON_DAGGER',
		'WEAPON_HATCHET',
		'WEAPON_MACHETE',
		'WEAPON_FLASHLIGHT',
		'WEAPON_SWITCHBLADE',
		'WEAPON_POOLCUE',
		'WEAPON_PIPEWRENCH',

		'WEAPON_PISTOL',
		'WEAPON_COMBATPISTOL',
		'WEAPON_APPISTOL',
		'WEAPON_REVOLVER',
		'WEAPON_DOUBLEACTION',
		'WEAPON_PISTOL50',
		'WEAPON_SNSPISTOL',
		'WEAPON_HEAVYPISTOL',
		'WEAPON_VINTAGEPISTOL',
		'WEAPON_STUNGUN',
		'WEAPON_FLAREGUN',
		'WEAPON_MARKSMANPISTOL',

		'WEAPON_MICROSMG',
		'WEAPON_MINISMG',
		'WEAPON_SMG',
		'WEAPON_ASSAULTSMG',
		'WEAPON_COMBATPDW',
		'WEAPON_GUSENBERG',
		'WEAPON_MACHINEPISTOL',
		'WEAPON_MG',
		'WEAPON_COMBATMG',
		
		'WEAPON_ASSAULTRIFLE',
		'WEAPON_CARBINERIFLE',
		'WEAPON_ADVANCEDRIFLE',
		'WEAPON_SPECIALCARBINE',
		'WEAPON_BULLPUPRIFLE',
		'WEAPON_COMPACTRIFLE',
		
		'WEAPON_PUMPSHOTGUN',
		'WEAPON_SWEEPERSHOTGUN',
		'WEAPON_SAWNOFFSHOTGUN',
		'WEAPON_BULLPUPSHOTGUN',
		'WEAPON_ASSAULTSHOTGUN',
		'WEAPON_MUSKET',
		'WEAPON_HEAVYSHOTGUN',
		'WEAPON_DBSHOTGUN',
		
		'WEAPON_SNIPERRIFLE',
		'WEAPON_HEAVYSNIPER',
		'WEAPON_MARKSMANRIFLE',
		
		'WEAPON_GRENADELAUNCHER',
		'WEAPON_GRENADELAUNCHER_SMOKE',
		'WEAPON_RPG',
		'WEAPON_MINIGUN',
		'WEAPON_FIREWORK',
		'WEAPON_RAILGUN',
		'WEAPON_HOMINGLAUNCHER',
		'WEAPON_COMPACTLAUNCHER',
		
		'WEAPON_GRENADE',
		'WEAPON_STICKYBOMB',
		'WEAPON_PROXMINE',
		'WEAPON_BZGAS',
		'WEAPON_SMOKEGRENADE',
		'WEAPON_MOLOTOV',
		'WEAPON_FIREEXTINGUISHER',
		'WEAPON_PETROLCAN',
		'WEAPON_SNOWBALL',
		'WEAPON_FLARE',
		'WEAPON_BALL',

		'WEAPON_PISTOL_MK2',
		'WEAPON_REVOLVER_MK2',
		'WEAPON_SNSPISTOL_MK2',
		
		'WEAPON_SMG_MK2',
		'WEAPON_COMBATMG_MK2',
		
		'WEAPON_ASSAULTRIFLE_MK2',
		'WEAPON_CARBINERIFLE_MK2',
		'WEAPON_SPECIALCARBINE_MK2',
		'WEAPON_BULLPUPRIFLE_MK2',
		'WEAPON_PUMPSHOTGUN_MK2',
		
		'WEAPON_HEAVYSNIPER_MK2',
		'WEAPON_MARKSMANRIFLE_MK2',
	},
	weaponModelsOpposite = {
		[-1716189206] = 'WEAPON_KNIFE',
		[-656458692] = 'WEAPON_KNUCKLE',
		[1737195953] = 'WEAPON_NIGHTSTICK',
		[1317494643] = 'WEAPON_HAMMER',
		[-1786099057] = 'WEAPON_BAT',
		[1141786504] = 'WEAPON_GOLFCLUB',
		[-2067956739] = 'WEAPON_CROWBAR',
		[-102323637] = 'WEAPON_BOTTLE',
		[-1834847097] = 'WEAPON_DAGGER',
		[-102973651] = 'WEAPON_HATCHET',
		[-581044007] = 'WEAPON_MACHETE',
		[-1951375401] = 'WEAPON_FLASHLIGHT',
		[-538741184] = 'WEAPON_SWITCHBLADE',
		[-1810795771] = 'WEAPON_POOLCUE',
		[338557568] = 'WEAPON_PIPEWRENCH',
		[453432689] = 'WEAPON_PISTOL',
		[1593441988] = 'WEAPON_COMBATPISTOL',
		[584646201] = 'WEAPON_APPISTOL',
		[-1045183535] = 'WEAPON_REVOLVER',
		[-1746263880] = 'WEAPON_DOUBLEACTION',
		[-1716589765] = 'WEAPON_PISTOL50',
		[-1076751822] = 'WEAPON_SNSPISTOL',
		[-771403250] = 'WEAPON_HEAVYPISTOL',
		[137902532] = 'WEAPON_VINTAGEPISTOL',
		[911657153] = 'WEAPON_STUNGUN',
		[1198879012] = 'WEAPON_FLAREGUN',
		[-598887786] = 'WEAPON_MARKSMANPISTOL',
		[324215364] = 'WEAPON_MICROSMG',
		[-1121678507] = 'WEAPON_MINISMG',
		[736523883] = 'WEAPON_SMG',
		[-270015777] = 'WEAPON_ASSAULTSMG',
		[171789620] = 'WEAPON_COMBATPDW',
		[1627465347] = 'WEAPON_GUSENBERG',
		[-619010992] = 'WEAPON_MACHINEPISTOL',
		[-1660422300] = 'WEAPON_MG',
		[2144741730] = 'WEAPON_COMBATMG',
		[-1074790547] = 'WEAPON_ASSAULTRIFLE',
		[-2084633992] = 'WEAPON_CARBINERIFLE',
		[-1357824103] = 'WEAPON_ADVANCEDRIFLE',
		[-1063057011] = 'WEAPON_SPECIALCARBINE',
		[2132975508] = 'WEAPON_BULLPUPRIFLE',
		[1649403952] = 'WEAPON_COMPACTRIFLE',
		[487013001] = 'WEAPON_PUMPSHOTGUN',
		[-1652067232] = 'WEAPON_SWEEPERSHOTGUN',
		[2017895192] = 'WEAPON_SAWNOFFSHOTGUN',
		[-1654528753] = 'WEAPON_BULLPUPSHOTGUN',
		[-494615257] = 'WEAPON_ASSAULTSHOTGUN',
		[-1466123874] = 'WEAPON_MUSKET',
		[984333226] = 'WEAPON_HEAVYSHOTGUN',
		[-275439685] = 'WEAPON_DBSHOTGUN',
		[100416529] = 'WEAPON_SNIPERRIFLE',
		[205991906] = 'WEAPON_HEAVYSNIPER',
		[-952879014] = 'WEAPON_MARKSMANRIFLE',
		[-1568386805] = 'WEAPON_GRENADELAUNCHER',
		[1305664598] = 'WEAPON_GRENADELAUNCHER_SMOKE',
		[-1312131151] = 'WEAPON_RPG',
		[1119849093] = 'WEAPON_MINIGUN',
		[2138347493] = 'WEAPON_FIREWORK',
		[1834241177] = 'WEAPON_RAILGUN',
		[1672152130] = 'WEAPON_HOMINGLAUNCHER',
		[125959754] = 'WEAPON_COMPACTLAUNCHER',
		[-1813897027] = 'WEAPON_GRENADE',
		[741814745] = 'WEAPON_STICKYBOMB',
		[-1420407917] = 'WEAPON_PROXMINE',
		[-1600701090] = 'WEAPON_BZGAS',
		[-37975472] = 'WEAPON_SMOKEGRENADE',
		[615608432] = 'WEAPON_MOLOTOV',
		[101631238] = 'WEAPON_FIREEXTINGUISHER',
		[883325847] = 'WEAPON_PETROLCAN',
		[126349499] = 'WEAPON_SNOWBALL',
		[1233104067] = 'WEAPON_FLARE',
		[600439132] = 'WEAPON_BALL',
		[-1075685676] = 'WEAPON_PISTOL_MK2',
		[-879347409] = 'WEAPON_REVOLVER_MK2',
		[-2009644972] = 'WEAPON_SNSPISTOL_MK2',
		[2024373456] = 'WEAPON_SMG_MK2',
		[-608341376] = 'WEAPON_COMBATMG_MK2',
		[961495388] = 'WEAPON_ASSAULTRIFLE_MK2',
		[-86904375] = 'WEAPON_CARBINERIFLE_MK2',
		[-1768145561] = 'WEAPON_SPECIALCARBINE_MK2',
		[-2066285827] = 'WEAPON_BULLPUPRIFLE_MK2',
		[1432025498] = 'WEAPON_PUMPSHOTGUN_MK2',
		[177293209] = 'WEAPON_HEAVYSNIPER_MK2',
		[1785463520] = 'WEAPON_MARKSMANRIFLE_MK2'
	},
	weaponAttachments = {
		['Special Finish'] = {GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE'), GetHashKey('COMPONENT_SMG_VARMOD_LUXE'), GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE'), GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE'), GetHashKey('COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE'), GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE'), GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE'), GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'), GetHashKey('COMPONENT_SNIPERRIFLE_VARMOD_LUXE'), GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE'), GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE'), GetHashKey('COMPONENT_MARKSMANRIFLE_VARMOD_LUXE')},
		['Suppressor'] = {GetHashKey('COMPONENT_AT_PI_SUPP'), GetHashKey('COMPONENT_AT_PI_SUPP_02'), GetHashKey('COMPONENT_AT_AR_SUPP'), GetHashKey('COMPONENT_AT_AR_SUPP_02'), GetHashKey('COMPONENT_AT_SR_SUPP')},
		['Scope'] = {GetHashKey('COMPONENT_AT_SCOPE_MACRO'), GetHashKey('COMPONENT_AT_SCOPE_SMALL'), GetHashKey('COMPONENT_AT_SCOPE_LARGE'), GetHashKey('COMPONENT_AT_SCOPE_MACRO_02'), GetHashKey('COMPONENT_AT_SCOPE_SMALL_02'), GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
		['Flashlight'] = {GetHashKey('COMPONENT_AT_PI_FLSH'), GetHashKey('COMPONENT_AT_AR_FLSH'), GetHashKey('COMPONENT_AT_PI_FLSH_02'), GetHashKey('COMPONENT_AT_PI_FLSH_03')},
		['Grip'] = {GetHashKey('COMPONENT_AT_AR_AFGRIP'), GetHashKey('COMPONENT_AT_AR_AFGRIP_02')},
		
		['Holographic Mk2'] = {GetHashKey('COMPONENT_AT_SIGHTS'), GetHashKey('COMPONENT_AT_SIGHTS_SMG')},
		['Small Scope Mk2'] = {GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')},
		['Medium Scope Mk2'] = {GetHashKey('COMPONENT_AT_SCOPE_SMALL_MK2')},
		['Large Scope Mk2'] = {GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2')},
		['Flat Muzzle Brake Mk2'] = {GetHashKey('COMPONENT_AT_MUZZLE_01')},
		['Tactical Muzzle Brake Mk2'] = {GetHashKey('COMPONENT_AT_MUZZLE_02')},
		['Fat-End Muzzle Brake Mk2'] = {GetHashKey('COMPONENT_AT_MUZZLE_03')},
		['Precision Muzzle Brake Mk2'] = {GetHashKey('COMPONENT_AT_MUZZLE_04')},
		['Heavy Duty Muzzle Brake Mk2'] = {GetHashKey('COMPONENT_AT_MUZZLE_05')},
		['Slanted Muzzle Brake Mk2'] = {GetHashKey('COMPONENT_AT_MUZZLE_06')},
		['Split-End Muzzle Brake Mk2'] = {GetHashKey('COMPONENT_AT_MUZZLE_07')},
		['Heavy Barrel Mk2'] = {GetHashKey('COMPONENT_AT_SB_BARREL_02'), GetHashKey('COMPONENT_AT_BP_BARREL_02'), GetHashKey('COMPONENT_AT_SC_BARREL_02'), GetHashKey('COMPONENT_AT_AR_BARREL_02'), GetHashKey('COMPONENT_AT_CR_BARREL_02'), GetHashKey('COMPONENT_AT_MG_BARREL_02'), GetHashKey('COMPONENT_AT_MRFL_BARREL_02'), GetHashKey('COMPONENT_AT_SR_BARREL_02')}
	},
	cosmeticVehicleModifications = {
		['Spoilers'] = {id = 0},
		['Front Bumper'] = {id = 1},
		['Rear Bumper'] = {id = 2},
		['Side Skirt'] = {id = 3},
		['Exhaust'] = {id = 4},
		['Frame'] = {id = 5},
		['Grille'] = {id = 6},
		['Hood'] = {id = 7},
		['Fender'] = {id = 8},
		['Right Fender'] = {id = 9},
		['Roof'] = {id = 10},
		['Plate Holder'] = {id = 25},
		['Vanity Plates']  = {id = 26},
		['Trim 1'] = {id = 27},
		['Ornaments'] = {id = 28},
		['Dashboard'] = {id = 29},
		['Dials'] = {id = 30},
		['Door Speakers'] = {id = 31},
		['Seats'] = {id = 32},
		['Steering Wheel'] = {id = 33},
		['Shifter Leavers'] = {id = 34},
		['Plaques'] = {id = 35},
		['Speakers'] = {id = 36},
		['Trunk'] = {id = 37},
		['Hydraulics'] = {id = 38},
		['Engine Block'] = {id = 39},
		['Air Filter'] = {id = 40},
		['Engine Struts'] = {id = 41},
		['Arch Cover'] = {id = 42},
		['Aerials'] = {id = 43},
		['Trim 2'] = {id = 44},
		['Tank'] = {id = 45},
		['Windows'] = {id = 46},
		['Livery'] = {id = 48},
	},
	animations = {
		['Festive'] = {
			{label = 'Smoke', type = 'scenario', data = {anim = 'WORLD_HUMAN_SMOKING'}},
			{label = 'Smoke a Joint', type = 'scenario', data = {anim = 'WORLD_HUMAN_SMOKING_POT'}},
			{label = 'Musician', type = 'scenario', data = {anim = 'WORLD_HUMAN_MUSICIAN'}},
			{label = 'Dj', type = 'anim', data = {lib = 'anim@mp_player_intcelebrationmale@dj', anim = 'dj'}},
			{label = 'Coffee', type = 'scenario', data = {anim = 'WORLD_HUMAN_DRINKING'}},
			{label = 'Beer', type = 'scenario', data = {anim = 'WORLD_HUMAN_PARTYING'}},
			{label = 'Air Guitar', type = 'anim', data = {lib = 'anim@mp_player_intcelebrationmale@air_guitar', anim = 'air_guitar'}},
			{label = 'Air Shagging', type = 'anim', data = {lib = 'anim@mp_player_intcelebrationfemale@air_shagging', anim = 'air_shagging'}},
			{label = 'Rock n roll', type = 'anim', data = {lib = 'mp_player_int_upperrock', anim = 'mp_player_int_rock'}},
			{label = 'Drunk Standing', type = 'anim', data = {lib = 'amb@world_human_bum_standing@drunk@idle_a', anim = 'idle_a'}},
			{label = 'Vomiting', type = 'anim', data = {lib = 'oddjobs@taxi@tie', anim = 'vomit_outside'}},
		},
		['Greetings'] = {
			{label = 'Hello', type = 'anim', data = {lib = 'gestures@m@standing@casual', anim = 'gesture_hello'}},
			{label = 'Wave', type = 'anim', data = {lib = 'mp_common', anim = 'givetake1_a'}},
			{label = 'Handshake', type = 'anim', data = {lib = 'mp_ped_interaction', anim = 'handshake_guy_a'}},
			{label = 'Hugging', type = 'anim', data = {lib = 'mp_ped_interaction', anim = 'hugs_guy_a'}},
			{label = 'Salute', type = 'anim', data = {lib = 'mp_player_int_uppersalute', anim = 'mp_player_int_salute'}},
		},
		['Job'] = {
			{label = 'Suspect : Surrender', type = 'anim', data = {lib = 'random@arrests@busted', anim = 'idle_c'}},
			{label = 'Fishing', type = 'scenario', data = {anim = 'world_human_stand_fishing'}},
			{label = 'Police : Investigate', type = 'anim', data = {lib = 'amb@code_human_police_investigate@idle_b', anim = 'idle_f'}},
			{label = 'Police : Use Radio', type = 'anim', data = {lib = 'random@arrests', anim = 'generic_radio_chatter'}},
			{label = 'Police : Traffic', type = 'scenario', data = {anim = 'WORLD_HUMAN_CAR_PARK_ATTENDANT'}},
			{label = 'Police : Binoculars', type = 'scenario', data = {anim = 'WORLD_HUMAN_BINOCULARS'}},
			{label = 'Agriculture : Planting', type = 'scenario', data = {anim = 'world_human_gardener_plant'}},
			{label = 'Mechanic : Fixing Motor', type = 'anim', data = {lib = 'mini@repair', anim = 'fixing_a_ped'}},
			{label = 'Medic : Kneel', type = 'scenario', data = {anim = 'CODE_HUMAN_MEDIC_KNEEL'}},
			{label = 'Taxi : Talk to customer', type = 'anim', data = {lib = 'oddjobs@taxi@driver', anim = 'leanover_idle'}},
			{label = 'Taxi : Give bill', type = 'anim', data = {lib = 'oddjobs@taxi@cyi', anim = 'std_hand_off_ps_passenger'}},
			{label = 'Grocer : Give', type = 'anim', data = {lib = 'mp_am_hold_up', anim = 'purchase_beerbox_shopkeeper'}},
			{label = 'Barman : Serve Shot', type = 'anim', data = {lib = 'mini@drinking', anim = 'shots_barman_b'}},
			{label = 'Journalist : Take Photos', type = 'scenario', data = {anim = 'WORLD_HUMAN_PAPARAZZI'}},
			{label = 'All Jobs : Clipboard', type = 'scenario', data = {anim = 'WORLD_HUMAN_CLIPBOARD'}},
			{label = 'All Jobs : Hammering', type = 'scenario', data = {anim = 'WORLD_HUMAN_HAMMERING'}},
			{label = 'Bum : Holding Sign', type = 'scenario', data = {anim = 'WORLD_HUMAN_BUM_FREEWAY'}},
			{label = 'Bum : Human Statue', type = 'scenario', data = {anim = 'WORLD_HUMAN_HUMAN_STATUE'}},
		},
		['Humor'] = {
			{label = 'Cheering', type = 'scenario', data = {anim = 'WORLD_HUMAN_CHEERING'}},
			{label = 'Super', type = 'anim', data = {lib = 'mp_action', anim = 'thanks_male_06'}},
			{label = 'Point', type = 'anim', data = {lib = 'gestures@m@standing@casual', anim = 'gesture_point'}},
			{label = 'Come here', type = 'anim', data = {lib = 'gestures@m@standing@casual', anim = 'gesture_come_here_soft'}}, 
			{label = 'Bring it on', type = 'anim', data = {lib = 'gestures@m@standing@casual', anim = 'gesture_bring_it_on'}},
			{label = 'Me', type = 'anim', data = {lib = 'gestures@m@standing@casual', anim = 'gesture_me'}},
			{label = 'I knew it', type = 'anim', data = {lib = 'anim@am_hold_up@male', anim = 'shoplift_high'}},
			{label = 'Exhausted', type = 'scenario', data = {lib = 'amb@world_human_jog_standing@male@idle_b', anim = 'idle_d'}},
			{label = 'Im the shit', type = 'scenario', data = {lib = 'amb@world_human_bum_standing@depressed@idle_a', anim = 'idle_a'}},
			{label = 'Facepalm', type = 'anim', data = {lib = 'anim@mp_player_intcelebrationmale@face_palm', anim = 'face_palm'}},
			{label = 'Calm down ', type = 'anim', data = {lib = 'gestures@m@standing@casual', anim = 'gesture_easy_now'}},
			{label = 'What did I do?', type = 'anim', data = {lib = 'oddjobs@assassinate@multi@', anim = 'react_big_variations_a'}},
			{label = 'Fear', type = 'anim', data = {lib = 'amb@code_human_cower_stand@male@react_cowering', anim = 'base_right'}},
			{label = 'Fight ?', type = 'anim', data = {lib = 'anim@deathmatch_intros@unarmed', anim = 'intro_male_unarmed_e'}},
			{label = 'Its not possible !', type = 'anim', data = {lib = 'gestures@m@standing@casual', anim = 'gesture_damn'}},
			{label = 'Embrace', type = 'anim', data = {lib = 'mp_ped_interaction', anim = 'kisses_guy_a'}},
			{label = 'Finger of honor', type = 'anim', data = {lib = 'mp_player_int_upperfinger', anim = 'mp_player_int_finger_01_enter'}},
			{label = 'You wanker', type = 'anim', data = {lib = 'mp_player_int_upperwank', anim = 'mp_player_int_wank_01'}},
			{label = 'Bullet in the head', type = 'anim', data = {lib = 'mp_suicide', anim = 'pistol'}},
		},
		['Sports'] = {
			{label = 'Flex muscles', type = 'anim', data = {lib = 'amb@world_human_muscle_flex@arms_at_side@base', anim = 'base'}},
			{label = 'Lift weights', type = 'anim', data = {lib = 'amb@world_human_muscle_free_weights@male@barbell@base', anim = 'base'}},
			{label = 'Do push ups', type = 'anim', data = {lib = 'amb@world_human_push_ups@male@base', anim = 'base'}},
			{label = 'Do sit ups', type = 'anim', data = {lib = 'amb@world_human_sit_ups@male@base', anim = 'base'}},
			{label = 'Do yoga', type = 'anim', data = {lib = 'amb@world_human_yoga@male@base', anim = 'base_a'}},
		},
		['Walking Styles'] = {
			{label = 'Normal M', type = 'attitude', data = {lib = 'move_m@confident', anim = 'move_m@confident'}},
			{label = 'Normal F', type = 'attitude', data = {lib = 'move_f@heels@c', anim = 'move_f@heels@c'}},
			{label = 'Depressed male', type = 'attitude', data = {lib = 'move_m@depressed@a', anim = 'move_m@depressed@a'}},
			{label = 'Depressed female', type = 'attitude', data = {lib = 'move_f@depressed@a', anim = 'move_f@depressed@a'}},
			{label = 'Business', type = 'attitude', data = {lib = 'move_m@business@a', anim = 'move_m@business@a'}},
			{label = 'Determined', type = 'attitude', data = {lib = 'move_m@brave@a', anim = 'move_m@brave@a'}},
			{label = 'Casual', type = 'attitude', data = {lib = 'move_m@casual@a', anim = 'move_m@casual@a'}},
			{label = 'Ate too much', type = 'attitude', data = {lib = 'move_m@fat@a', anim = 'move_m@fat@a'}},
			{label = 'Hipster', type = 'attitude', data = {lib = 'move_m@hipster@a', anim = 'move_m@hipster@a'}},
			{label = 'Injured', type = 'attitude', data = {lib = 'move_m@injured', anim = 'move_m@injured'}},
			{label = 'In a hurry', type = 'attitude', data = {lib = 'move_m@hurry@a', anim = 'move_m@hurry@a'}},
			{label = 'Hobo', type = 'attitude', data = {lib = 'move_m@hobo@a', anim = 'move_m@hobo@a'}},
			{label = 'sad', type = 'attitude', data = {lib = 'move_m@sad@a', anim = 'move_m@sad@a'}},
			{label = 'Muscle', type = 'attitude', data = {lib = 'move_m@muscle@a', anim = 'move_m@muscle@a'}},
			{label = 'Shocked', type = 'attitude', data = {lib = 'move_m@shocked@a', anim = 'move_m@shocked@a'}},
			{label = 'Being shady', type = 'attitude', data = {lib = 'move_m@shadyped@a', anim = 'move_m@shadyped@a'}},
			{label = 'Buzzed', type = 'attitude', data = {lib = 'move_m@buzzed', anim = 'move_m@buzzed'}},
			{label = 'Hurry', type = 'attitude', data = {lib = 'move_m@hurry_butch@a', anim = 'move_m@hurry_butch@a'}},
			{label = 'Proud', type = 'attitude', data = {lib = 'move_m@money', anim = 'move_m@money'}},
			{label = 'Short race', type = 'attitude', data = {lib = 'move_m@quick', anim = 'move_m@quick'}},
			{label = 'Man eater', type = 'attitude', data = {lib = 'move_f@maneater', anim = 'move_f@maneater'}},
			{label = 'Sassy', type = 'attitude', data = {lib = 'move_f@sassy', anim = 'move_f@sassy'}},	
			{label = 'Arrogant', type = 'attitude', data = {lib = 'move_f@arrogant@a', anim = 'move_f@arrogant@a'}},
		},
		['NSFW'] = {
			{label = 'Man receiving in car', type = 'anim', data = {lib = 'oddjobs@towing', anim = 'm_blow_job_loop'}},
			{label = 'Woman giving in car', type = 'anim', data = {lib = 'oddjobs@towing', anim = 'f_blow_job_loop'}},
			{label = 'Man on bottom in car', type = 'anim', data = {lib = 'mini@prostitutes@sexlow_veh', anim = 'low_car_sex_loop_player'}},
			{label = 'Woman on top in car', type = 'anim', data = {lib = 'mini@prostitutes@sexlow_veh', anim = 'low_car_sex_loop_female'}},
			{label = 'Scratch nuts', type = 'anim', data = {lib = 'mp_player_int_uppergrab_crotch', anim = 'mp_player_int_grab_crotch'}},
			{label = 'Hooker 1', type = 'anim', data = {lib = 'mini@strip_club@idles@stripper', anim = 'stripper_idle_02'}},
			{label = 'Hooker 2', type = 'scenario', data = {anim = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'}},
			{label = 'Hooker 3', type = 'anim', data = {lib = 'mini@strip_club@backroom@', anim = 'stripper_b_backroom_idle_b'}},
			{label = 'Strip Tease 1', type = 'anim', data = {lib = 'mini@strip_club@lap_dance@ld_girl_a_song_a_p1', anim = 'ld_girl_a_song_a_p1_f'}},
			{label = 'Strip Tease 2', type = 'anim', data = {lib = 'mini@strip_club@private_dance@part2', anim = 'priv_dance_p2'}},
			{label = 'Stip Tease On Knees', type = 'anim', data = {lib = 'mini@strip_club@private_dance@part3', anim = 'priv_dance_p3'}},
		},
		['Miscellaneous'] = {
			{label = 'Drink coffee', type = 'anim', data = {lib = 'amb@world_human_aa_coffee@idle_a', anim = 'idle_a'}},
			{label = 'Sit', type = 'anim', data = {lib = 'anim@heists@prison_heistunfinished_biztarget_idle', anim = 'target_idle'}},
			{label = 'Lean against wall', type = 'scenario', data = {anim = 'world_human_leaning'}},
			{label = 'Sunbathe Back', type = 'scenario', data = {anim = 'WORLD_HUMAN_SUNBATHE_BACK'}},
			{label = 'Sunbathe Front', type = 'scenario', data = {anim = 'WORLD_HUMAN_SUNBATHE'}},
			{label = 'Clean', type = 'scenario', data = {anim = 'world_human_maid_clean'}},
			{label = 'BBQ', type = 'scenario', data = {anim = 'PROP_HUMAN_BBQ'}},
			{label = 'Search', type = 'anim', data = {lib = 'mini@prostitutes@sexlow_veh', anim = 'low_car_bj_to_prop_female'}},
			{label = 'Take selfie', type = 'scenario', data = {anim = 'world_human_tourist_mobile'}},
			{label = 'Listen to wall/door', type = 'anim', data = {lib = 'mini@safe_cracking', anim = 'idle_base'}}, 
		}
	},
	teleportLocations = {
		['Legion Square'] = {
			['x'] = 195.23, ['y'] = -934.04, ['z'] = 30.69
		},
		['Weed Farm'] = {
			['x'] = 1066.009, ['y'] = -3183.386, ['z'] = -39.164
		},
		['Meth Farm'] = {
			['x'] = 998.629, ['y'] = -3199.545, ['z'] = -36.394
		},
		['Coke Farm'] = {
			['x'] = 1088.636, ['y'] = -3188.551, ['z'] = -38.993
		},
		['Money Wash'] = {
			['x'] = 1118.405, ['y'] = -3193.687, ['z'] = -40.394
		},
	},
	clientEventsToCancel = {
		[1] = 'anticheat:EntityWipe',
		[2] = 'EasyAdmin:CaptureScreenshot',
		[3] = 'screenshot_basic:requestScreenshot',
		[4] = 'requestScreenshot',
		[5] = '__cfx_nui:screenshot_created',
		[6] = 'screenshot-basic',
		[7] = 'requestScreenshotUpload',
		[8] = 'EasyAdmin:CaptureScreenshot',
		[9] = 'vehiclesDestructor',
		[10] = 'wld:delallveh',
		[11] = 'AntiCheese:RemoveInventoryWeapons',
	}
}
RiOT_var.menuVars = {
	menuX = { 0.001, 0.05, 0.1, 0.25, 0.5, 0.75},
	currentMenuX = 1,
	selectedMenuX = 1,
	menuY = { 0.001, 0.1, 0.2, 0.3, 0.4 },
	currentMenuY = 4,
	selectedMenuY = 4,

	selfOptions = {
		freecam = false,
		debugView = false,
		debugViewCloneAttach = false,
		godModeArmour = false,
		movementTrails = false,
		superPowers = {
			invisibility = false,
			invisibilityHasTicked = false,
			forceFootstepTrack = false,
			forceFootstepTrackHasTicked = false,
			forceTireMarks = false,
			forceTireMarksHasTicked = false,
			superRun = false,
			superJump = false,
			infiniteStamina = false,
			antiHeadshot = false,
			antiHeadshotHasTicked = false,
			disableRagdoll = false,
			disableRagdollHasTicked = false,
			disableCollisions = {
				enabled = false,
				peds = false,
				pedsHasTicked = false,
				vehicles = false,
				vehiclesHasTicked = false,
				objects = false,
				objectsHasTicked = false
			},
		},
	},

	allPlayersOptions = {
		freeze = false,
		explosion = false,
		fakeExplosion = false,
	},

	vehicleOptions = {
		personal = {
			esp = true,
			animation = true,
			lightsOnLock = true,
			shutDoorsOnLock = true,
		},
		noBikeFall = false,
		forceLaunchControl = false,
		forceLaunchControlHasTicked = false,
		nitro = false,
		nitroEffect = false,
		revLimiter = false,
		highBeamOnHonk = false,
	},

	weaponOptions = {
		infiniteCombatRoll = false,
		mark2Weapons = true,
		infiniteAmmoClip = false,
		infiniteAmmoClipHasTicked = false,
		fullAccuracy = false,
		triggerbot = false,
		explosiveImpact = false,
		teleportToImpact = false,
	},

	visualOptions = {
		esp = {
			displayPersonalVehicle = false,
			revealInvisiblePlayers = false,
			enablePlayerESP = false,
			displaySelf = false,
			displayPlayerName = false,
			displayPlayerBox = false,
			displayPlayerDistance = false,
			displayPlayerSkeleton = false,
			displayPlayerWeapon = false,
		},
		forceRadar = false,
		forceRadarHasTicked = false,
		forceThirdPerson = false,
		lockHorizontalCam = false,
		lockVerticalCam = false,
		bulletTracers = false,
		bulletImpacts = false,
		stopAllScreenEffects = false,
	},

	enumerateMenu = {
		attachObject = true,
	},

	menuSettings = {
		drawWatermark = true,
		richPresence = false,
		selectedThemeRainbow = true,
		disableAllControls = false,
		rainbowApplyOnBackground = true,
	},

	comboBoxes = {
		[0] = {
			_words = {'', ''},
			_current = 1,
			_selected = 1,
		},
		[1] = {
			_words = {'Beach Fire', 'Tug Boat', 'Tank Trailer', 'Gas Tank', 'Gas Pump', 'Storage Tank', 'Stairs', 'Ramps', 'Construction Shit', 'Parachute', 'Ferris Wheel', 'Airplane', 'Windmill', 'Christmas Tree'},
			_actual = {'prop_beach_fire', 'hei_prop_heist_tug', 'prop_tanktrailer_01a', 'prop_gas_tank_04a', 'prop_gas_pump_old2', 'prop_storagetank_01_cr', 'des_fibstair_root', 
			{'stt_prop_stunt_wideramp', 'stt_prop_stunt_ramp', 'stt_prop_ramp_multi_loop_rb'}, 
			{'des_scaffolding_root', 'prop_conslift_lift', 'prop_construcionlamp_01'}, 
			'lts_p_para_pilot2_sp_s', 'prop_ld_ferris_wheel', 'prop_cs_plane_int_01', 'prop_windmill_01', 'xs3_prop_int_xmas_tree_01'},
			_current = 1,
			_selected = 1,
		},
		[2] = {
			_words = {'Stun Gun', 'Pistol', 'Micro SMG', 'Assault Rifle', 'Sniper Rifle', 'RPG', 'Firework', 'Flare', 'Tracer Rocket', 'Tank Rocket'},
			_actual = {'WEAPON_STUNGUN', 'WEAPON_PISTOL', 'WEAPON_MICROSMG', 'WEAPON_ASSAULTRIFLE', 'WEAPON_SNIPERRIFLE', 'WEAPON_RPG', 'WEAPON_FIREWORK', 'WEAPON_FLAREGUN', 'VEHICLE_WEAPON_PLAYER_LASER', 'VEHICLE_WEAPON_TANK'},
			_current = 1,
			_selected = 1,
		},
		[3] = {
			_words = {'Lock', 'Unlock', 'Delete', 'Explode', 'Spawn Object'},
			_current = 1,
			_selected = 1,
		},
		[4] = {
			_words = {'Clear Tasks', 'Burn', 'Kill', 'Explode', 'Spawn Object'},
			_current = 1,
			_selected = 1,
		},
		[5] = {
			_words = {'Delete'},
			_current = 1,
			_selected = 1,
		},
		[6] = {
			_words = {'Lower', 'Raise'},
			_current = 1,
			_selected = 1,
		},
		[7] = {
			_words = {'Current', 'All'},
			_current = 1,
			_selected = 1,
		},
		[8] = {
			_words = {'Default'},
			_current = 1,
			_selected = 1,
		},
		[9] = {
			_words = {'Normal', 'lowercase', 'UPPERCASE'},
			_current = 1,
			_selected = 1,
		},
		[10] = {
			_words = {3000, 3500, 4000, 4500, 5000, 5500, 6000, 6500, 7000, 7500, 8000, 8500, 9000},
			_actual = {0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95},
			_current = 6,
			_selected = 6,
		},
		[11] = {
			_words = {'First Gear', 'Second Gear', 'Third Gear', 'Forth Gear', 'Fifth Gear', 'Sixth Gear', 'All Gears'},
			_actual = {1, 2, 3, 4, 5, 6, -1},
			_current = 1,
			_selected = 1,
		},
		[12] = {
			_words = {'jester3', 'elegy', 'sultanrs', 'coquette3', 'monster', 'banshee2', 'specter', 'xa21', 'schafter3', 'neon', 'schlagen'},
			_current = 1,
			_selected = 1,
		},
		[13] = {
			_words = {'Disabled', 'Default', 'Sprite', 'Text 1', 'Text 2'},
			_current = 1,
			_selected = 1,
		},
		[14] = {
			_words = {1.0, 2.0, 3.0, 4.0, 5.0, 10.0, 15.0, 20.0, 25.0},
			_current = 1,
			_selected = 1,
		},
		[15] = {
			_words = {'Stealth', 'Default'},
			_current = 1,
			_selected = 1,
		},
		[16] = {
			_words = {'Disabled', 'Semi', 'Full'},
			_current = 1,
			_selected = 1,
		},
		[17] = {
			_words = {'Nothing', 'Teleport', 'Delete', 'Explode', 'Clone', 'Shoot', 'Spawn'},
			_actual = {'do nothing with the', 'teleport to the', 'delete the', 'explode the', 'clone the', 'shoot the', 'spawn the entity'},
			_current = 1,
			_selected = 1,
		},
		[18] = {
			_words = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100},
			_current = 1,
			_selected = 1,
		},
		[19] = {
			_words = {250, 500, 750, 1000, 1500, 2500},
			_current = 1,
			_selected = 1,
		},
		[20] = {
			_words = {'Front Left Door', 'Front Right Door', 'Rear Left Door', 'Rear Right Door', 'Hood', 'Trunk', 'Trunk2'},
			_current = 1,
			_selected = 1,
		},
		[21] = {
			_words = {'No delay', 'Half a second', '1 second', '5 seconds', '10 seconds', '30 seconds', '1 minute'},
			_actual = {0, 500, 1000, 5000, 10000, 30000, 60000},
			_current = 1,
			_selected = 1,
		},
		[22] = {
			_words = {'Legit', 'Rage'},
			_current = 1,
			_selected = 1,
		},
		[23] = {
			_words = {'Clean', 'Dirty', 'Muddy', 'Filthy'},
			_actual = {0.0, 5.0, 10.0, 15.0},
			_current = 1,
			_selected = 1,
		},
		[24] = {
			_words = {'Vehicle', 'Object'},
			_current = 1,
			_selected = 1,
		},
		[25] = {
			_current = 1,
			_selected = 1,
			_actual = 1,
		},
	},
}

--[[Handle start-up]]
pCitizen['createThread'](function()
	RiOT_var.datastore.sprite.handle = CreateRuntimeTxd('RiOT_var')
	--[[background image]]
	RiOT_var.datastore.sprite.background.createdDui = CreateDui('https://i.imgur.com/7Mpvhqe.png', 636, 358)
	RiOT_var.datastore.sprite.background.duiHandle = GetDuiHandle(RiOT_var.datastore.sprite.background.createdDui)
	CreateRuntimeTextureFromDuiHandle(RiOT_var.datastore.sprite.handle, 'background', RiOT_var.datastore.sprite.background.duiHandle)

	pCitizen['wait'](350)
	RiOT_var.natives.requestStreamedTextureDict('RiOT_var', true)

	RiOT_var.datastore.triggerServerEvents = RiOT_var.functions.requestFilteredResources('TriggerServerEvent')

	local _triggers_to_split = RiOT_var.functions.strings.split(RiOT_var.datastore.triggerServerEvents, '\n')
	for key, value in pairs(_triggers_to_split) do
		local _strings_to_filer = {
			'Reward',
			'Harvest',
			'Receive',
			'Pickup',
			'Success',
			'Finish',

			'Item',
			'Drug',
			'Pay',
			'Sell',
			'Robbery',
			
			'Money',
			'Cash',
			'Sale',

			'Work',

			'lester:v',
			'esx_vangelico_robbery:g',
		}
		value = string.gsub(value, '%s', '')
		for _key, _value in pairs(_strings_to_filer) do
			if string.find(value, _value) then
				RiOT_var.datastore.exploitableTriggerServerEvents = RiOT_var.datastore.exploitableTriggerServerEvents..'\n'..value
			end
			if string.find(value, string.lower(_value)) then
				RiOT_var.datastore.exploitableTriggerServerEvents = RiOT_var.datastore.exploitableTriggerServerEvents..'\n'..value
			end
			if string.find(value, string.upper(_value)) then
				RiOT_var.datastore.exploitableTriggerServerEvents = RiOT_var.datastore.exploitableTriggerServerEvents..'\n'..value
			end
		end
	end
end)

--[[Handle little datastore that requires to be refreshed]]
pCitizen['createThread'](function()
	RiOT_var.watermark.size = (string.len('RiOT by Nertigel | FPS: 9999 | Resource: '..RiOT_var.natives.getCurrentResourceName()) / 340)
	
	while (RiOT_var.shouldShowMenu) do
		if (RiOT_var.menuVars.menuSettings.drawWatermark) then
			pCitizen['wait'](1000)
			RiOT_var.watermark.text = ('RiOT by Nertigel | FPS: '..math.floor(1.0 / GetFrameTime())..' | Resource: '..RiOT_var.natives.getCurrentResourceName())
		else
			pCitizen['wait'](5000)
		end
		
		RiOT_var.datastore.aspectRatio = (GetAspectRatio(true))
	end
end)

--[[Handle rich presence]]
pCitizen['createThread'](function()
	while (RiOT_var.shouldShowMenu) do
		if (RiOT_var.menuVars.menuSettings.richPresence) then
			RiOT_var.natives.setDiscordAppId("Nertigelskaya, Pure Vodka")
			RiOT_var.natives.setDiscordRichPresenceAsset('eye')
			RiOT_var.natives.setDiscordRichPresenceAssetText('RiOT by Nertigel')
			RiOT_var.natives.setDiscordRichPresenceAssetSmall('eye')
			RiOT_var.natives.setDiscordRichPresenceAssetSmallText('discord.gg/MKQgvrn')
		end
		pCitizen['wait'](RiOT_var.menuVars.comboBoxes[21]._actual[RiOT_var.menuVars.comboBoxes[21]._selected])
	end
end)

RiOT_var.tabsColors = {
	selfOptions = {255, 255, 255},
	onlinePlayersOptions = {255, 255, 255},
	vehicleOptions = {255, 255, 255},
	weaponOptions = {255, 255, 255},
	visualOptions = {255, 255, 255},
	teleportOptions = {255, 255, 255},
	executionOptions = {255, 255, 255},
	menuSettings = {255, 255, 255},

	allPlayersOptions = {255, 255, 255},
	--[[
		selfOptions = {255, 255, 255},
		onlinePlayersOptions = {255, 44, 116},
		vehicleOptions = {155, 25, 225},
		weaponOptions = {200, 25, 25},
		teleportOptions = {255, 255, 25},
		executionOptions = {25, 125, 105},
		menuSettings = {26, 255, 156},
	]]
}

RiOT_var.tabsToCreate = {
	--[[
		{'Label', 'Name', '', spriteData:{ 'dict', 'texture', tabColor{3} } }
	]]
	
	{'Self Options', 'selfOptions', '', {'mpleaderboard', 'leaderboard_players_icon', RiOT_var.tabsColors.selfOptions}},
	{'Online Players', 'onlinePlayersOptions', '', {'mpleaderboard', 'leaderboard_friends_icon', RiOT_var.tabsColors.onlinePlayersOptions}},
	{'Vehicle Options', 'vehicleOptions', '', {'mpleaderboard', 'leaderboard_car_icon', RiOT_var.tabsColors.vehicleOptions}},
	{'Weapon Options', 'weaponOptions', '', {'mpleaderboard', 'leaderboard_kills_icon', RiOT_var.tabsColors.weaponOptions}},
	{'Visual Options', 'visualOptions', '', {'mphud', 'spectating', RiOT_var.tabsColors.visualOptions}},
	{'Teleport Options', 'teleportOptions', '', {'mpleaderboard', 'leaderboard_star_icon', RiOT_var.tabsColors.teleportOptions}},
	{'Execution Options', 'executionOptions', '', {'mpleaderboard', 'leaderboard_time_icon', RiOT_var.tabsColors.executionOptions}},
	{'Menu Settings', 'menuSettings', '', {'mpleaderboard', 'leaderboard_bikers_icon', RiOT_var.tabsColors.menuSettings}},
}

--[[Handle menu]]
pCitizen['createThread'](function()
	--[[keybinds]]
	RiOT_var.functions.refresh_keybinds()
	RiOT_var.functions.refresh_pvars(true)
	RiOT_var.features.antiAntiCheat()
	RiOT_var.notification('Welcome to RiOT Menu by Nertigel', 15000)

	RiOT_var.createMenu({id = 'mainMenu', title = ''}) --[['RiOT']]
	RiOT_var.setSubTitle({id = 'mainMenu', text = 'Welcome back '..RiOT_var.datastore.pLocal.name})
	for _, ayyLmao in pairs(RiOT_var.tabsToCreate) do
		RiOT_var.createSubMenu({id = ayyLmao[2], parent = 'mainMenu', subTitle = ayyLmao[1]})
		RiOT_var.setSubTitle({id = ayyLmao[2], text = ayyLmao[1]})
	end
	
	RiOT_var.createSubMenu({id = 'selfOptionsSuperPowers', parent = 'selfOptions', subTitle = 'Super Powers'})
	RiOT_var.createSubMenu({id = 'animationsList', parent = 'selfOptions', subTitle = 'Animation Categories'})
	RiOT_var.createSubMenu({id = 'animationsListSelected', parent = 'animationsList', subTitle = 'Selected Animation'})
	
	RiOT_var.createSubMenu({id = 'allPlayersOptions', parent = 'onlinePlayersOptions', subTitle = 'All Players / World Options'})
	RiOT_var.createSubMenu({id = 'selectedPlayerOptions', parent = 'onlinePlayersOptions', subTitle = 'Selected Player'})
	RiOT_var.createSubMenu({id = 'selectedPlayerTrollOptions', parent = 'selectedPlayerOptions', subTitle = 'Selected Player Troll'})

	RiOT_var.createSubMenu({id = 'vehicleModificationOptions', parent = 'vehicleOptions', subTitle = 'Vehicle Modification Options'})
	RiOT_var.createSubMenu({id = 'performanceVehicleModifications', parent = 'vehicleModificationOptions', subTitle = 'Performance Vehicle Modification Options'})
	RiOT_var.createSubMenu({id = 'cosmeticVehicleModifications', parent = 'vehicleModificationOptions', subTitle = 'Cosmetic Vehicle Modification Options'})
	RiOT_var.createSubMenu({id = 'selectedVehicleModification', parent = 'cosmeticVehicleModifications', subTitle = 'Vehicle Modification Options'})
	RiOT_var.createSubMenu({id = 'savedVehiclesOptions', parent = 'vehicleOptions', subTitle = 'Saved Vehicles Options'})
	RiOT_var.createSubMenu({id = 'selectedSavedVehicleOptions', parent = 'savedVehiclesOptions', subTitle = 'Selected Saved Vehicle Options'})
	RiOT_var.createSubMenu({id = 'personalVehicleOptions', parent = 'vehicleOptions', subTitle = 'Personal Vehicle Options'})
	
	RiOT_var.createSubMenu({id = 'weaponLoadouts', parent = 'weaponOptions', subTitle = 'Weapon Loadouts'})
	RiOT_var.createSubMenu({id = 'weaponLoadoutsSelected', parent = 'weaponLoadouts', subTitle = 'Selected Weapon Loadout'})
	RiOT_var.createSubMenu({id = 'weaponAttachmentOptions', parent = 'weaponOptions', subTitle = 'Weapon Attachment Options'})
	
	RiOT_var.createSubMenu({id = 'visualESPOptions', parent = 'visualOptions', subTitle = 'Visual ESP Options'})

	RiOT_var.createSubMenu({id = 'teleportSelectedOption', parent = 'teleportOptions', subTitle = 'Selected Teleport Option'})

	RiOT_var.createSubMenu({id = 'resourceExecutionOptions', parent = 'executionOptions', subTitle = 'Resources'})
	
	RiOT_var.createSubMenu({id = 'creditsMenu', parent = 'menuSettings', subTitle = 'Credits Menu'})
	RiOT_var.createSubMenu({id = 'keybindsMenu', parent = 'menuSettings', subTitle = 'Keybinds Menu'})
	RiOT_var.createSubMenu({id = 'selectedKeybindMenu', parent = 'keybindsMenu', subTitle = 'Selected Keybind Menu'})
	RiOT_var.createSubMenu({id = 'datastoreMenu', parent = 'menuSettings', subTitle = 'Datastore Menu'})
	RiOT_var.createSubMenu({id = 'datastoreSpawnedObjectsMenu', parent = 'datastoreMenu', subTitle = 'Datastore Spawned Objects'})
	RiOT_var.createSubMenu({id = 'datastoreSelectedSpawnedObjectMenu', parent = 'datastoreSpawnedObjectsMenu', subTitle = 'Datastore Selected Spawned Object'})
	
	RiOT_var.createSubMenu({id = 'enumerateMenu', parent = 'allPlayersOptions', subTitle = 'Enumerate'})
	
	RiOT_var.initializeTheme(RiOT_var.menuVars.comboBoxes[8]._words[RiOT_var.menuVars.comboBoxes[8]._selected])
	
	while (RiOT_var.shouldShowMenu) do
		RiOT_var.functions.refresh_pvars(false)

		if RiOT_var.isMenuOpened({id = 'mainMenu'}) then
			for _, ayyLmao in pairs(RiOT_var.tabsToCreate) do
				if RiOT_var.menuButton({text = ayyLmao[1], id = ayyLmao[2], subText = ayyLmao[3], spriteData = ayyLmao[4]}) then
				end
			end

			if (RiOT_var.datastore.developerMode.enabled) then
				if RiOT_var.button({text = 'testicle 1'}) then
					SetPedConfigFlag(RiOT_var.datastore.pLocal.pedId, 52, false)
				elseif RiOT_var.checkBox({text = 'testicle 2', checked = RiOT_var.menuVars.selfOptions.testicle}) then
					RiOT_var.menuVars.selfOptions.testicle = not RiOT_var.menuVars.selfOptions.testicle
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'selfOptions'}) then
			if RiOT_var.menuButton({text = 'Animations', id = 'animationsList'}) then
			elseif RiOT_var.menuButton({text = 'Super Powers', id = 'selfOptionsSuperPowers'}) then
			elseif RiOT_var.button({text = 'Revive', subText = 'Native'}) then
				RiOT_var.features.nativeRevive()
			elseif RiOT_var.button({text = 'Suicide', subText = 'Native'}) then
				RiOT_var.natives.setEntityHealth(RiOT_var.datastore.pLocal.pedId, 0)
			elseif RiOT_var.button({text = 'Re-fill Health', subText = 'Native'}) then
				RiOT_var.natives.setEntityHealth(RiOT_var.datastore.pLocal.pedId, 200)
			elseif RiOT_var.button({text = 'Re-fill Armour', subText = 'Native'}) then
				RiOT_var.natives.setPedArmour(RiOT_var.datastore.pLocal.pedId, 200)
			elseif RiOT_var.comboBox('God-mode', RiOT_var.menuVars.comboBoxes[16]._words, RiOT_var.menuVars.comboBoxes[16]._current, RiOT_var.menuVars.comboBoxes[16]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[16]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[16]._selected = currentIndex
				end) then
			end
			if (RiOT_var.menuVars.comboBoxes[16]._selected > 1) then
				if RiOT_var.checkBox({text = 'Apply God-mode On Armour', checked = RiOT_var.menuVars.selfOptions.godModeArmour}) then
					RiOT_var.menuVars.selfOptions.godModeArmour = not RiOT_var.menuVars.selfOptions.godModeArmour
				end
			end
			if RiOT_var.checkBox({text = 'Movement Trails', checked = RiOT_var.menuVars.selfOptions.movementTrails}) then
				RiOT_var.menuVars.selfOptions.movementTrails = not RiOT_var.menuVars.selfOptions.movementTrails
			elseif RiOT_var.checkBox({text = 'Freecam', checked = RiOT_var.menuVars.selfOptions.freecam}) then
				RiOT_var.features.toggleFreecam()
			elseif RiOT_var.checkBox({text = 'Debug View', checked = RiOT_var.menuVars.selfOptions.debugView}) then
				RiOT_var.menuVars.selfOptions.debugView = not RiOT_var.menuVars.selfOptions.debugView
			end
			if (RiOT_var.menuVars.selfOptions.debugView) then
				local actionToDo = (RiOT_var.menuVars.comboBoxes[17]._words[RiOT_var.menuVars.comboBoxes[17]._selected])
				if RiOT_var.comboBox('View Mode', RiOT_var.menuVars.comboBoxes[17]._words, RiOT_var.menuVars.comboBoxes[17]._current, RiOT_var.menuVars.comboBoxes[17]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[17]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[17]._selected = currentIndex
					end) then
				end
				if (actionToDo == 'Shoot') then
					if RiOT_var.comboBox('Shoot Weapon', RiOT_var.menuVars.comboBoxes[2]._words, RiOT_var.menuVars.comboBoxes[2]._current, RiOT_var.menuVars.comboBoxes[2]._selected, 
						function(currentIndex, selectedIndex)
							RiOT_var.menuVars.comboBoxes[2]._current = currentIndex
							RiOT_var.menuVars.comboBoxes[2]._selected = currentIndex
						end) then
					end
				elseif (actionToDo == 'Clone') then
					if RiOT_var.checkBox({text = 'Attach Clone', checked = RiOT_var.menuVars.selfOptions.debugViewCloneAttach}) then
						RiOT_var.menuVars.selfOptions.debugViewCloneAttach = not RiOT_var.menuVars.selfOptions.debugViewCloneAttach
					end
				elseif (actionToDo == 'Spawn') then
					local actionToDo2 = (RiOT_var.menuVars.comboBoxes[24]._words[RiOT_var.menuVars.comboBoxes[24]._selected])
					if RiOT_var.comboBox('Type', RiOT_var.menuVars.comboBoxes[24]._words, RiOT_var.menuVars.comboBoxes[24]._current, RiOT_var.menuVars.comboBoxes[24]._selected, 
						function(currentIndex, selectedIndex)
							RiOT_var.menuVars.comboBoxes[24]._current = currentIndex
							RiOT_var.menuVars.comboBoxes[24]._selected = currentIndex
						end) then
					end
					if (actionToDo2 == 'Vehicle') then
						if RiOT_var.comboBox2('Saved Vehicles List', RiOT_var.datastore.pLocal.savedVehicles, 'name', RiOT_var.menuVars.comboBoxes[25]._current, RiOT_var.menuVars.comboBoxes[25]._selected, 
							function(currentIndex, selectedIndex)
								RiOT_var.menuVars.comboBoxes[25]._current = currentIndex
								RiOT_var.menuVars.comboBoxes[25]._selected = selectedIndex
								RiOT_var.menuVars.comboBoxes[25]._actual = RiOT_var.datastore.pLocal.savedVehicles[currentIndex]
							end) then
						end
					elseif (actionToDo2 == 'Object') then

					end
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'animationsList'}) then
			for key, value in pairs(RiOT_var.menuTables.animations) do
				if (RiOT_var.menuButton({text = key, id = 'animationsListSelected'})) then
					RiOT_var.datastore.pLocal.selectedAnimationListHandle = value
				end
			end

			if (RiOT_var.button({text = 'Cancel Animation', subText = 'Native'})) then
				ClearPedTasks(RiOT_var.datastore.pLocal.pedId)
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'animationsListSelected'}) then
			if (RiOT_var.datastore.pLocal.selectedAnimationListHandle ~= nil and type(RiOT_var.datastore.pLocal.selectedAnimationListHandle) == 'table') then
				for key, value in pairs(RiOT_var.datastore.pLocal.selectedAnimationListHandle) do
					if (RiOT_var.button({text = value.label, subText = value.type})) then
						local anim = value.data.anim
						local lib = value.data.lib
						if (value.type == 'scenario') then
							TaskStartScenarioInPlace(RiOT_var.datastore.pLocal.pedId, anim, 0, false)
						elseif (value.type == 'attitude') then
							if (not HasAnimSetLoaded(lib)) then
								RequestAnimSet(lib)
							else
								SetPedMovementClipset(RiOT_var.datastore.pLocal.pedId, anim, true)
							end
						elseif (value.type == 'anim') then
							if (not HasAnimDictLoaded(lib)) then
								RequestAnimDict(lib)
							else
								TaskPlayAnim(RiOT_var.datastore.pLocal.pedId, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
							end
						end
					end
				end
			else
				if (RiOT_var.button({text = 'Could not capture animation handler', subText = 'Native'})) then
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'selfOptionsSuperPowers'}) then
			if RiOT_var.checkBox({text = 'Invisibility', checked = RiOT_var.menuVars.selfOptions.superPowers.invisibility}) then
				RiOT_var.menuVars.selfOptions.superPowers.invisibility = not RiOT_var.menuVars.selfOptions.superPowers.invisibility
				RiOT_var.menuVars.selfOptions.superPowers.invisibilityHasTicked = true
			elseif RiOT_var.checkBox({text = 'Force Footstep Tracks', checked = RiOT_var.menuVars.selfOptions.superPowers.forceFootstepTrack}) then
				RiOT_var.menuVars.selfOptions.superPowers.forceFootstepTrack = not RiOT_var.menuVars.selfOptions.superPowers.forceFootstepTrack
				RiOT_var.menuVars.selfOptions.superPowers.forceFootstepTrackHasTicked = true
			elseif RiOT_var.checkBox({text = 'Force Tire Marks', checked = RiOT_var.menuVars.selfOptions.superPowers.forceTireMarks}) then
				RiOT_var.menuVars.selfOptions.superPowers.forceTireMarks = not RiOT_var.menuVars.selfOptions.superPowers.forceTireMarks
				RiOT_var.menuVars.selfOptions.superPowers.forceTireMarksHasTicked = true
			elseif RiOT_var.checkBox({text = 'Super Run', checked = RiOT_var.menuVars.selfOptions.superPowers.superRun}) then
				if (RiOT_var.menuVars.selfOptions.superPowers.superRun) then
					SetRunSprintMultiplierForPlayer(RiOT_var.datastore.pLocal.pId, 1.00)
				else
					SetRunSprintMultiplierForPlayer(RiOT_var.datastore.pLocal.pId, 1.49)
				end
				RiOT_var.menuVars.selfOptions.superPowers.superRun = not RiOT_var.menuVars.selfOptions.superPowers.superRun
			elseif RiOT_var.checkBox({text = 'Super Jump', checked = RiOT_var.menuVars.selfOptions.superPowers.superJump}) then
				RiOT_var.menuVars.selfOptions.superPowers.superJump = not RiOT_var.menuVars.selfOptions.superPowers.superJump
			elseif RiOT_var.checkBox({text = 'Infinite Stamina', checked = RiOT_var.menuVars.selfOptions.superPowers.infiniteStamina}) then
				RiOT_var.menuVars.selfOptions.superPowers.infiniteStamina = not RiOT_var.menuVars.selfOptions.superPowers.infiniteStamina
			elseif RiOT_var.checkBox({text = 'Disable Collisions', checked = RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.enabled}) then
				if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.enabled) then
					RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.peds = false
					RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.vehicles = false
					RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.objects = false
				end

				RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.enabled = not RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.enabled
			end

			if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.enabled) then
				if RiOT_var.checkBox({text = 'Disable Collisions With Peds', checked = RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.peds}) then
					RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.peds = not RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.peds
				elseif RiOT_var.checkBox({text = 'Disable Collisions With Vehicles', checked = RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.vehicles}) then
					RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.vehicles = not RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.vehicles
				elseif RiOT_var.checkBox({text = 'Disable Collisions With Objects', checked = RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.objects}) then
					RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.objects = not RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.objects
				end
			end

			if RiOT_var.checkBox({text = 'Anti Headshot', checked = RiOT_var.menuVars.selfOptions.superPowers.antiHeadshot}) then
				RiOT_var.menuVars.selfOptions.superPowers.antiHeadshot = not RiOT_var.menuVars.selfOptions.superPowers.antiHeadshot
				RiOT_var.menuVars.selfOptions.superPowers.antiHeadshotHasTicked = true
			elseif RiOT_var.checkBox({text = 'No Ragdoll', checked = RiOT_var.menuVars.selfOptions.superPowers.disableRagdoll}) then
				RiOT_var.menuVars.selfOptions.superPowers.disableRagdoll = not RiOT_var.menuVars.selfOptions.superPowers.disableRagdoll
				RiOT_var.menuVars.selfOptions.superPowers.disableRagdollHasTicked = true
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'onlinePlayersOptions'}) then
			if (NetworkIsSessionStarted()) then
				local cActivePlayers = #RiOT_var.natives.getActivePlayers()
				
				if cActivePlayers <= 1 then 
					RiOT_var.setSubTitle({id = 'onlinePlayersOptions', text = '1 Player Online'})
				else 
					RiOT_var.setSubTitle({id = 'onlinePlayersOptions', text = cActivePlayers..' Players Online'})
				end
				
				if RiOT_var.menuButton({text = 'All Players / World Options', id = 'allPlayersOptions', spriteData = {'mpleaderboard', 'leaderboard_globe_icon', RiOT_var.tabsColors.allPlayersOptions}}) then
				elseif RiOT_var.menuButton({text = '['..GetPlayerServerId(RiOT_var.datastore.pLocal.pId)..'/'..RiOT_var.datastore.pLocal.pId..'] You', id = 'selectedPlayerOptions'}) then
					RiOT_var.datastore.pTarget.handle = RiOT_var.datastore.pLocal.pId
				end

				local returnedPlayers = RiOT_var.functions.returnPlayersTable()
				for key, value in pairs(returnedPlayers) do
					if value['id'] ~= RiOT_var.datastore.pLocal.pId then
						if RiOT_var.menuButton({text = '['..value['serverid']..'/'..value['id']..'] | '..value['name']..(RiOT_var.functions.isRiOT_varUser(value['ped']) and ' | RiOT' or ''), id = 'selectedPlayerOptions'}) then
							RiOT_var.datastore.pTarget.handle = value['id']
						end
					end
				end

				--[[for _, currentPlayer in ipairs(RiOT_var.natives.getActivePlayers()) do
					if RiOT_var.menuButton({text = '['..currentPlayer..'/'..GetPlayerServerId(currentPlayer)..'] '..RiOT_var.functions.strings.getSafe(GetPlayerName(currentPlayer)), id = 'selectedPlayerOptions', }) then
						RiOT_var.datastore.pTarget.handle = currentPlayer
					end
				end]]
			else
				if RiOT_var.button({text = 'Not in a network session.', subText = ''}) then
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'allPlayersOptions'}) then
			if RiOT_var.menuButton({text = 'Enumerate', id = 'enumerateMenu'}) then
			elseif RiOT_var.button({text = 'Give Weapon', subText = 'Input'}) then
				local aInput = RiOT_var.functions.keyboardInput('give_weapon', '', 'WEAPON_', 200)
				if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then
					local modelHash = (type(aInput) == 'number' and aInput or GetHashKey(aInput))
					for _, player in ipairs(RiOT_var.natives.getActivePlayers()) do
						if (not RiOT_var.functions.friendsSystem('is_friend', player)) then
							RiOT_var.natives.giveWeaponToPed(GetPlayerPed(player), modelHash, 250, false, true)
						end
					end
				end
			elseif RiOT_var.button({text = 'Explode', subText = 'Native'}) then
				RiOT_var.features.explodeAllPlayers()
			elseif RiOT_var.comboBox('Spawn Object', RiOT_var.menuVars.comboBoxes[1]._words, RiOT_var.menuVars.comboBoxes[1]._current, RiOT_var.menuVars.comboBoxes[1]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[1]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[1]._selected = currentIndex
				end) then
					for _, player in ipairs(RiOT_var.natives.getActivePlayers()) do
						if (not RiOT_var.functions.friendsSystem('is_friend', player)) then
							pCitizen['createThread'](function() 
								if type(RiOT_var.menuVars.comboBoxes[1]._actual[RiOT_var.menuVars.comboBoxes[1]._selected]) == 'table' then
									for key, value in pairs(RiOT_var.menuVars.comboBoxes[1]._actual[RiOT_var.menuVars.comboBoxes[1]._selected]) do
										RiOT_var.features.spawnObject({target = GetPlayerPed(player), model = GetHashKey(value), attach = true})
									end
								else
									RiOT_var.features.spawnObject({target = GetPlayerPed(player), model = GetHashKey(RiOT_var.menuVars.comboBoxes[1]._actual[RiOT_var.menuVars.comboBoxes[1]._selected]), attach = true})
								end
							end)
						end
					end
			elseif RiOT_var.comboBox('Shoot', RiOT_var.menuVars.comboBoxes[2]._words, RiOT_var.menuVars.comboBoxes[2]._current, RiOT_var.menuVars.comboBoxes[2]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[2]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[2]._selected = currentIndex
				end) then
					for _, player in ipairs(RiOT_var.natives.getActivePlayers()) do
						if (not RiOT_var.functions.friendsSystem('is_friend', player)) then
							RiOT_var.features.shootAtPed(GetPlayerPed(player), RiOT_var.menuVars.comboBoxes[2]._actual[RiOT_var.menuVars.comboBoxes[2]._selected])
						end
					end
			elseif RiOT_var.checkBox({text = 'Freeze', checked = RiOT_var.menuVars.allPlayersOptions.freeze}) then
				RiOT_var.menuVars.allPlayersOptions.freeze = not RiOT_var.menuVars.allPlayersOptions.freeze
			elseif RiOT_var.checkBox({text = 'Explosion Loop', checked = RiOT_var.menuVars.allPlayersOptions.explosion}) then
				RiOT_var.menuVars.allPlayersOptions.explosion = not RiOT_var.menuVars.allPlayersOptions.explosion
			elseif RiOT_var.checkBox({text = 'Fake Explosion Loop', checked = RiOT_var.menuVars.allPlayersOptions.fakeExplosion}) then
				RiOT_var.menuVars.allPlayersOptions.fakeExplosion = not RiOT_var.menuVars.allPlayersOptions.fakeExplosion
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'enumerateMenu'}) then
			if RiOT_var.comboBox('Vehicles', RiOT_var.menuVars.comboBoxes[3]._words, RiOT_var.menuVars.comboBoxes[3]._current, RiOT_var.menuVars.comboBoxes[3]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[3]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[3]._selected = currentIndex
				end) then
					RiOT_var.features.runVehiclesEnumerator(RiOT_var.menuVars.comboBoxes[3]._words[RiOT_var.menuVars.comboBoxes[3]._selected])
			elseif RiOT_var.comboBox('Peds', RiOT_var.menuVars.comboBoxes[4]._words, RiOT_var.menuVars.comboBoxes[4]._current, RiOT_var.menuVars.comboBoxes[4]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[4]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[4]._selected = currentIndex
				end) then
					RiOT_var.features.runPedsEnumerator(RiOT_var.menuVars.comboBoxes[4]._words[RiOT_var.menuVars.comboBoxes[4]._selected])
			elseif RiOT_var.comboBox('Objects', RiOT_var.menuVars.comboBoxes[5]._words, RiOT_var.menuVars.comboBoxes[5]._current, RiOT_var.menuVars.comboBoxes[5]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[5]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[5]._selected = currentIndex
				end) then
					RiOT_var.features.runObjectsEnumerator(RiOT_var.menuVars.comboBoxes[5]._words[RiOT_var.menuVars.comboBoxes[5]._selected])
			end
			if RiOT_var.menuVars.comboBoxes[3]._words[RiOT_var.menuVars.comboBoxes[3]._selected] == 'Spawn Object' or RiOT_var.menuVars.comboBoxes[4]._words[RiOT_var.menuVars.comboBoxes[4]._selected] == 'Spawn Object' then
				if RiOT_var.comboBox('Select Object', RiOT_var.menuVars.comboBoxes[1]._words, RiOT_var.menuVars.comboBoxes[1]._current, RiOT_var.menuVars.comboBoxes[1]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[1]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[1]._selected = currentIndex
					end) then
				elseif RiOT_var.checkBox({text = 'Attach Object', checked = RiOT_var.menuVars.enumerateMenu.attachObject}) then
					RiOT_var.menuVars.enumerateMenu.attachObject = not RiOT_var.menuVars.enumerateMenu.attachObject
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'selectedPlayerOptions'}) then
			RiOT_var.setSubTitle({id = 'selectedPlayerOptions', text = 'Selected Player: '..'['..GetPlayerServerId(RiOT_var.datastore.pTarget.handle)..'/'..RiOT_var.datastore.pTarget.handle..'] - '..RiOT_var.functions.strings.getSafe(GetPlayerName(RiOT_var.datastore.pTarget.handle))})

			if RiOT_var.menuButton({text = 'Troll Options', id = 'selectedPlayerTrollOptions'}) then
			elseif RiOT_var.button({text = 'Spectate', subText = (RiOT_var.datastore.pLocal.isInSpectatorMode and 'Spectating: ['..GetPlayerServerId(RiOT_var.datastore.pTarget.data.whoIsBeingSpectated)..']' or 'Spectating: [-1]')}) then
				if (RiOT_var.datastore.pTarget.handle ~= RiOT_var.datastore.pLocal.pId) then
					RiOT_var.datastore.pTarget.data.whoIsBeingSpectated = RiOT_var.datastore.pTarget.handle
					RiOT_var.features.toggleSpectate(RiOT_var.datastore.pTarget.data.whoIsBeingSpectated)
				end
			elseif RiOT_var.button({text = 'Status: '..(RiOT_var.functions.friendsSystem('is_friend', RiOT_var.datastore.pTarget.handle) and '~g~Friend' or '~r~Enemy')}) then
				RiOT_var.functions.friendsSystem('add', RiOT_var.datastore.pTarget.handle)
			elseif RiOT_var.button({text = 'Give Weapon', subText = 'Input'}) then
				local aInput = RiOT_var.functions.keyboardInput('give_weapon', '', 'WEAPON_', 200)
				if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then
					local modelHash = (type(aInput) == 'number' and aInput or GetHashKey(aInput))
					RiOT_var.natives.giveWeaponToPed(GetPlayerPed(RiOT_var.datastore.pTarget.handle), modelHash, 250, false, true)
				end
			elseif RiOT_var.button({text = 'Teleport Into Vehicle', subText = 'Native'}) then
				local pVehicle = RiOT_var.functions.getPedVehicle(GetPlayerPed(RiOT_var.datastore.pTarget.handle))
				if (pVehicle and RiOT_var.natives.doesEntityExist(pVehicle)) then
					RiOT_var.functions.getIntoVehicle(pVehicle)
				end
			elseif RiOT_var.button({text = 'Teleport To', subText = 'Native'}) then
				local _x, _y, _z = table.unpack(RiOT_var.natives.getEntityCoords(GetPlayerPed(RiOT_var.datastore.pTarget.handle)))
				RiOT_var.features.teleportToCoords(_x, _y, _z)
			elseif RiOT_var.button({text = 'Copy Car', subText = 'Native'}) then
				local pVehicle = RiOT_var.functions.getPedVehicle(GetPlayerPed(RiOT_var.datastore.pTarget.handle))
				if (pVehicle and RiOT_var.natives.doesEntityExist(pVehicle)) then
					pCitizen['createThread'](function()
						RiOT_var.features.spawnVehicle({hash = GetEntityModel(pVehicle), props = RiOT_var.functions.getVehicleProperties(pVehicle), setIn = true})
					end)
				end
			elseif RiOT_var.button({text = 'Copy Outfit', subText = 'Native'}) then
				RiOT_var.features.copyPedOutfit(GetPlayerPed(RiOT_var.datastore.pTarget.handle))
			elseif RiOT_var.button({text = 'Give All Weapons', subText = 'Native'}) then
				for key, value in pairs(RiOT_var.menuTables.weaponModels) do
					RiOT_var.natives.giveWeaponToPed(GetPlayerPed(RiOT_var.datastore.pTarget.handle), GetHashKey(value), 250, false, true)
				end
				if RiOT_var.menuVars.weaponOptions.mark2Weapons then
					for key, value in pairs(RiOT_var.menuTables.weaponModelsMk2) do
						RiOT_var.natives.giveWeaponToPed(GetPlayerPed(RiOT_var.datastore.pTarget.handle), GetHashKey(value), 250, false, true)
					end
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'selectedPlayerTrollOptions'}) then
			if RiOT_var.button({text = 'Clear Tasks', subText = 'Native'}) then
				RiOT_var.natives.clearPedTasksImmediately(GetPlayerPed(RiOT_var.datastore.pTarget.handle))
			elseif RiOT_var.button({text = 'Explode', subText = 'Native'}) then
				RiOT_var.functions.explodeEntity(GetPlayerPed(RiOT_var.datastore.pTarget.handle))
			elseif RiOT_var.button({text = 'Enumerated Peds As Enemies', subText = 'Native'}) then
				for ped in RiOT_var.functions.enumeratePeds() do
					if (ped ~= RiOT_var.datastore.pLocal.pedId) then
						NetworkRequestControlOfEntity(ped)
						if (NetworkHasControlOfEntity(ped)) then
							TaskCombatPed(ped, GetPlayerPed(RiOT_var.datastore.pTarget.handle), 0, 16)
						end
					end
				end
			elseif RiOT_var.button({text = 'Teleport Enumerated Vehicles', subText = 'Native'}) then
				RiOT_var.features.teleportEnumeratedVehicles(GetPlayerPed(RiOT_var.datastore.pTarget.handle))
			elseif RiOT_var.button({text = 'Fake Explosion Particle', subText = 'Native'}) then
				RequestNamedPtfxAsset('core')
				UseParticleFxAssetNextCall('core')
				StartNetworkedParticleFxNonLoopedOnEntity('veh_backfire', GetPlayerPed(RiOT_var.datastore.pTarget.handle), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 100.0, false, false, false)
			elseif RiOT_var.comboBox('Shoot', RiOT_var.menuVars.comboBoxes[2]._words, RiOT_var.menuVars.comboBoxes[2]._current, RiOT_var.menuVars.comboBoxes[2]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[2]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[2]._selected = currentIndex
				end) then
					RiOT_var.features.shootAtPed(GetPlayerPed(RiOT_var.datastore.pTarget.handle), RiOT_var.menuVars.comboBoxes[2]._actual[RiOT_var.menuVars.comboBoxes[2]._selected])
			elseif RiOT_var.comboBox('Spawn Object', RiOT_var.menuVars.comboBoxes[1]._words, RiOT_var.menuVars.comboBoxes[1]._current, RiOT_var.menuVars.comboBoxes[1]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[1]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[1]._selected = currentIndex
				end) then
					pCitizen['createThread'](function() 
						RiOT_var.features.spawnObject({target = GetPlayerPed(RiOT_var.datastore.pTarget.handle), model = GetHashKey(RiOT_var.menuVars.comboBoxes[1]._actual[RiOT_var.menuVars.comboBoxes[1]._selected]), attach = true})
					end)
			elseif RiOT_var.checkBox({text = 'Freeze', checked = RiOT_var.datastore.pTarget.frozenTargets[RiOT_var.datastore.pTarget.handle]}) then
				RiOT_var.datastore.pTarget.frozenTargets[RiOT_var.datastore.pTarget.handle] = not RiOT_var.datastore.pTarget.frozenTargets[RiOT_var.datastore.pTarget.handle]
			elseif RiOT_var.checkBox({text = 'Explosion Loop', checked = RiOT_var.datastore.pTarget.explosionLoopTargets[RiOT_var.datastore.pTarget.handle]}) then
				RiOT_var.datastore.pTarget.explosionLoopTargets[RiOT_var.datastore.pTarget.handle] = not RiOT_var.datastore.pTarget.explosionLoopTargets[RiOT_var.datastore.pTarget.handle]
			elseif RiOT_var.checkBox({text = 'Fake Explosion Loop', checked = RiOT_var.datastore.pTarget.fakeExplosionLoopTargets[RiOT_var.datastore.pTarget.handle]}) then
				RiOT_var.datastore.pTarget.fakeExplosionLoopTargets[RiOT_var.datastore.pTarget.handle] = not RiOT_var.datastore.pTarget.fakeExplosionLoopTargets[RiOT_var.datastore.pTarget.handle]
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'vehicleOptions'}) then
			if RiOT_var.menuButton({text = 'Modifications', id = 'vehicleModificationOptions'}) then
			elseif RiOT_var.menuButton({text = 'Personal Vehicle', id = 'personalVehicleOptions'}) then
			elseif RiOT_var.menuButton({text = 'Saved Vehicles', id = 'savedVehiclesOptions'}) then
			elseif RiOT_var.button({text = 'Spawn Vehicle', subText = 'Input'}) then
				local aInput = RiOT_var.functions.keyboardInput('spawn_vehicle', 'model', '', 100)
				if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) and IsModelValid(aInput) and IsModelAVehicle(aInput) then
					local modelHash = (type(aInput) == 'number' and aInput or GetHashKey(aInput))
					pCitizen['createThread'](function()
						RiOT_var.features.spawnVehicle({hash = modelHash, setIn = true})
					end)
				else
					RiOT_var.notification('Model is invalid!')
				end
			elseif RiOT_var.button({text = 'Re-Fuel Vehicle', subText = 'Native'}) then
				RiOT_var.features.refuelVehicle(RiOT_var.datastore.pLocal.vehicle)
			elseif RiOT_var.button({text = 'Delete Vehicle', subText = 'Native'}) then
				RiOT_var.functions.deleteEntity(RiOT_var.datastore.pLocal.vehicle)
			elseif RiOT_var.button({text = 'Change Plate', subText = 'Input'}) then
				local aInput = RiOT_var.functions.keyboardInput('change_plate', 'plate', '', 8)
				if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then
					SetVehicleNumberPlateText(RiOT_var.datastore.pLocal.vehicle, aInput)
				end
			elseif RiOT_var.comboBox('Repair Vehicle', RiOT_var.menuVars.comboBoxes[15]._words, RiOT_var.menuVars.comboBoxes[15]._current, RiOT_var.menuVars.comboBoxes[15]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[15]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[15]._selected = selectedIndex
				end) then
					RiOT_var.features.repairVehicle(RiOT_var.datastore.pLocal.vehicle, RiOT_var.menuVars.comboBoxes[15]._words[RiOT_var.menuVars.comboBoxes[15]._selected])
			elseif RiOT_var.comboBox('Suspension', RiOT_var.menuVars.comboBoxes[6]._words, RiOT_var.menuVars.comboBoxes[6]._current, RiOT_var.menuVars.comboBoxes[6]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[6]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[6]._selected = selectedIndex
				end) then
					local pVehicle = RiOT_var.datastore.pLocal.vehicle
					if (pVehicle and RiOT_var.natives.doesEntityExist(pVehicle)) then
						local currentSuspension = GetVehicleHandlingFloat(pVehicle, 'CHandlingData', 'fSuspensionRaise')
						if RiOT_var.menuVars.comboBoxes[6]._words[RiOT_var.menuVars.comboBoxes[6]._selected] == 'Lower' then
							SetVehicleHandlingFloat(pVehicle, 'CHandlingData', 'fSuspensionRaise', currentSuspension - 0.01)
						elseif RiOT_var.menuVars.comboBoxes[6]._words[RiOT_var.menuVars.comboBoxes[6]._selected] == 'Raise' then
							SetVehicleHandlingFloat(pVehicle, 'CHandlingData', 'fSuspensionRaise', currentSuspension + 0.01)
						end
						RiOT_var.features.repairVehicle(pVehicle, 'Default')
					end
			elseif RiOT_var.comboBox('Change Sound', RiOT_var.menuVars.comboBoxes[12]._words, RiOT_var.menuVars.comboBoxes[12]._current, RiOT_var.menuVars.comboBoxes[12]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[12]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[12]._selected = selectedIndex
				end) then
					local pVehicle = RiOT_var.datastore.pLocal.vehicle
					if (pVehicle and RiOT_var.natives.doesEntityExist(pVehicle)) then
						RiOT_var.natives.forceVehicleEngineAudio(pVehicle, RiOT_var.menuVars.comboBoxes[12]._words[RiOT_var.menuVars.comboBoxes[12]._selected])
					end
			elseif RiOT_var.comboBox('Set Dirt Level', RiOT_var.menuVars.comboBoxes[23]._words, RiOT_var.menuVars.comboBoxes[23]._current, RiOT_var.menuVars.comboBoxes[23]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[23]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[23]._selected = selectedIndex
				end) then
					local pVehicle = RiOT_var.datastore.pLocal.vehicle
					if (pVehicle and RiOT_var.natives.doesEntityExist(pVehicle)) then
						SetVehicleDirtLevel(pVehicle, RiOT_var.menuVars.comboBoxes[23]._actual[RiOT_var.menuVars.comboBoxes[23]._selected])
					end
			elseif RiOT_var.checkBox({text = 'No Bike Fall', checked = RiOT_var.menuVars.vehicleOptions.noBikeFall}) then
				if (RiOT_var.menuVars.vehicleOptions.noBikeFall) then
					SetPedCanBeKnockedOffVehicle(RiOT_var.datastore.pLocal.pedId, 0)
				else
					SetPedCanBeKnockedOffVehicle(RiOT_var.datastore.pLocal.pedId, 1)
				end
				RiOT_var.menuVars.vehicleOptions.noBikeFall = not RiOT_var.menuVars.vehicleOptions.noBikeFall
			elseif RiOT_var.checkBox({text = 'Force Launch Control', checked = RiOT_var.menuVars.vehicleOptions.forceLaunchControl}) then
				RiOT_var.menuVars.vehicleOptions.forceLaunchControl = not RiOT_var.menuVars.vehicleOptions.forceLaunchControl
				RiOT_var.menuVars.vehicleOptions.forceLaunchControlHasTicked = true
			elseif RiOT_var.checkBox({text = 'Nitro', checked = RiOT_var.menuVars.vehicleOptions.nitro}) then
				RiOT_var.menuVars.vehicleOptions.nitro = not RiOT_var.menuVars.vehicleOptions.nitro
			end
			if (RiOT_var.menuVars.vehicleOptions.nitro) then
				if RiOT_var.checkBox({text = 'Nitro Effect', checked = RiOT_var.menuVars.vehicleOptions.nitroEffect}) then
					RiOT_var.menuVars.vehicleOptions.nitroEffect = not RiOT_var.menuVars.vehicleOptions.nitroEffect
				elseif RiOT_var.comboBox('Nitro Amount', RiOT_var.menuVars.comboBoxes[18]._words, RiOT_var.menuVars.comboBoxes[18]._current, RiOT_var.menuVars.comboBoxes[18]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[18]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[18]._selected = currentIndex
					end) then 
				end
			end
			if RiOT_var.checkBox({text = 'Rev Limiter', checked = RiOT_var.menuVars.vehicleOptions.revLimiter}) then
				RiOT_var.menuVars.vehicleOptions.revLimiter = not RiOT_var.menuVars.vehicleOptions.revLimiter
			end
			if (RiOT_var.menuVars.vehicleOptions.revLimiter) then
				if RiOT_var.comboBox('Rev Limit Amount', RiOT_var.menuVars.comboBoxes[10]._words, RiOT_var.menuVars.comboBoxes[10]._current, RiOT_var.menuVars.comboBoxes[10]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[10]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[10]._selected = currentIndex
					end) then
				elseif RiOT_var.comboBox('Rev Limit Only On', RiOT_var.menuVars.comboBoxes[11]._words, RiOT_var.menuVars.comboBoxes[11]._current, RiOT_var.menuVars.comboBoxes[11]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[11]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[11]._selected = currentIndex
					end) then
				end
			end
			if RiOT_var.checkBox({text = 'High Beam On Honk', checked = RiOT_var.menuVars.vehicleOptions.highBeamOnHonk}) then
				RiOT_var.menuVars.vehicleOptions.highBeamOnHonk = not RiOT_var.menuVars.vehicleOptions.highBeamOnHonk
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'vehicleModificationOptions'}) then
			local pVehicle = RiOT_var.datastore.pLocal.vehicle
			if (pVehicle and RiOT_var.natives.doesEntityExist(pVehicle)) then
				if (RiOT_var.menuButton({text = 'Performance', id = 'performanceVehicleModifications'})) then
				elseif (RiOT_var.menuButton({text = 'Cosmetics', id = 'cosmeticVehicleModifications'})) then
				elseif RiOT_var.button({text = 'Set Stock Upgrades', subText = 'Native'}) then
					RiOT_var.features.stockUpgrades(RiOT_var.datastore.pLocal.vehicle)
				elseif RiOT_var.button({text = 'Random Cosmetic Upgrades', subText = 'Native'}) then
					RiOT_var.features.randomCosmetics(RiOT_var.datastore.pLocal.vehicle)
				elseif RiOT_var.button({text = 'Max Performance Upgrades', subText = 'Native'}) then
					RiOT_var.features.maxPerformanceUpgrades(RiOT_var.datastore.pLocal.vehicle)
				elseif RiOT_var.button({text = 'Max All Upgrades', subText = 'Native'}) then
					RiOT_var.features.maxAllUpgrades(RiOT_var.datastore.pLocal.vehicle)
				elseif RiOT_var.button({text = 'Random Primary Color', subText = 'Native'}) then
					local pVehicle = RiOT_var.datastore.pLocal.vehicle
					local colorPrimary, colorSecondary = GetVehicleColours(pVehicle)
					SetVehicleModKit(pVehicle, 0)
					SetVehicleColours(pVehicle, math.random(1, 112), colorSecondary)
				elseif RiOT_var.button({text = 'Random Secondary Color', subText = 'Native'}) then
					local pVehicle = RiOT_var.datastore.pLocal.vehicle
					local colorPrimary, colorSecondary = GetVehicleColours(pVehicle)
					SetVehicleModKit(pVehicle, 0)
					SetVehicleColours(pVehicle, colorPrimary, math.random(1, 112))
				end
			else
				if (RiOT_var.button({text = 'Could not find your vehicle.', subText = ''})) then
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'performanceVehicleModifications'}) then
			

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'cosmeticVehicleModifications'}) then
			for key, value in pairs(RiOT_var.menuTables.cosmeticVehicleModifications) do
				if (RiOT_var.menuButton({text = key, id = 'selectedVehicleModification'})) then
					RiOT_var.datastore.selectedVehicleModification = value
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'selectedVehicleModification'}) then
			local pVehicle = (RiOT_var.datastore.pLocal.vehicle)
			if (pVehicle and RiOT_var.natives.doesEntityExist(pVehicle)) then
				SetVehicleModKit(pVehicle, 0)
				local modIndex = (RiOT_var.datastore.selectedVehicleModification.id)
				if (RiOT_var.button({text = 'Stock', subText = 'Native'})) then
					SetVehicleMod(pVehicle, modIndex, -1)
				end
				if (GetNumVehicleMods(pVehicle, modIndex) ~= nil and GetNumVehicleMods(pVehicle, modIndex) > 0) then
					for key=0, GetNumVehicleMods(pVehicle, modIndex) do
						local modName = (GetModTextLabel(pVehicle, modIndex, key) or 'un-known')
						if (modName ~= 'un-known') then modName = (GetLabelText(modName)) end
						if (RiOT_var.button({text = modName, subText = 'Native'})) then
							SetVehicleMod(pVehicle, modIndex, key)
						end
					end
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'personalVehicleOptions'}) then
			local pVehicle = (RiOT_var.datastore.pLocal.vehicle)
			if (pVehicle and RiOT_var.natives.doesEntityExist(pVehicle)) then
				local lockStatus = {
					idx = GetVehicleDoorLockStatus(pVehicle),
					label = 'unknown'
				}
				if (lockStatus.idx == 1) then
					lockStatus.label = 'Unlocked'
				elseif (lockStatus.idx == 2) then
					lockStatus.label = 'Locked'
				end
				if RiOT_var.button({text = 'Lock State: '..lockStatus.label, subText = 'Native'}) then
					if (lockStatus.label == 'Unlocked') then
						SetVehicleDoorsLocked(pVehicle, 2)
						PlayVehicleDoorCloseSound(pVehicle, 1)
						SetVehicleDoorsLockedForAllPlayers(pVehicle, true)
					elseif (lockStatus.label == 'Locked') then
						SetVehicleDoorsLocked(pVehicle, 1)
						PlayVehicleDoorOpenSound(pVehicle, 0)
						SetVehicleDoorsLockedForAllPlayers(pVehicle, false)
					end
					if (RiOT_var.menuVars.vehicleOptions.personal.animation and not IsPedInAnyVehicle(RiOT_var.datastore.pLocal.pedId, true)) then
						local animationDict = 'anim@mp_player_intmenu@key_fob@'
						RequestAnimDict(animationDict)
						if (HasAnimDictLoaded(animationDict)) then
							TaskPlayAnim(RiOT_var.datastore.pLocal.pedId, animationDict, 'fob_click_fp', 8.0, 8.0, -1, 48, 1, false, false, false)
						else
							pCitizen['createThread'](function()
								while (not HasAnimDictLoaded(animationDict)) do
									pCitizen['wait'](0)
								end
							end)
						end
					end
					if (RiOT_var.menuVars.vehicleOptions.personal.lightsOnLock) then
						pCitizen['createThread'](function()
							for _i=0, 2 do
								pCitizen['wait'](100)
								SetVehicleLights(pVehicle, 2)
								pCitizen['wait'](250)
								SetVehicleLights(pVehicle, 0)
							end
						end)
					end
					if (RiOT_var.menuVars.vehicleOptions.personal.shutDoorsOnLock) then
						for _i=0, 6 do
							SetVehicleDoorShut(pVehicle, _i, false)
						end
					end
				elseif RiOT_var.comboBox('Open/Close', RiOT_var.menuVars.comboBoxes[20]._words, RiOT_var.menuVars.comboBoxes[20]._current, RiOT_var.menuVars.comboBoxes[20]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[20]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[20]._selected = currentIndex
					end) then
						local actualIndex = (RiOT_var.menuVars.comboBoxes[20]._selected - 1)
						if (GetVehicleDoorAngleRatio(pVehicle, actualIndex) > 0.0) then
							SetVehicleDoorShut(pVehicle, actualIndex, false)
						else
							SetVehicleDoorOpen(pVehicle, actualIndex, false, false)
						end
				elseif RiOT_var.checkBox({text = 'Draw ESP', checked = RiOT_var.menuVars.vehicleOptions.personal.esp}) then
					RiOT_var.menuVars.vehicleOptions.personal.esp = not RiOT_var.menuVars.vehicleOptions.personal.esp
				elseif RiOT_var.checkBox({text = 'Lock Animation', checked = RiOT_var.menuVars.vehicleOptions.personal.animation}) then
					RiOT_var.menuVars.vehicleOptions.personal.animation = not RiOT_var.menuVars.vehicleOptions.personal.animation
				elseif RiOT_var.checkBox({text = 'Lights on Un/Lock', checked = RiOT_var.menuVars.vehicleOptions.personal.lightsOnLock}) then
					RiOT_var.menuVars.vehicleOptions.personal.lightsOnLock = not RiOT_var.menuVars.vehicleOptions.personal.lightsOnLock
				elseif RiOT_var.checkBox({text = 'Shut Doors on Un/Lock', checked = RiOT_var.menuVars.vehicleOptions.personal.shutDoorsOnLock}) then
					RiOT_var.menuVars.vehicleOptions.personal.shutDoorsOnLock = not RiOT_var.menuVars.vehicleOptions.personal.shutDoorsOnLock
				end
			else
				if RiOT_var.button({text = 'Couldn\'t find a personal vehicle.', subText = ''}) then
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'savedVehiclesOptions'}) then
			RiOT_var.setSubTitle({id = 'savedVehiclesOptions', text = #RiOT_var.datastore.pLocal.savedVehicles..' Saved Vehicles'})
			if RiOT_var.button({text = 'Save Current Vehicle', subText = 'Input'}) then
				if IsPedInAnyVehicle(RiOT_var.datastore.pLocal.pedId) then
					local aInput = RiOT_var.functions.keyboardInput('save_curr_vehicle', 'name', '', 100)
					if RiOT_var.functions.strings.isNullOrEmpty(aInput) then aInput = 'un-named' end

					local rGlobal = {name = aInput, props = RiOT_var.functions.getVehicleProperties(RiOT_var.datastore.pLocal.vehicle)}
					if (rGlobal and rGlobal.props) then
						table.insert(RiOT_var.datastore.pLocal.savedVehicles, rGlobal)
					end
				end
			end
			if (RiOT_var.datastore.developerMode.enabled) then
				if (RiOT_var.button({text = 'Print Current Vehicle Properties', subText = 'Native'})) then
					RiOT_var.print(RiOT_var.functions.tables.dump(RiOT_var.functions.getVehicleProperties(RiOT_var.datastore.pLocal.vehicle)))
				end
			end
			if (RiOT_var.datastore.pLocal.savedVehicles and #RiOT_var.datastore.pLocal.savedVehicles > 0) then
				for _i=1, #RiOT_var.datastore.pLocal.savedVehicles do
					if (IsModelValid(RiOT_var.datastore.pLocal.savedVehicles[_i].props.model)) then
						if (RiOT_var.menuButton({text = RiOT_var.datastore.pLocal.savedVehicles[_i].name..' | '..RiOT_var.datastore.pLocal.savedVehicles[_i].props.model, id = 'selectedSavedVehicleOptions'})) then
							RiOT_var.datastore.savedVehiclesOptionsHandle = RiOT_var.datastore.pLocal.savedVehicles[_i]
							RiOT_var.datastore.savedVehiclesOptionsDeleteHandle = _i
						end
					end
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'selectedSavedVehicleOptions'}) then
			if RiOT_var.button({text = 'Spawn Saved Vehicle', subText = 'Native'}) then
				local carToSpawn = RiOT_var.datastore.savedVehiclesOptionsHandle
				if carToSpawn.props then
					pCitizen['createThread'](function()
						RiOT_var.features.spawnVehicle({hash = carToSpawn.props.model, props = carToSpawn.props, setIn = true})
					end)
				end
			end
			if RiOT_var.datastore.pLocal.vehicle and RiOT_var.natives.doesEntityExist(RiOT_var.datastore.pLocal.vehicle) and GetEntityModel(RiOT_var.datastore.pLocal.vehicle) == RiOT_var.datastore.savedVehiclesOptionsHandle.props.model then
				if RiOT_var.button({text = 'Copy Properties', subText = 'Native'}) then
					RiOT_var.functions.setVehicleProperties(RiOT_var.datastore.pLocal.vehicle, RiOT_var.datastore.savedVehiclesOptionsHandle.props)
				end
			end
			if RiOT_var.button({text = 'Remove Vehicle', subText = 'Native'}) then
				table.remove(RiOT_var.datastore.pLocal.savedVehicles, RiOT_var.datastore.savedVehiclesOptionsDeleteHandle)
				RiOT_var.openMenu({id = 'savedVehiclesOptions'})
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'weaponOptions'}) then
			if RiOT_var.menuButton({text = 'Loadouts', id = 'weaponLoadouts'}) then
			elseif RiOT_var.menuButton({text = 'Attachments', id = 'weaponAttachmentOptions'}) then
			elseif RiOT_var.button({text = 'Spawn Weapon', subText = 'Input'}) then
				local aInput = RiOT_var.functions.keyboardInput('give_weapon', '', 'WEAPON_', 200)
				if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then
					local modelHash = (type(aInput) == 'number' and aInput or GetHashKey(aInput))
					RiOT_var.natives.giveWeaponToPed(RiOT_var.datastore.pLocal.pedId, modelHash, 250, false, true)
				end
			elseif RiOT_var.button({text = 'Spawn All Weapons', subText = 'Native'}) then
				for key, value in pairs(RiOT_var.menuTables.weaponModels) do
					RiOT_var.natives.giveWeaponToPed(RiOT_var.datastore.pLocal.pedId, GetHashKey(value), 250, false, true)
				end
				if (RiOT_var.menuVars.weaponOptions.mark2Weapons) then
					for key, value in pairs(RiOT_var.menuTables.weaponModelsMk2) do
						RiOT_var.natives.giveWeaponToPed(RiOT_var.datastore.pLocal.pedId, GetHashKey(value), 250, false, true)
					end
				end
			elseif RiOT_var.button({text = 'Remove All Weapons', subText = 'Native'}) then
				RemoveAllPedWeapons(RiOT_var.datastore.pLocal.pedId, true)
			elseif RiOT_var.comboBox('Re-fill Ammo', RiOT_var.menuVars.comboBoxes[7]._words, RiOT_var.menuVars.comboBoxes[7]._current, RiOT_var.menuVars.comboBoxes[7]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[7]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[7]._selected = currentIndex
				end) then
					if RiOT_var.menuVars.comboBoxes[7]._words[RiOT_var.menuVars.comboBoxes[7]._selected] == 'Current' then
						local retval, weaponHash = GetCurrentPedWeapon(RiOT_var.datastore.pLocal.pedId, true)
						if (retval and weaponHash) then
							SetPedAmmo(RiOT_var.datastore.pLocal.pedId, weaponHash, 250)
						end
					elseif RiOT_var.menuVars.comboBoxes[7]._words[RiOT_var.menuVars.comboBoxes[7]._selected] == 'All' then
						for key, value in pairs(RiOT_var.menuTables.weaponModelsFull) do
							SetPedAmmo(RiOT_var.datastore.pLocal.pedId, GetHashKey(value), 250)
						end
					end
			elseif RiOT_var.comboBox('Damage Multiplier', RiOT_var.menuVars.comboBoxes[14]._words, RiOT_var.menuVars.comboBoxes[14]._current, RiOT_var.menuVars.comboBoxes[14]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[14]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[14]._selected = currentIndex
				end) then
			elseif RiOT_var.checkBox({text = 'Mark II', checked = RiOT_var.menuVars.weaponOptions.mark2Weapons}) then
				RiOT_var.menuVars.weaponOptions.mark2Weapons = not RiOT_var.menuVars.weaponOptions.mark2Weapons
			elseif RiOT_var.checkBox({text = 'Infinite Combat-Roll', checked = RiOT_var.menuVars.weaponOptions.infiniteCombatRoll}) then
				RiOT_var.menuVars.weaponOptions.infiniteCombatRoll = not RiOT_var.menuVars.weaponOptions.infiniteCombatRoll
				if (RiOT_var.menuVars.weaponOptions.infiniteCombatRoll) then
					for key=0, 3 do
						StatSetInt(GetHashKey('MP'..key..'_SHOOTING_ABILITY'), 1100, true)
						StatSetInt(GetHashKey('SP'..key..'_SHOOTING_ABILITY'), 1100, true)
					end
				else
					for key=0, 3 do
						StatSetInt(GetHashKey('MP'..key..'_SHOOTING_ABILITY'), 99, true)
						StatSetInt(GetHashKey('SP'..key..'_SHOOTING_ABILITY'), 99, true)
					end
				end
			elseif RiOT_var.checkBox({text = 'Infinite Ammo Clip', checked = RiOT_var.menuVars.weaponOptions.infiniteAmmoClip}) then
				RiOT_var.menuVars.weaponOptions.infiniteAmmoClip = not RiOT_var.menuVars.weaponOptions.infiniteAmmoClip
				RiOT_var.menuVars.weaponOptions.infiniteAmmoClipHasTicked = true
			elseif RiOT_var.checkBox({text = 'Full Accuracy', checked = RiOT_var.menuVars.weaponOptions.fullAccuracy}) then
				if (RiOT_var.menuVars.weaponOptions.fullAccuracy) then
					SetPedAccuracy(RiOT_var.datastore.pLocal.pedId, 50)
				else
					SetPedAccuracy(RiOT_var.datastore.pLocal.pedId, 100)
				end
				RiOT_var.menuVars.weaponOptions.fullAccuracy = not RiOT_var.menuVars.weaponOptions.fullAccuracy
			elseif RiOT_var.checkBox({text = 'Triggerbot', checked = RiOT_var.menuVars.weaponOptions.triggerbot}) then
				RiOT_var.menuVars.weaponOptions.triggerbot = not RiOT_var.menuVars.weaponOptions.triggerbot
			end
			if (RiOT_var.menuVars.weaponOptions.triggerbot) then
				if RiOT_var.comboBox('Triggerbot Type', RiOT_var.menuVars.comboBoxes[22]._words, RiOT_var.menuVars.comboBoxes[22]._current, RiOT_var.menuVars.comboBoxes[22]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[22]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[22]._selected = currentIndex
					end) then
				end
			end
			if RiOT_var.checkBox({text = 'Explosive Impact', checked = RiOT_var.menuVars.weaponOptions.explosiveImpact}) then
				RiOT_var.menuVars.weaponOptions.explosiveImpact = not RiOT_var.menuVars.weaponOptions.explosiveImpact
			elseif RiOT_var.checkBox({text = 'Teleport To Impact', checked = RiOT_var.menuVars.weaponOptions.teleportToImpact}) then
				RiOT_var.menuVars.weaponOptions.teleportToImpact = not RiOT_var.menuVars.weaponOptions.teleportToImpact
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'weaponLoadouts'}) then
			if RiOT_var.button({text = 'Save Loadout', subText = 'Native'}) then
				local aInput = RiOT_var.functions.keyboardInput('save_loadout', '', '', 24)
				if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then
					RiOT_var.features.saveLoadout(aInput)
				end
			end
			for key, value in pairs(RiOT_var.datastore.weaponLoadouts) do
				if RiOT_var.menuButton({text = value.name, id = 'weaponLoadoutsSelected'}) then
					RiOT_var.datastore.selectedWeaponLoadoutHandle = value
					RiOT_var.datastore.selectedWeaponLoadoutDeleteHandle = key
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'weaponLoadoutsSelected'}) then
			if (RiOT_var.datastore.developerMode.enabled) then
				if (RiOT_var.button({text = 'Print Loadout', subText = 'Native'})) then
					RiOT_var.print(RiOT_var.functions.tables.dump(RiOT_var.datastore.selectedWeaponLoadoutHandle.weapons))
				end
			end
			if RiOT_var.button({text = 'Equip Loadout', subText = 'Native'}) then
				RiOT_var.features.loadLoadout(RiOT_var.datastore.selectedWeaponLoadoutHandle)
			elseif RiOT_var.button({text = 'Delete Loadout', subText = 'Native'}) then
				table.remove(RiOT_var.datastore.weaponLoadouts, RiOT_var.datastore.selectedWeaponLoadoutDeleteHandle)
				RiOT_var.openMenu({id = 'weaponLoadouts'})
			elseif RiOT_var.button({text = 'Weapons', subText = 'Native'}) then
			end
			for key, value in pairs(RiOT_var.datastore.selectedWeaponLoadoutHandle.weapons) do
				if RiOT_var.button({text = key, subText = 'Native'}) then
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'weaponAttachmentOptions'}) then
			for key, value in pairs(RiOT_var.menuTables.weaponAttachments) do
				if RiOT_var.button({text = key, subText = 'Native'}) then
					for _key, _value in pairs(RiOT_var.menuTables.weaponAttachments[key]) do
						local p_ret = RiOT_var.features.installWeaponAttachment(_value)
						if (p_ret) then
							break
						end
					end
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'visualOptions'}) then
			if RiOT_var.menuButton({text = 'Extra-Sensory Perception', id = 'visualESPOptions'}) then
			elseif RiOT_var.button({text = 'Custom License Plates', subText = 'Native'}) then
				RiOT_var.features.customLicensePlateVisual()
			elseif RiOT_var.comboBox('Crosshair', RiOT_var.menuVars.comboBoxes[13]._words, RiOT_var.menuVars.comboBoxes[13]._current, RiOT_var.menuVars.comboBoxes[13]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[13]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[13]._selected = currentIndex
				end) then
			elseif RiOT_var.checkBox({text = 'Force Radar', checked = RiOT_var.menuVars.visualOptions.forceRadar}) then
				RiOT_var.menuVars.visualOptions.forceRadar = not RiOT_var.menuVars.visualOptions.forceRadar
				RiOT_var.menuVars.visualOptions.forceRadarHasTicked = true
			elseif RiOT_var.checkBox({text = 'Force Third-person', checked = RiOT_var.menuVars.visualOptions.forceThirdPerson}) then
				RiOT_var.menuVars.visualOptions.forceThirdPerson = not RiOT_var.menuVars.visualOptions.forceThirdPerson
			elseif RiOT_var.checkBox({text = 'Lock Horizontal Camera', checked = RiOT_var.menuVars.visualOptions.lockHorizontalCam}) then
				RiOT_var.menuVars.visualOptions.lockHorizontalCam = not RiOT_var.menuVars.visualOptions.lockHorizontalCam
			elseif RiOT_var.checkBox({text = 'Lock Vertical Camera', checked = RiOT_var.menuVars.visualOptions.lockVerticalCam}) then
				RiOT_var.menuVars.visualOptions.lockVerticalCam = not RiOT_var.menuVars.visualOptions.lockVerticalCam
			elseif RiOT_var.checkBox({text = 'Bullet Tracers', checked = RiOT_var.menuVars.visualOptions.bulletTracers}) then
				RiOT_var.menuVars.visualOptions.bulletTracers = not RiOT_var.menuVars.visualOptions.bulletTracers
			elseif RiOT_var.checkBox({text = 'Bullet Impacts', checked = RiOT_var.menuVars.visualOptions.bulletImpacts}) then
				RiOT_var.menuVars.visualOptions.bulletImpacts = not RiOT_var.menuVars.visualOptions.bulletImpacts		
			elseif RiOT_var.checkBox({text = 'Stop All Screen Effects', checked = RiOT_var.menuVars.visualOptions.stopAllScreenEffects}) then
				RiOT_var.menuVars.visualOptions.stopAllScreenEffects = not RiOT_var.menuVars.visualOptions.stopAllScreenEffects		
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'visualESPOptions'}) then
			if RiOT_var.checkBox({text = 'Reveal Invisible Players', checked = RiOT_var.menuVars.visualOptions.esp.revealInvisiblePlayers}) then
				RiOT_var.menuVars.visualOptions.esp.revealInvisiblePlayers = not RiOT_var.menuVars.visualOptions.esp.revealInvisiblePlayers
			elseif RiOT_var.checkBox({text = 'Enable Player ESP', checked = RiOT_var.menuVars.visualOptions.esp.enablePlayerESP}) then
				RiOT_var.menuVars.visualOptions.esp.enablePlayerESP = not RiOT_var.menuVars.visualOptions.esp.enablePlayerESP
			end
			if RiOT_var.menuVars.visualOptions.esp.enablePlayerESP then
				if RiOT_var.checkBox({text = 'Self', checked = RiOT_var.menuVars.visualOptions.esp.displaySelf}) then
					RiOT_var.menuVars.visualOptions.esp.displaySelf = not RiOT_var.menuVars.visualOptions.esp.displaySelf
				elseif RiOT_var.checkBox({text = 'Player Box', checked = RiOT_var.menuVars.visualOptions.esp.displayPlayerBox}) then
					RiOT_var.menuVars.visualOptions.esp.displayPlayerBox = not RiOT_var.menuVars.visualOptions.esp.displayPlayerBox
				elseif RiOT_var.checkBox({text = 'Player Name', checked = RiOT_var.menuVars.visualOptions.esp.displayPlayerName}) then
					RiOT_var.menuVars.visualOptions.esp.displayPlayerName = not RiOT_var.menuVars.visualOptions.esp.displayPlayerName
				elseif RiOT_var.checkBox({text = 'Player IDs', checked = RiOT_var.menuVars.visualOptions.esp.displayPlayerID}) then
					RiOT_var.menuVars.visualOptions.esp.displayPlayerID = not RiOT_var.menuVars.visualOptions.esp.displayPlayerID
				elseif RiOT_var.checkBox({text = 'Player Distance', checked = RiOT_var.menuVars.visualOptions.esp.displayPlayerDistance}) then
					RiOT_var.menuVars.visualOptions.esp.displayPlayerDistance = not RiOT_var.menuVars.visualOptions.esp.displayPlayerDistance
				elseif RiOT_var.checkBox({text = 'Player Skeleton', checked = RiOT_var.menuVars.visualOptions.esp.displayPlayerSkeleton}) then
					RiOT_var.menuVars.visualOptions.esp.displayPlayerSkeleton = not RiOT_var.menuVars.visualOptions.esp.displayPlayerSkeleton
				elseif RiOT_var.checkBox({text = 'Player Weapon', checked = RiOT_var.menuVars.visualOptions.esp.displayPlayerWeapon}) then
					RiOT_var.menuVars.visualOptions.esp.displayPlayerWeapon = not RiOT_var.menuVars.visualOptions.esp.displayPlayerWeapon
				elseif RiOT_var.comboBox('Draw Distance', RiOT_var.menuVars.comboBoxes[19]._words, RiOT_var.menuVars.comboBoxes[19]._current, RiOT_var.menuVars.comboBoxes[19]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[19]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[19]._selected = currentIndex
					end) then
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'teleportOptions'}) then
			if (RiOT_var.datastore.pLocal.lastLocation) then
				if (RiOT_var.button({text = 'Last Location', subText = 'Native'})) then
					RiOT_var.features.teleportToCoords(table.unpack(RiOT_var.datastore.pLocal.lastLocation))
				end
			end
			
			if (RiOT_var.button({text = 'Teleport To Waypoint', subText = 'Native'})) then
				pCitizen['createThread'](RiOT_var.features.teleportToWaypoint)
			elseif (RiOT_var.button({text = 'Save Current Location', subText = 'Native'})) then
				local aInput = RiOT_var.functions.keyboardInput('teleport_location', 'name', '', 15)
				if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then 
					local _x, _y, _z = table.unpack(RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId))
					RiOT_var.menuTables.teleportLocations[aInput] = { ['x'] = _x, ['y'] = _y, ['z'] = _z }
				end
			end

			for key, value in pairs(RiOT_var.menuTables.teleportLocations) do
				if (RiOT_var.menuButton({text = key, id = 'teleportSelectedOption'})) then
					RiOT_var.datastore.pLocal.selectedTeleportLocationHandle = value
					RiOT_var.datastore.pLocal.selectedTeleportLocationDeleteHandle = key
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'teleportSelectedOption'}) then
			local value = RiOT_var.datastore.pLocal.selectedTeleportLocationHandle
			local key = RiOT_var.datastore.pLocal.selectedTeleportLocationDeleteHandle
			if (value ~= nil and type(value) == 'table') then
				if (RiOT_var.button({text = 'Selected - '..key, subText = 'Native'})) then
				elseif (RiOT_var.button({text = 'Teleport To Location', subText = 'Native'})) then
					RiOT_var.features.teleportToCoords(value['x'], value['y'], value['z'])
				elseif (RiOT_var.button({text = 'Delete Location', subText = 'Native'})) then
					RiOT_var.menuTables.teleportLocations[key] = nil
					RiOT_var.openMenu({id = 'teleportOptions'})
				end
			else
				if (RiOT_var.button({text = 'Could not capture teleport handler', subText = 'Native'})) then
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'executionOptions'}) then
			if RiOT_var.menuButton({text = 'Server Resources', id = 'resourceExecutionOptions'}) then
			elseif RiOT_var.button({text = 'Execute Custom Code', subText = 'Input'}) then
				RiOT_var.features.customExecution()
			elseif RiOT_var.button({text = 'Spam Chat', subText = 'Input'}) then
				local aInput = RiOT_var.functions.keyboardInput('spam_chat', 'event', '_chat:messageEntered', 200)
				if RiOT_var.functions.strings.isNullOrEmpty(aInput) then aInput = '_chat:messageEntered' end

				for _0=1, 5 do
					RiOT_var.triggerCustomEvent(true, aInput, 'RiOT', RiOT_var.mainColor, '^*^'.._0..'RiOT Menu | discord.gg/MKQgvrn')
				end
			elseif RiOT_var.button({text = 'Server IP', subText = RiOT_var.natives.getCurrentServerEndpoint()}) then
			elseif RiOT_var.button({text = 'Resource', subText = RiOT_var.natives.getCurrentResourceName()}) then
				if (not RiOT_var.datastore.developerMode.enabled) then
					if (RiOT_var.datastore.developerMode.count <= 1) then
						local aInput = RiOT_var.functions.keyboardInput('developer_key', 'developer key', '', 20)
						if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then 
							if (aInput == RiOT_var.datastore.developerMode.key) then
								RiOT_var.datastore.developerMode.enabled = true
								RiOT_var.notification('You have entered developer mode.')
							else
								RiOT_var.notification('You have entered an incorrect developer key.')
							end
						end
					else
						RiOT_var.datastore.developerMode.count = RiOT_var.datastore.developerMode.count - 1
						RiOT_var.notification('You are now '..(RiOT_var.datastore.developerMode.count)..' steps away from being a developer.')
					end
				end
			end
			if (RiOT_var.datastore.developerMode.enabled) then
				if (RiOT_var.button({text = 'Table Name', subText = RiOT_var.n_obf_req})) then
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'resourceExecutionOptions'}) then
			local resourcesTable = RiOT_var.functions.returnResourceList()
			if RiOT_var.button({text = 'Dump TriggerServerEvent', subText = 'Native'}) then
				RiOT_var.print(RiOT_var.datastore.triggerServerEvents)
			elseif RiOT_var.button({text = 'Dump Exploitable TriggerServerEvent', subText = 'Native'}) then
				RiOT_var.print(RiOT_var.datastore.exploitableTriggerServerEvents)
			end
			
			for _i = 1, #resourcesTable do
				if RiOT_var.button({text = resourcesTable[_i]}) then
					RiOT_var.features.exportFilesFromResource(resourcesTable, _i)
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'menuSettings'}) then
			if RiOT_var.menuButton({text = 'Credits', id = 'creditsMenu'}) then
			elseif RiOT_var.menuButton({text = 'Keybinds', id = 'keybindsMenu'}) then
			elseif RiOT_var.menuButton({text = 'Datastore', id = 'datastoreMenu'}) then
			elseif RiOT_var.comboBox('Menu X', RiOT_var.menuVars.menuX, RiOT_var.menuVars.currentMenuX, RiOT_var.menuVars.selectedMenuX, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.currentMenuX = currentIndex
					RiOT_var.menuVars.selectedMenuX = selectedIndex
					for _i = 1, #RiOT_var.menus_list do
						RiOT_var.setMenuX(RiOT_var.menus_list[_i], RiOT_var.menuVars.menuX[RiOT_var.menuVars.currentMenuX])
					end
                end) then
            elseif RiOT_var.comboBox('Menu Y', RiOT_var.menuVars.menuY, RiOT_var.menuVars.currentMenuY, RiOT_var.menuVars.selectedMenuY, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.currentMenuY = currentIndex
					RiOT_var.menuVars.selectedMenuY = selectedIndex
					for _i = 1, #RiOT_var.menus_list do
						RiOT_var.setMenuY(RiOT_var.menus_list[_i], RiOT_var.menuVars.menuY[RiOT_var.menuVars.currentMenuY])
					end
                end) then
			elseif RiOT_var.comboBox('Theme', RiOT_var.menuVars.comboBoxes[8]._words, RiOT_var.menuVars.comboBoxes[8]._current, RiOT_var.menuVars.comboBoxes[8]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[8]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[8]._selected = currentIndex
				end) then
					RiOT_var.initializeTheme(RiOT_var.menuVars.comboBoxes[8]._words[RiOT_var.menuVars.comboBoxes[8]._selected])
			elseif RiOT_var.comboBox('Text Style', RiOT_var.menuVars.comboBoxes[9]._words, RiOT_var.menuVars.comboBoxes[9]._current, RiOT_var.menuVars.comboBoxes[9]._selected, 
				function(currentIndex, selectedIndex)
					RiOT_var.menuVars.comboBoxes[9]._current = currentIndex
					RiOT_var.menuVars.comboBoxes[9]._selected = currentIndex
				end) then
					
			elseif RiOT_var.checkBox({text = 'Rainbow', checked = RiOT_var.menuVars.menuSettings.selectedThemeRainbow}) then
				RiOT_var.menuVars.menuSettings.selectedThemeRainbow = not RiOT_var.menuVars.menuSettings.selectedThemeRainbow
				if RiOT_var.menuVars.menuSettings.rainbowApplyOnBackground then 
					RiOT_var.menuVars.menuSettings.rainbowApplyOnBackground = false 
				end
			end
			if RiOT_var.menuVars.menuSettings.selectedThemeRainbow then
				if RiOT_var.checkBox({text = 'Apply Rainbow To Header', checked = RiOT_var.menuVars.menuSettings.rainbowApplyOnBackground}) then
					RiOT_var.menuVars.menuSettings.rainbowApplyOnBackground = not RiOT_var.menuVars.menuSettings.rainbowApplyOnBackground
				end
			end
			if RiOT_var.checkBox({text = 'Watermark', checked = RiOT_var.menuVars.menuSettings.drawWatermark}) then
				RiOT_var.menuVars.menuSettings.drawWatermark = not RiOT_var.menuVars.menuSettings.drawWatermark
			elseif RiOT_var.checkBox({text = 'Disable Keys While Menu Open', checked = RiOT_var.menuVars.menuSettings.disableAllControls}) then
				RiOT_var.menuVars.menuSettings.disableAllControls = not RiOT_var.menuVars.menuSettings.disableAllControls
			elseif RiOT_var.checkBox({text = 'Rich Presence', checked = RiOT_var.menuVars.menuSettings.richPresence}) then
				RiOT_var.menuVars.menuSettings.richPresence = not RiOT_var.menuVars.menuSettings.richPresence
			end

			if (RiOT_var.menuVars.menuSettings.richPresence) then
				if RiOT_var.comboBox('Rich Presence Delay', RiOT_var.menuVars.comboBoxes[21]._words, RiOT_var.menuVars.comboBoxes[21]._current, RiOT_var.menuVars.comboBoxes[21]._selected, 
					function(currentIndex, selectedIndex)
						RiOT_var.menuVars.comboBoxes[21]._current = currentIndex
						RiOT_var.menuVars.comboBoxes[21]._selected = currentIndex
					end) then
				end
			end

            if (RiOT_var.button({text = '~r~Close Menu'})) then
            	RiOT_var.closeMenu()
				RiOT_var.shouldShowMenu = false
				pCitizen['wait'](50)
				RiOT_var.features.quitAllCameras()
            end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'keybindsMenu'}) then
			if (RiOT_var.button({text = 'Reset Keybinds'})) then
				RiOT_var.functions.refresh_keybinds()
			end
			for key, value in pairs(RiOT_var.datastore.keybinds) do
				if RiOT_var.menuButton({text = key, id = 'selectedKeybindMenu'}) then
					RiOT_var.datastore.selectedKeybindHandle = key
				end
			end
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'selectedKeybindMenu'}) then
			local key = RiOT_var.datastore.selectedKeybindHandle
			local value = RiOT_var.datastore.keybinds[key]
			if (value) then
				if (RiOT_var.button({text = key, subText = value['key_label'] or 'un-bound'})) then
					RiOT_var.features.bindFeature(key)
				elseif (RiOT_var.button({text = 'Remove Keybind'})) then
					if (value['removable']) then
						RiOT_var.functions.tables.removeKey(RiOT_var.datastore.keybinds, key)
						RiOT_var.openMenu({id = 'keybindsMenu'})
					else
						RiOT_var.notification('This keybind is un-removable.')
					end
				elseif (RiOT_var.checkBox({text = 'Notification', checked = value['notification']})) then
					value['notification'] = not value['notification']
				elseif (RiOT_var.checkBox({text = 'Play Sound', checked = value['play_sound']})) then
					value['play_sound'] = not value['play_sound']
				end
			else
				if (RiOT_var.button({text = ('Could not catch - '..key)})) then

				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'creditsMenu'}) then
			for _i = 1, #RiOT_var.creditsYeet do
				if RiOT_var.button({text = RiOT_var.creditsYeet[_i]}) then 
				end
			end

			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'datastoreMenu'}) then
			if RiOT_var.menuButton({text = 'SpawnedObjects - '..#RiOT_var.datastore.spawnedObjects, id = 'datastoreSpawnedObjectsMenu'}) then
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'datastoreSpawnedObjectsMenu'}) then
			if (RiOT_var.datastore.developerMode.enabled) then
				RiOT_var.setSubTitle({id = 'datastoreSpawnedObjectsMenu', text = 'table: spawnedObjects'})
			end
			if (RiOT_var.datastore.spawnedObjects and #RiOT_var.datastore.spawnedObjects > 0) then
				for key, value in pairs(RiOT_var.datastore.spawnedObjects) do
					if type(key) == 'number' and RiOT_var.natives.doesEntityExist(value.handle) then
						if RiOT_var.menuButton({text = key..' | '..NetworkGetEntityOwner(value.handle)..' - '..value.model, id = 'datastoreSelectedSpawnedObjectMenu'}) then
							RiOT_var.datastore.spawnedObjects._selected = {key = key, handle = value.handle}
						end
					end
				end
			else
				if RiOT_var.button({text = 'No spawned objects in datastore.'}) then
				end
			end
			
			RiOT_var.runDrawMenu()
		elseif RiOT_var.isMenuOpened({id = 'datastoreSelectedSpawnedObjectMenu'}) then
			if RiOT_var.button({text = 'Delete', subText = 'Native'}) then
				RiOT_var.functions.deleteEntity(RiOT_var.datastore.spawnedObjects._selected.handle)
				table.remove(RiOT_var.datastore.spawnedObjects, RiOT_var.datastore.spawnedObjects.key)
				RiOT_var.openMenu({id = 'datastoreSpawnedObjectsMenu'})
			end

			RiOT_var.runDrawMenu()
		end

		if (RiOT_var.datastore.developerMode.enabled) then
			if (RiOT_var.menuVars.selfOptions.testicle) then
				--[[
					ResetPedRagdollTimer(RiOT_var.datastore.pLocal.pedId)
				]]
			end
		end

		--[[selfOptions]]
		if (RiOT_var.menuVars.comboBoxes[16]._selected >= 1) then
			RiOT_var.features.handleGodMode()
		end

		if (RiOT_var.menuVars.selfOptions.superPowers.forceTireMarksHasTicked and RiOT_var.natives.doesEntityExist(RiOT_var.datastore.pLocal.vehicle)) then
			SetForceVehicleTrails(RiOT_var.menuVars.selfOptions.superPowers.forceTireMarks)
		end

		if (RiOT_var.menuVars.selfOptions.superPowers.disableRagdollHasTicked) then
			SetPedCanRagdoll(RiOT_var.datastore.pLocal.pedId, (not RiOT_var.menuVars.selfOptions.superPowers.disableRagdoll))
		end

		if (RiOT_var.menuVars.selfOptions.superPowers.superRun) then
			SetPedMoveRateOverride(RiOT_var.datastore.pLocal.pedId, 3.00)
		end

		if (RiOT_var.menuVars.selfOptions.superPowers.superJump) then
			SetSuperJumpThisFrame(RiOT_var.datastore.pLocal.pId)
		end

		if (RiOT_var.menuVars.selfOptions.superPowers.infiniteStamina) then
			RestorePlayerStamina(RiOT_var.datastore.pLocal.pId, 1.0)
		end

		if (RiOT_var.menuVars.selfOptions.superPowers.antiHeadshotHasTicked) then
			SetPedSuffersCriticalHits(RiOT_var.datastore.pLocal.pedId, RiOT_var.menuVars.selfOptions.superPowers.antiHeadshot)
		end

		RiOT_var.features.handleCollisions()

		if (RiOT_var.menuVars.selfOptions.superPowers.invisibility) then
			SetEntityVisible(RiOT_var.datastore.pLocal.pedId, false, false)
			SetEntityLocallyVisible(RiOT_var.datastore.pLocal.pedId, true)
			SetEntityAlpha(RiOT_var.datastore.pLocal.pedId, 150)
			RiOT_var.menuVars.selfOptions.superPowers.invisibilityHasTicked = true
		elseif (RiOT_var.menuVars.selfOptions.superPowers.invisibilityHasTicked) then
			SetEntityVisible(RiOT_var.datastore.pLocal.pedId, true, true)
			SetEntityAlpha(RiOT_var.datastore.pLocal.pedId, 255)
			RiOT_var.menuVars.selfOptions.superPowers.invisibilityHasTicked = false
		end
		
		if (RiOT_var.menuVars.selfOptions.superPowers.forceFootstepTrackHasTicked) then
			SetForcePedFootstepsTracks(RiOT_var.menuVars.selfOptions.superPowers.forceFootstepTrack)
		end

		if (RiOT_var.menuVars.selfOptions.debugView) then
			if (RiOT_var.menuVars.selfOptions.freecam) then
				RiOT_var.features.runDebugView({camera = RiOT_var.datastore.cameras.freecam.handle, position = RiOT_var.natives.getCamCoord(RiOT_var.datastore.cameras.freecam.handle)})
			elseif (RiOT_var.datastore.pLocal.isInSpectatorMode) then
				RiOT_var.features.runDebugView({camera = RiOT_var.datastore.pTarget.data.spectateCameraHandle, position = RiOT_var.natives.getCamCoord(RiOT_var.datastore.pTarget.data.spectateCameraHandle)})
			else
				RiOT_var.features.runDebugView({camera = nil})
			end
		end

		if (RiOT_var.menuVars.selfOptions.freecam and RiOT_var.datastore.cameras.freecam.handle ~= nil) then
			RiOT_var.features.handleFreecam()
		end

		if (RiOT_var.menuVars.selfOptions.movementTrails) then
			RiOT_var.features.handleMovementTrails()
		end

		--[[onlinePlayersOptions]]
		if (RiOT_var.datastore.pLocal.isInSpectatorMode) then
			RiOT_var.features.handleSpectate()
		end

		--[[allPlayersOptions]]
		if (RiOT_var.menuVars.allPlayersOptions.freeze) then
			RiOT_var.features.freezeAllPlayers()
		end
		if (RiOT_var.menuVars.allPlayersOptions.explosion) then
			RiOT_var.features.explodeAllPlayers()
		end
		if (RiOT_var.menuVars.allPlayersOptions.fakeExplosion) then
			RiOT_var.features.fakeExplodeAllPlayers()
		end

		--[[selectedPlayerTrollOptions]]
		for player, value in pairs(RiOT_var.datastore.pTarget.frozenTargets) do
			player = tonumber(player)
            local ped = GetPlayerPed(player)

            if (RiOT_var.natives.doesEntityExist(ped) and value) then
                ClearPedTasks(ped)
                ClearPedTasksImmediately(ped)
                DisablePlayerFiring(player, true)
            end
		end
		for player, value in pairs(RiOT_var.datastore.pTarget.explosionLoopTargets) do
			player = tonumber(player)
            local ped = GetPlayerPed(player)

            if (RiOT_var.natives.doesEntityExist(ped) and value) then
                RiOT_var.functions.explodeEntity(ped)
            end
		end
		for player, value in pairs(RiOT_var.datastore.pTarget.fakeExplosionLoopTargets) do
			player = tonumber(player)
            local ped = GetPlayerPed(player)

            if (RiOT_var.natives.doesEntityExist(ped) and value) then
				RequestNamedPtfxAsset('core')
				UseParticleFxAssetNextCall('core')
				StartNetworkedParticleFxNonLoopedOnEntity('veh_backfire', ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 100.0, false, false, false)
            end
		end

		--[[vehicleOptions]]
		if (RiOT_var.menuVars.vehicleOptions.revLimiter) then
			RiOT_var.features.handleRevLimiter(RiOT_var.datastore.pLocal.vehicle)
		end
		if (RiOT_var.menuVars.vehicleOptions.forceLaunchControlHasTicked) then
			SetLaunchControlEnabled(RiOT_var.menuVars.vehicleOptions.forceLaunchControl)
		end
		if (RiOT_var.menuVars.vehicleOptions.personal.esp and RiOT_var.datastore.pLocal.vehicle and RiOT_var.natives.doesEntityExist(RiOT_var.datastore.pLocal.vehicle) and GetVehiclePedIsIn(RiOT_var.datastore.pLocal.pedId, false) ~= RiOT_var.datastore.pLocal.vehicle) then
			local pVehicle = RiOT_var.datastore.pLocal.vehicle
			local pVehicle_distance = RiOT_var.functions.math.round(GetDistanceBetweenCoords(RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId), RiOT_var.natives.getEntityCoords(pVehicle)))
			RiOT_var.features.drawEntityESP({
				entity = pVehicle, 
				text = GetDisplayNameFromVehicleModel(GetEntityModel(pVehicle))..'\n'..pVehicle_distance..'ft away', 
				text_lines = 2,
				text_color = {r = 255, g = 255, b = 255, a = 175},
				box = true,
				box_color = RiOT_var.mainColor
			})
		end
		if (RiOT_var.menuVars.vehicleOptions.highBeamOnHonk) then
			RiOT_var.features.highBeamOnHonk()
		end

		--[[weaponOptions]]
		if (RiOT_var.menuVars.weaponOptions.triggerbot and IsPlayerFreeAiming(RiOT_var.datastore.pLocal.pId)) then
			RiOT_var.features.handleTriggerbot()
		end
		
		if (RiOT_var.menuVars.weaponOptions.explosiveImpact) then
			local impact, coords = GetPedLastWeaponImpactCoord(RiOT_var.datastore.pLocal.pedId)
			if (impact) then
				RiOT_var.natives.addExplosion(coords.x, coords.y, coords.z, 7, 100.0, true, false, 0.0)
			end
		end
		
		if (RiOT_var.menuVars.weaponOptions.teleportToImpact) then
			local impact, coords = GetPedLastWeaponImpactCoord(RiOT_var.datastore.pLocal.pedId)
			if (impact) then
				RiOT_var.features.teleportToCoords(coords.x, coords.y, coords.z)
				ClearPedTasks(RiOT_var.datastore.pLocal.pedId)
			end
		end

		if (RiOT_var.menuVars.weaponOptions.infiniteAmmoClipHasTicked) then
			SetPedInfiniteAmmoClip(RiOT_var.datastore.pLocal.pedId, RiOT_var.menuVars.weaponOptions.infiniteAmmoClip)
		end

		if (RiOT_var.menuVars.comboBoxes[14]._words[RiOT_var.menuVars.comboBoxes[14]._selected] > 1.1) then
			local value = RiOT_var.menuVars.comboBoxes[14]._words[RiOT_var.menuVars.comboBoxes[14]._selected]
			RiOT_var.natives.setPlayerWeaponDamageModifier(RiOT_var.datastore.pLocal.pId, value)
			RiOT_var.natives.setPlayerMeleeWeaponDamageModifier(RiOT_var.datastore.pLocal.pId, value)
		end

		if (RiOT_var.menuVars.visualOptions.bulletTracers) then
			RiOT_var.features.handleBulletTracers()
		end
		if (RiOT_var.menuVars.visualOptions.bulletImpacts) then
			RiOT_var.features.handleBulletImpacts()
		end
		if (RiOT_var.menuVars.visualOptions.stopAllScreenEffects) then
			AnimpostfxStopAll()
		end

		--[[visualOptions]]
		if (RiOT_var.menuVars.visualOptions.forceRadarHasTicked) then
			RiOT_var.natives.displayRadar(RiOT_var.menuVars.visualOptions.forceRadar)
		end
		if (RiOT_var.menuVars.visualOptions.forceThirdPerson) then
			DisableFirstPersonCamThisFrame()
			DisableVehicleFirstPersonCamThisFrame()
		end
		if (RiOT_var.menuVars.visualOptions.lockHorizontalCam and not IsPlayerFreeAiming(RiOT_var.datastore.pLocal.pId)) then
			ClampGameplayCamYaw(0.0, 0.0)
		end
		if (RiOT_var.menuVars.visualOptions.lockVerticalCam and not IsPlayerFreeAiming(RiOT_var.datastore.pLocal.pId)) then
			if (IsPedInAnyVehicle(RiOT_var.datastore.pLocal.pedId)) then
				ClampGameplayCamPitch(-20.0, -20.0)
			else
				ClampGameplayCamPitch(0.0, 0.0)
			end
		end
		if (RiOT_var.menuVars.comboBoxes[13]._words[RiOT_var.menuVars.comboBoxes[13]._selected] ~= 'Disabled' and IsPlayerFreeAiming(RiOT_var.datastore.pLocal.pId)) then
			RiOT_var.features.handleCrosshair()
		end
		
		--[[visualESPOptions]]
		if (RiOT_var.menuVars.visualOptions.esp.revealInvisiblePlayers) then
			RiOT_var.features.handleRevealInvisiblePlayers()
		end
		if (RiOT_var.menuVars.visualOptions.esp.enablePlayerESP) then
			RiOT_var.features.handlePlayerESP()
		end

		--[[teleportOptions]]



		--[[menuSettings]]
		if (RiOT_var.menuVars.menuSettings.selectedThemeRainbow) then
			RiOT_var.datastore.rainbowValue = RiOT_var.functions.returnRGB(0.2)
			RiOT_var.mainColor = {
				r = RiOT_var.datastore.rainbowValue.r, 
				g = RiOT_var.datastore.rainbowValue.g, 
				b = RiOT_var.datastore.rainbowValue.b,
				a = 255
			}
		end

		--[[Handle notifications]]
		if (#RiOT_var.notificationSystem.cachedNotifications > 0) then
			for notificationIndex = 1, #RiOT_var.notificationSystem.cachedNotifications do
                local notification = (RiOT_var.notificationSystem.cachedNotifications[notificationIndex])

                if (notification) then
                    notification['opacity'] = (notification['opacity'] or (notification['time'] / 1000) * 60) - 1

                    local offset = 0.5 + (notificationIndex * .1)
					local notificationTimer = (GetGameTimer() - notification['startTime']) / notification['time'] * 100
					local _x,_y,_factor = 0.5, -0.15 + (offset * 0.32), string.len(notification['text']) / 300
					
					RiOT_var.drawText(notification['text'], _x,_y + 0.0015, 4, {r=255,g=255,b=255,a=200}, 0.35, true, true, false, true)
					RiOT_var.drawRect(_x,_y + 0.0135, 0.0155 + _factor, 0.03, {r=35,g=35,b=35,a=200})
					RiOT_var.drawRect(_x,_y + 0.0, 0.0155 + _factor, 0.001, RiOT_var.mainColor)

                    if (notificationTimer >= 100) then
                        RiOT_var.notificationSystem.removeNotification(notificationIndex)
					end
                end
			end
		end

		--[[Draw watermark]]
		if (RiOT_var.menuVars.menuSettings.drawWatermark) then
			local positioning = 0.975
			RiOT_var.drawRect(0.5, positioning + 0.0135, 0.0155 + RiOT_var.watermark.size, 0.03, {r=35,g=35,b=35,a=200})
			RiOT_var.drawRect(0.5, positioning + 0.0, 0.0155 + RiOT_var.watermark.size, 0.001, RiOT_var.mainColor)
			RiOT_var.drawText(RiOT_var.watermark.text, 0.5, 0.975, 4, {r=255,g=255,b=255,a=200}, 0.35, true, true, false, true)
			
			if (RiOT_var.datastore.developerMode.enabled) then
				if (IsPedInAnyVehicle(RiOT_var.datastore.pLocal.pedId)) then
					local speed = GetEntitySpeed(RiOT_var.datastore.pLocal.vehicle)
					local vehicle_info = {
						kmh = (RiOT_var.functions.math.round(speed * 3.6)),
						mph = (RiOT_var.functions.math.round(speed * 2.236936)),
						rpm = (RiOT_var.functions.math.round(GetVehicleCurrentRpm(RiOT_var.datastore.pLocal.vehicle) * 10000) - 2000),
						gear = (GetVehicleCurrentGear(RiOT_var.datastore.pLocal.vehicle)),
					}
					
					positioning = positioning - 0.040
					RiOT_var.drawRect(0.5, positioning + 0.0135, 0.0155 + RiOT_var.watermark.size, 0.03, {r=35,g=35,b=35,a=200})
					RiOT_var.drawRect(0.5, positioning + 0.0, 0.0155 + RiOT_var.watermark.size, 0.001, RiOT_var.mainColor)
					RiOT_var.drawText(('MPH: '..vehicle_info.mph..' | Gear: '..vehicle_info.gear..' | RPM: '..vehicle_info.rpm), 0.5, positioning, 4, {r=255,g=255,b=255,a=200}, 0.35, true, true, false, true)
				end
				
				positioning = positioning - 0.040
				RiOT_var.drawRect(0.5, positioning + 0.0135, 0.0155 + RiOT_var.watermark.size, 0.03, {r=35,g=35,b=35,a=200})
				RiOT_var.drawRect(0.5, positioning + 0.0, 0.0155 + RiOT_var.watermark.size, 0.001, RiOT_var.mainColor)
				local pcoords = RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId)
				RiOT_var.drawText(('X: '..RiOT_var.functions.math.round(pcoords.x, 2)..' | Y: '..RiOT_var.functions.math.round(pcoords.y, 2)..' | Z: '..RiOT_var.functions.math.round(pcoords.z, 2)..' | H: '..RiOT_var.functions.math.round(GetEntityHeading(RiOT_var.datastore.pLocal.pedId), 2)), 0.5, positioning, 4, {r=255,g=255,b=255,a=200}, 0.35, true, true, false, true)
			end
		end

		--[[handle keybinds]]
		for key, value in pairs(RiOT_var.datastore.keybinds) do
			if (value['key'] ~= nil and IsDisabledControlJustPressed(0, value['key'])) then
				local feature = value['feature']
				if (feature and type(feature) == 'function') then
					feature()
				end
				if (value['notification'] and value['notification_text']) then
					RiOT_var.notification(value['notification_text'])
				end
				if (value['play_sound']) then
					RiOT_var.natives.playSoundFrontend(-1, 'COLLECTED', 'HUD_AWARDS', true)
				end
			end
		end

		pCitizen['wait'](0)
	end
end)

--[[
	RiOT Menu Features
]]

RiOT_var.features.nativeRevive = function()
	pCitizen['createThread'](function()
		local coords = RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId)

		local formattedCoords = {
			x = RiOT_var.functions.math.round(coords.x, 1),
			y = RiOT_var.functions.math.round(coords.y, 1),
			z = RiOT_var.functions.math.round(coords.z, 1)
		}

		RiOT_var.natives.setEntityCoordsNoOffset(RiOT_var.datastore.pLocal.pedId, formattedCoords.x, formattedCoords.y, formattedCoords.z, false, false, false, true)
		NetworkResurrectLocalPlayer(formattedCoords.x, formattedCoords.y, formattedCoords.z, 0.0, true, false)
		SetPlayerInvincible(RiOT_var.datastore.pLocal.pedId, false)
		RiOT_var.triggerCustomEvent(false, 'playerSpawned', formattedCoords.x, formattedCoords.y, formattedCoords.z)
		ClearPedBloodDamage(RiOT_var.datastore.pLocal.pedId)
		StopAllScreenEffects()
		if IsScreenFadedOut() then
			DoScreenFadeIn(800)
		end
	end)
end

RiOT_var.features.stockUpgrades = function(vehicle)
	if (vehicle and RiOT_var.natives.doesEntityExist(vehicle)) then
		pCitizen['createThread'](function()
			SetVehicleModKit(vehicle, 0)
			for _i=0, 10 do --[[cosmetics]]
				if (GetNumVehicleMods(vehicle, _i) > 0 and GetNumVehicleMods(vehicle, _i) ~= nil) then
					SetVehicleMod(vehicle, _i, 0, false)
				end
			end
			for _i=25, 47 do --[[bennys]]
				if (GetNumVehicleMods(vehicle, _i) > 0 and GetNumVehicleMods(vehicle, _i) ~= nil) then
					SetVehicleMod(vehicle, _i, 0, false)
				end
			end
			SetVehicleWindowTint(vehicle, 0)
			SetVehicleMod(vehicle, 14, -1, false)
			SetVehicleMod(vehicle, 23, -1, false)
			SetVehicleMod(vehicle, 24, -1, false)
			ToggleVehicleMod(vehicle, 17, false)
			ToggleVehicleMod(vehicle, 18, false)
			ToggleVehicleMod(vehicle, 19, false)
			ToggleVehicleMod(vehicle, 20, false)
			ToggleVehicleMod(vehicle, 21, false)
			ToggleVehicleMod(vehicle, 22, false)
			SetVehicleTyresCanBurst(vehicle, true)
		end)
	end
end

RiOT_var.features.randomCosmetics = function(vehicle)
	if (vehicle and RiOT_var.natives.doesEntityExist(vehicle)) then
		pCitizen['createThread'](function()
			SetVehicleModKit(vehicle, 0)
			for _i=0, 10 do --[[cosmetics]]
				if (GetNumVehicleMods(vehicle, _i) > 0 and GetNumVehicleMods(vehicle, _i) ~= nil) then
					SetVehicleMod(vehicle, _i, math.random(0, GetNumVehicleMods(vehicle, _i)-1), false)
				end
			end
			for _i=25, 47 do --[[bennys]]
				if (GetNumVehicleMods(vehicle, _i) > 0 and GetNumVehicleMods(vehicle, _i) ~= nil) then
					SetVehicleMod(vehicle, _i, math.random(0, GetNumVehicleMods(vehicle, _i)-1), false)
				end
			end
		end)
	end
end

RiOT_var.features.maxPerformanceUpgrades = function(vehicle)
	if (vehicle and RiOT_var.natives.doesEntityExist(vehicle)) then
		pCitizen['createThread'](function()
			SetVehicleModKit(vehicle, 0)
			SetVehicleMod(vehicle, 11, GetNumVehicleMods(vehicle, 11) - 1, false)
			SetVehicleMod(vehicle, 12, GetNumVehicleMods(vehicle, 12) - 1, false)
			SetVehicleMod(vehicle, 13, GetNumVehicleMods(vehicle, 13) - 1, false)
			SetVehicleMod(vehicle, 15, GetNumVehicleMods(vehicle, 15) - 2, false)
			SetVehicleMod(vehicle, 16, GetNumVehicleMods(vehicle, 16) - 1, false)
			ToggleVehicleMod(vehicle, 17, true)
			ToggleVehicleMod(vehicle, 18, true)
			ToggleVehicleMod(vehicle, 19, true)
			ToggleVehicleMod(vehicle, 21, true)
		end)
	end
end

RiOT_var.features.maxAllUpgrades = function(vehicle)
	if (vehicle and RiOT_var.natives.doesEntityExist(vehicle)) then
		pCitizen['createThread'](function()
			RiOT_var.features.maxPerformanceUpgrades(vehicle)
			SetVehicleModKit(vehicle, 0)
			for _i=0, 10 do --[[cosmetics]]
				if (GetNumVehicleMods(vehicle, _i) > 0 and GetNumVehicleMods(vehicle, _i) ~= nil) then
					SetVehicleMod(vehicle, _i, GetNumVehicleMods(vehicle, _i) - 1, false)
				end
			end
			for _i=25, 47 do --[[bennys]]
				if (GetNumVehicleMods(vehicle, _i) > 0 and GetNumVehicleMods(vehicle, _i) ~= nil) then
					SetVehicleMod(vehicle, _i, GetNumVehicleMods(vehicle, _i) - 1, false)
				end
			end
			SetVehicleWindowTint(vehicle, 5)
			SetVehicleWheelType(vehicle, 0)
			if (GetVehicleClass(vehicle) <= 7) then
				SetVehicleMod(vehicle, 23, 7, true)
			end
			SetVehicleNeonLightsColour(vehicle, RiOT_var.mainColor.r, RiOT_var.mainColor.g, RiOT_var.mainColor.b)
			SetVehicleExtraColours(vehicle, 3, false)
			ToggleVehicleMod(vehicle, 20, true)
			SetVehicleNumberPlateTextIndex(vehicle, true)
		end)
	end
end

RiOT_var.features.teleportToCoords = function(x, y, z)
	pCitizen['createThread'](function()
		local entity = nil
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(RiOT_var.datastore.pLocal.vehicle, -1) == GetPlayerPed(-1) then
			entity = RiOT_var.datastore.pLocal.vehicle
		else
			entity = RiOT_var.datastore.pLocal.pedId
		end

		if entity and entity ~= nil then
			RiOT_var.datastore.pLocal.lastLocation = RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId, false)
			if RiOT_var.datastore.cameras.freecam.handle ~= nil then
				SetCamCoord(RiOT_var.datastore.cameras.freecam.handle, x, y, z)
			else
				RiOT_var.natives.setEntityCoords(entity, x, y, z + 1)
			end
		end
	end)
end

RiOT_var.features.toggleSpectate = function(targetHandle)
	if (not RiOT_var.datastore.pLocal.isInSpectatorMode) then
		RiOT_var.features.quitAllCameras()
	end

	local RiOT_var_enable = function()
		local target = GetPlayerPed(targetHandle)
		local coords = RiOT_var.natives.getEntityCoords(target)
		RiOT_var.datastore.pTarget.data.spectateCameraHandle = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', coords.x, coords.y, coords.z + 1, 0.0, 0.0, 0.0, GetGameplayCamFov(), false, 0)
		SetCamActive(RiOT_var.datastore.pTarget.data.spectateCameraHandle, true)
		RenderScriptCams(true, false, 0, 0, 0)
		SetTimecycleModifier('spectator1')
		RiOT_var.datastore.pLocal.isInSpectatorMode = true
	end

	local RiOT_var_disable = function()
		SetCamActive(RiOT_var.datastore.pTarget.data.spectateCameraHandle, false)
		RenderScriptCams(false, false, 0, true, false)
		DestroyCam(RiOT_var.datastore.pTarget.data.spectateCameraHandle, false)
		SetFocusEntity(RiOT_var.datastore.pLocal.pedId)
		RiOT_var.datastore.pTarget.data.spectateCameraHandle = nil
		ClearTimecycleModifier()
		RiOT_var.datastore.pLocal.isInSpectatorMode = false
	end

	if (RiOT_var.datastore.pLocal.isInSpectatorMode) then
		RiOT_var_disable()
	else
		RiOT_var_enable()
	end
end

RiOT_var.features.handleSpectate = function()
	local camCoords = RiOT_var.natives.getCamCoord(RiOT_var.datastore.pTarget.data.spectateCameraHandle)
	local playerCoords = RiOT_var.natives.getEntityCoords(GetPlayerPed(RiOT_var.datastore.pTarget.data.whoIsBeingSpectated))

	RiOT_var.natives.setFocusPosAndVel(camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, 0.0)
  	SetHdArea(camCoords.x, camCoords.y, camCoords.z, 30.0)

	local xMagnitude = GetDisabledControlNormal(0, 1)
	local yMagnitude = GetDisabledControlNormal(0, 2)
	local camRot = RiOT_var.natives.getCamRot(RiOT_var.datastore.pTarget.data.spectateCameraHandle)

	local x = camRot.x - yMagnitude * 10
	local y = camRot.y
	local z = camRot.z - xMagnitude * 10

	if x < -75.0 then
		x = -75.0
	end

	if x > 100.0 then
		x = 100.0
	end

	SetCamRot(RiOT_var.datastore.pTarget.data.spectateCameraHandle, x, y, z, 0)
	SetCamCoord(RiOT_var.datastore.pTarget.data.spectateCameraHandle, playerCoords.x, playerCoords.y, playerCoords.z + 2)
	PointCamAtEntity(RiOT_var.datastore.pTarget.data.spectateCameraHandle, RiOT_var.datastore.pTarget.data.whoIsBeingSpectated)

	DisableAllControlActions(0)
end

RiOT_var.features.spawnVehicle = function(data)
	local timeout = 0
	if (data.hash == nil) then 
		data.hash = GetHashKey('elegy') 
	end
	local modelHash = (type(data.hash) == 'number' and data.hash or GetHashKey(data.hash))
	if (not data.coords) then 
		data.coords = RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId) 
	end
	RequestModel(modelHash)
	while (not HasModelLoaded(modelHash)) do
		timeout = timeout + 100
		pCitizen['wait'](100)
		if (timeout > 5000) then
			RiOT_var.notification('Could not spawn this vehicle!')
			break
		end
	end

	local generatedVehicle = RiOT_var.natives.createVehicle(modelHash, data.coords, GetEntityHeading(RiOT_var.datastore.pLocal.pedId), true, true)

	RiOT_var.features.repairVehicle(generatedVehicle, 'Default')

	if (data.props) then
		RiOT_var.functions.setVehicleProperties(generatedVehicle, data.props)
	end

	SetVehicleStrong(generatedVehicle, true)
	SetVehicleEngineOn(generatedVehicle, true, true, false)
	SetVehicleEngineCanDegrade(generatedVehicle, false)
	SetVehicleHasBeenOwnedByPlayer(generatedVehicle, true)

	if (not RiOT_var.functions.strings.isNullOrEmpty(data.plate)) then 
		SetVehicleNumberPlateText(generatedVehicle, data.plate) 
	end

	if (data.setIn) then
		SetPedIntoVehicle(RiOT_var.datastore.pLocal.pedId, generatedVehicle, -1)
	end

	SetVehicleDirtLevel(generatedVehicle, 0.1)

	RiOT_var.functions.networkEntity(generatedVehicle)

	return (generatedVehicle)
end

--[[
	usage in it's own thread only!:
	RiOT_var.features.spawnObject({
		amount = 1,
		model = 'bike_test', 
		target = playerPed,
		attach = true,
		coords = {x=1,y=2,z=3}
	})
]]
RiOT_var.features.spawnObject = function(data)
    RequestModel(data.model)
	local timeout = 0
	while (not HasModelLoaded(data.model)) do
		timeout = timeout + 100
		pCitizen['wait'](100)
		if (timeout > 5000) then
			RiOT_var.notification('Could not load model!')
			break
		end
	end
	
	local _objects = {}
	local amount = data.amount or 1
	for _1=0, amount do
		local object = nil
		if (data.target) then
			local _x, _y, _z = table.unpack(RiOT_var.natives.getEntityCoords(data.target))
			object = RiOT_var.natives.createObject(data.model, _x, _y, _z, true, true, false)
			if (data.attach) then
				AttachEntityToEntity(object, data.target, GetPedBoneIndex(data.target, 0xE0FD), 0.0, 0.0, 0.0, 0.0, 90.0, 0, false, false, false, false, 2, true)
			end
		else
			local _x, _y, _z = table.unpack(data.coords)
			object = RiOT_var.natives.createObject(data.model, _x, _y, _z, true, true, false)
		end
		
		if (object ~= nil and RiOT_var.natives.doesEntityExist(object)) then
			table.insert(RiOT_var.datastore.spawnedObjects, {handle = object, model = data.model})
			RiOT_var.functions.networkEntity(object)
		end
		SetEntityAsMissionEntity(object, true, true)

		if (amount == 1) then
			return (object)
		else
			table.insert(_objects, object)
		end
	end

	if (amount > 1) then
		return (_objects)
	end
end

RiOT_var.features.customExecution = function()
	pCitizen['createThread'](function()
		local code = RiOT_var.functions.keyboardInput('custom_execution', 'code', '', 200)
		if not RiOT_var.functions.strings.isNullOrEmpty(code) then
			local codeLoad = load(code)
			local status, return_error = pcall(codeLoad)
			if status then
				RiOT_var.notification('Code was successfully executed!')
			else
				RiOT_var.notification('There was an error in your code, printed it out in F8 Console.')
				RiOT_var.print('Execution error: ^1'..string.upper(return_error))
			end
		end
	end)
end

RiOT_var.features.exportFilesFromResource = function(resourcesTable, _i)
	local _manifest_lookup = RiOT_var.natives.loadResourceFile(resourcesTable[_i], '__resource.lua')
	local _new_manifest_lookup = RiOT_var.natives.loadResourceFile(resourcesTable[_i], 'fxmanifest.lua')
	if _manifest_lookup then
		RiOT_var.print(_manifest_lookup)
	elseif _new_manifest_lookup then
		RiOT_var.print(_new_manifest_lookup)
	end

	local aInput = RiOT_var.functions.keyboardInput('export_file_path', 'path', '', 200)
	if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then
		local _file_lookup = RiOT_var.natives.loadResourceFile(resourcesTable[_i], tostring(aInput))
		if _file_lookup then
			local _file_to_split = RiOT_var.functions.strings.split(_file_lookup, '\n')
			local _relevant_code = ''
			local dInput = RiOT_var.functions.keyboardInput('export_file_trigger', 'string', 'Trigger', 200)
			if RiOT_var.functions.strings.isNullOrEmpty(dInput) then dInput = 'Trigger' end
			for __i = 1, #_file_to_split do
				_file_to_split[__i] = string.gsub(_file_to_split[__i], '%s', '')
				if string.find(_file_to_split[__i], tostring(dInput)) then
					_relevant_code = _relevant_code..'\n'.._file_to_split[__i]
				end
			end
			RiOT_var.print(_relevant_code)
		end
	end
end

RiOT_var.features.shootAtPed = function(target, weaponName)
	local weaponHash = GetHashKey(weaponName)
	pCitizen['createThread'](function()
		RequestWeaponAsset(weaponHash, 31, 0)
		while (not HasWeaponAssetLoaded(weaponHash)) do
            pCitizen['wait'](0)
        end
	end)
	
	if (IsPedInAnyVehicle(target, true)) then
		RiOT_var.natives.clearPedTasksImmediately(target)
	end
	local destination = GetPedBoneCoords(target, 0x0, 0.0, 0.0, 0.0)
	local origin = GetPedBoneCoords(target, 0x796E, 0.0, 0.0, 0.2)
	RiOT_var.natives.shootSingleBulletBetweenCoords(origin.x, origin.y, origin.z, destination.x, destination.y, destination.z, math.random(5, 10), 0, weaponHash, RiOT_var.datastore.pLocal.pedId, false, false, 1)
end

RiOT_var.features.runVehiclesEnumerator = function(action)
	if action and not RiOT_var.functions.strings.isNullOrEmpty(action) then
		for vehicle in RiOT_var.functions.enumerateVehicles() do
			NetworkRequestControlOfEntity(vehicle)
			if NetworkHasControlOfEntity(vehicle) then
				if action == 'Lock' then
					SetVehicleDoorsLocked(vehicle, 2)
				elseif action == 'Unlock' then
					SetVehicleDoorsLocked(vehicle, 1)
				elseif action == 'Delete' then
					RiOT_var.functions.deleteEntity(vehicle)
				elseif action == 'Explode' then
					RiOT_var.natives.networkExplodeVehicle(vehicle, true, false, false)
				elseif action == 'Spawn Object' then
					pCitizen['createThread'](function() 
						RiOT_var.features.spawnObject({target = vehicle, model = GetHashKey(RiOT_var.menuVars.comboBoxes[1]._actual[RiOT_var.menuVars.comboBoxes[1]._selected]), attach = RiOT_var.menuVars.enumerateMenu.attachObject})
					end)
				end
			end
		end
	else
		RiOT_var.notification('Error, action not passed in runVehiclesEnumerator')
	end
end

RiOT_var.features.runPedsEnumerator = function(action)
	if action and not RiOT_var.functions.strings.isNullOrEmpty(action) then
		for ped in RiOT_var.functions.enumeratePeds() do
			NetworkRequestControlOfEntity(ped)
			if NetworkHasControlOfEntity(ped) then
				if action == 'Clear Tasks' then
					RiOT_var.natives.clearPedTasksImmediately(ped)
				elseif action == 'Kill' then
					RiOT_var.natives.setEntityHealth(ped, 0)
					ExplodePedHead(ped, GetHashKey('WEAPON_NIGHTSTICK'))
					SetPedToRagdoll(ped, 6, 20, 20, true, true, true)
				elseif action == 'Burn' then
					StartEntityFire(ped)
				elseif action == 'Explode' then
					RiOT_var.functions.explodeEntity(ped)
				elseif action == 'Spawn Object' then
					pCitizen['createThread'](function() 
						RiOT_var.features.spawnObject({target = ped, model = GetHashKey(RiOT_var.menuVars.comboBoxes[1]._actual[RiOT_var.menuVars.comboBoxes[1]._selected]), attach = RiOT_var.menuVars.enumerateMenu.attachObject})
					end)
				end
			end
		end
	else
		RiOT_var.notification('Error, action not passed in runPedsEnumerator')
	end
end

RiOT_var.features.runObjectsEnumerator = function(action)
	if action and not RiOT_var.functions.strings.isNullOrEmpty(action) then
		for object in RiOT_var.functions.enumerateObjects() do
			NetworkRequestControlOfEntity(object)
			if NetworkHasControlOfEntity(object) then
				if action == 'Delete' then
					RiOT_var.functions.deleteEntity(object)
				end
			end
		end
	else
		RiOT_var.notification('Error, action not passed in runObjectsEnumerator')
	end
end

RiOT_var.features.repairVehicle = function(vehicle, ptype)
	local vehicle = (vehicle or RiOT_var.datastore.pLocal.vehicle)
	if (vehicle and RiOT_var.natives.doesEntityExist(vehicle)) then
		local ptype = (ptype or RiOT_var.menuVars.comboBoxes[15]._words[RiOT_var.menuVars.comboBoxes[15]._selected])
		if (ptype == 'Stealth') then
			SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehiclePetrolTankHealth(vehicle, 1000.0)
            SetVehicleOilLevel(vehicle, 1000.0)
		elseif (ptype == 'Default') then
			SetVehicleEngineHealth(vehicle, 1000)
			SetVehicleFixed(vehicle)
			SetVehicleEngineOn(vehicle, 1, 1)
			SetVehicleBurnout(vehicle, false)
			RiOT_var.features.refuelVehicle(vehicle)
		end
	end
end

RiOT_var.features.refuelVehicle = function(vehicle)
	local vehicle = (vehicle or RiOT_var.datastore.pLocal.vehicle)
	if (vehicle and RiOT_var.natives.doesEntityExist(vehicle)) then
		SetVehicleFuelLevel(vehicle, 60.0)
		if (DecorExistOn(vehicle, '_FUEL_LEVEL')) then
			DecorSetFloat(vehicle, '_FUEL_LEVEL', GetVehicleFuelLevel(vehicle))
		end
		if (DecorExistOn(vehicle, 'zm_fuel')) then
			DecorSetFloat(vehicle, 'zm_fuel', GetVehicleFuelLevel(vehicle))
		end
	end
end

RiOT_var.features.runDebugView = function(data)
	local hit, coords, entity = RiOT_var.functions.rayCastGamePlayCamera({distance = 1000.0, camera = data.camera})
	local position = RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId)
	if (data.position ~= nil) then
		position = data.position
	end
	local color = RiOT_var.mainColor
	if (data.color ~= nil and type(data.color) == 'table') then
		color = data.color
	end
	local entity_type = nil

	if (hit) then
		if (RiOT_var.natives.doesEntityExist(entity) and RiOT_var.functions.isAnEntity(entity)) then
			if (IsEntityAVehicle(entity)) then entity_type = 'vehicle'
			elseif (IsEntityAPed(entity)) then entity_type = 'ped'
			elseif (IsEntityAnObject(entity)) then entity_type = 'object'
			elseif (RiOT_var.natives.doesEntityExist(entity)) then entity_type = 'unknown'
			else entity_type = 'error'
			end

			if (entity ~= RiOT_var.datastore.pLocal.vehicle) then
				RiOT_var.features.drawEntityESP({
					entity = entity, 
					text = 'entity: ' .. entity .. ' | model: ' .. GetEntityModel(entity).. '\npress [~g~E~s~] to '..RiOT_var.menuVars.comboBoxes[17]._actual[RiOT_var.menuVars.comboBoxes[17]._selected]..' '..entity_type, 
					text_lines = 2,
					text_color = {r = 255, g = 255, b = 255, a = 175},
					box = true,
					box_color = RiOT_var.mainColor
				})
			end
		end
		if (coords ~= nil and coords.x ~= 0.0) then
			RiOT_var.natives.drawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
		end

		if (IsDisabledControlJustPressed(0, pCitizen['keys']['E'])) then
			local actionToDo = (RiOT_var.menuVars.comboBoxes[17]._words[RiOT_var.menuVars.comboBoxes[17]._selected])
			if (actionToDo == 'Teleport') then
				if (coords ~= nil and coords.x ~= 0.0) then
					RiOT_var.features.quitAllCameras()
					if (entity_type == 'vehicle') then
						RiOT_var.functions.getIntoVehicle(entity)
					else
						RiOT_var.features.teleportToCoords(coords.x, coords.y, coords.z)
					end
				end
			elseif (actionToDo == 'Explode') then
				if (entity_type == 'vehicle') then
					RiOT_var.natives.networkExplodeVehicle(entity, true, false, false)
				else
					if (coords ~= nil and coords.x ~= 0.0) then
						RiOT_var.natives.addExplosion(coords.x, coords.y, coords.z, 7, 100.0, true, false, 0.0)
					end
				end
			elseif (actionToDo == 'Delete') then
				RiOT_var.functions.deleteEntity(entity)
			elseif (actionToDo == 'Clone') then
				if (entity_type == 'vehicle') then
					local vehicle_props = RiOT_var.functions.getVehicleProperties(entity)
					if (vehicle_props) then
						pCitizen['createThread'](function()
							local spawnedVehicle = RiOT_var.features.spawnVehicle({hash = vehicle_props.model, props = vehicle_props, setIn = false, coords = RiOT_var.natives.getEntityCoords(entity)})
							if (RiOT_var.natives.doesEntityExist(spawnedVehicle) and RiOT_var.menuVars.selfOptions.debugViewCloneAttach) then
								AttachEntityToEntity(spawnedVehicle, entity, GetPedBoneIndex(entity, 0xE0FD), 0.0, 0.0, 0.0, 0.0, 90.0, 0, false, false, false, false, 2, true)
							end
						end)
					end
				elseif (entity_type == 'object') then
					pCitizen['createThread'](function() 
						local spawnedObject = RiOT_var.features.spawnObject({model = GetEntityModel(entity), target = entity, attach = RiOT_var.menuVars.selfOptions.debugViewCloneAttach})
					end)
				elseif (entity_type == 'ped') then
					local clonedPed = ClonePed(entity, GetEntityHeading(entity), true, true)
					if (clonedPed and RiOT_var.natives.doesEntityExist(clonedPed) and RiOT_var.menuVars.selfOptions.debugViewCloneAttach) then
						AttachEntityToEntity(clonedPed, entity, GetPedBoneIndex(entity, 0xE0FD), 0.0, 0.0, 0.0, 0.0, 90.0, 0, false, false, false, false, 2, true)
					end
				end
			elseif (actionToDo == 'Shoot') then
				if (entity and RiOT_var.natives.doesEntityExist(entity)) then
					local value = RiOT_var.menuVars.comboBoxes[2]._actual[RiOT_var.menuVars.comboBoxes[2]._selected]
					if (entity_type == 'ped') then
						RiOT_var.features.shootAtPed(entity, value)
					else
						if (coords ~= nil and coords.x ~= 0.0) then
							RiOT_var.natives.shootSingleBulletBetweenCoords(position.x, position.y, position.z, coords.x, coords.y, coords.z, math.random(5, 10), 0, GetHashKey(value), RiOT_var.datastore.pLocal.pedId, false, false, 1)
						end
					end
				end
			elseif (actionToDo == 'Spawn') then
				local actionToDo2 = (RiOT_var.menuVars.comboBoxes[24]._words[RiOT_var.menuVars.comboBoxes[24]._selected])
				if (coords ~= nil and coords.x ~= 0.0) then
					if (actionToDo2 == 'Vehicle') then
						pCitizen['createThread'](function()
							local vehicle = RiOT_var.menuVars.comboBoxes[25]._actual
							local spawnedVehicle = RiOT_var.features.spawnVehicle({hash = vehicle.props.model, props = vehicle.props, setIn = false, coords = coords})
						end)
					elseif (actionToDo2 == 'Object') then

					end
				end
			end
		end
	end
end

RiOT_var.features.runNitro = function(vehicle)
	if (RiOT_var.natives.doesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle)) then
		local amount = (RiOT_var.menuVars.comboBoxes[18]._words[RiOT_var.menuVars.comboBoxes[18]._selected] or 10)
		SetVehicleBoostActive(vehicle, true)
		if (RiOT_var.menuVars.vehicleOptions.nitroEffect) then
			StartScreenEffect('RaceTurbo', 0, 0)
		end
		SetVehicleForwardSpeed(vehicle, GetEntitySpeed(vehicle) + amount)
		SetVehicleBoostActive(vehicle, false)
		if (RiOT_var.menuVars.vehicleOptions.nitroEffect) then
			StopScreenEffect('RaceTurbo')
		end
	end
end

RiOT_var.features.quitAllCameras = function()
	if (RiOT_var.datastore.pLocal.isInSpectatorMode) then
		RiOT_var.features.toggleSpectate(RiOT_var.datastore.pLocal.pId)
	end
	if (RiOT_var.menuVars.selfOptions.freecam) then
		RiOT_var.features.toggleFreecam('disable')
	end
end

RiOT_var.features.toggleFreecam = function(hardcode)
	if (not RiOT_var.menuVars.selfOptions.freecam) then
		RiOT_var.features.quitAllCameras()
	end
	
	local RiOT_var_enable = function()
		local coords = (RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId))
		RiOT_var.datastore.cameras.freecam.handle = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, GetGameplayCamFov(), false, 0)
		SetCamActive(RiOT_var.datastore.cameras.freecam.handle, true)
		RenderScriptCams(true, false, 0, 0, 0)
		RiOT_var.menuVars.selfOptions.freecam = true
	end

	local RiOT_var_disable = function()
		RiOT_var.datastore.cameras.freecam.handle = nil
		SetCamActive(RiOT_var.datastore.cameras.freecam.handle, false)
		RenderScriptCams(false, false, 0, true, false)
		DestroyCam(RiOT_var.datastore.cameras.freecam.handle, false)
		SetFocusEntity(RiOT_var.datastore.pLocal.pedId)
		RiOT_var.menuVars.selfOptions.freecam = false
	end
	if (hardcode == 'disable' and RiOT_var.menuVars.selfOptions.freecam) then
		RiOT_var_disable()
		return
	end

	if (RiOT_var.datastore.cameras.freecam.handle == nil) then
		RiOT_var_enable()
	else
		RiOT_var_disable()
	end
end

RiOT_var.features.handleFreecam = function()
	local camCoords 		= RiOT_var.natives.getCamCoord(RiOT_var.datastore.cameras.freecam.handle)
	local right, forward 	= RiOT_var.functions.math.getCamRightVector(RiOT_var.datastore.cameras.freecam.handle), RiOT_var.functions.math.getCamForwardVector(RiOT_var.datastore.cameras.freecam.handle)
	local speedMultiplier 	= 0.25

	RiOT_var.natives.setFocusPosAndVel(camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, 0.0)
  	SetHdArea(camCoords.x, camCoords.y, camCoords.z, 30.0)

	if IsDisabledControlPressed(0, 21) then
		speedMultiplier = 5.0
	elseif IsDisabledControlPressed(0, 36) then
		speedMultiplier = 0.025
	else
		speedMultiplier = 0.25
	end

	if IsDisabledControlPressed(0, 32) then
		local newCamPos = camCoords + forward * speedMultiplier
		SetCamCoord(RiOT_var.datastore.cameras.freecam.handle, newCamPos.x, newCamPos.y, newCamPos.z)
	elseif IsDisabledControlPressed(0, 33) then
		local newCamPos = camCoords + forward * -speedMultiplier
		SetCamCoord(RiOT_var.datastore.cameras.freecam.handle, newCamPos.x, newCamPos.y, newCamPos.z)
	elseif IsDisabledControlPressed(0, 34) then
		local newCamPos = camCoords + right * -speedMultiplier
		SetCamCoord(RiOT_var.datastore.cameras.freecam.handle, newCamPos.x, newCamPos.y, newCamPos.z)
	elseif IsDisabledControlPressed(0, 30) then
		local newCamPos = camCoords + right * speedMultiplier
		SetCamCoord(RiOT_var.datastore.cameras.freecam.handle, newCamPos.x, newCamPos.y, newCamPos.z)
	end

	local xMagnitude = GetDisabledControlNormal(0, 1);
	local yMagnitude = GetDisabledControlNormal(0, 2);
	local camRot     = RiOT_var.natives.getCamRot(RiOT_var.datastore.cameras.freecam.handle)

	local x = camRot.x - yMagnitude * 10
	local y = camRot.y
	local z = camRot.z - xMagnitude * 10

	if x < -75.0 then
		x = -75.0
	end

	if x > 100.0 then
		x = 100.0
	end

	SetCamRot(RiOT_var.datastore.cameras.freecam.handle, x, y, z, 0)

	DisableAllControlActions(0)
end

RiOT_var.features.handleRevLimiter = function(vehicle)
	if (vehicle and RiOT_var.natives.doesEntityExist(vehicle)) then
		local mph = (GetEntitySpeed(vehicle) * 2.236936)
		if (mph <= 30 or GetVehicleCurrentGear(vehicle) >= 1) then
			if (GetVehicleCurrentRpm(vehicle) >= 1.0 and GetVehicleCurrentGear(vehicle) <= RiOT_var.menuVars.comboBoxes[11]._actual[RiOT_var.menuVars.comboBoxes[11]._selected]) or
				(GetVehicleCurrentRpm(vehicle) >= 1.0 and RiOT_var.menuVars.comboBoxes[11]._actual[RiOT_var.menuVars.comboBoxes[11]._selected] == -1) then
				SetVehicleCurrentRpm(vehicle, RiOT_var.menuVars.comboBoxes[10]._actual[RiOT_var.menuVars.comboBoxes[10]._selected])
			end
		else
			if (GetVehicleCurrentRpm(vehicle) >= RiOT_var.menuVars.comboBoxes[10]._actual[RiOT_var.menuVars.comboBoxes[10]._selected] and GetVehicleCurrentGear(vehicle) <= RiOT_var.menuVars.comboBoxes[11]._actual[RiOT_var.menuVars.comboBoxes[11]._selected]) or
				(GetVehicleCurrentRpm(vehicle) >= RiOT_var.menuVars.comboBoxes[10]._actual[RiOT_var.menuVars.comboBoxes[10]._selected] and RiOT_var.menuVars.comboBoxes[11]._actual[RiOT_var.menuVars.comboBoxes[11]._selected] == -1) then
				SetVehicleCurrentRpm(vehicle, RiOT_var.menuVars.comboBoxes[10]._actual[RiOT_var.menuVars.comboBoxes[10]._selected])
			end
		end
	end
end

--[[
	usage:
	RiOT_var.features.drawEntityESP({
		entity = defEntity, 
		text = 'aww \n shit', 
		text_lines = 2,
		box = true,
		box_entity = defEntity,
		box_color = RiOT_var.mainColor,
		skeleton = true,
		skeleton_entity = defEntity,
		skeleton_color = RiOT_var.mainColor,
		capDistance = 500
	})
]]

RiOT_var.features.drawEntityESP = function(data)
	if (RiOT_var.functions.isAnEntity(data.entity)) then
		local entityCoord = RiOT_var.natives.getEntityCoords(data.entity)
		if (data.coords ~= nil and type(data.coords) == 'table') then
			entityCoord = data.coords
		end
		local _, screenX, screenY = GetScreenCoordFromWorldCoord(entityCoord.x, entityCoord.y, entityCoord.z)
		if (data.capDistance ~= nil and type(data.capDistance) == 'number') then
			local player_distance = RiOT_var.functions.math.round(GetDistanceBetweenCoords(RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId), entityCoord))
			if (data.capDistance < player_distance) then
				return
			end
		end
		if (data.box and type(data.box) == 'boolean' and data.box ~= false) then
			local box_color = RiOT_var.mainColor
			local box_entity = data.entity
			if (data.box_color ~= nil and type(data.box_color) == 'table') then
				box_color = data.box_color
			end
			if (data.box_entity ~= nil and RiOT_var.functions.isAnEntity(data.box_entity)) then
				box_entity = data.box_entity
			end
			RiOT_var.functions.drawEntityBoundingBox(box_entity, nil, box_color)
		end
		if (data.skeleton and type(data.skeleton) == 'boolean' and data.skeleton ~= false) then
			local skeleton_color = RiOT_var.mainColor
			local skeleton_entity = data.entity
			if (data.skeleton_color ~= nil and type(data.skeleton_color) == 'table') then
				skeleton_color = data.skeleton_color
			end
			if (data.skeleton_entity ~= nil and RiOT_var.functions.isAnEntity(data.skeleton_entity)) then
				skeleton_entity = data.skeleton_entity
			end
			RiOT_var.features.drawEntitySkeleton(skeleton_entity, skeleton_color)
		end
		local text_color = RiOT_var.mainColor
		if (data.text_color and type(data.text_color) == 'table') then
			text_color = data.text_color
		end
		RiOT_var.drawText(data.text, screenX, screenY, 4, text_color, 0.35, true, true, false, true)
	end
end

RiOT_var.features.drawEntitySkeleton = function(ped, color)
	local head = GetPedBoneCoords(ped, 0x796E, 0.0, 0.0, 0.0)
	local pelvis = GetPedBoneCoords(ped, 0x2E28, 0.0, 0.0, 0.0)
	local rightFoot = GetPedBoneCoords(ped, 0xCC4D, 0.0, 0.0, 0.0)
	local leftFoot = GetPedBoneCoords(ped, 0x3779, 0.0, 0.0, 0.0)
	local rightUpperArm = GetPedBoneCoords(ped, 0x9D4D, 0.0, 0.0, 0.0)
	local leftUpperArm = GetPedBoneCoords(ped, 0xB1C5, 0.0, 0.0, 0.0)
	local rightForeArm = GetPedBoneCoords(ped, 0x6E5C, 0.0, 0.0, 0.0)
	local leftForeArm = GetPedBoneCoords(ped, 0xEEEB, 0.0, 0.0, 0.0)
	local rightHand = GetPedBoneCoords(ped, 0xDEAD, 0.0, 0.0, 0.0)
	local leftHand = GetPedBoneCoords(ped, 0x49D9, 0.0, 0.0, 0.0)

	--[[head -> pelvis]]
	RiOT_var.natives.drawLine(head.x, head.y, head.z, pelvis.x, pelvis.y, pelvis.z, color.r, color.g, color.b, color.a)
	--[[pelvis -> feet]]
	RiOT_var.natives.drawLine(pelvis.x, pelvis.y, pelvis.z, rightFoot.x, rightFoot.y, rightFoot.z, color.r, color.g, color.b, color.a)
	RiOT_var.natives.drawLine(pelvis.x, pelvis.y, pelvis.z, leftFoot.x, leftFoot.y, leftFoot.z, color.r, color.g, color.b, color.a)
	--[[head -> upper arms]]
	RiOT_var.natives.drawLine(head.x, head.y, head.z, rightUpperArm.x, rightUpperArm.y, rightUpperArm.z, color.r, color.g, color.b, color.a)
	RiOT_var.natives.drawLine(head.x, head.y, head.z, leftUpperArm.x, leftUpperArm.y, leftUpperArm.z, color.r, color.g, color.b, color.a)
	--[[upper arms -> forearms]]
	RiOT_var.natives.drawLine(rightUpperArm.x, rightUpperArm.y, rightUpperArm.z, rightForeArm.x, rightForeArm.y, rightForeArm.z, color.r, color.g, color.b, color.a)
	RiOT_var.natives.drawLine(leftUpperArm.x, leftUpperArm.y, leftUpperArm.z, leftForeArm.x, leftForeArm.y, leftForeArm.z, color.r, color.g, color.b, color.a)
	--[[forearms -> hands]]
	RiOT_var.natives.drawLine(rightForeArm.x, rightForeArm.y, rightForeArm.z, rightHand.x, rightHand.y, rightHand.z, color.r, color.g, color.b, color.a)
	RiOT_var.natives.drawLine(leftForeArm.x, leftForeArm.y, leftForeArm.z, leftHand.x, leftHand.y, leftHand.z, color.r, color.g, color.b, color.a)
end

RiOT_var.features.handleTriggerbot = function()
	local hasTarget, target = GetEntityPlayerIsFreeAimingAt(RiOT_var.datastore.pLocal.pId)
	if (hasTarget and IsEntityAPed(target) and not IsEntityDead(target) and not RiOT_var.functions.friendsSystem('is_friend', target)) then
		local boneTarget = GetPedBoneCoords(target, 0x796E, 0.0, 0.0, 0.0)
		local value = RiOT_var.menuVars.comboBoxes[22]._words[RiOT_var.menuVars.comboBoxes[22]._selected]
		if (value == 'Legit') then 
			if (not IsPedWeaponReadyToShoot(RiOT_var.datastore.pLocal.pedId)) then 
				return 
			end
		end

		SetPedShootsAtCoord(RiOT_var.datastore.pLocal.pedId, boneTarget, true)
	end
end

RiOT_var.features.handleGodMode = function()
	local value = RiOT_var.menuVars.comboBoxes[16]._words[RiOT_var.menuVars.comboBoxes[16]._selected]
	local pPedId = RiOT_var.datastore.pLocal.pedId
	local pPlayerId = RiOT_var.datastore.pLocal.pId
	if (value == 'Semi') then
		SetEntityInvincible(pPedId, false)
		SetPlayerInvincible(pPlayerId, false)
		SetEntityProofs(pPedId, false, false, false, false, false, false, false, false)
		SetEntityCanBeDamaged(pPedId, true)
		if (GetEntityHealth(pPedId) < GetEntityMaxHealth(pPedId) - 25) then
			SetTimeout(250, function()
				SetEntityHealth(pPedId, GetEntityMaxHealth(pPedId))
			end)
		end
		if (RiOT_var.menuVars.selfOptions.godModeArmour) then
			SetTimeout(250, function()
				if (GetPedArmour(pPedId) < 200 - 25) then
					RiOT_var.natives.setPedArmour(pPedId, 200)
				end
			end)
		end
	elseif (value == 'Full') then
		SetEntityInvincible(pPedId, true)
		SetPlayerInvincible(pPlayerId, true)
		SetEntityProofs(pPedId, true, true, true, true, true, true, true, true)
		SetEntityCanBeDamaged(pPedId, false)
		if (RiOT_var.menuVars.selfOptions.godModeArmour) then
			RiOT_var.natives.setPedArmour(pPedId, 200)
		end
	end
end

RiOT_var.features.handleCrosshair = function()
	local value = RiOT_var.menuVars.comboBoxes[13]._words[RiOT_var.menuVars.comboBoxes[13]._selected]
	if (value == 'Default') then
		ShowHudComponentThisFrame(14)
	elseif (value == 'Sprite') then
		if not HasStreamedTextureDictLoaded('mpleaderboard') then RiOT_var.natives.requestStreamedTextureDict('mpleaderboard', true) end
		local scale = 0.025
		RiOT_var.drawSprite('mpleaderboard', 'leaderboard_kd_icon', 0.5, 0.5, scale / 1.428571428571429, scale, 0.0, RiOT_var.mainColor)
	elseif (value == 'Text 1') then
		RiOT_var.drawText('.', 0.5, 0.475, 4, RiOT_var.mainColor, 0.505, true, true, false, true)
	elseif (value == 'Text 2') then
		RiOT_var.drawText('+', 0.5, 0.479, 0, RiOT_var.mainColor, 0.5, true, true, false, true)
	end
end

RiOT_var.features.handleCollisions = function()
	local ourEntity = (RiOT_var.datastore.pLocal.pedId)
	if (IsPedInAnyVehicle(RiOT_var.datastore.pLocal.pedId)) then
		ourEntity = (RiOT_var.datastore.pLocal.vehicle)
	else
		ourEntity = (RiOT_var.datastore.pLocal.pedId)
	end
	
	if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.enabled) then
		if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.peds) then
			SetTimeout(5000, function()
				for ped in RiOT_var.functions.enumeratePeds() do
					SetEntityNoCollisionEntity(ped, ourEntity, false)
				end
				RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.pedsHasTicked = true
			end)
		end
		
		if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.vehicles) then
			SetTimeout(5000, function()
				for vehicle in RiOT_var.functions.enumerateVehicles() do
					SetEntityNoCollisionEntity(vehicle, ourEntity, false)
				end
				RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.vehiclesHasTicked = true
			end)
		end

		if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.objects) then
			SetTimeout(5000, function()
				for object in RiOT_var.functions.enumerateObjects() do
					SetEntityNoCollisionEntity(object, ourEntity, false)
				end
				RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.objectsHasTicked = true
			end)
		end
	else
		if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.pedsHasTicked) then
			for _i=1, 5 do
				for ped in RiOT_var.functions.enumeratePeds() do
					SetEntityNoCollisionEntity(ped, ourEntity, true)
				end
			end
			RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.pedsHasTicked = false
		end
		if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.vehiclesHasTicked) then
			for _i=1, 5 do
				for vehicle in RiOT_var.functions.enumerateVehicles() do
					SetEntityNoCollisionEntity(vehicle, ourEntity, true)
				end
			end
			RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.vehiclesHasTicked = false
		end
		if (RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.objectsHasTicked) then
			for _i=1, 5 do
				for object in RiOT_var.functions.enumerateObjects() do
					SetEntityNoCollisionEntity(object, ourEntity, true)
				end
			end
			RiOT_var.menuVars.selfOptions.superPowers.disableCollisions.objectsHasTicked = false
		end
	end
end

RiOT_var.features.customLicensePlateVisual = function()
	local textureDic = CreateRuntimeTxd('duiTxd')
	local object = CreateDui('https://i.imgur.com/po0VDeW.png', 540, 300)
	local handle = GetDuiHandle(object)
	CreateRuntimeTextureFromDuiHandle(textureDic, 'duiTex', handle)
	AddReplaceTexture('vehshare', 'plate01', 'duiTxd', 'duiTex')
	AddReplaceTexture('vehshare', 'plate02', 'duiTxd', 'duiTex')
	AddReplaceTexture('vehshare', 'plate03', 'duiTxd', 'duiTex')
	AddReplaceTexture('vehshare', 'plate04', 'duiTxd', 'duiTex')
	AddReplaceTexture('vehshare', 'plate05', 'duiTxd', 'duiTex')

	local object = CreateDui('https://i.imgur.com/Q3uw6V7.png', 540, 300)
	local handle = GetDuiHandle(object)
	CreateRuntimeTextureFromDuiHandle(textureDic, 'duiTex2', handle)
	AddReplaceTexture('vehshare', 'plate01_n', 'duiTxd', 'duiTex2')
	AddReplaceTexture('vehshare', 'plate02_n', 'duiTxd', 'duiTex2')
	AddReplaceTexture('vehshare', 'plate03_n', 'duiTxd', 'duiTex2')
	AddReplaceTexture('vehshare', 'plate04_n', 'duiTxd', 'duiTex2')
	AddReplaceTexture('vehshare', 'plate05_n', 'duiTxd', 'duiTex2')
end

RiOT_var.features.installWeaponAttachment = function(componentHash)
	local ped = RiOT_var.datastore.pLocal.pedId
	local hasWeapon, weaponHash = GetCurrentPedWeapon(ped, true)
	if (hasWeapon and weaponHash) then
		local canTake = DoesWeaponTakeWeaponComponent(weaponHash, componentHash)
		if (canTake) then
			local gotComponent = HasPedGotWeaponComponent(ped, weaponHash, componentHash)
			if (gotComponent) then
				RemoveWeaponComponentFromPed(ped, weaponHash, componentHash)
			else
				GiveWeaponComponentToPed(ped, weaponHash, componentHash)
			end
			return (true)
		else
			--[[RiOT_var.notification('Your current weapon can not take this attachment.')]]
			return (false)
		end
	end
end

RiOT_var.features.bindFeature = function(pkeybind)
    local aInput = (RiOT_var.functions.keyboardInput('bind_feature_key', 'key', RiOT_var.datastore.keybinds[pkeybind['key']] or '', 200))
	if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) then
		aInput = string.upper(aInput)
        local checkKey = pCitizen['keys'][(aInput)]
		if (checkKey) then
			RiOT_var.datastore.keybinds[pkeybind]['key'] = checkKey
			RiOT_var.datastore.keybinds[pkeybind]['key_label'] = aInput
			if (RiOT_var.datastore.keybinds[pkeybind]['removable'] == nil) then
				RiOT_var.datastore.keybinds[pkeybind]['removable'] = true
			end
        else
            RiOT_var.notification('The keybind that you tried giving is in-valid.')
        end
    end
end

RiOT_var.features.handleRevealInvisiblePlayers = function()
	local returnedPlayers = RiOT_var.functions.returnPlayersTable()
	for key, value in pairs(returnedPlayers) do
		if value['id'] ~= RiOT_var.datastore.pLocal.pId then
			local playerCoords = (GetOffsetFromEntityInWorldCoords(value['ped'], 0.0, 0.0, 1.0))
			local ourCoords = (GetOffsetFromEntityInWorldCoords(RiOT_var.datastore.pLocal.pedId, 0.0, 0.0, 0.0))
			local distanceBetween = (GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, ourCoords.x, ourCoords.y, ourCoords.z))

			if distanceBetween <= 100.0 then
				local isPlayerInvisible = (not IsEntityVisibleToScript(value['ped']))

				if isPlayerInvisible then
					SetEntityLocallyVisible(value['ped'], true)
					SetEntityAlpha(value['ped'], 150)
				else
					SetEntityAlpha(value['ped'], 255)
				end
			else
				SetEntityAlpha(value['ped'], 255)
			end
		end
	end
end

RiOT_var.features.handlePlayerESP = function()
	local returnedPlayers = RiOT_var.functions.returnPlayersTable()
	for key, value in pairs(returnedPlayers) do
		if ((value['ped'] ~= RiOT_var.datastore.pLocal.pedId or RiOT_var.menuVars.visualOptions.esp.displaySelf)) then
			local text = ''
			local lines = 1
			local box_entity = (value['ped'])

			if (value['vehicle'] and (GetPedInVehicleSeat(value['vehicle'], -1) == value['ped'])) then
				box_entity = (GetVehiclePedIsIn(value['ped'], false))
			else
				box_entity = (value['ped'])
			end

			if (RiOT_var.menuVars.visualOptions.esp.displayPlayerName) then
				lines = (lines + 1)
				text = (text..value['name']..'\n')
			end

			if (RiOT_var.menuVars.visualOptions.esp.displayPlayerID) then
				text = (text..'['..value['serverid']..'/'..value['id']..']\n')
				lines = (lines + 1)
			end

			if (RiOT_var.menuVars.visualOptions.esp.displayPlayerDistance) then
				local player_distance = RiOT_var.functions.math.round(GetDistanceBetweenCoords(RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.pedId), RiOT_var.natives.getEntityCoords(value['ped'])))
				if player_distance then
					text = (text..player_distance..'ft away\n')
					lines = (lines + 1)
				end
			end

			if (RiOT_var.menuVars.visualOptions.esp.revealInvisiblePlayers) then
				local isPlayerInvisible = (not IsEntityVisibleToScript(value['ped']))
				if isPlayerInvisible then
					text = (text..'Invisible\n')
					lines = (lines + 1)
				end
			end

			if (RiOT_var.menuVars.visualOptions.esp.displayPlayerWeapon) then
				local targetWeapon = 'Un-armed'
				local hasWeapon, weaponHash = GetCurrentPedWeapon(value['ped'], true)
				if (hasWeapon and weaponHash) then
					targetWeapon = string.gsub((RiOT_var.menuTables.weaponModelsOpposite[weaponHash] or 'Un-known'), 'WEAPON_', '')
				end

				text = (text..targetWeapon..'\n')
				lines = (lines + 1)
			end

			local shouldDrawBox = false
			if (RiOT_var.menuVars.visualOptions.esp.displayPlayerBox and HasEntityClearLosToEntity(RiOT_var.datastore.pLocal.pedId, value['ped'], 17)) then
				shouldDrawBox = true
			end
			RiOT_var.features.drawEntityESP({
				entity = value['ped'], 
				text = text, 
				text_lines = lines,
				text_color = {r = 255, g = 255, b = 255, a = 175},
				box = shouldDrawBox,
				box_entity = box_entity,
				box_color = RiOT_var.mainColor,
				skeleton = RiOT_var.menuVars.visualOptions.esp.displayPlayerSkeleton,
				skeleton_entity = value['ped'],
				skeleton_color = RiOT_var.mainColor,
				capDistance = RiOT_var.menuVars.comboBoxes[19]._words[RiOT_var.menuVars.comboBoxes[19]._selected]
			})
		end
	end
end

RiOT_var.features.saveLoadout = function(loadout_name)
    if (not loadout_name) then
        loadout_name = ('un-named')
    end
    local loadout = {
        name = loadout_name, 
        weapons = {}
	}
	
    local ped = RiOT_var.datastore.pLocal.pedId
    for key, value in pairs(RiOT_var.menuTables.weaponModelsFull) do
        local weaponHash = GetHashKey(value)
        if (HasPedGotWeapon(ped, weaponHash)) then
            loadout.weapons[value] = {
                attachments = {}
            }

            for _key, _value in pairs(RiOT_var.menuTables.weaponAttachments) do
                for __key, componentHash in pairs(_value) do
                    local gotComponent = HasPedGotWeaponComponent(ped, weaponHash, componentHash)
                    if (gotComponent) then
                        table.insert(loadout.weapons[value].attachments, componentHash)
                    end
                end
            end
        end
    end

	if (RiOT_var.functions.tables.length(loadout.weapons) > 0) then
		RiOT_var.datastore.weaponLoadouts[#RiOT_var.datastore.weaponLoadouts + 1] = loadout
	else
		RiOT_var.notification('You dont have any weapons')
	end
end

RiOT_var.features.loadLoadout = function(loadout)
    local ped = RiOT_var.datastore.pLocal.pedId
    for key, value in pairs(loadout.weapons) do
        local weaponHash = (GetHashKey(key))
        RiOT_var.natives.giveWeaponToPed(ped, weaponHash, 250, false, true)

		if (RiOT_var.functions.tables.length(value.attachments) > 0) then
			for _key, componentHash in pairs(value.attachments) do
				GiveWeaponComponentToPed(ped, weaponHash, componentHash)
			end
		end
    end
end

RiOT_var.features.handleBulletTracers = function()
	local ped = RiOT_var.datastore.pLocal.pedId
	local pcoords = RiOT_var.natives.getEntityCoords(ped)
	local retval, bcoords = GetPedLastWeaponImpactCoord(ped)
	if (retval) then
		table.insert(RiOT_var.datastore.bulletTracers, { 
			['x'] = pcoords.x, 
			['y'] = pcoords.y, 
			['z'] = pcoords.z, 
			['x2'] = bcoords.x, 
			['y2'] = bcoords.y, 
			['z2'] = bcoords.z, 
			['delay'] = 5000, 
			['startTime'] = GetGameTimer()
		})
	end

	if (#RiOT_var.datastore.bulletTracers > 0) then
		for _i = 1, #RiOT_var.datastore.bulletTracers do
			local value = RiOT_var.datastore.bulletTracers[_i]
			if (value) then
				local timer = ((GetGameTimer() - value['startTime']) / value['delay'] * 100)
				DrawLine(value['x'], value['y'], value['z'], value['x2'], value['y2'], value['z2'], RiOT_var.mainColor.r, RiOT_var.mainColor.g, RiOT_var.mainColor.b, 200)
				
				if (timer >= 100) then
					table.remove(RiOT_var.datastore.bulletTracers, _i)
				end
			end
		end
	end
end

RiOT_var.features.handleMovementTrails = function()
	local ped = RiOT_var.datastore.pLocal.pedId
	if (GetEntitySpeed(ped) >= 1.0) then
		local coords = RiOT_var.natives.getEntityCoords(ped)
		if (IsPedInAnyVehicle(ped)) then
			coords = RiOT_var.natives.getEntityCoords(RiOT_var.datastore.pLocal.vehicle)
		end
		table.insert(RiOT_var.datastore.movementTrails, { 
			["x"] = coords.x, 
			["y"] = coords.y, 
			["z"] = coords.z, 
			["delay"] = 1000, 
			["startTime"] = GetGameTimer()
		})
	end

	if (#RiOT_var.datastore.movementTrails > 0) then
		for _i = 1, #RiOT_var.datastore.movementTrails do
			local value = RiOT_var.datastore.movementTrails[_i]
			if (value) then
				local timer = ((GetGameTimer() - value['startTime']) / value['delay'] * 100)
				DrawMarker(28, value['x'], value['y'], value['z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, RiOT_var.mainColor.r, RiOT_var.mainColor.g, RiOT_var.mainColor.b, 200, false, true, 2, nil, nil, false)
				
				if (timer >= 100) then
					table.remove(RiOT_var.datastore.movementTrails, _i)
				end
			end
		end
	end
end

RiOT_var.features.handleBulletImpacts = function()
	local ped = RiOT_var.datastore.pLocal.pedId
	local retval, bcoords = GetPedLastWeaponImpactCoord(ped)
	if (retval) then
		table.insert(RiOT_var.datastore.bulletImpacts, { 
			["x"] = bcoords.x, 
			["y"] = bcoords.y, 
			["z"] = bcoords.z, 
			["delay"] = 2500, 
			["startTime"] = GetGameTimer()
		})
	end

	if (#RiOT_var.datastore.bulletImpacts > 0) then
		for _i = 1, #RiOT_var.datastore.bulletImpacts do
			local value = RiOT_var.datastore.bulletImpacts[_i]
			if (value) then
				local timer = ((GetGameTimer() - value['startTime']) / value['delay'] * 100)
				DrawMarker(28, value['x'], value['y'], value['z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.075, 0.075, 0.075, RiOT_var.mainColor.r, RiOT_var.mainColor.g, RiOT_var.mainColor.b, 200, false, true, 2, nil, nil, false)
				
				if (timer >= 100) then
					table.remove(RiOT_var.datastore.bulletImpacts, _i)
				end
			end
		end
	end
end

RiOT_var.features.highBeamOnHonk = function()
	if (IsDisabledControlJustPressed(0, pCitizen['keys']['E'])) then
		pCitizen['createThread'](function()
			local vehicle = RiOT_var.datastore.pLocal.vehicle
			SetVehicleFullbeam(vehicle, true)
			pCitizen['wait'](100)
			SetVehicleFullbeam(vehicle, false)
		end)
	end
end

RiOT_var.features.teleportEnumeratedVehicles = function(player)
	pCitizen['createThread'](function()
		local v1 = 1
		for vehicle in RiOT_var.functions.enumerateVehicles() do
			NetworkRequestControlOfEntity(vehicle)
			if NetworkHasControlOfEntity(vehicle) then
				local _x, _y, _z = table.unpack(RiOT_var.natives.getEntityCoords(player))
				RiOT_var.natives.setEntityCoords(vehicle, _x, _y, _z + v1, 0.0, 0.0, 0.0, false)
				v1 = v1 + 1
			end
		end
	end)
end

RiOT_var.features.copyPedOutfit = function(ped)
    if (ped and RiOT_var.natives.doesEntityExist(ped) and IsEntityAPed(ped)) then
        local ped_outfit = {
			ped = RiOT_var.datastore.pLocal.pedId,
			--[[model = GetEntityModel(ped),]]
			hat = GetPedPropIndex(ped, 0),
			hat_texture = GetPedPropTextureIndex(ped, 0),
			glasses = GetPedPropIndex(ped, 1),
			glasses_texture = GetPedPropTextureIndex(ped, 1),
			ear = GetPedPropIndex(ped, 2),
			ear_texture = GetPedPropTextureIndex(ped, 2),
			watch = GetPedPropIndex(ped, 6),
			watch_texture = GetPedPropTextureIndex(ped, 6),
			wrist = GetPedPropIndex(ped, 7),
			wrist_texture = GetPedPropTextureIndex(ped, 3),
			head = {
				draw = GetPedDrawableVariation(ped, 0),
				texture = GetPedTextureVariation(ped, 0),
				palette = GetPedPaletteVariation(ped, 0)
			},
			beard = {
				draw = GetPedDrawableVariation(ped, 1),
				texture = GetPedTextureVariation(ped, 1),
				palette = GetPedPaletteVariation(ped, 1)
			},
			hair = {
				draw = GetPedDrawableVariation(ped, 2),
				texture = GetPedTextureVariation(ped, 2),
				palette = GetPedPaletteVariation(ped, 2)
			},
			torso = {
				draw = GetPedDrawableVariation(ped, 3),
				texture = GetPedTextureVariation(ped, 3),
				palette = GetPedPaletteVariation(ped, 3)
			},
			legs = {
				draw = GetPedDrawableVariation(ped, 4),
				texture = GetPedTextureVariation(ped, 4),
				palette = GetPedPaletteVariation(ped, 4)
			},
			hands = {
				draw = GetPedDrawableVariation(ped, 5),
				texture = GetPedTextureVariation(ped, 5),
				palette = GetPedPaletteVariation(ped, 5)
			},
			feet = {
				draw = GetPedDrawableVariation(ped, 6),
				texture = GetPedTextureVariation(ped, 6),
				palette = GetPedPaletteVariation(ped, 6)
			},
			accessory_1 = {
				draw = GetPedDrawableVariation(ped, 7),
				texture = GetPedTextureVariation(ped, 7),
				palette = GetPedPaletteVariation(ped, 7)
			},
			accessory_2 = {
				draw = GetPedDrawableVariation(ped, 8),
				texture = GetPedTextureVariation(ped, 8),
				palette = GetPedPaletteVariation(ped, 8)
			},
			accessory_3 = {
				draw = GetPedDrawableVariation(ped, 9),
				texture = GetPedTextureVariation(ped, 9),
				palette = GetPedPaletteVariation(ped, 9)
			},
			mask = {
				draw = GetPedDrawableVariation(ped, 10),
				texture = GetPedTextureVariation(ped, 10),
				palette = GetPedPaletteVariation(ped, 10)
			},
			auxillary = {
				draw = GetPedDrawableVariation(ped, 11),
				texture = GetPedTextureVariation(ped, 11),
				palette = GetPedPaletteVariation(ped, 11)
			}
		}
        RiOT_var.functions.setOutfit(ped_outfit)
    end
end

RiOT_var.features.freezeAllPlayers = function()
	for _, player in ipairs(RiOT_var.natives.getActivePlayers()) do
		if (not RiOT_var.functions.friendsSystem('is_friend', player)) then
			local ped = GetPlayerPed(player)
			ClearPedTasks(ped)
			ClearPedTasksImmediately(ped)
			DisablePlayerFiring(player, true)
		end
	end
end

RiOT_var.features.explodeAllPlayers = function()
	for _, player in ipairs(RiOT_var.natives.getActivePlayers()) do
		if (not RiOT_var.functions.friendsSystem('is_friend', player)) then
			RiOT_var.functions.explodeEntity(GetPlayerPed(player))
		end
	end
end

RiOT_var.features.fakeExplodeAllPlayers = function()
	for _, player in ipairs(RiOT_var.natives.getActivePlayers()) do
		if (not RiOT_var.functions.friendsSystem('is_friend', player)) then
			RequestNamedPtfxAsset('core')
			UseParticleFxAssetNextCall('core')
			StartNetworkedParticleFxNonLoopedOnEntity('veh_backfire', GetPlayerPed(player), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 100.0, false, false, false)
		end
	end
end

RiOT_var.features.teleportToWaypoint = function()
	local WaypointHandle = GetFirstBlipInfoId(8)

	if (DoesBlipExist(WaypointHandle)) then
		local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

		for height = 1, 1000 do
			SetPedCoordsKeepVehicle(RiOT_var.datastore.pLocal.pedId, waypointCoords['x'], waypointCoords['y'], height + 0.0)

			local foundGround, zPos = RiOT_var.natives.getGroundZFor_3dCoord(waypointCoords['x'], waypointCoords['y'], height + 0.0)

			if (foundGround) then
				SetPedCoordsKeepVehicle(RiOT_var.datastore.pLocal.pedId, waypointCoords['x'], waypointCoords['y'], height + 0.0)
				break
			end

			pCitizen['wait'](5)
		end
	end
end

--[[
	usage:
	ped types | player = 1 | male = 4 | female = 5 | cop = 6 | taxi driver = 25 | (sfink) human = 26 | swat = 27 | animal = 28 | army = 29
	local spawned_peds = RiOT_var.features.spawnPed({
		amount = 2,
		model = 'a_m_m_hasjew_01',
		type = 4,
		heading = 180.0,
		coords = {x = 1.0, y = 2.0, z = 3.0},
		network = true,
		freeze = false,
		invincible = true,
		health = 190,
		armour = 180,
		accuracy = 100,
		target = GetPlayerPed(-1)
	})
]]

RiOT_var.features.spawnPed = function(data)
	local _peds = {}
	local amount = data.amount or 1

	for _i=0, amount do
		local ped_model = data.model or 'a_m_y_hasjew_01'
		local model_hashped_model = (type(ped_model) == 'number' and ped_model or GetHashKey(ped_model))
		RequestModel(model_hashped_model)
		pCitizen['wait'](50)
		if (HasModelLoaded(model_hashped_model)) then
			local ped_type = data.type or 4
			local heading = data.heading or 180.0
			local coords = data.coords or RiOT_var.natives.getEntityCoords(GetPlayerPed(RiOT_var.datastore.pLocal.pedId))
			local network = data.network and true or false
			local ped = CreatePed(ped_type, model_hashped_model, coords.x + _i, coords.y - _i, coords.z + 0.5, (heading + 0.0), network, true)

			if (RiOT_var.natives.doesEntityExist(ped)) then
				if (network) then
					RiOT_var.functions.networkEntity(ped)
				end
				if (data.freeze) then
					FreezeEntityPosition(ped, data.freeze)
				end
				if (data.invincible) then
					SetEntityInvincible(ped, data.invincible)
				end
				if (data.health) then
					RiOT_var.natives.setEntityHealth(ped, data.health)
				end
				if (data.armour) then
					RiOT_var.natives.setPedArmour(ped, data.armour)
				end
				if (data.accuracy) then
					SetPedAccuracy(ped, accuracy)
				end
				if (data.target) then
					TaskCombatPed(ped, data.target, 0, 16)
				end

				if (amount == 1) then
					return (ped)
				else
					table.insert(_peds, ped)
				end
			end
		else
			RequestModel(model_hashped_model)
		end
	end

	if (amount > 1) then
		return (_peds)
	end
end

RiOT_var.features.antiAntiCheat = function()
    for key, value in pairs(RiOT_var.menuTables.clientEventsToCancel) do
        RegisterNetEvent(value)
        AddEventHandler(value, function(...)
            CancelEvent()
			RiOT_var.print('AAC - Event: '..value..' has been triggered.', 5000)
        end)
    end
	RiOT_var.notification('Done running anti-anti-cheat(AAC).', 5000)
end

--[[
	RiOT Functions
]]

RiOT_var.functions.doesResourceExist = function(resource_name)
	if (GetResourceState(resource_name) == 'started' or 
		string.upper(GetResourceState(resource_name)) == 'started' or 
		string.lower(GetResourceState(resource_name)) == 'started' or 
		GetResourceState(resource_name..'-master') == 'started' or 
		string.upper(GetResourceState(resource_name..'-master')) == 'started' or 
		string.lower(GetResourceState(resource_name..'-master')) == 'started') then
		return true
	else
		return false
	end
end

RiOT_var.functions.keyboardInput = function(input_name, textEntry, exampleText, maxStringLenght)
	RiOT_var.natives.addTextEntry('FMMC_KEY_TIP1', textEntry)
	RiOT_var.natives.displayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', RiOT_var.datastore.keyboardInputs[input_name] or exampleText, '', '', '', maxStringLenght)
	RiOT_var.shouldBlockInput = true
	DisableAllControlActions(0)

	while (RiOT_var.natives.updateOnscreenKeyboard() ~= 1 and RiOT_var.natives.updateOnscreenKeyboard() ~= 2) do
		pCitizen['wait'](0)
	end
		
	if (RiOT_var.natives.updateOnscreenKeyboard() ~= 2) then
		local result = GetOnscreenKeyboardResult()
		pCitizen['wait'](500)
		RiOT_var.shouldBlockInput = false
		EnableAllControlActions(0)
		if (not RiOT_var.functions.strings.isNullOrEmpty(result) and RiOT_var.datastore.keyboardInputs[input_name] == nil or RiOT_var.datastore.keyboardInputs[input_name] ~= result) then
			RiOT_var.datastore.keyboardInputs[input_name] = result
		end
		return result
	else
		pCitizen['wait'](500)
		RiOT_var.shouldBlockInput = false
		EnableAllControlActions(0)
		return nil
	end
end

RiOT_var.functions.returnResourceList = function()
	local resources = {}
	for _i=0, GetNumResources() do
		resources[_i] = GetResourceByFindIndex(_i)
	end
	return resources
end

RiOT_var.functions.returnPlayersTable = function()
	local players = {}
	for key, player in pairs(RiOT_var.natives.getActivePlayers()) do
		players[key] = {
			['ped'] = GetPlayerPed(player),
			['name'] = RiOT_var.functions.strings.getSafe(GetPlayerName(player)),
			['id'] = player,
			['serverid'] = GetPlayerServerId(player),
			['vehicle'] = RiOT_var.functions.getPedVehicle(GetPlayerPed(player)),
		}
	end

	table.sort(players, function(a, b)
		return a.serverid < b.serverid
	end)

	return players
end

RiOT_var.functions.requestFilteredResources = function(_to_filer)
	local resourcesTable = RiOT_var.functions.returnResourceList()
	local _return_filtered = ''
	for _i = 1, #resourcesTable do
		local _file_dirs = {
			'client.lua',
			'main.lua',
			'client/client.lua',
			'client/main.lua',
		}
		for __i = 1, #_file_dirs do
			local _file_lookup = RiOT_var.natives.loadResourceFile(resourcesTable[_i], _file_dirs[__i])
			if _file_lookup then
				local _file_to_split = RiOT_var.functions.strings.split(_file_lookup, '\n')
				for ___i = 1, #_file_to_split do
					_file_to_split[___i] = string.gsub(_file_to_split[___i], '%s', '')
					if string.find(_file_to_split[___i], _to_filer) then
						_return_filtered = _return_filtered..'\n'.._file_to_split[___i]
					end
				end
			end
		end
	end
	
	return _return_filtered
end

RiOT_var.functions.returnRGB = function(l) 
	local rgb = {} 
	local n = GetGameTimer() / 200 
	rgb.r = math.floor(math.sin(n * l + 0) * 127 + 128) 
	rgb.g = math.floor(math.sin(n * l + 2) * 127 + 128) 
	rgb.b = math.floor(math.sin(n * l + 4) * 127 + 128) 
	return rgb 
end

RiOT_var.functions.getVehicleProperties = function(vehicle)
	if (RiOT_var.natives.doesEntityExist(vehicle)) then
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		local extras = {}

		for id=0, 12 do
			if RiOT_var.natives.doesExtraExist(vehicle, id) then
				local state = IsVehicleExtraTurnedOn(vehicle, id) == 1
				extras[tostring(id)] = state
			end
		end

		return {
			model             = GetEntityModel(vehicle),

			plate             = RiOT_var.functions.math.trim(GetVehicleNumberPlateText(vehicle)),
			plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),

			bodyHealth        = RiOT_var.functions.math.round(GetVehicleBodyHealth(vehicle), 1),
			engineHealth      = RiOT_var.functions.math.round(GetVehicleEngineHealth(vehicle), 1),

			fuelLevel         = RiOT_var.functions.math.round(GetVehicleFuelLevel(vehicle), 1),
			dirtLevel         = RiOT_var.functions.math.round(GetVehicleDirtLevel(vehicle), 1),
			color1            = colorPrimary,
			color2            = colorSecondary,

			pearlescentColor  = pearlescentColor,
			wheelColor        = wheelColor,

			wheels            = GetVehicleWheelType(vehicle),
			windowTint        = GetVehicleWindowTint(vehicle),
			xenonColor        = RiOT_var.natives.getVehicleXenonLightsColour(vehicle),

			neonEnabled       = {
				IsVehicleNeonLightEnabled(vehicle, 0),
				IsVehicleNeonLightEnabled(vehicle, 1),
				IsVehicleNeonLightEnabled(vehicle, 2),
				IsVehicleNeonLightEnabled(vehicle, 3)
			},

			neonColor         = table.pack(GetVehicleNeonLightsColour(vehicle)),
			extras            = extras,
			tyreSmokeColor    = table.pack(GetVehicleTyreSmokeColor(vehicle)),

			modSpoilers       = GetVehicleMod(vehicle, 0),
			modFrontBumper    = GetVehicleMod(vehicle, 1),
			modRearBumper     = GetVehicleMod(vehicle, 2),
			modSideSkirt      = GetVehicleMod(vehicle, 3),
			modExhaust        = GetVehicleMod(vehicle, 4),
			modFrame          = GetVehicleMod(vehicle, 5),
			modGrille         = GetVehicleMod(vehicle, 6),
			modHood           = GetVehicleMod(vehicle, 7),
			modFender         = GetVehicleMod(vehicle, 8),
			modRightFender    = GetVehicleMod(vehicle, 9),
			modRoof           = GetVehicleMod(vehicle, 10),

			modEngine         = GetVehicleMod(vehicle, 11),
			modBrakes         = GetVehicleMod(vehicle, 12),
			modTransmission   = GetVehicleMod(vehicle, 13),
			modHorns          = GetVehicleMod(vehicle, 14),
			modSuspension     = GetVehicleMod(vehicle, 15),
			modArmor          = GetVehicleMod(vehicle, 16),

			modTurbo          = IsToggleModOn(vehicle, 18),
			modSmokeEnabled   = IsToggleModOn(vehicle, 20),
			modXenon          = IsToggleModOn(vehicle, 22),

			modFrontWheels    = GetVehicleMod(vehicle, 23),
			modBackWheels     = GetVehicleMod(vehicle, 24),

			modPlateHolder    = GetVehicleMod(vehicle, 25),
			modVanityPlate    = GetVehicleMod(vehicle, 26),
			modTrimA          = GetVehicleMod(vehicle, 27),
			modOrnaments      = GetVehicleMod(vehicle, 28),
			modDashboard      = GetVehicleMod(vehicle, 29),
			modDial           = GetVehicleMod(vehicle, 30),
			modDoorSpeaker    = GetVehicleMod(vehicle, 31),
			modSeats          = GetVehicleMod(vehicle, 32),
			modSteeringWheel  = GetVehicleMod(vehicle, 33),
			modShifterLeavers = GetVehicleMod(vehicle, 34),
			modAPlate         = GetVehicleMod(vehicle, 35),
			modSpeakers       = GetVehicleMod(vehicle, 36),
			modTrunk          = GetVehicleMod(vehicle, 37),
			modHydrolic       = GetVehicleMod(vehicle, 38),
			modEngineBlock    = GetVehicleMod(vehicle, 39),
			modAirFilter      = GetVehicleMod(vehicle, 40),
			modStruts         = GetVehicleMod(vehicle, 41),
			modArchCover      = GetVehicleMod(vehicle, 42),
			modAerials        = GetVehicleMod(vehicle, 43),
			modTrimB          = GetVehicleMod(vehicle, 44),
			modTank           = GetVehicleMod(vehicle, 45),
			modWindows        = GetVehicleMod(vehicle, 46),
			modLivery         = GetVehicleLivery(vehicle),

			suspensionRaise = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSuspensionRaise'),
		}
	else
		return
	end
end

RiOT_var.functions.setVehicleProperties = function(vehicle, props)
	if (RiOT_var.natives.doesEntityExist(vehicle)) then
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleModKit(vehicle, 0)

		if props.plate then SetVehicleNumberPlateText(vehicle, props.plate) end
		if props.plateIndex then SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex) end
		if props.bodyHealth then SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0) end
		if props.engineHealth then SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0) end
		if props.fuelLevel then SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0) end
		if props.dirtLevel then SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0) end
		if props.color1 then SetVehicleColours(vehicle, props.color1, colorSecondary) end
		if props.color2 then SetVehicleColours(vehicle, props.color1 or colorPrimary, props.color2) end
		if props.pearlescentColor then SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor) end
		if props.wheelColor then SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor) end
		if props.wheels then SetVehicleWheelType(vehicle, props.wheels) end
		if props.windowTint then SetVehicleWindowTint(vehicle, props.windowTint) end

		if props.neonEnabled then
			SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
			SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
			SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
			SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
		end

		if props.extras then
			for id,enabled in pairs(props.extras) do
				if enabled then
					SetVehicleExtra(vehicle, tonumber(id), 0)
				else
					SetVehicleExtra(vehicle, tonumber(id), 1)
				end
			end
		end

		if props.neonColor then SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3]) end
		if props.xenonColor then RiOT_var.natives.setVehicleXenonLightsColour(vehicle, props.xenonColor) end
		if props.modSmokeEnabled then ToggleVehicleMod(vehicle, 20, true) end
		if props.tyreSmokeColor then SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3]) end
		if props.modSpoilers then SetVehicleMod(vehicle, 0, props.modSpoilers, false) end
		if props.modFrontBumper then SetVehicleMod(vehicle, 1, props.modFrontBumper, false) end
		if props.modRearBumper then SetVehicleMod(vehicle, 2, props.modRearBumper, false) end
		if props.modSideSkirt then SetVehicleMod(vehicle, 3, props.modSideSkirt, false) end
		if props.modExhaust then SetVehicleMod(vehicle, 4, props.modExhaust, false) end
		if props.modFrame then SetVehicleMod(vehicle, 5, props.modFrame, false) end
		if props.modGrille then SetVehicleMod(vehicle, 6, props.modGrille, false) end
		if props.modHood then SetVehicleMod(vehicle, 7, props.modHood, false) end
		if props.modFender then SetVehicleMod(vehicle, 8, props.modFender, false) end
		if props.modRightFender then SetVehicleMod(vehicle, 9, props.modRightFender, false) end
		if props.modRoof then SetVehicleMod(vehicle, 10, props.modRoof, false) end
		if props.modEngine then SetVehicleMod(vehicle, 11, props.modEngine, false) end
		if props.modBrakes then SetVehicleMod(vehicle, 12, props.modBrakes, false) end
		if props.modTransmission then SetVehicleMod(vehicle, 13, props.modTransmission, false) end
		if props.modHorns then SetVehicleMod(vehicle, 14, props.modHorns, false) end
		if props.modSuspension then SetVehicleMod(vehicle, 15, props.modSuspension, false) end
		if props.modArmor then SetVehicleMod(vehicle, 16, props.modArmor, false) end
		if props.modTurbo then ToggleVehicleMod(vehicle,  18, props.modTurbo) end
		if props.modXenon then ToggleVehicleMod(vehicle,  22, props.modXenon) end
		if props.modFrontWheels then SetVehicleMod(vehicle, 23, props.modFrontWheels, false) end
		if props.modBackWheels then SetVehicleMod(vehicle, 24, props.modBackWheels, false) end
		if props.modPlateHolder then SetVehicleMod(vehicle, 25, props.modPlateHolder, false) end
		if props.modVanityPlate then SetVehicleMod(vehicle, 26, props.modVanityPlate, false) end
		if props.modTrimA then SetVehicleMod(vehicle, 27, props.modTrimA, false) end
		if props.modOrnaments then SetVehicleMod(vehicle, 28, props.modOrnaments, false) end
		if props.modDashboard then SetVehicleMod(vehicle, 29, props.modDashboard, false) end
		if props.modDial then SetVehicleMod(vehicle, 30, props.modDial, false) end
		if props.modDoorSpeaker then SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false) end
		if props.modSeats then SetVehicleMod(vehicle, 32, props.modSeats, false) end
		if props.modSteeringWheel then SetVehicleMod(vehicle, 33, props.modSteeringWheel, false) end
		if props.modShifterLeavers then SetVehicleMod(vehicle, 34, props.modShifterLeavers, false) end
		if props.modAPlate then SetVehicleMod(vehicle, 35, props.modAPlate, false) end
		if props.modSpeakers then SetVehicleMod(vehicle, 36, props.modSpeakers, false) end
		if props.modTrunk then SetVehicleMod(vehicle, 37, props.modTrunk, false) end
		if props.modHydrolic then SetVehicleMod(vehicle, 38, props.modHydrolic, false) end
		if props.modEngineBlock then SetVehicleMod(vehicle, 39, props.modEngineBlock, false) end
		if props.modAirFilter then SetVehicleMod(vehicle, 40, props.modAirFilter, false) end
		if props.modStruts then SetVehicleMod(vehicle, 41, props.modStruts, false) end
		if props.modArchCover then SetVehicleMod(vehicle, 42, props.modArchCover, false) end
		if props.modAerials then SetVehicleMod(vehicle, 43, props.modAerials, false) end
		if props.modTrimB then SetVehicleMod(vehicle, 44, props.modTrimB, false) end
		if props.modTank then SetVehicleMod(vehicle, 45, props.modTank, false) end
		if props.modWindows then SetVehicleMod(vehicle, 46, props.modWindows, false) end

		if (props.modLivery) then
			SetVehicleMod(vehicle, 48, props.modLivery, false)
			SetVehicleLivery(vehicle, props.modLivery)
		end

		if (props.suspensionRaise) then
			SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSuspensionRaise', props.suspensionRaise)
		end
		if (props.sound) then
			RiOT_var.natives.forceVehicleEngineAudio(vehicle, props.sound)
		end
	end
end

RiOT_var.functions.polar3DToWorld3D = function(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
    local polarAngleRad = polarAngleDeg * math.pi / 180.0
    local azimuthAngleRad = azimuthAngleDeg * math.pi / 180.0

    local pos = {
        x = entityPosition.x + radius * (math.sin(azimuthAngleRad) * math.cos(polarAngleRad)),
        y = entityPosition.y - radius * (math.sin(azimuthAngleRad) * math.sin(polarAngleRad)),
        z = entityPosition.z - radius * math.cos(azimuthAngleRad)
    }

    return pos
end

RiOT_var.functions.entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

RiOT_var.functions.enumerateEntities = function(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, RiOT_var.functions.entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

RiOT_var.functions.enumerateObjects = function()
	return RiOT_var.functions.enumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

RiOT_var.functions.enumeratePeds = function()
	return RiOT_var.functions.enumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

RiOT_var.functions.enumerateVehicles = function()
	return RiOT_var.functions.enumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

RiOT_var.functions.enumeratePickups = function()
	return RiOT_var.functions.enumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

RiOT_var.functions.deleteEntity = function(entity)
	if RiOT_var.natives.doesEntityExist(entity) and not (IsEntityAPed(entity) and IsPedAPlayer(entity)) then
		if NetworkHasControlOfEntity(entity) then
			if IsEntityAttached(entity) then
				DetachEntity(entity, 0, false)
			end
			SetEntityCollision(entity, false, false)
			SetEntityAlpha(entity, 0, true)
			SetEntityAsMissionEntity(entity, true, true)
			SetEntityAsNoLongerNeeded(entity)
			DeleteEntity(entity)
		else
			RiOT_var.notification('Action impossible, requesting control.')
			NetworkRequestControlOfEntity(entity)
		end
	else
		RiOT_var.notification('Entity does not exist.')
	end
end

RiOT_var.functions.getPedVehicle = function(ped)
	local pedVehicle = nil
	if (IsPedInAnyVehicle(ped, false)) then
		pedVehicle = GetVehiclePedIsIn(ped, false)
	else
		pedVehicle = GetVehiclePedIsIn(ped, true)
	end

	return pedVehicle
end

RiOT_var.functions.refresh_pvars = function(first_time)
	RiOT_var.datastore.pLocal.pId = PlayerId()
	RiOT_var.datastore.pLocal.pedId = PlayerPedId()
	RiOT_var.datastore.pLocal.vehicle = RiOT_var.functions.getPedVehicle(RiOT_var.datastore.pLocal.pedId)
	if (first_time) then
		DecorRegister('RiOT_var', 2)
		DecorSetBool(RiOT_var.datastore.pLocal.pedId, 'RiOT_var', true)
		if (Ham ~= nil and type(Ham) == 'table') then
			RiOT_var.datastore.pLocal.name = RiOT_var.functions.strings.getSafe(Ham.getName())
		else
			RiOT_var.datastore.pLocal.name = RiOT_var.functions.strings.getSafe(GetPlayerName(RiOT_var.datastore.pLocal.pId))
		end
	end
end

RiOT_var.functions.refresh_keybinds = function()
	RiOT_var.datastore.keybinds = {
		['Open Menu'] = {
			['feature'] = (function() 
				if (not RiOT_var.isAnyMenuOpened()) then
					RiOT_var.openMenu({id = 'mainMenu'})
				end
			end),
			['key'] = pCitizen['keys']['TAB'],
			['key_label'] = 'TAB',
			['notification'] = false,
			['notification_text'] = 'Welcome to RiOT Menu by Nertigel',
			['play_sound'] = true,
			['removable'] = false
		},
		['Revive'] = {
			['feature'] = RiOT_var.features.nativeRevive,
			['notification'] = true,
			['notification_text'] = 'You have revived yourself.',
			['play_sound'] = true,
			['removable'] = true
		},
		['Re-fill Health'] = {
			['feature'] = (function()
				RiOT_var.natives.setEntityHealth(RiOT_var.datastore.pLocal.pedId, 200)
			end),
			['notification'] = true,
			['notification_text'] = 'You have re-filled your health.',
			['play_sound'] = true,
			['removable'] = true
		},
		['Re-fill Armour'] = {
			['feature'] = (function()
				RiOT_var.natives.setPedArmour(RiOT_var.datastore.pLocal.pedId, 200)
			end),
			['notification'] = true,
			['notification_text'] = 'You have re-filled your armour.',
			['play_sound'] = true,
			['removable'] = true
		},
		['Repair Vehicle'] = {
			['feature'] = RiOT_var.features.repairVehicle,
			['notification'] = true,
			['notification_text'] = 'You have repaired your vehicle.',
			['play_sound'] = true,
			['removable'] = true
		},
		['Nitro'] = {
			['feature'] = (function()
				if (RiOT_var.menuVars.vehicleOptions.nitro) then
					RiOT_var.features.runNitro(RiOT_var.datastore.pLocal.vehicle)
				end
			end),
			['notification'] = false,
			['notification_text'] = 'You have activated your nitro.',
			['play_sound'] = true,
			['key'] = pCitizen['keys']['LEFTALT'],
			['key_label'] = 'LEFTALT',
			['removable'] = true
		},
		['Triggerbot'] = {
			['feature'] = (function()
				RiOT_var.menuVars.weaponOptions.triggerbot = not RiOT_var.menuVars.weaponOptions.triggerbot
			end),
			['notification'] = true,
			['notification_text'] = 'You have toggled triggerbot.',
			['play_sound'] = true,
			['removable'] = true
		},
		['Debug View'] = {
			['feature'] = (function()
				RiOT_var.menuVars.selfOptions.debugView = not RiOT_var.menuVars.selfOptions.debugView
			end),
			['notification'] = true,
			['notification_text'] = 'You have toggled debug view.',
			['play_sound'] = true,
			['removable'] = true
		},
		['Spawn Vehicle'] = {
			['feature'] = (function()
				local aInput = RiOT_var.datastore.keyboardInputs['spawn_vehicle'] or 'adder'
				local modelHash = GetHashKey('adder')
				if (not RiOT_var.functions.strings.isNullOrEmpty(aInput)) and IsModelValid(aInput) and IsModelAVehicle(aInput) then
					modelHash = (type(aInput) == 'number' and aInput or GetHashKey(aInput))
				end

				pCitizen['createThread'](function()
					RiOT_var.features.spawnVehicle({hash = modelHash, setIn = true})
				end)
			end),
			['notification'] = true,
			['notification_text'] = 'You have spawned a vehicle.',
			['play_sound'] = true,
			['removable'] = true
		},
	}
end

RiOT_var.functions.drawEntityBoundingBox = function(entity, color, lines_color)
	color = color or {r = 150, g = 150, b = 150, a = 50}
	lines_color = lines_color or {r = 150, g = 150, b = 150, a = 50}
	color.a = 40
	if (RiOT_var.natives.doesEntityExist(entity)) then
		local model = GetEntityModel(entity)
		local min, max = GetModelDimensions(model)
		local top_front_right = GetOffsetFromEntityInWorldCoords(entity, max)
		local top_back_right = GetOffsetFromEntityInWorldCoords(entity, vector3(max.x, min.y, max.z))
		local bottom_front_right = GetOffsetFromEntityInWorldCoords(entity, vector3(max.x, max.y, min.z))
		local bottom_back_right = GetOffsetFromEntityInWorldCoords(entity, vector3(max.x, min.y, min.z))
		local top_front_left = GetOffsetFromEntityInWorldCoords(entity, vector3(min.x, max.y, max.z))
		local top_back_left = GetOffsetFromEntityInWorldCoords(entity, vector3(min.x, min.y, max.z))
		local bottom_front_left = GetOffsetFromEntityInWorldCoords(entity, vector3(min.x, max.y, min.z))
		local bottom_back_left = GetOffsetFromEntityInWorldCoords(entity, min)
		
		DrawLine(top_front_right, top_back_right, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(top_front_right, bottom_front_right, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(bottom_front_right, bottom_back_right, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(top_back_right, bottom_back_right, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(top_front_left, top_back_left, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(top_back_left, bottom_back_left, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(top_front_left, bottom_front_left, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(bottom_front_left, bottom_back_left, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(top_front_right, top_front_left, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(top_back_right, top_back_left, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(bottom_front_left, bottom_front_right, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		DrawLine(bottom_back_left, bottom_back_right, lines_color.r, lines_color.g, lines_color.b, lines_color.a)
		
		DrawPoly(top_front_left, top_front_right, bottom_front_right, color.r, color.g, color.b, color.a)
		DrawPoly(bottom_front_right, bottom_front_left, top_front_left, color.r, color.g, color.b, color.a)
		DrawPoly(top_front_right, top_front_left, top_back_right, color.r, color.g, color.b, color.a)
		DrawPoly(top_front_left, top_back_left, top_back_right, color.r, color.g, color.b, color.a)
		DrawPoly(top_back_right, top_back_left, bottom_back_right, color.r, color.g, color.b, color.a)
		DrawPoly(top_back_left, bottom_back_left, bottom_back_right, color.r, color.g, color.b, color.a)
		DrawPoly(top_back_left, top_front_left, bottom_front_left, color.r, color.g, color.b, color.a)
		DrawPoly(bottom_front_left, bottom_back_left, top_back_left, color.r, color.g, color.b, color.a)
		DrawPoly(top_front_right, top_back_right, bottom_front_right, color.r, color.g, color.b, color.a)
		DrawPoly(top_back_right, bottom_back_right, bottom_front_right, color.r, color.g, color.b, color.a)
		DrawPoly(bottom_front_left, bottom_front_right, bottom_back_right, color.r, color.g, color.b, color.a)
		DrawPoly(bottom_back_right, bottom_back_left, bottom_front_left, color.r, color.g, color.b, color.a)
	end
end

RiOT_var.functions.rayCastGamePlayCamera = function(data)
    local cameraRotation = RiOT_var.natives.getGameplayCamRot()
	local cameraCoord = RiOT_var.natives.getGameplayCamCoord()
	if data.camera ~= nil then
		cameraRotation = RiOT_var.natives.getCamRot(data.camera)
		cameraCoord = RiOT_var.natives.getCamCoord(data.camera)
	end
	local direction = RiOT_var.functions.math.rotationToDirection(cameraRotation)
	local destination = { 
		x = cameraCoord.x + direction.x * data.distance, 
		y = cameraCoord.y + direction.y * data.distance, 
		z = cameraCoord.z + direction.z * data.distance 
	}
	local retval, hit, endCoords, surfaceNormal, entityHit = RiOT_var.natives.getShapeTestResult(RiOT_var.natives.startShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, RiOT_var.datastore.pLocal.pedId, 0))
	return hit, endCoords, entityHit
end

RiOT_var.functions.isAnEntity = function(entity)
	return (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity))
end

RiOT_var.functions.friendsSystem = function(ptype, ped)
	local pFriendlies = RiOT_var.datastore.pTarget.friendlies
	if (ptype == 'add') then
		if (pFriendlies[ped]) then
			pFriendlies[ped] = nil
			SetPedAsEnemy(ped, true)
		else
			pFriendlies[ped] = true
			SetPedAsEnemy(ped, false)
		end
	elseif (ptype == 'is_friend') then
		if (pFriendlies[ped]) then
			return true
		else
			return false
		end
	end
end

RiOT_var.functions.networkEntity = function(entity)
	if not RiOT_var.natives.doesEntityExist(entity) then 
		return 
	end
	local id = nil
	if IsEntityAnObject(entity) then
		id = ObjToNet(entity)
	elseif IsEntityAVehicle(entity) then
		id = VehToNet(entity)
	end

	if id ~= nil then
		RiOT_var.natives.networkSetNetworkIdDynamic(id, true)
		RiOT_var.natives.setNetworkIdExistsOnAllMachines(id, true)
		RiOT_var.natives.setNetworkIdCanMigrate(id, false)
		for key, value in pairs(RiOT_var.natives.getActivePlayers()) do
			RiOT_var.natives.setNetworkIdSyncToPlayer(id, value, true)
		end
	else
		RiOT_var.notification('Could not network this entity with the server.')
	end
end

RiOT_var.functions.explodeEntity = function(entity)
	if (type(entity) == 'table') then
		for key, value in pairs(entity) do
			local _x, _y, _z = table.unpack(RiOT_var.natives.getEntityCoords(value))
			RiOT_var.natives.addExplosion(_x + 1, _y + 1, _z + 1, 7, math.random(49, 99), true, false, 0.0)
		end
	else
		local _x, _y, _z = table.unpack(RiOT_var.natives.getEntityCoords(entity))
		RiOT_var.natives.addExplosion(_x + 1, _y + 1, _z + 1, 7, math.random(49, 99), true, false, 0.0)
	end
end

RiOT_var.functions.getIntoVehicle = function(vehicle)
	if vehicle and RiOT_var.natives.doesEntityExist(vehicle) then
		if AreAnyVehicleSeatsFree(vehicle) then
			for index = -1, 4 do
				if IsVehicleSeatFree(vehicle, index) then
					SetPedIntoVehicle(RiOT_var.datastore.pLocal.pedId, vehicle, index)
					return
				end
			end
		else
			RiOT_var.notification('There are no free seats in the vehicle.')
			return
		end
	end
end

RiOT_var.functions.setOutfit = function(data)
	if (data.ped and RiOT_var.natives.doesEntityExist(data.ped)) then
		if (data.model) then
			SetPlayerModel(RiOT_var.datastore.pLocal.pId, data.model)
		end
		if (data.hat and data.hat_texture) then
			SetPedPropIndex(data.ped, 0, data.hat, data.hat_texture, 1)
		end
		if (data.glasses and data.glasses_texture) then
			SetPedPropIndex(data.ped, 1, data.glasses, data.glasses_texture, 1)
		end
		if (data.ear and data.ear_texture) then
			SetPedPropIndex(data.ped, 2, data.ear, data.ear_texture, 1)
		end
		if (data.watch and data.watch_texture) then
			SetPedPropIndex(data.ped, 6, data.watch, data.watch_texture, 1)
		end
		if (data.wrist and data.wrist_texture) then
			SetPedPropIndex(data.ped, 7, data.wrist, data.wrist_texture, 1)
		end
		if (data.head.draw and data.head.texture and data.head.palette) then
			SetPedComponentVariation(data.ped, 0, data.head.draw, data.head.texture, data.head.palette)
		end
		if (data.beard.draw and data.beard.texture and data.beard.palette) then
			SetPedComponentVariation(data.ped, 1, data.beard.draw, data.beard.texture, data.beard.palette)
		end
		if (data.hair.draw and data.hair.texture and data.hair.palette) then
			SetPedComponentVariation(data.ped, 2, data.hair.draw, data.hair.texture, data.hair.palette)
		end
		if (data.torso.draw and data.torso.texture and data.torso.palette) then
			SetPedComponentVariation(data.ped, 3, data.torso.draw, data.torso.texture, data.torso.palette)
		end
		if (data.legs.draw and data.legs.texture and data.legs.palette) then
			SetPedComponentVariation(data.ped, 4, data.legs.draw, data.legs.texture, data.legs.palette)
		end
		if (data.hands.draw and data.hands.texture and data.hands.palette) then
			SetPedComponentVariation(data.ped, 5, data.hands.draw, data.hands.texture, data.hands.palette)
		end
		if (data.feet.draw and data.feet.texture and data.feet.palette) then
			SetPedComponentVariation(data.ped, 6, data.feet.draw, data.feet.texture, data.feet.palette)
		end
		if (data.accessory_1.draw and data.accessory_1.texture and data.accessory_1.palette) then
			SetPedComponentVariation(data.ped, 7, data.accessory_1.draw, data.accessory_1.texture, data.accessory_1.palette)
		end
		if (data.accessory_2.draw and data.accessory_2.texture and data.accessory_2.palette) then
			SetPedComponentVariation(data.ped, 8, data.accessory_2.draw, data.accessory_2.texture, data.accessory_2.palette)
		end
		if (data.accessory_3.draw and data.accessory_3.texture and data.accessory_3.palette) then
			SetPedComponentVariation(data.ped, 9, data.accessory_3.draw, data.accessory_3.texture, data.accessory_3.palette)
		end
		if (data.mask.draw and data.mask.texture and data.mask.palette) then
			SetPedComponentVariation(data.ped, 10, data.mask.draw, data.mask.texture, data.mask.palette)
		end
		if (data.auxillary.draw and data.auxillary.texture and data.auxillary.palette) then
			SetPedComponentVariation(data.ped, 11, data.auxillary.draw, data.auxillary.texture, data.auxillary.palette)
		end
	end
end

RiOT_var.functions.isRiOT_varUser = function(ped)
	local retval = DecorGetBool(ped, 'RiOT_var')
	return retval
end

--[[
	RiOT String Functions
]]

RiOT_var.functions.strings.isNullOrEmpty = function(str) 
	return str == nil or str == ''
end

RiOT_var.functions.strings.getSafe = function(str)
	local returnStr = str
	if RiOT_var.functions.strings.isNullOrEmpty(str) then 
		return 'unknown string' 
	end
	returnStr = returnStr:gsub('%^', '\\^')
	returnStr = returnStr:gsub('%~', '\\~')
	returnStr = returnStr:gsub('%<', '«')
	returnStr = returnStr:gsub('%>', '»')
	if string.len(returnStr) > 16 then
		local fmt = string.sub(returnStr, 1, 16)
		return tostring(fmt .. '...')
	else
		return returnStr
	end

end

RiOT_var.functions.strings.split = function(source, delimiters)
	local elements = {}
	local pattern = '([^'..delimiters..']+)'
	string.gsub(source, pattern, function(value) elements[#elements + 1] = value end)
	return elements
end

--[[
	RiOT Math Functions
]]

RiOT_var.functions.math.round = function(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end

RiOT_var.functions.math.groupDigits = function(value)
	local locale_digit_grouping_symbol = ','
	local left,num,right = string.match(value,'^([^%d]*%d)(%d*)(.-)$')

	return left..(num:reverse():gsub('(%d%d%d)','%1' .. locale_digit_grouping_symbol):reverse())..right
end

RiOT_var.functions.math.trim = function(value)
	if value then
		return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
	else
		return nil
	end
end

RiOT_var.functions.math.rotationToDirection = function(rotation)
	local adjustedRotation = { 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = {
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

RiOT_var.functions.math.rotationToDirection2 = function(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

RiOT_var.functions.math.rotToQuat = function(rot)
	local pitch = math.rad(rot.x)
	local roll  = math.rad(rot.y)
	local yaw   = math.rad(rot.z)
	
    local cy = math.cos(yaw   * 0.5)
	local sy = math.sin(yaw   * 0.5)
	local cr = math.cos(roll  * 0.5)
	local sr = math.sin(roll  * 0.5)
	local cp = math.cos(pitch * 0.5)
	local sp = math.sin(pitch * 0.5)

	return quat(cy * cr * cp + sy * sr * sp, cy * sp * cr - sy * cp * sr, cy * cp * sr + sy * sp * cr, sy * cr * cp - cy * sr * sp)
end

RiOT_var.functions.math.getCamForwardVector = function(cam)
	local coords  = RiOT_var.natives.getCamCoord(cam)
	local rot     = RiOT_var.natives.getCamRot(cam)

	return RiOT_var.functions.math.rotToQuat(rot) * vector3(0.0, 1.0, 0.0)
end

RiOT_var.functions.math.getCamRightVector = function(cam)
	local coords  = RiOT_var.natives.getCamCoord(cam)
	local rot     = RiOT_var.natives.getCamRot(cam)
	local qrot    = quat(0.0, vector3(rot.x, rot.y, rot.z))

	return RiOT_var.functions.math.rotToQuat(rot) * vector3(1.0, 0.0, 0.0)
end

--[[
	RiOT Table Functions
]]

RiOT_var.functions.tables.length = function(gTable)
	if gTable == nil then
        return 0
    end
    local count = 0
    for _ in pairs(gTable) do count = count + 1 end
    return count
end

RiOT_var.functions.tables.dump = function(gTable)
	if type(gTable) == 'table' then
		local s = '{ '
		for key,value in pairs(gTable) do
			if type(key) ~= 'number' then key = '"'..key..'"' end
			s = s .. '['..key..'] = ' .. RiOT_var.functions.tables.dump(value) .. ','
		end
		return s .. '} '
	else
		return tostring(gTable)
	end
end

RiOT_var.functions.tables.contains = function(gTable, pvalue)
    for _, value in pairs(gTable) do
        if (value == pvalue) then
            return (true)
        end
    end
    return (false)
end

RiOT_var.functions.tables.removeValue = function(gTable, pvalue)
	for key, value in pairs(gTable) do
		if (value == pvalue) then
			table.remove(gTable, key)
		end
	end
end

RiOT_var.functions.tables.removeKey = function(gTable, pkey)
    local element = gTable[pkey]
    gTable[pkey] = nil
    return (element)
end

--[[Handle garbage collection]]
pCitizen['createThread'](function()
	while (RiOT_var.shouldShowMenu) do 
		pCitizen['wait'](30000)
		collectgarbage()

		--[[if RiOT_var.datastore.spawnedObjects and #RiOT_var.datastore.spawnedObjects > 0 then
			for key, value in pairs(RiOT_var.datastore.spawnedObjects) do
				if not RiOT_var.natives.doesEntityExist(value.handle) then
					RiOT_var.functions.tables.removeValue(RiOT_var.datastore.spawnedObjects, value)
				end
			end
		end]]
	end
end)