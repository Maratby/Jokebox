return {
	["misc"] = {
		["dictionary"] = {
			["k_insj_dented"] = "Dented",
		},
	},
	["descriptions"] = {
		["Other"] = {
			["j_insj_fake_trading"] = {
				["name"] = "Trading Card",
				["text"] = {
					"If {C:attention}first discard{} of round",
                    "has only {C:attention}1{} card, destroy",
                    "it and earn {C:money}$3",
				},
			},
			["j_insj_fake_idol"] = {
				["name"] = "The Idol",
				["text"] = {
					"Each played {C:attention}Ace",
                    "of Spades gives",
                    "{X:mult,C:white} X2 {} Mult when scored",
                    "{s:0.8}Card changes every round",
				},
			},
		},
		["Joker"] = {
			["j_insj_getwellsoon"] = {
				["name"] = "Get Well Soon Card",
				["text"] = {
					"After scoring {C:attention}#1#{C:inactive}[#3#] {C:attention}7{}s,",
					"Level Up {C:attention}Straight{}",
					"and {C:attention}Straight Flush",
					"by {C:attention}#2#{} Levels",
				},
			},
			["j_insj_blue_eyes"] = {
				["name"] = "Blue-Eyes White Joker",
				["text"] = {
					"Once per {C:blue}hand{}, if you {C:attention}control{} this {C:attention}face-up Joker,",
					"This joker gains {C:attention}#1# Mult Counters",
					"{C:inactive,s:0.7}(Mult Counters are spent at the end of the Scoring Step to add +4 Mult to your Hand Score)",
					'{C:inactive,s:0.5, E:1}"Blue-eyed mfs waiting for you to compliment them"',
				},
			},
			["j_insj_offcamera"] = {
				["name"] = "Off-Camera Mining",
				["text"] = {
					"Creates a {C:red}Rare Tag{}",
					"when obtained",
					"{C:green}#1# in #2#{} chance to",
					"create a {C:red}Rare Tag{} when sold",
					"{C:inactive}(must have room)"
				},
			},
			["j_insj_buffed_joker"] = {
				["name"] = "Buffed Joker",
				["text"] = {
					"{C:blue}Blinds bleed for #1#{C:inactive} [#2#] {C:blue}Hands",
					"{C:red}-99% Hand Capacity",
					"{C:red}-50% Mult Penalty",
					"{C:red}-84% Reload Speed",
					"{C:blue,s:2}BUFFED",
				},
			},
			["j_insj_anvil_shaped"] = {
				["name"] = "Suspiciously Anvil-Shaped Green Joker",
				["text"] = {
					"-#1# Discard",
					"This joker gains {C:attention}+#1#{} Mult for each card played",
					"This joker loses {C:attention}-#1#{} Mult for each card discarded",
					"{C:inactive}(currently {C:attention}#2#{C:inactive} Mult)",
					"{C:inactive,s:0.7}(can go below 0)",
				},
			},
			["j_insj_get_you"] = {
				["name"] = "Me when I Get You",
				["text"] = {
					"If played hand contains 2 {C:attention}scoring",
					"{C:attention}Queens{} of different {C:attention}suits,",
					"{C:red}destroy{} them and create a {C:red}Rare Joker Tag",
				},
			},
			["j_insj_9_min_crusade"] = {
				["name"] = "9-Minute Crusade",
				["text"] = {
					"If played hand contains a {C:attention}Two Pair{},",
					"{C:green}50%{} chance to {C:dark_edition}win the run{},",
					"otherwise, {C:red}lose the run",
				},
			},
			["j_insj_gd_colon"] = {
				["name"] = "GD Colon Plush",
				["text"] = {
					"{C:attention}Retrigger{} the {C:attention}last{} card in each played hand",
					"{C:inactive,s:0.8}\"I love GD Cologne\"",
				},
			},
			["j_insj_birthday"] = {
				["name"] = "Birthday Joker",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult if it is someone's {C:dark_edition}Birthday",
				},
			},
			["j_insj_compare_number"] = {
				["name"] = '["name"] = "Attempt to compare Number with Table"',
				["text"] = {
					'"{X;mult,C;white}X#1#{} Mult if",',
					'"{C;attention}Talisman{} is installed"',
				},
			},
			["j_insj_eekum_jokum"] = {
				["name"] = 'Eekum Bokum',
				["text"] = {
					'{C:money}Sell{} this card after {C:attention}#2# {C:inactive}[#1#]{} Rounds',
					'to create {C:attention}The Idol{} and {C:dark_edition}Negative{} {C:attention}Trading Card{}',
					"{C:inactive}(don't need room)"
				},
			},
			["j_insj_demoknight"] = {
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
			["j_insj_smack"] = {
				["name"] = 'SMACK',
				["text"] = {
					"{C:attention}Smacks{} the joker to the {C:attention}Right{} with a {C:dark_edition}Frying Pan",
					"This joker gains {X:mult,C:white}X#1#{} Mult for each joker {C:attention}Smacked{}",
					"{C:inactive}(Smacked Jokers become Jibnor)",
					"{C:inactive}(currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
			},
			["j_insj_jibnor"] = {
				["name"] = 'Jibnor',
				["text"] = {
					"{C:red}#1#{} Mult",
				},
			},
			["j_insj_job_app"] = {
				["name"] = 'Job Application',
				["text"] = {
					"{C:red}Lose $10 when added to Deck",
					"{C:red}Pay 10% of your current money in Taxes when Boss Blind is defeated",
					"{C:money}Earn 25%{} of current money each time you play a {C:attention}Straight Flush",
					"{C:red}Red{} effects do not trigger if you have at least {C:money}$10,000"
				},
			},
			["j_insj_marie"] = {
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
			["j_insj_jevil"] = {
				["name"] = "Jevil",
				["text"] = {
					"{C:dark_edition,s:3,E:1}I CAN DO ANYTHING!!",
				},
			},
			["j_insj_notepad"] = {
				["name"] = "Notepad",
				["text"] = {
					"{X:chips,C:white}X#1#{} Chips for each {C:dark_edition}Balatro Mod installed{} {C:inactive}(#3#)",
					"{X:mult,C:white}X#1#{} Mult for each {C:dark_edition}lovely log{} {C:inactive}(#2#)",
					"{C:inactive,s:0.7}(File System collection - Designed for Windows!)"
				},
			},
			["j_insj_mantis"] = {
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
