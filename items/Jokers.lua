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
		if card and card.area then
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
