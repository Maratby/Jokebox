return {
	["misc"] = {
		["dictionary"] = {
			["k_jkbx_dented"] = "Dented",
			["k_jkbx_special"] = "Special",
			["k_jkbx_vest"] = "I told you the armor would help!",

			["k_jkbx_quickhack_title"] = "Select Hacks",
			["k_jkbx_cancel"] = "Exit",

			["k_jkbx_virus"] = "Virus [2]",
			["k_jkbx_virus_desc"] = "X0.9 blind size, clears Foil/Holo/Poly from all jokers",

			["k_jkbx_shutdown"] = "Shutdown [4]",
			["k_jkbx_shutdown_desc"] = "X0.75 blind size",

			["k_jkbx_reroute"] = "Reroute Power [8]",
			["k_jkbx_reroute_desc"] = "X3 blind size, disable blind effect",

			["k_jkbx_overload"] = "Overload [6]",
			["k_jkbx_overload_desc"] = "X2 blind size, create an Uncommon or Rare Tag",

			["k_jkbx_siphon"] = "Siphon [8]",
			["k_jkbx_siphon_desc"] = "X5 blind size, permanently gain +1 joker slot",

			["k_jkbx_virtualise"] = "Virtualise [6]",
			["k_jkbx_virtualise_desc"] = "X1.5 blind size, +3 Hand Size until end of round",

			["k_jkbx_vram_display"] = "VRAM",
		},
	},
	["descriptions"] = {
		["Other"] = {
			["j_jkbx_fake_trading"] = {
				["name"] = "Trading Card",
				["text"] = {
					"If {C:attention}first discard{} of round",
					"has only {C:attention}1{} card, destroy",
					"it and earn {C:money}$3",
				},
			},
			["j_jkbx_fake_idol"] = {
				["name"] = "The Idol",
				["text"] = {
					"Each played {C:attention}Ace",
					"of Spades gives",
					"{X:mult,C:white} X2 {} Mult when scored",
					"{s:0.8}Card changes every round",
				},
			},
			["j_jkbx_fake_to_be_hog"] = {
				["name"] = "To Be Crankin' Hog",
				["text"] = {
					"Gains {C:attention}+1{} Charge after each defeated Blind",
					"{C:dark_edition,E:1}transforms{} into {C:attention}Crankin' Hog{} if placed in",
					"rightmost Joker Slot when a hand is played",
					"{C:inactive}(currently X Charge)",
				},
			},

			["j_jkbx_fake_hog"] = {
				["name"] = "Crankin' Hog",
				["text"] = {
					"Loses {C:attention}1{} Charge after each Hand",
					"{C:dark_edition,E:1}transforms{} into {C:attention}To Be Crankin' Hog{} when reaching",
					"{C:attention}1{} remaining Charge",
					"Grants {X:mult,C:white}Xmult{} equal to number of remaining Charges",
					"{C:inactive}(currently X Charge)",
				},
			},
		},
		["Joker"] = {
			["j_jkbx_getwellsoon"] = {
				["name"] = "Get Well Soon Card",
				["text"] = {
					"After scoring {C:attention}#1#{C:inactive}[#3#] {C:attention}7{}s,",
					"Level Up {C:attention}Straight{}",
					"and {C:attention}Straight Flush",
					"by {C:attention}#2#{} Levels",
				},
			},
			["j_jkbx_blue_eyes"] = {
				["name"] = "Blue-Eyes White Joker",
				["text"] = {
					"Once per {C:blue}hand{}, if you {C:attention}control{} this {C:attention}face-up Joker,",
					"This joker gains {C:attention}#1# Mult Counters",
					"{C:inactive,s:0.7}(Mult Counters are spent at the end of the Scoring Step to add +4 Mult to your Hand Score)",
					'{C:inactive,s:0.5, E:1}"Blue-eyed mfs waiting for you to compliment them"',
				},
			},
			["j_jkbx_offcamera"] = {
				["name"] = "Off-Camera Mining",
				["text"] = {
					"Creates a {C:red}Rare Tag{}",
					"when obtained",
					"{C:green}#1# in #2#{} chance to",
					"create a {C:red}Rare Tag{} when sold",
					"{C:inactive}(must have room)"
				},
			},
			["j_jkbx_buffed_joker"] = {
				["name"] = "Buffed Joker",
				["text"] = {
					"{C:blue}Blinds bleed for #1#{C:inactive} [#2#] {C:blue}Hands",
					"{C:red}-99% Hand Capacity",
					"{C:red}-50% Mult Penalty",
					"{C:red}-84% Reload Speed",
					"{C:blue,s:2}BUFFED",
				},
			},
			["j_jkbx_anvil_shaped"] = {
				["name"] = "Suspiciously Anvil-Shaped Green Joker",
				["text"] = {
					"-#1# Discard",
					"This joker gains {C:attention}+#1#{} Mult for each card played",
					"This joker loses {C:attention}-#1#{} Mult for each card discarded",
					"{C:inactive}(currently {C:attention}#2#{C:inactive} Mult)",
					"{C:inactive,s:0.7}(can go below 0)",
				},
			},
			["j_jkbx_get_you"] = {
				["name"] = "Me when I Get You",
				["text"] = {
					"If played hand contains 2 {C:attention}scoring",
					"{C:attention}Queens{} of different {C:attention}suits,",
					"{C:red}destroy{} them and create a {C:red}Rare Joker Tag",
				},
			},
			["j_jkbx_9_min_crusade"] = {
				["name"] = "9-Minute Crusade",
				["text"] = {
					"If played hand contains a {C:attention}Two Pair{},",
					"{C:green}50%{} chance to {C:dark_edition}win the run{},",
					"otherwise, {C:red}lose the run",
				},
			},
			["j_jkbx_gd_colon"] = {
				["name"] = "GD Colon",
				["text"] = {
					"{C:attention}Retrigger{} the {C:attention}last{} card in each played hand",
					"{C:inactive,s:0.8}\"I love GD Cologne\"",
				},
			},
			["j_jkbx_winton"] = {
				["name"] = "Winton",
				["text"] = {
					"All played cards gain {C:blue}+1{} permanent {C:blue}Chip{} for each scored card",
					"{C:inactive,s:0.8}\"hi there\"",
				},
			},
			["j_jkbx_miku"] = {
				["name"] = "Miku",
				["text"] = {
					"{C:attention}+39{} Mult if played hand contains",
					"a scoring {C:attention}3{} followed by a scoring {C:attention}9{}",
					"{C:inactive,s:0.8}\"thank you!\"",
				},
			},
			["j_jkbx_reimu"] = {
				["name"] = "Reimu",
				["text"] = {
					"{C:green}25%{} chance to add {C:dark_edition}Polychrome{} to each played {C:attention}Wild Card",
					"otherwise, turn it into a {C:attention}Stone Card",
					"{C:inactive,s:0.8}\"I love not thinking!\"",
				},
			},
			["j_jkbx_nobara"] = {
				["name"] = "Nobara",
				["text"] = {
					"{C:green}50%{} chance for each non-Edition Joker to gain a random {C:dark_edition}Edition",
					"when {C:attention}Boss Blind is defeated",
					"{C:red}destroy{} Jokers that fail this roll",
					"{C:inactive,s:0.8}\"Let's play a game of chicken!\"",
				},
			},
			["j_jkbx_miwa"] = {
				["name"] = "Miwa",
				["text"] = {
					"{C:attention}Middle{} card in played hand{}",
					"gives {C:blue}+#1#{} Chips when scored",
					"{C:inactive}Only works on odd-length hands",
					"{C:inactive,s:0.8}\"Hello, useless Miwa here.\"",
				},
			},
			["j_jkbx_birthday"] = {
				["name"] = "Birthday Joker",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult if it is someone's {C:dark_edition}Birthday",
				},
			},

			["j_jkbx_lancer"] = {
				["name"] = "Lancer",
				["text"] = {
					"{X:green,C:white}^1{} Glop before scoring",
				},
			},

			["j_jkbx_gentrification"] = {
				["name"] = "Gentrification",
				["text"] = {
					"All cards are {C:attention}4s{}",
					"{C:inactive,s:0.6}\"Shoot - Should've thought of that; I was JUST in San Francisco!\"",
				},
			},

			["j_jkbx_surgeon"] = {
				["name"] = "I  Am  A Surgeon",
				["text"] = {
					"{C:attention}Retrigger{} the {C:attention}Nth{} card in each hand {C:attention}#1#{} times",
					"where {C:attention}N{} is this Joker's {C:attention}Index{} in your Joker Slots",
				},
			},

			["j_jkbx_to_be_hog"] = {
				["name"] = "To Be Crankin' Hog",
				["text"] = {
					"Gains {C:attention}+1{} Charge after each defeated Blind",
					"{C:dark_edition,E:1}transforms{} into {C:attention}Crankin' Hog{} if placed in",
					"rightmost Joker Slot when a hand is played",
					"{C:inactive}(currently #1# Charge)",
				},
			},

			["j_jkbx_hog"] = {
				["name"] = "Crankin' Hog",
				["text"] = {
					"Loses {C:attention}1{} Charge after each Hand",
					"{C:dark_edition,E:1}transforms{} into {C:attention}To Be Crankin' Hog{} when reaching",
					"{C:attention}1{} remaining Charge",
					"Grants {X:mult,C:white}Xmult{} equal to number of remaining Charges",
					"{C:inactive}(currently #1# Charge)",
				},
			},

			["j_jkbx_load_goku"] = {
				["name"] = "Load-Bearing Goku",
				["text"] = {
					"Creates {C:dark_edition}The Soul{} when obtained {C:inactive}(don't need room)",
					"{C:red}lose the run{} if this Joker is {C:money}Sold{} or {C:red}Destroyed",
					"{C:inactive}(Cannot have Editions or Stickers)",
				},
			},

			["j_jkbx_merge_nolook"] = {
				["name"] = "Merging Without Looking",
				["text"] = {
					"{C:dark_edition}Merge{} into the Joker to the right {C:attention}without looking",
					"{C:red}destroy{} that Joker and gain {C:attention}10%{} of its",
					"{C:money}Sell Value{} as {X:mult,C:white}XMult{}",
					"{C:inactive}(currently {X:mult,C:white}X#1#{C:inactive} Mult)",
					"{C:inactive,s:0.6}\"What kind of asshole would drive one of these?\"",
				},
			},

			["j_jkbx_armed_dangerous"] = {
				["name"] = "ARMED AND DANGEROUS!",
				["text"] = {
					"{C:green}#1# in #2#{} chance to {C:attention}Retrigger{} each scored card",
					"{C:red}Pisses you The Fuck Off{} because your team keeps {C:attention}feeding{} him",
					"{C:inactive}(max #3# retriggers per card)",
				},
			},

			["j_jkbx_nanami"] = {
				["name"] = "Work Is Shit!",
				["text"] = {
					"Selects a random {C:blue}Common Joker{} each {C:attention}Ante",
					"Current Joker: {C:attention}#1#",
					"{C:red}Destroy{} all copies of that Joker when {C:attention}Blind{} is selected",
					"This joker gains {X:mult,C:white}X#3#{} Mult and {C:money}$#5#{} for each Joker destroyed this way",
					"{C:inactive}(currently {X:mult,C:white}X#2#{C:inactive} Mult and {C:money}$#4#{})",
				},
			},

			["j_jkbx_armoured_vest"] = {
				["name"] = "Armoured Vest",
				["text"] = {
					"{C:attention}+25 Armor",
					"Reduce blind requirement by {C:attention}30%",
					"Saves you from {C:red}death{} once, then {C:red}self-destructs",
				},
			},

			["j_jkbx_compare_number"] = {
				["name"] = '["name"] = "Attempt to compare Number with Table"',
				["text"] = {
					'"{X;mult,C;white}X#1#{} Mult if",',
					'"{C;attention}Talisman{} is installed"',
				},
			},
			["j_jkbx_interfacer"] = {
				["name"] = 'Cyberjoker',
				["text"] = {
					"{C:green}Quickhack{} every {C:attention}Boss Blind",
				},
			},

			["j_jkbx_eekum_jokum"] = {
				["name"] = 'Eekum Bokum',
				["text"] = {
					'{C:money}Sell{} this card after {C:attention}#2# {C:inactive}[#1#]{} Rounds',
					'to create {C:attention}The Idol{} and {C:dark_edition}Negative{} {C:attention}Trading Card{}',
					"{C:inactive}(don't need room)"
				},
			},

			["j_jkbx_lapse_blue"] = {
				["name"] = 'Lapse Blue',
				["text"] = {
					"{C:red}Drains{} the {C:blue}Chip Value{} of all scored cards",
					"Also {C:red}drains{} {C:blue}Extra Chip Value{} of cards",
					"and removes {C:attention}Bonus Card{} and {C:attention}Stone Card{} enhancements",
					"This Joker gains {C:attention}2.5%{} of drained {C:blue}Chip Value{} as {X:chips,C:white}XChips",
					"{C:inactive}(currently {X:blue,C:white}X#1#{C:inactive} Chips",
					"{C:inactive,s:0.8}\"You take the amplified...\"",
				},
			},

			["j_jkbx_reversal_red"] = {
				["name"] = 'Reversal Red',
				["text"] = {
					"If played hand contains a scoring {C:attention}5{}",
					"followed by a scoring {C:attention}Queen{},",
					"return all {C:attention}played{} or {C:attention}discarded{} cards to the {C:attention}deck",
					"with {X:mult,C:white}X0.25{} extra {X:mult,C:white}Xmult{}",
					"{C:inactive,s:0.8}\"And smash it together with the reversal...\"",
				},
			},

			["j_jkbx_demoknight"] = {
				["name"] = 'Demoknight TF2',
				["text"] = {
					"{C:attention}Pins self to {C:attention}leftmost{} Joker Slot when {C:attention}Blind{} is selected",
					"Before each {C:blue}Hand{}, this Joker {C:dark_edition}Charges{} through the Joker to its {C:attention}right",
					"{C:dark_edition}Charging{} through a Joker {C:attention}Pins{} it to the left of this Joker",
					"When this Joker {C:dark_edition}Charges{} from the {C:attention}rightmost slot{},",
					"unpin all Jokers and {C:red}debuff{} this Joker until end of round",
					"All {C:attention}Pinned{} Jokers give {X:mult,C:white}X#1#{} Mult",
					"{C:inactive}(this card is Eternal while it is Pinned)",
					"{C:inactive,s:0.85}(remove Pinned from all Jokers and Eternal from this Joker at end of round or when debuffed)",
					'{C:inactive,s:0.7}"Demoknight\'s Charge is C O M P L I C A T E D" - Solarlight TF2',
				},
			},
			["j_jkbx_smack"] = {
				["name"] = 'SMACK',
				["text"] = {
					"{C:attention}Smacks{} the joker to the {C:attention}Right{} with a {C:dark_edition}Frying Pan",
					"This joker gains {X:mult,C:white}X#1#{} Mult for each joker {C:attention}Smacked{}",
					"{C:inactive}(Smacked Jokers become Jibnor)",
					"{C:inactive}(currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
			},
			["j_jkbx_jibnor"] = {
				["name"] = 'Jibnor',
				["text"] = {
					"{C:red}#1#{} Mult",
				},
			},

			["j_jkbx_gamblers_fallacy"] = {
				["name"] = 'Gambler\'s Fallacy',
				["text"] = {
					{
						"{C:green}#1# in #2#{} chance to create",
						"{C:dark_edition}The Soul{} when {C:attention}Boss Blind{} is selected",
					},
					{
						"{C:green}#3# in #4#{} chance to {C:dark_edition}win the run",
						"when {C:attention}Boss Blind{} is selected",
					},
					{
						"Lose {C:attention}25%{} of your {C:money}money{} on a fail",
						"{C:red}self-destructs{} on a success",
					}
				},
			},

			["j_jkbx_job_app"] = {
				["name"] = 'Job Application',
				["text"] = {
					"{C:red}Lose $10 when added to Deck",
					"{C:red}Pay 10% of your current money in Taxes when Boss Blind is defeated",
					"{C:money}Earn 25%{} of current money each time you play a {C:attention}Straight Flush",
					"{C:red}Red{} effects do not trigger if you have at least {C:money}$10,000"
				},
			},
			["j_jkbx_megatron"] = {
				["name"] = "Megatron Enters the Dungeon",
				["text"] = {
					{
						"Megatron {C:attention}Enters{} the {C:dark_edition}Dungeon{} each time {C:attention}Steel Cards{} are destroyed",
						"Advance to next {C:attention}Room{} when {C:attention}Steel Cards{} are destroyed",
					},
					{
						"Gains {X:mult,C:white}X0.05{} Mult per {C:money}$1{} lost",
						"{C:inactive}(currently {X:mult,C:white}X#4#{C:inactive} Mult)",
						"{V:1}#1#",
					},
					{
						"Earn {C:money}$2{} for each {C:attention}Steel Card{} destroyed",
						"{V:2}#2#",
					},
					{
						"Create a {C:attention}Rare Tag{} if this Joker is in the {C:attention}leftmost{} slot when {C:attention}Boss Blind{} is selected",
						"Create a {C:attention}Voucher Tag{} if this Joker is in the {C:attention}rightmost{} slot when {C:attention}Boss Blind{} is selected",
						"{V:3}#3#",
					},
				},
			},

			["j_jkbx_inigo_montoya"] = {
				["name"] = "Inigo Montoya",
				["text"] = {
					{
						"Each scored {C:attention}Jack{} gives {X:mult,C:white}X#1#{} Mult",
						"for each scoring {C:attention}Jack{} in played hand",
						"{C:inactive}(minimum X1 Mult)",
					},
					{
						"Each {C:attention}Jack{} in your Full Deck permanently gains",
						"{X:mult,C:white}X#2#{} Mult when a {C:attention}Face Card{} is destroyed",
					},
					{
						"{C:inactive,s:1.2, E:1}\"You killed my father. Prepare to die.\"",
					},
				},
			},

			["j_jkbx_marie"] = {
				["name"] = "Marie",
				["text"] = {
					"This Joker is {C:dark_edition}Colorblind",
					"This Joker steals {C:attention}some{} of your {C:blue}Chips{} after each {C:blue}Hand",
					"Converts stolen {C:blue}Chips{} into {C:dark_edition}BP{} at {C:attention}end of round",
					"{X:chips,C:white}X2{} Chips for each of{C:dark_edition,E:1}Maratby's{} mods installed",
					"{C:inactive,s:0.9}(That's me! I'm the mod dev! :D)",
					"{C:inactive}(currently {C:dark_edition}#1#%{C:inactive} progress to next BP Gain)"
				},
			},
			["j_jkbx_jevil"] = {
				["name"] = "Jevil",
				["text"] = {
					"{C:dark_edition,s:3,E:1}I CAN DO ANYTHING!!",
				},
			},
			["j_jkbx_notepad"] = {
				["name"] = "Notepad",
				["text"] = {
					"{X:chips,C:white}X#1#{} Chips for each {C:dark_edition}Balatro Mod installed{} {C:inactive}(#3#)",
					"{X:mult,C:white}X#1#{} Mult for each {C:dark_edition}lovely log{} {C:inactive}(#2#)",
					"{C:inactive,s:0.7}(File System collection - Designed for Windows!)"
				},
			},
			["j_jkbx_mantis"] = {
				["name"] = "Psycho Mantis",
				["text"] = {
					"{C:dark_edition}Copies{} the abilities of {C:attention}adjacent Jokers{}",
					"{C:dark_edition}Retriggers {C:attention}adjacent Jokers{}",
					"{C:red}Effects only activate if Mantis is in the 4th Joker Slot",
					"{C:inactive,s:0.7}(File System collection - Designed for Windows!)",
					'{C:dark_edition,s:0.8,E:1}"#3#"',
				},
			},
		},
	},
}
