---Jokers relating to or directly interacting with your computer's filesystem. Designed for Windows


---You can change this directory to your main Steam installation directory if you insstalled games to a non-default location
---Make sure it points to steamapps\common specifically
Jokebox.Steam_Directory = "C:\\Program Files (x86)\\Steam\\steamapps\\common"

---Isolate profile names

jkbx_Profile_Table = NFS.getDirectoryItems("C:/Users")


table.jkbxremovekey(jkbx_Profile_Table, "All Users")
table.jkbxremovekey(jkbx_Profile_Table, "Default")
table.jkbxremovekey(jkbx_Profile_Table, "Default User")
table.jkbxremovekey(jkbx_Profile_Table, "Public")
table.jkbxremovekey(jkbx_Profile_Table, "desktop.ini")

---Get the path of the Balatro Mods folder
local mod_path = "" .. SMODS.current_mod.path
Jokebox.path = mod_path

local mods_path_temp = Jokebox.string_split(Jokebox.path, "Mods")
Jokebox.mods_folder_path = string.sub(mods_path_temp, 1, #mods_path_temp) .. "Mods"

Jokebox.Get_Completion_Percentages = function()
	local temp0 = G.PROFILES[G.SETTINGS.profile].progress
	local temp1 = Jokebox.Get_Percentage(temp0.challenges.of, temp0.challenges.tally)
	local temp2 = Jokebox.Get_Percentage(temp0.joker_stickers.of, temp0.joker_stickers.tally)
	local temp3 = Jokebox.Get_Percentage(temp0.deck_stakes.of, temp0.deck_stakes.tally)
	local temp4 = Jokebox.Get_Percentage(temp0.discovered.of, temp0.discovered.tally)
	return { temp1, temp2, temp3, temp4 }
end

---Notepad Joker
SMODS.Joker {
	key = "notepad",
	pos = { x = 0, y = 2 },
	soul_pos = { x = 0, y = 3 },
	atlas = "JokeboxJokers",
	rarity = 4,
	discovered = false,
	blueprint_compat = true,
	cost = 20,
	config = { extra = { xmod = 0.1, }, },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmod, #NFS.getDirectoryItems(Jokebox.mods_folder_path .. "\\lovely\\log"), #NFS.getDirectoryItems(Jokebox.mods_folder_path) - 2 } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local log_size = NFS.getDirectoryItems(Jokebox.mods_folder_path .. "\\lovely\\log")
			local modsfolder_size = NFS.getDirectoryItems(Jokebox.mods_folder_path)
			return {
				xmult = 1 + card.ability.extra.xmod * #log_size,
				---mods folder size is reduced by 2 because of Steamodded and Lovely being required to load mods
				---they do not count as mods for this effect, and people will always have them, soooo...
				xchips = 1 + card.ability.extra.xmod * #modsfolder_size - 2
			}
		end
	end
}


---Mantis code

Jokebox.Mantis_Games = {}
Jokebox.Mantis_Games.List = NFS.getDirectoryItems(Jokebox.Steam_Directory)
for index, value in ipairs(Jokebox.Mantis_Games.List) do
	if value == "Steamworks Shared" or value == "Steam Controller Configs" then
		Jokebox.Mantis_Games.List[index] = nil
	end
	Jokebox.Mantis_Games[value] = true
end

Jokebox.Mantis_Games.Quip = "You! You doubt my power?"

function jkbx_Mantis_Quipcheck()
	if #Jokebox.Mantis_Games.List >= 100 then
		Jokebox.Mantis_Games.Quip = "Your mind is disgustingly populated."
	elseif #Jokebox.Mantis_Games.List >= 50 then
		Jokebox.Mantis_Games.Quip = "You have quite the backlog, don't you?"
	elseif #Jokebox.Mantis_Games.List >= 30 then
		Jokebox.Mantis_Games.Quip = "You've spent... How much money?"
	elseif not Jokebox.Mantis_Games["Balatro"] then
		Jokebox.Mantis_Games.Quip = "Piracy is a serious crime.." ---hi internal code readers
	elseif #Jokebox.Mantis_Games.List <= 1 then
		Jokebox.Mantis_Games.Quip = "Why? Why can't I read your mind?"
	elseif #Jokebox.Mantis_Games.List <= 5 then
		Jokebox.Mantis_Games.Quip = "Your mind is almost completely clean..."
	elseif #Jokebox.Mantis_Games.List <= 10 then
		Jokebox.Mantis_Games.Quip = "Are you trying to reach someone, or something?"
	elseif #Jokebox.Mantis_Games.List <= 20 then
		Jokebox.Mantis_Games.Quip = "Moderate, respectable numbers.."
	end
	if Jokebox.Mantis_Games["Huniepop"] then
		Jokebox.Mantis_Games.Quip = "That selfish and atavistic desire to pass on one's seed... It makes me sick."
	end
	local random_index = math.random(1, 15)
	if random_index == 15 then
		Jokebox.Mantis_Games.Quip = 'And no, I do not respect your "Game Seed".'
	elseif random_index == 5 then
		Jokebox.Mantis_Games.Quip =
		"This is the first time I've ever used my powers to help someone. It feels kind of nice."
	elseif random_index == 10 then
		---NUMBERED VALUES KEY
		---1 = challenges
		---2 = joker_stickers
		---3 = deck_stakes
		---4 = discovered
		local temp = Jokebox.Get_Completion_Percentages()
		local temp2 = math.random(1, 4)
		local temp3 = temp[temp2]
		if temp2 == 4 then
			if G.PROFILES[G.SETTINGS.profile] then
				Jokebox.Mantis_Games.Quip =
				'I know you cheated! You pressed that "Unlock All" button! Your discovery progress means nothing!'
			elseif temp3 >= 90 then
				Jokebox.Mantis_Games.Quip = temp3 ..
				"% collection discovered.. A well-earned palette of information. Your mind knows little bounds."
			elseif temp3 >= 50 then
				Jokebox.Mantis_Games.Quip = temp3 ..
				"% collection discovered.. Getting up in the world, finding things, earning them.. You have done well."
			else
				Jokebox.Mantis_Games.Quip = temp3 ..
				"% collection discovered.. A new player, or a new profile? I can see what your future holds."
			end
		elseif temp2 == 3 then
			if temp3 >= 90 then
				Jokebox.Mantis_Games.Quip = temp3 .. "% completed deck stakes.. Was the achievement worth it?"
			elseif temp3 >= 50 then
				Jokebox.Mantis_Games.Quip = temp3 ..
				"% completed deck stakes.. Are you working toward something? Or blindly choosing?"
			elseif temp3 >= 30 then
				Jokebox.Mantis_Games.Quip = temp3 .. "% completed deck stakes... You clearly have favourites."
			else
				Jokebox.Mantis_Games.Quip = temp3 ..
				"% completed deck stakes.. You know you can go higher than White Stake, don't you?"
			end
		elseif temp2 == 2 then
			if temp3 >= 90 then
				Jokebox.Mantis_Games.Quip = temp3 .. "% completed stickers.. A completionist through-and-through."
			elseif temp3 >= 50 then
				Jokebox.Mantis_Games.Quip = temp3 ..
				"% completed stickers.. Determined and calculated.. Or perhaps, careless?"
			elseif temp3 >= 30 then
				Jokebox.Mantis_Games.Quip = temp3 .. "% completed stickers... The bare minimum, likely a fluke."
			else
				Jokebox.Mantis_Games.Quip = temp3 .. "% completed stickers.. You are a coward."
			end
		elseif temp2 == 1 then
			if temp3 >= 90 then
				Jokebox.Mantis_Games.Quip = temp3 ..
				"% completed challenges.. You are thorough, and efficient... Or was it luck?"
			elseif temp3 >= 50 then
				Jokebox.Mantis_Games.Quip = temp3 .. "% completed challenges.. Close, but no cigar."
			elseif temp3 >= 30 then
				Jokebox.Mantis_Games.Quip = temp3 .. "% completed challenges..."
			else
				Jokebox.Mantis_Games.Quip = temp3 .. "% completed challenges.. You are a coward."
			end
		else
			Jokebox.Mantis_Games.Quip = "Why? Why can't I read your mind?"
		end
	elseif random_index <= 2 then
		Jokebox.Mantis_Games.Quip = "So.. You like " .. pseudorandom_element(Jokebox.Mantis_Games.List) .. "?"
	end
end

---Mantis' actual joker code
SMODS.Joker {
	key = "mantis",
	pos = { x = 1, y = 2 },
	soul_pos = { x = 1, y = 3 },
	atlas = "JokeboxJokers",
	discovered = false,
	rarity = 4,
	blueprint_compat = false,
	cost = 20,
	loc_vars = function(self, info_queue, card)
		if card.area and card.area == G.jokers then
			local left_joker, right_joker = nil, nil
			local left_compat, right_compat = false, false

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					left_joker = G.jokers.cards[i - 1]
					right_joker = G.jokers.cards[i + 1]
					break
				end
			end

			left_compat = left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat
			right_compat = right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat

			local left_indicator = {
				n = G.UIT.C,
				config = {
					align = "cm",
					padding = 0.05,
					minw = 1.5,
					r = 0.1,
					colour = left_compat and G.C.GREEN or G.C.RED
				},
				nodes = {
					{
						n = G.UIT.T,
						config = {
							align = "cm",
							text = "← " ..
								(left_joker and localize { type = "name_text", set = "Joker", key = left_joker.config.center_key } or "None"),
							scale = 0.32,
							colour = G.C.UI.TEXT_LIGHT
						}
					}
				}
			}

			local right_indicator = {
				n = G.UIT.C,
				config = {
					align = "cm",
					padding = 0.05,
					minw = 1.5,
					r = 0.1,
					colour = right_compat and G.C.GREEN or G.C.RED
				},
				nodes = {
					{
						n = G.UIT.T,
						config = {
							align = "cm",
							text = (right_joker and localize { type = "name_text", set = "Joker", key = right_joker.config.center_key } or "None") ..
								" →",
							scale = 0.32,
							colour = G.C.UI.TEXT_LIGHT
						}
					}
				}
			}

			return {
				main_end = {
					{
						n = G.UIT.R,
						config = { align = "cm", padding = 0, minh = 0.6 },
						nodes = { left_indicator, right_indicator }
					}
				},
				vars = {
					left_compat and "Compatible" or "Incompatible",
					right_compat and "Compatible" or "Incompatible",
					Jokebox.Mantis_Games.Quip
				}
			}
		end
		return {
			vars = {
				left_compat and "Compatible" or "Incompatible",
				right_compat and "Compatible" or "Incompatible",
				Jokebox.Mantis_Games.Quip
			}
		}
	end,

	calculate = function(self, card, context)
		---Changes dialogue on every context
		jkbx_Mantis_Quipcheck()

		if not G.jokers then return nil end
		---Mantis' effects only trigger if he is in the 4th Joker Slot
		if G.jokers.cards[4] == card then

			if context.retrigger_joker_check then
				if G.jokers.cards[4] == card and (context.other_card == G.jokers.cards[3] or (G.jokers.cards[5] and context.other_card == G.jokers.cards[5])) then
					return { repetitions = 1 }
				end
			end

			local left_effect, right_effect = nil, nil

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					local left_joker = G.jokers.cards[i - 1]
					local right_joker = G.jokers.cards[i + 1]

					if left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat then
						left_effect = SMODS.blueprint_effect(card, left_joker, context)
					end

					if right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat then
						right_effect = SMODS.blueprint_effect(card, right_joker, context)
					end
					break
				end
			end

			if left_effect or right_effect then
				local merged_effect = SMODS.merge_effects(
					{ left_effect or {} },
					{ right_effect or {} }
				)

				return merged_effect
			else
				return nil
			end
		end
	end,
}
