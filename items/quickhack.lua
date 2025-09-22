Jokebox.Quickhack = {
    VRAM = 16
}

--- function for making UI buttons
function Jokebox.create_uibox_button(button_key, _text, _minw, _minh, _colour)
    return {
        n = G.UIT.C,
        config = { minw = _minw, minh = _minh, padding = 0.05, align = 'cm' },
        nodes = {
            {
                n = G.UIT.R,
                config = { minw = _minw, minh = _minh, padding = 0.05, align = "cm", func = "update_quickhack_ui" },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { button = button_key, r = 0.1, emboss = 0.06, minw = _minw, minh = _minh, align = "cm", colour = _colour, hover = true, shadow = true },
                        nodes = {
                            { n = G.UIT.T, config = { text = _text, colour = HEX("FFFFFF"), scale = 0.4, align = "cm" } }
                        }
                    }
                }
            },
        }
    }
end

--- function for making UI buttons (ALT)
function Jokebox.create_uibox_button_alt(button_key, _text, _minw, _minh, _colour, _storeval)
    return {
        n = G.UIT.C,
        config = { minw = _minw, minh = _minh, padding = 0.05, align = 'cm' },
        nodes = {
            {
                n = G.UIT.R,
                config = { minw = _minw, minh = _minh, padding = 0.05, align = "cm", func = "update_quickhack_ui_alt" },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { storeval = _storeval, button = button_key, r = 0.1, emboss = 0.06, minw = _minw, minh = _minh, align = "cm", colour = _colour, hover = true, shadow = true },
                        nodes = {
                            { n = G.UIT.T, config = { text = _text, colour = HEX("FFFFFF"), scale = 0.4, align = "cm" } }
                        }
                    }
                }
            },
        }
    }
end

function G.FUNCS.Quickhack_reroute()
    if Jokebox.Quickhack.VRAM >= 8 then
        Jokebox.Quickhack.VRAM = Jokebox.Quickhack.VRAM - 8
        Jokebox.ease_blind_size(3)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        delay(0.4)
                        return true
                    end
                }))
                return true
            end
        }))
    end
    if Jokebox.Quickhack.VRAM <= 1 then
        G.FUNCS.exit_overlay_menu()
        G.Jokebox_Quickhack_Active = false
    end
end

function G.FUNCS.Quickhack_overload()
    if Jokebox.Quickhack.VRAM >= 6 then
        Jokebox.Quickhack.VRAM = Jokebox.Quickhack.VRAM - 6
        Jokebox.ease_blind_size(2)
        if pseudorandom("john balatro", 1, 4) == 4 then
            add_tag(Tag('tag_rare'))
        else
            add_tag(Tag('tag_uncommon'))
        end
    end
    if Jokebox.Quickhack.VRAM <= 1 then
        G.FUNCS.exit_overlay_menu()
        G.Jokebox_Quickhack_Active = false
    end
end

function G.FUNCS.Quickhack_shutdown()
    if Jokebox.Quickhack.VRAM >= 4 then
        Jokebox.Quickhack.VRAM = Jokebox.Quickhack.VRAM - 4
        Jokebox.ease_blind_size(0.75)
    end
    if Jokebox.Quickhack.VRAM <= 1 then
        G.FUNCS.exit_overlay_menu()
        G.Jokebox_Quickhack_Active = false
    end
end

function G.FUNCS.Quickhack_siphon()
    if Jokebox.Quickhack.VRAM >= 8 then
        Jokebox.Quickhack.VRAM = Jokebox.Quickhack.VRAM - 8
        Jokebox.ease_blind_size(5)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end
    if Jokebox.Quickhack.VRAM <= 1 then
        G.FUNCS.exit_overlay_menu()
        G.Jokebox_Quickhack_Active = false
    end
end

function G.FUNCS.Quickhack_virtualise()
    if Jokebox.Quickhack.VRAM >= 6 then
        Jokebox.Quickhack.VRAM = Jokebox.Quickhack.VRAM - 6
        Jokebox.ease_blind_size(1.5)
        G.hand:change_size(3)
        G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + 3
    end
    if Jokebox.Quickhack.VRAM <= 1 then
        G.FUNCS.exit_overlay_menu()
        G.Jokebox_Quickhack_Active = false
    end
end

function G.FUNCS.Quickhack_virus()
    if Jokebox.Quickhack.VRAM >= 2 then
        Jokebox.Quickhack.VRAM = Jokebox.Quickhack.VRAM - 2
        Jokebox.ease_blind_size(0.9)
        if G.jokers then
            for index, value in ipairs(G.jokers.cards) do
                if value.edition and (value.edition.key == "e_foil" or value.edition.key == "e_holo" or value.edition.key == "e_polychrome") then
                    value.edition = nil
                end
            end
        end
    end
    if Jokebox.Quickhack.VRAM <= 1 then
        G.FUNCS.exit_overlay_menu()
        G.Jokebox_Quickhack_Active = false
    end
end

function Jokebox.Quickhack_end()
    G.Jokebox_Quickhack_Active = false
    G.FUNCS.exit_overlay_menu()
    Jokebox.Quickhack.VRAM = 16
end

function G.FUNCS.Quickhack_cancel()
    G.Jokebox_Quickhack_Active = false
    G.FUNCS.exit_overlay_menu()
    Jokebox.Quickhack.VRAM = 16
end

G.FUNCS.update_quickhack_ui = function(e)
    for i, child in ipairs(e.children) do
        if i >= 17 then
            break
        end
        child.config.colour = ((i <= Jokebox.Quickhack.VRAM) and G.C.GREEN) or G.C.RED
    end
end

G.FUNCS.update_quickhack_ui_alt = function(e)
    for _, child in ipairs(e.children) do
        child.config.colour = (((child.config.storeval) <= Jokebox.Quickhack.VRAM) and G.C.GREEN) or G.C.RED
    end
end

function Jokebox.create_uibox_Quickhack(card)
    Jokebox.Quickhack.VRAM = 16
    if Jokebox.Quickhack then
        G.Jokebox_Quickhack_Active = true
        G.FUNCS.overlay_menu({
            definition = create_UIBox_generic_options({
                no_back = true,
                contents = {
                    {
                        n = G.UIT.C,
                        config = { minw = 9, minh = 9, padding = 0.15, align = "cm", colour = HEX("023403") },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { minw = 1, minh = 0.2, padding = 0.15, align = "cm" },
                                nodes = {
                                    { n = G.UIT.T, config = { minw = 4, text = localize("k_jkbx_quickhack_title"), colour = HEX("FFFFFF"), scale = 0.8, shadow = true, align = "cm" } }
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { minw = 1, minh = 0.3, padding = 0.05, align = 'cl' },
                                nodes = {
                                    Jokebox.create_uibox_button_alt('Quickhack_shutdown', localize("k_jkbx_shutdown"), 3,
                                        1,
                                        G.C.GREEN, 4),
                                    {
                                        n = G.UIT.C,
                                        config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                                nodes = {
                                                    { n = G.UIT.T, config = { minw = 4, text = localize("k_jkbx_shutdown_desc"), colour = G.C.GREEN, scale = 0.6, shadow = true, align = "cm" } }
                                                }
                                            }
                                        }
                                    },
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { minw = 1, minh = 0.3, padding = 0.05, align = 'cl' },
                                nodes = {
                                    Jokebox.create_uibox_button_alt('Quickhack_reroute', localize("k_jkbx_reroute"), 3, 1,
                                        G.C.GREEN, 8),
                                    {
                                        n = G.UIT.C,
                                        config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                                nodes = {
                                                    { n = G.UIT.T, config = { minw = 4, text = localize("k_jkbx_reroute_desc"), colour = G.C.GREEN, scale = 0.6, shadow = true, align = "cm" } }
                                                }
                                            }
                                        }
                                    },
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { minw = 1, minh = 0.3, padding = 0.05, align = 'cl' },
                                nodes = {
                                    Jokebox.create_uibox_button_alt('Quickhack_overload', localize("k_jkbx_overload"), 3,
                                        1,
                                        G.C.GREEN, 6),
                                    {
                                        n = G.UIT.C,
                                        config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                                nodes = {
                                                    { n = G.UIT.T, config = { minw = 4, text = localize("k_jkbx_overload_desc"), colour = G.C.GREEN, scale = 0.6, shadow = true, align = "cm" } }
                                                }
                                            }
                                        }
                                    },
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { minw = 1, minh = 0.3, padding = 0.05, align = 'cl' },
                                nodes = {
                                    Jokebox.create_uibox_button_alt('Quickhack_virus', localize("k_jkbx_virus"), 3, 1,
                                        G.C.GREEN, 2),
                                    {
                                        n = G.UIT.C,
                                        config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                                nodes = {
                                                    { n = G.UIT.T, config = { minw = 4, text = localize("k_jkbx_virus_desc"), colour = G.C.GREEN, scale = 0.6, shadow = true, align = "cm" } }
                                                }
                                            }
                                        }
                                    },
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { minw = 1, minh = 0.3, padding = 0.05, align = 'cl' },
                                nodes = {
                                    Jokebox.create_uibox_button_alt('Quickhack_siphon', localize("k_jkbx_siphon"), 3, 1,
                                        G.C.GREEN, 8),
                                    {
                                        n = G.UIT.C,
                                        config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                                nodes = {
                                                    { n = G.UIT.T, config = { minw = 4, text = localize("k_jkbx_siphon_desc"), colour = G.C.GREEN, scale = 0.6, shadow = true, align = "cm" } }
                                                }
                                            }
                                        }
                                    },
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { minw = 1, minh = 0.3, padding = 0.05, align = 'cl' },
                                nodes = {
                                    Jokebox.create_uibox_button_alt('Quickhack_virtualise', localize("k_jkbx_virtualise"),
                                        3,
                                        1, G.C.GREEN, 6),
                                    {
                                        n = G.UIT.C,
                                        config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { minw = 10, minh = 0.2, padding = 0.15, align = "cl" },
                                                nodes = {
                                                    { n = G.UIT.T, config = { minw = 4, text = localize("k_jkbx_virtualise_desc"), colour = G.C.GREEN, scale = 0.6, shadow = true, align = "cm" } }
                                                }
                                            }
                                        }
                                    },
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { minw = 1, minh = 0.3, padding = 0.05, align = 'cm' },
                                nodes = {
                                    { n = G.UIT.T, config = { minw = 2, text = localize("k_jkbx_vram_display"), scale = 0.6, shadow = true, align = "cm" } },
                                    {
                                        n = G.UIT.C,
                                        config = { minw = 10, minh = 0.2, padding = 0.15, align = "cm", },
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = { minw = 10, minh = 0.2, padding = 0.15, func = "update_quickhack_ui", align = "cm" },
                                                nodes = {
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    { n = G.UIT.C, config = { minw = 0.6, minh = 0.9, padding = 0.05, colour = G.C.GREEN, align = "cm" } },
                                                    Jokebox.create_uibox_button('Quickhack_cancel',
                                                        localize("k_jkbx_cancel"), 3, 1, G.C.GREEN),
                                                }
                                            }
                                        }
                                    },
                                }
                            },
                        },
                    }
                }
            })
        })
        G.OVERLAY_MENU:recalculate()
    end
end
