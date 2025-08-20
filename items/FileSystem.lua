---Jokers relating to or directly interacting with your computer's filesystem. Designed for Windows



---Isolate profile names

Insj_Profile_Table = NFS.getDirectoryItems("C:/Users")


table.insjremovekey(Insj_Profile_Table, "All Users")
table.insjremovekey(Insj_Profile_Table, "Default")
table.insjremovekey(Insj_Profile_Table, "Default User")
table.insjremovekey(Insj_Profile_Table, "Public")
table.insjremovekey(Insj_Profile_Table, "desktop.ini")

---Get the path of the Balatro Mods folder
local mod_path = "" .. SMODS.current_mod.path
Jokebox.path = mod_path

local mods_path_temp = insj_string_split(Jokebox.path, "Mods")
Jokebox.mods_folder_path = string.sub(mods_path_temp, 1, #mods_path_temp) .. "Mods"

---Notepad Joker
SMODS.Joker {
	key = "notepad",
	pos = { x = 0, y = 2 },
	soul_pos = { x = 0, y = 3 },
	atlas = "JokeboxJokers",
	rarity = 4,
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
