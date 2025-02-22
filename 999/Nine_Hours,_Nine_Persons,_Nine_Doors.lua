--- STEAMODDED HEADER
--- MOD_NAME: 999
--- MOD_ID: 999_deck
--- PREFIX: q9
--- MOD_AUTHOR: [Rot8er]
--- MOD_DESCRIPTION: Nine Hours, Nine Persons, Nine Doors
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.0.0
--- BADGE_COLOR: 9D75A9

local atlas_key = 'q9_atlas' -- Format: PREFIX_KEY
-- See end of file for notes
local atlas_path = '999_LC.png' -- Filename for the image in the asset folder
local atlas_path_hc = '999_HC.png' -- Filename for the high-contrast version of the texture, if existing

local suits = {'clubs'} -- Which suits to replace
local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace"} -- Which ranks to replace

local description = 'Nine Hours, Nine Persons, Nine Doors' -- English-language description, also used as default

-----------------------------------------------------------
-- You should only need to change things above this line --
-----------------------------------------------------------

SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false}, -- See end of file for notes
}

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false}, -- See end of file for notes
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = "q9_"..suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description
        },
        posStyle = 'deck'
    }
end

-- Notes:

-- The current version of Steamodded has a bug with prefixes in mods including `DeckSkin`s.
-- By manually including the prefix in the atlas' key, this should keep the mod functional
-- even after this bug is fixed.

SMODS.Atlas {
  -- Key for code to find it with
  key = "q9",
  -- The name of the file, for the code to pull the atlas from
  path = "jokers.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

G.localization.descriptions.Other["digital_root"] = {
  name = "Digital Root",
  text = {
    "Take all digits of the number, add them together.",
	"Repeat until the result is a single digit.",
	"{C:inactive}(Ex: {C:attention}38{C:inactive} -> 3 + 8 = 11 -> 1 + 1 = {C:attention}2{C:inactive}){}"
  }
}
G.localization.misc.v_dictionary.q9_ending = {"#1# Ending"}

function digital_root(value)
  return 1 + (( value - 1) % 9)
end

function true_number(card)
  local spoilers = (G.SETTINGS.CUSTOM_DECK.Collabs.Clubs == "q9_clubs_skin")
  if spoilers and card:is_suit('Clubs') then
    if card:get_id() == 3 then
	  return 9
	elseif card:get_id() == 6 then
	  return 0
	end
  elseif card:get_id() == 10 then
    return 1
  end
  return card:get_id()
end

function SMODS.INIT.NineNineNine()
  local mod_id = "NineNineNine"
  local mod_obj = SMODS.findModByID(mod_id)
  
  table.insert(G.P_JOKER_RARITY_POOLS, {})
  table.insert(G.C.RARITY, HEX("FFABAF"))

  loc_colour("mult", nil)
  G.ARGS.LOC_COLOURS["NineNineNine"] = G.C.RARITY[5]
  
  SMODS.Joker { -- Nonary Game
    key = 'nonary_game',
	loc_txt = {
	  name = "Nonary Game",
	  text = {
	    "If played hand contains 3 - 5 numbered cards,",
		"gives their digital root as {X:mult,C:white}Xmult{}."
	  }
	},
	config = {
	  extra = {
	  }
	},
	loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'digital_root'})
	  return {
		vars = {
		}
	  }
	end,
    rarity = 3,
    pos = { x = 0, y = 0},
	atlas = "q9",
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
	  if context.joker_main and context.cardarea == G.jokers then
	    local numbered = 0
		local total = 0
        for i = 1, #context.full_hand do
	      if context.full_hand[i]:get_id() < 11 then
		    numbered = numbered + 1
			total = total + true_number(context.full_hand[i])
		  end
		end
		if (numbered > 2) and (numbered < 6) then
		  local dig = digital_root(total)
          return {
            message = localize{type='variable',key='a_xmult',vars={dig}},
            Xmult_mod = dig
          }
		end
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { ref_table = "card.joker_display_values", ref_value = "active", colour = G.C.UI.TEXT_INACTIVE },
          {
            border_nodes = {
              { ref_table = "card.joker_display_values", ref_value = "total" }
            }
          }
        },
        calc_function = function(card)
          local playing_hand = G.play.cards
          local text, _, scoring_hand = JokerDisplay.evaluate_hand()
		  if #playing_hand == 0 then
		    playing_hand = JokerDisplay.current_hand
		  end
		  local total = 0
		  local numbered = 0
            for _, playing_card in ipairs(playing_hand) do
              if playing_card.highlighted then
	            if playing_card:get_id() < 11 then
		          numbered = numbered + 1
		          total = total + playing_card:get_id()
		        end
	    	  end
		    end
		  card.joker_display_values.total = ""
		  card.joker_display_values.active = "inactive"
		  if (numbered > 2) and (numbered < 6) then
		    local dig = digital_root(total)
			card.joker_display_values.total = "X"..dig
			card.joker_display_values.active = ""
		  end
        end
	  }
	end,
	enstomach_compat = {
      type = "incompatible"
    }
  }
  
  SMODS.Joker { -- Seek a Way Out
    key = 'q9_seek',
	loc_txt = {
	  name = "Seek a Way Out",
	  text = {
	    "Seek a door that carries a {C:attention}[#1#]{}."
	  }
	},
	config = {
	  extra = {
	    flow = "",
		door = "9",
		safending = false
	  }
	},
	loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'digital_root'})
	  return {
		vars = {
		  card.ability.extra.door
		}
	  }
	end,
    rarity = 3,
    pos = { x = 1, y = 0},
	atlas = "q9",
    cost = 8,
    blueprint_compat = false,
    calculate = function(self, card, context)
	  if context.joker_main and context.cardarea == G.jokers then
	    if card.ability.extra.flow == "X999" then
          return {
            message = localize{type='variable',key='a_xmult',vars={999}},
            Xmult_mod = 999
          }
		end
	    local numbered = 0
		local total = 0
		local junpei = false
		local z = false
        for i = 1, #context.full_hand do
		  if context.full_hand[i].debuff or context.full_hand[i].base.suit ~= 'Clubs' then
		  elseif context.full_hand[i]:get_id() == 5 then
		    junpei = true
		  elseif context.full_hand[i]:get_id() == 13 then
		    z = true
		  end
	      if context.full_hand[i]:get_id() < 11 then
		    numbered = numbered + 1
			total = total + true_number(context.full_hand[i])
		  end
		end
		if junpei then
		  if (numbered > 2) and (numbered < 6) then
		    local dig = digital_root(total)
			if #card.ability.extra.flow == 0 then
			  if dig == 4 or dig == 5 then
			    card.ability.extra.flow = ""..dig
			  end
			elseif #card.ability.extra.flow == 1 then
			  if dig == 3 or dig == 7 or dig == 8 then
			    card.ability.extra.flow = card.ability.extra.flow..dig
			  end
			elseif #card.ability.extra.flow == 2 then
			  local generate = {nil, "Seek"}
			  reset = true
			  if dig == 2 then
			    generate = {'j_splash', "Submarine"}
			  elseif string.sub(card.ability.extra.flow,2,2) == "3" then
			    return
			  elseif dig == 1 or dig == 6 then
			    card.ability.extra.flow = card.ability.extra.flow..dig
			    if card.ability.extra.flow == "471" then
				  if card.ability.extra.safending then
				    -- allow for true ending
					reset = false
				  else
			        generate = {'j_mr_bones', "Coffin"}
				  end
				elseif card.ability.extra.flow == "586" then
				  card.ability.extra.safending = true
				elseif string.sub(card.ability.extra.flow,3,3) == "1" then
			      generate = {'j_trading', "Axe"}
				elseif string.sub(card.ability.extra.flow,3,3) == "6" then
			      generate = {'j_ceremonial', "Knife"}
				end
			  else
			    return
			  end
			  if reset then
		        card.ability.extra.flow = ""
			    if generate[1] ~= nil then
                  t = {
                    set = 'Joker',
                    area = G.jokers,
                    key = generate[1],
					edition = { negative = true }
                  }
                  G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,
                    func = function()
                      SMODS.add_card(t)
                      return true
                    end
                  }))
                  return {
    			    message = localize{type='variable',key='q9_ending',vars={generate[2]}},
					card = card
    			  }
			    end
			  end
			elseif (#card.ability.extra.flow == 3) and (dig == 9) then
			  -- on true ending
			  card.ability.extra.flow = card.ability.extra.flow..dig
			  card.ability.extra.door = "q"
			elseif (#card.ability.extra.flow == 4) and (total == 26) then
			  -- finish true ending
			  card.ability.extra.flow = "X999"
			  card.loc_txt.text = {"{C:attention}[#1#] Door{} found!"}
			end
		  end
		elseif z then
		  card.ability.extra.flow = ""
	      card.children.center:set_sprite_pos({ x = 1, y = 0})
		end
	  end
    end,
	update = function(self, card, dt)
	  if card.ability.extra.flow == "X999" then
	    card.children.center:set_sprite_pos({ x = 6, y = 8})
	  elseif #card.ability.extra.flow == 4 then
	    card.children.center:set_sprite_pos({ x = 6, y = 7})
	  elseif #card.ability.extra.flow == 3 then
	    card.children.center:set_sprite_pos({ x = 6, y = 6})
	  else
	    local posx = 1
		local posy = 0
		if string.sub(card.ability.extra.flow,1,1) == "4" then
		  posx = 0
		  posy = 1
		elseif string.sub(card.ability.extra.flow,1,1) == "5" then
		  posx = 1
		  posy = 1
		end
		if string.sub(card.ability.extra.flow,2,2) == "3" then
		  posy = 2
		elseif string.sub(card.ability.extra.flow,2,2) == "7" then
		  posx = posx + 2
		  posy = 2
		elseif string.sub(card.ability.extra.flow,2,2) == "8" then
		  posx = posx + 4
		  posy = 2
		end
		if card.ability.extra.safending then
		  posx = posx + 4
		  posy = posy + 3
		end
	    card.children.center:set_sprite_pos({ x = posx, y = posy})
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { ref_table = "card.joker_display_values", ref_value = "doors" },
          {
            border_nodes = {
              { ref_table = "card.joker_display_values", ref_value = "xmult" }
            }
          }
        },
        calc_function = function(card)
		  card.joker_display_values.doors = ""
		  card.joker_display_values.xmult = ""
		  if card.ability.extra.flow == "X999" then
		    card.joker_display_values.xmult = card.ability.extra.flow
		  else
		    card.joker_display_values.doors = card.ability.extra.flow
		  end
        end
	  }
	end,
	enstomach_compat = {
      type = "incompatible"
    }
  }
end