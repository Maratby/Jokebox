SMODS.Joker {
	key = "getwellsoon",
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	config = { extra = { count = 0, levels = 5, countmax = 7 } },
	atlas = "JokeboxJokers",
	pos = { x = 0, y = 0 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.countmax, card.ability.extra.levels, card.ability.extra.count } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 7 then
				card.ability.extra.count = card.ability.extra.count + 1
			end
		end
		if context.after then
			while card.ability.extra.count > card.ability.extra.countmax do
				if card.ability.extra.count > card.ability.extra.countmax then
					card.ability.extra.count = card.ability.extra.count - card.ability.extra.countmax
					G.E_MANAGER:add_event(Event({
						blockable = true,
						blocking = true,
						func = (function()
							level_up_hand(card, 'Straight', false, 5)
							level_up_hand(card, 'Straight Flush', false, 5)
							return true
						end)
					}))
				end
			end
		end
	end
}


SMODS.Joker {
	key = "offcamera",
	rarity = 2,
	cost = 10,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	config = { extra = { odds = 4 } },
	atlas = "JokeboxJokers",
	pos = { x = 2, y = 0 },
	add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			add_tag(Tag('tag_rare'))
		end
	end,
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
			'Jokebox-Off-Camera-Mining')
		return { vars = { new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)
		if context.selling_card and context.card == card then
			if SMODS.pseudorandom_probability(card, 'IdleDeathGamble', 1, card.ability.extra.odds, 'Jokebox-off-camera-mining') then
				add_tag(Tag('tag_rare'))
			end
		end
	end
}

SMODS.Joker {
	key = "blue_eyes",
	pos = { x = 3, y = 0 },
	atlas = "JokeboxJokers",
	rarity = 1,
	blueprint_compat = true,
	discovered = true,
	cost = 2,
	config = { extra = { mult = 4 }, },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}

SMODS.Joker {
	key = "gd_colon",
	pos = { x = 0, y = 3 },
	atlas = "JokeboxBetter2X",
	rarity = 1,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = false,
	rental_compat = false,
	eternal_compat = false,
	cost = 4,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
			if context.other_card == G.play.cards[#G.play.cards] then
				return {
					repetitions = 1
				}
			end
		end
	end,
}

SMODS.Joker {
	key = "birthday",
	pos = { x = 0, y = 1 },
	atlas = "JokeboxJokers",
	rarity = 2,
	blueprint_compat = true,
	discovered = true,
	cost = 6,
	config = { extra = { xmult = 2 }, },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}

SMODS.Joker {
	key = "compare_number",
	pos = { x = 4, y = 1 },
	atlas = "JokeboxJokers",
	rarity = 3,
	blueprint_compat = true,
	discovered = true,
	cost = 8,
	config = { extra = { xmult = 3 }, },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and Talisman then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}

SMODS.Joker {
	key = "buffed_joker",
	pos = { x = 4, y = 0 },
	atlas = "JokeboxJokers",
	rarity = 1,
	discovered = true,
	blueprint_compat = true,
	immutable = true,
	cost = 8,
	config = { extra = { hands = 8, handsmax = 8, sizechange = 0 }, },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.handsmax, card.ability.extra.hands } }
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.sizechange = G.hand.config.card_limit - 1
		G.hand:change_size(-card.ability.extra.sizechange)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.sizechange)
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = 0.5
			}
		end
		if context.setting_blind then
			card.ability.extra.hands = card.ability.extra.handsmax
		end
		if context.after and card.ability.extra.hands <= card.ability.extra.handsmax then
			G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * 0.1)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			card.ability.extra.hands = card.ability.extra.hands - 1
			card:juice_up()
		end
	end,
}


SMODS.Joker {
	key = "anvil_shaped",
	blueprint_compat = true,
	perishable_compat = false,
	discovered = true,
	rarity = 1,
	cost = 7,
	atlas = "JokeboxJokers",
	pos = { x = 1, y = 0 },
	config = { extra = { modifier = 1, mult = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.modifier, card.ability.extra.mult } }
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.modifier
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.modifier
	end,
	calculate = function(self, card, context)
		if context.discard then
			local prev_mult = card.ability.extra.mult
			card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.modifier
			if card.ability.extra.mult ~= prev_mult then
				return {
					message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.modifier } },
					colour = G.C.RED
				}
			end
		end
		if context.before and context.main_eval and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.modifier * #G.play.cards
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.modifier * #G.play.cards } }
			}
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}

SMODS.Joker {
	key = "get_you",
	blueprint_compat = false,
	discovered = true,
	rarity = 2,
	cost = 7,
	atlas = "JokeboxBetter2X",
	pos = { x = 0, y = 0 },
	loc_vars = function(self, info_queue, card)
	end,
	calculate = function(self, card, context)
		if context.before then
			local winflag
			local queensuit1 = "no"
			for _, scored_card in ipairs(context.scoring_hand) do
				if scored_card:get_id() == 12 then
					if queensuit1 == "no" then
						queensuit1 = scored_card.base.suit
						scored_card.insj_gotten = true
					else
						if scored_card.base.suit ~= queensuit1 then
							winflag = true
							scored_card.insj_gotten = true
							break
						end
					end
				end
			end
			if winflag == true then
				add_tag(Tag('tag_rare'))
			end
		end
		if context.destroying_card then
			if context.destroying_card.insj_gotten == true then
				return { remove = true }
			end
		end
	end
}

SMODS.Joker {
	key = "9_min_crusade",
	blueprint_compat = false,
	discovered = true,
	rarity = 2,
	cost = 7,
	atlas = "JokeboxBetter2X",
	pos = { x = 1, y = 0 },
	loc_vars = function(self, info_queue, card)
	end,
	calculate = function(self, card, context)
		if context.before and (next(context.poker_hands['Two Pair']) or next(context.poker_hands['Full House'])) then
			card:juice_up()
			play_sound("insj_two-pair", 1, 2)
		end
		if context.after and (next(context.poker_hands['Two Pair']) or next(context.poker_hands['Full House'])) then
			G.E_MANAGER:add_event(Event({
				blockable = true,
				blocking = true,
				func = function()
					card:juice_up()
					play_sound("insj_Exodia", 1, 2)
					return true
				end
			}))
			if math.random(1, 2) == 1 then
				---lose run
				G.E_MANAGER:add_event(Event({
					blockable = true,
					blocking = true,
					func = function()
						G.STATE = G.STATES.GAME_OVER
						if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
							G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
						end
						G:save_settings()
						G.FILE_HANDLER.force = true
						G.STATE_COMPLETE = false
						return true
					end
				}))
			else
				---win run
				win_game()
				G.GAME.won = true
			end
		end
	end
}

SMODS.Joker {
	key = "eekum_jokum",
	pos = { x = 2, y = 0 },
	atlas = "JokeboxBetter2X",
	rarity = 2,
	blueprint_compat = false,
	immutable = true,
	cost = 8,
	config = { tally = 0, tallymax = 5 },
	loc_vars = function(self, info_queue, card)
		if Jokebox_Config.Eekum_Toggle == true then
			info_queue[#info_queue + 1] = { key = "j_insj_fake_idol", set = "Other" }
			info_queue[#info_queue + 1] = { key = "j_insj_fake_trading", set = "Other" }
		end
		return { vars = { card.ability.tally, card.ability.tallymax } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.main_eval and not context.blueprint then
			card.ability.tally = card.ability.tally + 1
			if card.ability.tally >= card.ability.tallymax then
				local eval = function(card) return card.ability.tally <= card.ability.tallymax end
				juice_card_until(card, eval, true)
			end
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.GREEN,
				card = card
			}
		end
		if context.selling_self and card.ability.tally >= card.ability.tallymax and not context.blueprint then
			play_sound("insj_eekum_bokum", 1, 1)
			Jokebox_Cardmaker(false, false, "j_idol")
			Jokebox_Cardmaker("e_negative", false, "j_trading")
		end
	end,
}

SMODS.Joker {
	key = "demoknight",
	pos = { x = 3, y = 0 },
	atlas = "JokeboxBetter2X",
	rarity = 3,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = false,
	rental_compat = false,
	immutable = true,
	cost = 9,
	config = { xmult = 1.75 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.xmult } }
	end,
	set_ability = function(self, card, initial, delay_sprites)
		card.ability.rental = nil
		card.ability.perishable = nil
		card.pinned = nil
	end,
	remove_from_deck = function(self, card, from_debuff)
		for index, value in ipairs(G.jokers.cards) do
			if value.pinned then
				value.pinned = nil
			end
		end
		card.pinned = false
		card.ability.eternal = false
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			for index, value in ipairs(G.jokers.cards) do
				if value.pinned then
					value.pinned = nil
				end
			end
			card.pinned = true
			card.ability.eternal = true
		end
		if context.before and not context.blueprint then
			card.pinned = nil
			G.E_MANAGER:add_event(Event({
				blockable = true,
				blocking = true,
				func = function()
					card:juice_up()
					local temp = math.random(1, 3)
					play_sound("insj_demoknight-" .. temp, 1, 1)
					return true
				end
			}))
			local my_pos
			for index, value in ipairs(G.jokers.cards) do
				if value == card then
					my_pos = index
				end
			end
			if G.jokers.cards[my_pos + 1] then
				G.E_MANAGER:add_event(Event({
				blockable = true,
				blocking = true,
				func = function()
					card:juice_up()
					G.jokers.cards[my_pos + 1].pinned = true
					card.pinned = true
					return true
				end
			}))
			else
				SMODS.debuff_card(card, true, "demoknight-tf2")
				for index, value in ipairs(G.jokers.cards) do
					if value.pinned then
						value.pinned = nil
					end
				end
				card.pinned = false
				card.ability.eternal = false
			end
		end
		if context.other_joker and context.other_joker.pinned then
			return {
				xmult = card.ability.xmult,
				message_card = context.other_joker
			}
		end
		if context.end_of_round and context.main_eval then
			for index, value in ipairs(G.jokers.cards) do
				if value.pinned then
					value.pinned = nil
				end
			end
			card.pinned = false
			card.ability.eternal = false
		end
	end,
}

SMODS.Joker {
	key = "smack",
	pos = { x = 1, y = 1 },
	atlas = "JokeboxJokers",
	rarity = 2,
	blueprint_compat = true,
	discovered = true,
	cost = 6,
	config = { extra = { xmult = 1, xmult_gain = 0.75 }, },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_insj_jibnor
		return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			local my_pos = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					my_pos = i
					break
				end
			end
			if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
				local sliced_card = G.jokers.cards[my_pos + 1]
				if sliced_card.config.center.key ~= "j_insj_jibnor" then
					sliced_card.getting_sliced = true
					G.GAME.joker_buffer = G.GAME.joker_buffer - 1
					G.E_MANAGER:add_event(Event({
						func = function()
							G.GAME.joker_buffer = 0
							card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
							card:juice_up(1.5, 2)
							---replace sliced_card with Jibnor
							Jokebox.change_card(sliced_card, "j_insj_jibnor")
							sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
							play_sound('insj_pan', 1, 1)
							return true
						end
					}))
				end
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}

SMODS.Joker {
	key = "jibnor",
	pos = { x = 2, y = 1 },
	atlas = "JokeboxJokers",
	rarity = "insj_dented",
	blueprint_compat = true,
	no_collection = true,
	discovered = true,
	cost = -2,
	config = { extra = { mult = -4 }, },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if card.sell_cost >= 0 then
			card.sell_cost = card.sell_cost * -1
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}

SMODS.Joker {
	key = "job_app",
	pos = { x = 4, y = 0 },
	atlas = "JokeboxBetter2X",
	rarity = 2,
	blueprint_compat = true,
	discovered = true,
	cost = 0,
	add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			ease_dollars(-10)
		end
	end,
	calculate = function(self, card, context)
		card.sell_cost = -10
		if context.end_of_round and context.beat_boss and context.main_eval and to_number(G.GAME.dollars) < 10000 then
			ease_dollars(-to_big((to_number(G.GAME.dollars) * 0.05)))
		end
		if context.before and (next(context.poker_hands['Straight Flush'])) then
			ease_dollars(to_big((to_number(G.GAME.dollars) * 0.25)))
		end
	end
}

SMODS.Joker {
	key = "marie",
	pos = { x = 0, y = 1 },
	soul_pos = { x = 0, y = 2 },
	atlas = "JokeboxBetter2X",
	rarity = 4,
	blueprint_compat = false,
	discovered = false,
	cost = 20,
	config = { eaten = 0, blind_rates = 1, extra = { BP = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.eaten } }
	end,
	calculate = function(self, card, context)
		if context.after then
			G.E_MANAGER:add_event(Event({
				blockable = true,
				blocking = true,
				func = function()
					card:juice_up()
					local temp = G.GAME.chips
					local temprand = math.random(5, 10) / 100
					G.GAME.chips = G.GAME.chips - G.GAME.chips * temprand
					card.ability.eaten = temp - G.GAME.chips
					print(card.ability.eaten)
					return true
				end
			}))
		end
		if context.before then
			card.ability.blind_rates = 300 / G.GAME.blind.chips
		end
		if context.end_of_round then
			card.ability.eaten = card.ability.eaten * card.ability.blind_rates
			while card.ability.eaten >= 100 do
				card.ability.eaten = card.ability.eaten - 100
				card.ability.extra.BP = card.ability.extra.BP + 1
			end
		end
		if context.joker_main then
			local temptally = 1
			if Tsunami then
				temptally = temptally + 1
			end
			if Referee then
				temptally = temptally + 1
			end
			if Splatro then
				temptally = temptally + 1
			end
			if Fortune then
				temptally = temptally + 1
			end
			if Tsunami then
				temptally = temptally + 1
			end
			if Compendium then
				temptally = temptally + 1
			end
			xchips = 2 * temptally
		end
	end
}


local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
	local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
	if not ret and not SMODS.has_no_suit(self) and next(SMODS.find_card("j_insj_marie")) then
		return true
	end
	return ret
end

SMODS.Joker {
	key = 'jevil',
	config = { modifier = 99, extra = { timer = 0 } },
	discovered = false,
	rarity = 4,
	cost = 20,
	atlas = 'JokeboxJevil',
	pos = { x = 0, y = 0 },
	blueprint_compat = false,

	add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.modifier)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.modifier
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.modifier
		SMODS.change_play_limit(card.ability.modifier)
		SMODS.change_discard_limit(card.ability.modifier)
		change_shop_size(20)
		---more boosters_in_shop
		G.GAME.modifiers.extra_boosters = (G.GAME.modifiers.extra_boosters or 0) + 10
		if G.shop_booster and G.shop_booster.cards then
			G.shop_booster.config.card_limit = G.GAME.starting_params.boosters_in_shop +
				(G.GAME.modifiers.extra_boosters or 0)
			for i = #G.shop_booster.cards + 1, G.shop_booster.config.card_limit do
				G.GAME.current_round.used_packs[i] = get_pack('shop_pack').key
				local card = Card(G.shop_booster.T.x + G.shop_booster.T.w / 2,
					G.shop_booster.T.y, G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
					G.P_CENTERS[G.GAME.current_round.used_packs[i]],
					{ bypass_discovery_center = true, bypass_discovery_ui = true })
				create_shop_card_ui(card, 'Booster', G.shop_booster)
				card.ability.booster_pos = i
				G.shop_booster:emplace(card)
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.hand.config.card_limit < 100 then
			G.hand.config.card_limit = 1
		else
			G.hand:change_size(-card.ability.modifier)
		end
		G.GAME.modifiers.extra_boosters = math.max(G.GAME.modifiers.extra_boosters - 10, 0)

		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.modifier
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.modifier
		SMODS.change_play_limit(-card.ability.modifier)
		SMODS.change_discard_limit(-card.ability.modifier)
		change_shop_size(-20)
	end,
	update = function(self, card)
		---this if statement makes jevil not do this in the collection, because it was really fucking annoying
		if not Jokebox.in_collection(card) then
			---code that fucks up the UI
			local extra = card.ability.extra
			local fps = 0.04 -- corruption speed higher number is faster lower number is more extreme but slower
			local current_time = G.TIMERS.REAL
			extra.timer = (extra.timer or 0) + G.TIMERS.REAL
			if extra.timer >= (2.5 / fps) then
				extra.timer = 0
				G.TIMERS.REAL = 0
			end
		end
	end,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
			return {
				repetitions = math.random(1, 5),
			}
		end
	end
}
