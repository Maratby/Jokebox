------------MOD CODE -------------------------

--- Every played card counts in scoring

Jokebox = {}
Jokebox_Mod = SMODS.current_mod
Jokebox_Config = Jokebox_Mod.config

---it's a surprise tool that will help us later
SMODS.current_mod.optional_features = function()
	return { retrigger_joker = true }
end

SMODS.Atlas {
	key = "JokeboxJokers",
	path = "jokers.png",
	px = 71,
	py = 95,
}

---jevil
SMODS.Atlas {
	key = "JokeboxJevil",
	path = "jevil.png",
	px = 71,
	py = 95,
}

---better 2x sprites for some jokers
SMODS.Atlas {
	key = "JokeboxBetter2X",
	path = "Better2X.png",
	px = 71,
	py = 95,
}

---check if card in collection (thanks minty and or pokermon)
Jokebox.in_collection = function(card)
	if G.your_collection then
		for k, v in pairs(G.your_collection) do
			if card.area == v then
				return true
			end
		end
	end
	return false
end

---get percentage from two values
Jokebox.Get_Percentage = function(num1, num2)
	local temp1 = num2 / num1
	local temp2 = temp1 * 100
	return math.floor(temp2 + 0.5)
end

---Adds a dummy function that does nothing if Talisman isn't loaded, lets me avoid having Talisman be a dependency
---and avoid crashes if Talisman is loaded
to_big = to_big or function(num)
	return num
end
to_number = to_number or function(num)
	return num
end


---jevil moving thanks N Joyousspring
SMODS.DrawStep {
	key = 'jkbx_jevil_chaos',
	order = 100,
	func = function(card)
		if card.config.center.key == "j_jkbx_jevil" then
			if not G.jkbx_jevil_soul then
				G.jkbx_jevil_soul = Sprite(0, 0, G.CARD_W, G.CARD_H,
					G.ASSET_ATLAS["jkbx_JokeboxJevil"], { x = 0, y = 0 })
			end

			G.jkbx_jevil_soul:set_sprite_pos({ x = math.floor(G.TIMERS.REAL * 10) % 8, y = 1 })

			G.jkbx_jevil_soul.role.draw_major = card
			G.jkbx_jevil_soul:draw_shader('dissolve', nil, nil, nil, card.children.center, 1, 0, 0, 0)
		end
	end,
	conditions = { vortex = false, facing = 'front' },
}

---enter an edition in _edition to set edition, enter true or false in eternal to set eternal
function Jokebox_Cardmaker(_edition, eternal, _key)
	local _card = SMODS.create_card({
		area = G.jokers,
		key = _key
	})
	if _edition == "e_negative" or _edition == "negative" then
		_card:set_edition({ negative = true }, nil)
		_card.edition.negative = true
	end
	if eternal then
		_card.ability.eternal = true
	end
	_card:add_to_deck()
	G.jokers:emplace(_card)
	return _card
end

---Deck key finder
function Jokebox_Deck_Check()
	if Galdur and Galdur.config.use and Galdur.run_setup.choices.deck then
		return Galdur.run_setup.choices.deck.effect.center.key
	elseif G.GAME.viewed_back then
		return G.GAME.viewed_back.effect.center.key
	elseif G.GAME.selected_back then
		return G.GAME.selected_back.effect.center.key
	end
	return "b_red"
end

---function for merging tables. MOVES VALUES FROM TABLE1 TO TABLE2!!!!	
function Jokebox.table_merge(table1, table2)
	for _, value in ipairs(table1) do
		table.insert(table2, value)
	end
end

---removing stuff from tables by key
function table.jkbxremovekey(table, key)
	local element = table[key]
	table[key] = nil
	return element
end

---split string at symbol (thanks Meta, Rock Muncher)
function jkbx_string_split(string, symbol)
	local index = string.find(string, symbol)
	local string1 = string.sub(string, 1, index - 1)
	local string2 = string.sub(string, index + 1, -1)
	return string1, string2
end

SMODS.load_file("items/Jokers.lua")()

if Jokebox_Config.FileSystem == true then
	SMODS.load_file("items/FileSystem.lua")()
end


---Dented rarity
SMODS.Rarity {
	key = "jkbx_dented",
	default_weight = 0,
	badge_colour = G.C.RED,
	pools = { ["Joker"] = false },
	get_weight = function(self, weight, object_type)
		return weight
	end,
}

---Special rarity
SMODS.Rarity {
	key = "jkbx_special",
	default_weight = 0,
	badge_colour = G.C.DARK_EDITION,
	pools = { ["Joker"] = false },
	get_weight = function(self, weight, object_type)
		return weight
	end,
}
---hook for playing more than 6 cards at a time
local canplayref = G.FUNCS.can_play
G.FUNCS.can_play = function(e)
	canplayref(e) ---complete function hook
	if #G.hand.highlighted <= G.hand.config.highlighted_limit then
		if #G.hand.highlighted > 5 then
			e.config.colour = G.C.BLUE
			e.config.button = 'play_cards_from_highlighted'
		end
	end
end

---hook for undebuffing Demoknight at end of round
local end_round_ref = end_round
function end_round()
	for index, value in ipairs(G.jokers.cards) do
		if value.config.center.key == "j_jkbx_demoknight" then
			SMODS.debuff_card(value, false, "demoknight-tf2")
		end
	end
	end_round_ref()
end

---function for spawning vouchers
function compend_redeem_voucher(local_voucher, _delay)
	local voucher_card = SMODS.create_card({ area = G.play, key = local_voucher })
	voucher_card:start_materialize()
	voucher_card.cost = 0
	G.play:emplace(voucher_card)
	delay(0.3)
	voucher_card:redeem()
	G.E_MANAGER:add_event(Event({
		trigger = 'after',
		delay = _delay or 0.8,
		func = function()
			voucher_card:start_dissolve()
			return true
		end
	}))
end

---function for swapping a joker out for a new one
function Jokebox.change_card(card_object, new_card_key, transfer_ability, extra)
	local old_ability = 0
	if transfer_ability then
		if extra then
			old_ability = card_object.ability.extra[transfer_ability]
		else
			old_ability = card_object.ability[transfer_ability]
		end
	end
	card_object:set_ability(G.P_CENTERS[new_card_key])
	if transfer_ability then
		if extra then
			card_object.ability.extra[transfer_ability] = old_ability
		else
			card_object.ability[transfer_ability] = old_ability
		end
	end
	card_object:juice_up()
end

---function for removing all stickers (thanks minty)
Jokebox.Stickerclear = function(target)
	local stickers = SMODS.stickers
	target.ability.rental = false
	target.ability.perishable = false
	target.ability.eternal = false
	target.pinned = false
	if stickers ~= nil then
		for k, v in pairs(SMODS.stickers) do
			if target.ability[k] then
				if v.removed then v:removed(target) end --Patch for Gemstones; I don't think this is universal
				target:remove_sticker(k)
			end
		end
	end
end
---jevil noises
SMODS.Sound({
	key = "jevil_music",
	path = "world_revolving.mp3",
	sync = false,
	pitch = 1,
	select_music_track = function()
		return next(find_joker("j_jkbx_jevil"))
	end,
})

---other sounds

SMODS.Sound({
	key = "two-pair",
	path = "two_pair.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "Exodia",
	path = "EXODIA.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "eekum_bokum",
	path = "eekum_bokum.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "demoknight-1",
	path = "tf2-demoman-charge-sound-1.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "demoknight-2",
	path = "tf2-demoman-charge-sound-2.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "demoknight-3",
	path = "tf2-demoman-charge-sound-3.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "pan",
	path = "pan.mp3",
	pitch = 1,
})


SMODS.Sound({
	key = "winton-1",
	path = "winton\\winton-1.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-2",
	path = "winton\\winton-2.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-3",
	path = "winton\\winton-3.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-4",
	path = "winton\\winton-4.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-5",
	path = "winton\\winton-5.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-6",
	path = "winton\\winton-6.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-7",
	path = "winton\\winton-7.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-rare",
	path = "winton\\winton-rare.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-sell-1",
	path = "winton\\winton-sell-1.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-sell-2",
	path = "winton\\winton-sell-2.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "winton-sell-3",
	path = "winton\\winton-sell-3.ogg",
	pitch = 1,
})

SMODS.Sound({
	key = "armed_dangerous",
	path = "again.mp3",
	pitch = 1,
})

SMODS.Sound({
	key = "kaboom_JKBX",
	path = "deltarune-explosion.mp3",
	pitch = 1,
})
---Config UI

Jokebox_Mod.config_tab = function()
	return {
		n = G.UIT.ROOT,
		config = { align = "m", r = 0.1, padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 6 },
		nodes = {
			{ n = G.UIT.R, config = { align = "cl", padding = 0, minh = 0.1 }, nodes = {} },

			{
				n = G.UIT.R,
				config = { align = "cl", padding = 0 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cl", padding = 0.05 },
						nodes = {
							create_toggle { col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = Jokebox_Config, ref_value = "FileSystem" },
						}
					},
					{
						n = G.UIT.C,
						config = { align = "c", padding = 0 },
						nodes = {
							{ n = G.UIT.T, config = { text = "Enable file system searches (WINDOWS ONLY)", scale = 0.5, colour = G.C.UI.TEXT_LIGHT } },
						}
					},
				}
			},

			{
				n = G.UIT.R,
				config = { align = "cl", padding = 0 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cl", padding = 0.05 },
						nodes = {
							create_toggle { col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = Jokebox_Config, ref_value = "Eekum_Toggle" },
						}
					},
					{
						n = G.UIT.C,
						config = { align = "c", padding = 0 },
						nodes = {
							{ n = G.UIT.T, config = { text = "Enable \"Eekum Bokum\"'s info_queues (they crash sometimes?)", scale = 0.5, colour = G.C.UI.TEXT_LIGHT } },
						}
					},
				}
			},

		}
	}
end

----------------------------------------------
------------MOD CODE END----------------------
