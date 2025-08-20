------------MOD CODE -------------------------

--- Every played card counts in scoring

Jokebox = {}
Jokebox_Mod = SMODS.current_mod
Jokebox_Config = Jokebox_Mod.config

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

---jevil moving
SMODS.DrawStep {
    key = 'insj_jevil_chaos',
    order = 100,
    func = function(card)
        if card.config.center.key == "j_insj_jevil" then
            if not G.insj_jevil_soul then
                G.insj_jevil_soul = Sprite(0, 0, G.CARD_W, G.CARD_H,
                    G.ASSET_ATLAS["insj_JokeboxJevil"], { x = 0, y = 0 })
            end

            G.insj_jevil_soul:set_sprite_pos({ x = math.floor(G.TIMERS.REAL * 10) % 8, y = 1 })

            G.insj_jevil_soul.role.draw_major = card
            G.insj_jevil_soul:draw_shader('dissolve', nil, nil, nil, card.children.center, 1, 0, 0, 0)
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

---removing stuff from tables by key
function table.insjremovekey(table, key)
    local element = table[key]
    table[key] = nil
    return element
end

---split string at symbol (thanks Meta, Rock Muncher)
function insj_string_split(string, symbol)
	local index = string.find(string, symbol)
	local string1 = string.sub(string, 1, index - 1)
	local string2 = string.sub(string, index + 1, -1)
	return string1, string2
end

SMODS.load_file("items/Jokers.lua")()

if Jokebox_Config.FileSystem == true then
	SMODS.load_file("items/FileSystem.lua")()
end
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

---jevil noises
SMODS.Sound({
	key = "jevil_music",
	path = "world_revolving.mp3",
	sync = false,
	pitch = 1,
	select_music_track = function()
		return next(find_joker("j_insj_jevil"))
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

		}
	}
end

----------------------------------------------
------------MOD CODE END----------------------
