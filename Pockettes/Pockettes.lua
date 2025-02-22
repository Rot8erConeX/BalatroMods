--- STEAMODDED HEADER
--- MOD_NAME: Pockettes
--- MOD_ID: Pockettes
--- MOD_AUTHOR: [Rot8er_ConeX]
--- MOD_DESCRIPTION: New jokers based on tiny ladies!
--- BADGE_COLOUR: FFABAF
--- PRIORITY: -9999
--- PREFIX: pocket
----------------------------------------------
------------MOD CODE -------------------------

--Creates an atlas for cards to use
SMODS.Atlas {
  -- Key for code to find it with
  key = "Pockettes",
  -- The name of the file, for the code to pull the atlas from
  path = "Pockettes.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}


G.localization.misc.dictionary["k_transformed_ex"] = "Transformed!"
G.localization.misc.dictionary["k_headless"] = "Off with her head!"
G.localization.misc.dictionary["k_drinkme"] = "Drink me?  Why not!"
G.localization.misc.dictionary["k_borrow"] = "Borrowing!"
G.localization.misc.dictionary["k_tink"] = "Chime!"
G.localization.misc.dictionary["k_tink_dies"] = "Lights out!"
G.localization.misc.dictionary["k_gadget_ex_good"] = "There we go!"
G.localization.misc.dictionary["k_gadget_ex_bad"] = "I'll try again!"
G.localization.misc.dictionary["k_rapunzel"] = "Time for a haircut!"
G.localization.misc.dictionary["k_enstomach_tick"] = "Yum!"
G.localization.misc.dictionary["k_enstomach_swallow"] = G.localization.misc.dictionary["k_eaten_ex"] -- duplicated to avoid recursion
G.localization.misc.dictionary["k_enstomach_return"] = "Freed!"
G.localization.misc.dictionary["k_ayase_success"] = "There ya go!"
G.localization.misc.dictionary["k_ayase_mistake"] = "Oops!  Your banana's gone!"
G.localization.misc.dictionary["k_ayase_failure"] = "Give me a bit!"
G.localization.descriptions.Other["record_highest_occupancy"] = {
  name = "Record: Highest Occupancy",
  text = {
    "Highest total {C:attention}Occupancy",
    "achieved on this Joker:",
    "{C:attention}+#1#"
  }
}
G.localization.descriptions.Other["j_alice"] = {
  name = "Alice in Wonderland",
  text = {
    "{C:attention}Source:{} Alice's Adventures in Wonderland, by Lewis Carrol (1865)",
    "{C:attention}This depiction:{} Disney's Alice in Wonderland (1951)",
    "{C:attention}Category:{} Artifically sizeshifts"
  }
}
G.localization.descriptions.Other["j_arrietty"] = {
  name = "Arrietty Clock",
  text = {
    "{C:attention}Source:{} The Borrowers, by Mary Norton (1952)",
    "{C:attention}This depiction:{} Studio Ghibli's Arrietty (2010)",
    "{C:attention}Category:{} Naturally tiny"
  }
}
G.localization.descriptions.Other["j_gadget"] = {
  name = "Gadget Hackwrench",
  text = {
    "{C:attention}Source:{} Chip & Dale: Rescue Rangers (1989)",
    "{C:attention}Category:{} Naturally tiny"
  }
}
G.localization.descriptions.Other["j_gallica"] = {
  name = "Gallica",
  text = {
    "{C:attention}Source:{} Metaphor: ReFantazio (2024)",
    "{C:attention}Category:{} Naturally tiny"
  }
}
G.localization.descriptions.Other["j_enstomach"] = {
  name = "Lily Enstomach",
  text = {
    "{C:attention}Source:{} One Piece anime",
    "{C:attention}First appearance:{} Z's Ambition Arc - The Little Giant Lily!",
    "Episode 575, first aired in 2012, first dubbed in 2022",
    "{C:attention}Category:{} Natural sizeshifter"
  }
}
G.localization.descriptions.Other["j_ayase"] = {
  name = "Ayase Momo",
  text = {
    "{C:attention}Source:{} DanDaDan, by Yukinobu Tatsu (2021)",
	"{C:attention}First appearance:{} Chapter 1: That's How Love Starts, Ya Know?",
    "{C:attention}First appearance as a tiny:{} Chapter 163: Saviors, Don't Be Late!",
    "{C:attention}Category:{} Artificially shrunken"
  }
}
G.localization.descriptions.Other["j_rapunzel"] = {
  name = "Rapunzel Elf",
  text = {
    "{C:attention}Source:{} Brothers Grimm (1812)",
    "{C:attention}This depiction:{} Golem in the Gears, by Piers Anthony (1986)",
    "{C:attention}Category:{} Natural sizeshifter"
  }
}
G.localization.descriptions.Other["j_rapunzel2"] = {
  name = "Wait, why is Rapunzel here?",
  text = {
    "While the more mainstream depictions of Rapunzel are",
    "not tiny, the one found within the Xanth series is a",
    "human/elf hybrid that, due to her mixed heritage being",
    "bolstered over many generations, has the natural ability",
    "to sizeshift into any size between, and a few sizes",
    "beyond, those of her ancesters.  She herself marries a",
    "living golem the size of a human's hand, and as such she",
    "spends much of her time at that size.  There is a",
    "particularly cute scene within Man from Mundania, in which",
    "she sits on that book's namesake's shoulder, and ties her",
    "archetypically long hair through his shirt button hole as",
    "a means of anchoring herself in case of falls."
  }
}
G.localization.descriptions.Other["j_tommelise"] = {
  name = "Thumbelina (originally Tommelise)",
  text = {
    "{C:attention}Source:{} Tale by Hans Christian Anderson (1835)",
    "{C:attention}This depiction:{} Don Bluth's Thumbelina (1994)",
    "{C:attention}Category:{} Naturally tiny"
  }
}
G.localization.descriptions.Other["j_tinkerbell"] = {
  name = "Tinker Bell",
  text = {
    "{C:attention}Source:{} Peter Pan, by J. M. Barrie (1902)",
    "{C:attention}This depiction:{} Disney's Peter Pan (1953)",
    "{C:attention}Category:{} Naturally tiny"
  }
}

if not to_big then
  function to_big(v)
    return v
  end
end

local function reverse(tab)
    for i = 1, #tab/2, 1 do
        tab[i], tab[#tab-i+1] = tab[#tab-i+1], tab[i]
    end
    return tab
end

local FoodJokers = {
  -- Vanilla
  'Gros Michel','Ice Cream','Cavendish','Turtle Bean','Diet Cola','Popcorn','Ramen','Seltzer','Egg',
  -- Fusion mods
  'Golden Egg','Sweet Theatre Combo','Blue Java',
  -- Cryptid
  'Nostalgic Candy','Pickle','Chili Pepper','Tropical Smoothie','Pumpkin','Cotton Candy','Wrapped Candy','Chocolate Die','Carved Pumpkin','Clicked Cookie','Candy Cane',
  'Candy Buttons','Jawbreaker','Mellowcreme','Brittle Candy','Candy Sticks','Fast Food M','Energia',
  -- Ortalab
  'Taliaferro','Hot Chocolate','Royal Gala','Fine Wine','Mystery Soda','Picnic Basket','Salad',
  -- Other mods
  'Ice Cream Sandwich','Garlic Bread'
}

function IsFoodJoker(card)
  if SMODS.INIT.Cryptid then
    return table.contains(Cryptid.food,card.config.center.key)
  else
    return table.contains(FoodJokers,card.ability.name)
  end
end

local TinyLadies = {
  'Alice','Arrietty','Gadget','Gallica','Lily Enstomach','Momo Ayase','Rapunzel','Thumbelina','Tinker Bell',
  'j_alice','j_arrietty','j_gadget','j_gallica','j_enstomach','j_ayase','j_rapunzel','j_tommelise','j_tinkerbell',
  'j_pocket_alice','j_pocket_arrietty','j_pocket_gadget','j_pocket_gallica','j_pocket_enstomach','j_pocket_ayase','j_pocket_rapunzel','j_pocket_tommelise','j_pocket_tinkerbell'
}

local OtherIncompats = {
  -- too small to buff (lore reasons rather than mechanical reasons)
  'Wee Joker','DNA',
  -- no variables to buff
  'Four Fingers','Mime','Sixth Sense','Dusk','Pareidolia','Hack','Chaos the Clown','Splash','Seance','Shortcut','Midas Mask','Luchador','Mr. Bones','Sock and Buskin',
  'Smeared Joker','Showman','Misprint','Opps! All 6s','Invisible Joker','Brainstorm','Cartomancer','Chicot','Perkeo','Marble Joker','Superposition','Certificate','Astronomer',
  'Burnt Joker','Oscar Best Actor','Blueprint',
}

local function has_joker(val)
  for k, v in pairs(G.jokers.cards) do
    if v.ability.set == 'Joker' and v.config.center_key == val then 
      return k
    end
  end
  return -1
end

function serializeTable(val, name, skipnewlines, depth)
  skipnewlines = skipnewlines or false
  depth = depth or 0

  local tmp = string.rep(" ", depth)

  if name then tmp = tmp .. name .. " = " end

  if type(val) == "table" then
    tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

    for k, v in pairs(val) do
      tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
    end

    tmp = tmp .. string.rep(" ", depth) .. "}"
  elseif type(val) == "number" then
    tmp = tmp .. tostring(val)
  elseif type(val) == "string" then
    tmp = tmp .. string.format("%q", val)
  elseif type(val) == "boolean" then
    tmp = tmp .. (val and "true" or "false")
  else
    tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
  end

  return tmp
end

function dispTable(val)
  local s = ""
  for k, v in ipairs(val) do
    if #s <= 0 then
	  s = v
	else
	  s = s..", "..v
	end
  end
  return s
end

function SMODS.INIT.Pockettes()
  local mod_id = "Pockettes"
  local mod_obj = SMODS.findModByID(mod_id)
  
  table.insert(G.P_JOKER_RARITY_POOLS, {})
  table.insert(G.C.RARITY, HEX("FFABAF"))

  loc_colour("mult", nil)
  G.ARGS.LOC_COLOURS["pockettes"] = G.C.RARITY[5]
  
  SMODS.Joker { -- Collector's Dollhouse
	  name = "Collector's Dollhouse",
    key = 'Dollhouse',
	loc_txt = {
	  name = "Collector's Dollhouse",
	  text = {
	    "Pockettes on either side of this Joker",
		"are considered Occupants.",
		"Pockettes adjacent to Occupants are also",
		"considered Occupants.",
		"All Occupants are treated as {C:dark_edition}Negative{}.",
		"{C:inactive}(Occupants: {V:1}#1#{C:inactive}){}"
	  },
	  unlock = {
	    "Have at least {C:attention}3{} unique",
		"Pockettes at once"
	  }
	},
	config = {
	  extra = {
	    occupants = {},
		framebuffer = 0
	  }
	},
	loc_vars = function(self, info_queue, card)
	  if FlowerPot then
	    card_progress = G.PROFILES[G.SETTINGS.profile].joker_usage[self.key] or {}
        table.insert(info_queue, {key = 'record_highest_occupancy', set = 'Other', vars = {to_number((card_progress.records and card_progress.records.highest_occupancy) or 0)}})
	  end
	  if card.ability.extra.occupants == nil or #card.ability.extra.occupants == 0 then
	    return { vars = { 'None', colours = {G.C.RED}} }
	  else
	    return { vars = { dispTable(card.ability.extra.occupants), colours = {G.C.FILTER}} }
	  end
	end,
	unlocked = false,
    rarity = 3,
    pos = { x = 7, y = 0},
    atlas = "Pockettes",
    cost = 8,
    blueprint_compat = false,
	check_for_unlock = function(args)
      if not G.jokers or not G.jokers.cards then
	    return false
	  end
	  local m = 0
	  local z = {}
	  for i,v in ipairs(G.jokers.cards) do
	    if table.contains(TinyLadies,v.config.center.key) and not table.contains(z,v.config.center.key) then
		  m = m + 1
		  table.insert(z, v.config.center.key)
		end
	  end
	  return m>=3
	end,
    calculate = function(self, card, context)
	  if context.selling_self then
	    local m = 0
	    for i,v in ipairs(G.jokers.cards) do
	      if v.ability.dollhouse then
		    m = m + 1
		  end
	      v.ability.dollhouse = false
	    end
	    G.jokers.config.card_limit = G.jokers.config.card_limit - m
		card.ability.extra.framebuffer = 30
	  elseif context.selling_card then
	    if context.card.ability.dollhouse then
	      G.jokers.config.card_limit = G.jokers.config.card_limit - 1
		end
	  end
	end,
	update = function(self, card, dt)
      if not G.jokers or not G.jokers.cards then
	    return
	  elseif card.ability.extra.framebuffer > 0 then
	    card.ability.extra.framebuffer = card.ability.extra.framebuffer - 1
		return
	  end
	  local f = {}
	  local m = 0
	  card.ability.extra.occupants = {}
	  for i,v in ipairs(G.jokers.cards) do
	    -- if it was counted on the previous frame, it should be counted on this frame even if it is now negative
	    if v.ability.dollhouse and not(v.ability.dollhouse_negative) then
		  m = m + 1
		end
	    v.ability.dollhouse = false
	    if v.config.center.key == card.config.center.key then
		  table.insert(f, i)
		end
	  end
	  G.jokers.config.card_limit = G.jokers.config.card_limit - m
	  for i2,v2 in ipairs(f) do
	    if f[i2] > 0 then
	      local i = 1
	      local z = {}
		  if f[i2] > 1 then
	        z = {f[i2] - 1}
		    while i <= #z do
		      if z[i] > 0 then
		        if table.contains(TinyLadies,G.jokers.cards[z[i]].config.center.key) then
				  if G.jokers.cards[f[i2]] == card then
			        table.insert(card.ability.extra.occupants, G.jokers.cards[z[i]].ability.name)
				  end
				  if (G.jokers.cards[z[i]].edition and G.jokers.cards[z[i]].edition.negative) then
				    G.jokers.cards[z[i]].ability.dollhouse_negative = true
				  end
		          G.jokers.cards[z[i]].ability.dollhouse = true
				  if G.jokers.cards[z[i]-1] then
			        table.insert(z,z[i]-1)
				  end
		        end
		        i = i + 1
		      end
		    end
		    reverse(card.ability.extra.occupants)
		  end
		  if f[i2] < #G.jokers.cards then
	        z = {f[i2] + 1}
		    i = 1
		    while i <= #z do
		      if z[i] <= #G.jokers.cards then
		        if table.contains(TinyLadies,G.jokers.cards[z[i]].config.center.key) then
				  if G.jokers.cards[f[i2]] == card then
			        table.insert(card.ability.extra.occupants, G.jokers.cards[z[i]].ability.name)
				  end
				  if (G.jokers.cards[z[i]].edition and G.jokers.cards[z[i]].edition.negative) then
				    G.jokers.cards[z[i]].ability.dollhouse_negative = true
				  else
				    G.jokers.cards[z[i]].ability.dollhouse_negative = false
				  end
		          G.jokers.cards[z[i]].ability.dollhouse = true
				  if G.jokers.cards[z[i]+1] then
			        table.insert(z,z[i]+1)
				  end
		        end
		        i = i + 1
		      end
		    end
		  end
	    end
	  end
	  m = 0
	  for i,v in ipairs(G.jokers.cards) do
	    if v.ability.dollhouse and not(v.edition and v.edition.negative) then
		  m = m + 1
		end
	  end
	  G.jokers.config.card_limit = G.jokers.config.card_limit + m
	end
  }
  
  SMODS.Joker { -- Alice
      name = "Alice",
    key = 'alice',
    loc_txt = {
      name = "Alice",
      text = {
        "Loses {X:mult,C:white}X#1#{} of mult for each scoring {C:hearts}Heart{} or {C:attention}Queen{}.",
        "Loses {X:mult,C:white}X#2#{} of mult for each played {C:hearts}Queen of Hearts{}",
        "Resets and gains {X:mult,C:white}X#3#{} for each Drink Joker consumed.",
        "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} mult)"
      }
    },
    config = {
      extra = {
        Xmult = to_big(0.1),
        XmultB = to_big(0.5),
        XmultC = to_big(1),
        total = to_big(3),
        totalB = to_big(3)
      }
    },
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_alice'})
	  if FlowerPot then
	    card_progress = G.PROFILES[G.SETTINGS.profile].joker_usage[self.key] or {}
        table.insert(info_queue, {key = 'record_highest_xmult', set = 'Other', vars = {to_number((card_progress.records and card_progress.records.highest_xmult) or 3)}})
	  end
      return {
        vars = {
          card.ability.extra.Xmult,
          card.ability.extra.XmultB,
          card.ability.extra.XmultC,
          card.ability.extra.total
        }
      }
    end,
    rarity = 3,
    pos = { x = 0, y = 0},
    soul_pos = { x = 0, y = 1},
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.before and not context.blueprint then
        local reduced = false
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i]:is_suit('Hearts') or context.scoring_hand[i]:get_id() == 12 then
            if not(context.scoring_hand[i]:is_suit('Hearts') and context.scoring_hand[i]:get_id() == 12) and not context.scoring_hand[i].debuff then
              reduced = true
              card.ability.extra.total = to_big(card.ability.extra.total) - to_big(card.ability.extra.Xmult)
            end
          end
        end
        for i = 1, #context.full_hand do
          if context.full_hand[i]:is_suit('Hearts') and (context.full_hand[i]:get_id() == 12) and not context.scoring_hand[i].debuff then
            reduced = true
            card.ability.extra.total = to_big(card.ability.extra.total) - to_big(card.ability.extra.XmultB)
          end
        end
        if reduced then
          if card.ability.extra.total <= 1 then
            G.E_MANAGER:add_event(Event({
              func = function()
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                  func = function()
                      G.jokers:remove_card(card)
                      card:remove()
                      card = nil
                    return true; end})) 
                return true
              end
            })) 
            return {
              message = localize('k_headless'),
              colour = G.C.RED,
              card = card
            }
          else
            return {
              message = localize{type='variable',key='a_xmult',vars={card.ability.extra.total}},
              colour = G.C.RED,
              card = card
            }
          end
        end
      end
      
      if ((context.selling_card and context.card.ability.name == 'Diet Cola') or context.drink) and not context.blueprint then
        sendErrorMessage('vvv')
        alice_drink_buff(card)
      end
      
      if context.cardarea == G.jokers and card.ability.extra.Xmult > to_big(0) and context.joker_main then
        return {
          message = localize{type='variable',key='a_xmult',vars={card.ability.extra.total}},
          Xmult_mod = card.ability.extra.total
        }
      end
    end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          {
            border_nodes = {
              { text = "X" },
              { ref_table = "card.ability.extra", ref_value = "total", retrigger_type = "exp" }
            }
          }
        }
	  }
	end
  }
  
  SMODS.Joker { -- Arrietty
      name = "Arrietty",
    key = 'arrietty',
    loc_txt = {
      name = "Arrietty",
      text = {
        "Booster packs allow you to",
        "choose #1# extra card."
      }
    },
    config = {
      extra = {
        inc = 1
      }
    },
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_arrietty'})
      return {
        vars = {
          card.ability.extra.inc
        }
      }
    end,
    rarity = 3,
    pos = { x = 1, y = 0},
    soul_pos = { x = 1, y = 1},
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.open_booster then
        if G.GAME.pack_choices < G.GAME.pack_size then
          G.GAME.pack_choices = G.GAME.pack_choices + card.ability.extra.inc
          if G.GAME.pack_choices > G.GAME.pack_size then
            G.GAME.pack_choices = G.GAME.pack_size
          end
          return {
            message = localize('k_borrow'),
            colour = G.C.RED,
            card = card
          }
        end
      end
    end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { ref_table = "card.joker_display_values", ref_value = "active" }
        },
        calc_function = function(card)
		  local m = {
		    G.STATES.SMODS_BOOSTER_OPENED,
		    G.STATES.TAROT_PACK,
		    G.STATES.PLANET_PACK,
		    G.STATES.SPECTRAL_PACK,
		    G.STATES.STANDARD_PACK,
		    G.STATES.BUFFOON_PACK,
		  }
          card.joker_display_values.active = (table.contains(m,G.STATE) and localize("jdis_active") or localize("jdis_inactive"))
        end,
        style_function = function(card, text, reminder_text, extra)
		  local m = {
		    G.STATES.SMODS_BOOSTER_OPENED,
		    G.STATES.TAROT_PACK,
		    G.STATES.PLANET_PACK,
		    G.STATES.SPECTRAL_PACK,
		    G.STATES.STANDARD_PACK,
		    G.STATES.BUFFOON_PACK,
		  }
		  if table.contains(m,G.STATE) then
			text.children[1].config.colour = G.C.UI.TEXT_LIGHT
		  else
			text.children[1].config.colour = G.C.UI.TEXT_INACTIVE
		  end
		  return true
        end
      }
	end
  }
  
  SMODS.Joker { -- Gadget
      name = "Gadget",
    key = 'gadget',
    loc_txt = {
      name = "Gadget",
      text = {
        "After #1# hands, has a {C:green}#2# in #3#{} chance to produce",
        "a Blueprint. If successful, doubles length of timer. Resets.",
        "{C:inactive}(Currently #4#/#5#){}"
      }
    },
    config = {
      extra = {
        timer = 3,
        tick = 3,
        odds = 5
      }
    },
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_gadget'})
      table.insert(info_queue, G.P_CENTERS.j_blueprint)
      return {
        vars = {
          card.ability.extra.timer,
          ''..(G.GAME and G.GAME.probabilities.normal or 1),
          card.ability.extra.odds,
          (card.ability.extra.timer - card.ability.extra.tick),
          card.ability.extra.timer
        }
      }
    end,
    rarity = 3,
    pos = { x = 4, y = 0 },
    soul_pos = { x = 4, y = 1 },
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    calculate = function(self, card, context)
      if context.joker_main and not context.blueprint then
        card.ability.extra.tick = card.ability.extra.tick - 1
        if card.ability.extra.tick <= 0 then
          if pseudorandom('gadget') < G.GAME.probabilities.normal/card.ability.extra.odds and #G.jokers.cards < G.jokers.config.card_limit then
            t = {
              set = 'Joker',
              area = G.jokers,
              key = 'j_blueprint'
            }
            card.ability.extra.timer = card.ability.extra.timer * 2
            card.ability.extra.tick = card.ability.extra.timer
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,
              func = function()
                SMODS.add_card(t)
                return true
              end
            }))
            return {
              message = localize('k_gadget_ex_good'),
              colour = G.C.GOLD,
              card = card
            }
          else
            card.ability.extra.tick = card.ability.extra.timer
            return {
              message = localize('k_gadget_ex_bad'),
              colour = G.C.GOLD,
              card = card
            }
          end
        end
      end
    end,
    joker_display_def = function(JokerDisplay)
	  return {
	    text = {
          { ref_table = "card.ability.extra", ref_value = "tick" },
		  { text = "/" },
          { ref_table = "card.ability.extra", ref_value = "timer" },
		},
	    extra = {
	      {
            { ref_table = "card.joker_display_values", ref_value = "odds" },
		  }
		},
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
          card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
		end
	  }
	end
  }

  SMODS.Joker { -- Gallica
      name = "Gallica",
    key = 'gallica',
    loc_txt = {
      name = "Gallica",
      text = {
        "If scoring hand contains a face card,",
		"add the product of the lowest ranks",
		"from each non-scoring suit held in hand",
		"to {C:mult}Mult{}."
      }
    },
    config = {
      extra = {
        face = false,
		wild = false,
		suits = {}
      }
    },
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_gallica'})
      return {}
    end,
    rarity = 3,
    pos = { x = 8, y = 0 },
    soul_pos = { x = 8, y = 1 },
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
	    if context.other_card:is_face() and not context.other_card.debuff then
		  card.ability.extra.face = true
		end
		if context.other_card.debuff then
		elseif context.other_card.ability.name == 'Wild Card' then
		  card.ability.extra.wild = true
		elseif not table.contains(card.ability.extra.suits,context.other_card.base.suit) then
		  table.insert(card.ability.extra.suits,context.other_card.base.suit)
		end
	  end
	  
      if context.cardarea == G.jokers and context.joker_main then
	    if card.ability.extra.face and not card.ability.extra.wild then
		  card.ability.extra.face = false
		  local m = {}
		  for i,v in pairs(SMODS.Suits) do
		    if table.contains(card.ability.extra.suits,v.key) then
		      m[v.key] = {value = -100000, id = nil}
			else
		      m[v.key] = {value = 100000, id = nil}
			end
		  end
		  local w = {value = 100000, id = nil}
          for i=1, #G.hand.cards do
		    local r = G.hand.cards[i].base.nominal
			if G.hand.cards[i].ability.name == 'Wild Card' then
			  if r < w.value then
			    w.value = r
				w.id = G.hand.cards[i]
			  end
			else
			  if r < m[G.hand.cards[i].base.suit].value then
			    m[G.hand.cards[i].base.suit].value = r
				m[G.hand.cards[i].base.suit].id = G.hand.cards[i]
			  end
			end
		  end
		  if w.id ~= nil then
		    local s = ''
			local top = 1
			for i,v in pairs(m) do
			  if v.value > top then
			    s = i
			  end
			end
			m[s] = w
		  end
		  local z = 1
		  for i,v in pairs(m) do
			if v.id ~= nil and not v.id.debuff then
		      z = z * v.value
			end
		  end
		  if z > 1 then
		    card.ability.extra.suits = {}
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,
              func = function()
		        for i,v in pairs(m) do
			      if v.id ~= nil then
				    if v.id.debuff then
			          v.id:juice_up(0.1, 0.2)
					else
			          v.id:juice_up(0.3, 0.4)
					end
			      end
				end
			    return true
			  end
            }))
            return {
              message = localize{type='variable',key='a_mult',vars={z}},
              mult_mod = z
            }
		  end
		end
		card.ability.extra.face = false
		card.ability.extra.suits = {}
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { text = "+" },
          { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        calc_function = function(card)
		  local mult = 0
		  local face = false
		  local s = {}
		  local w = false
          local playing_hand = next(G.play.cards)
          local text, _, scoring_hand = JokerDisplay.evaluate_hand()
          if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
              if scoring_card:is_face() then
			    face = true
              end
		      if scoring_card.debuff then
		      elseif scoring_card.ability.name == 'Wild Card' then
		        w = true
		      elseif not table.contains(s,scoring_card.base.suit) then
		        table.insert(s,scoring_card.base.suit)
		      end
            end
          end
		  if face then
		    local m = {}
		    for i,v in pairs(SMODS.Suits) do
		      if table.contains(s,v.key) then
		        m[v.key] = {value = -100000, id = nil}
			  else
		        m[v.key] = {value = 100000, id = nil}
			  end
		    end
		    local w = { value = 100000, id = nil}
            for _, playing_card in ipairs(G.hand.cards) do
              if playing_hand or not playing_card.highlighted then
		        local r = playing_card.base.nominal
			    if playing_card.ability.name == 'Wild Card' then
			      if r < w.value then
			        w.value = r
					w.id = playing_card
			      end
			    else
			      if r < m[playing_card.base.suit].value then
			        m[playing_card.base.suit].value = r
			        m[playing_card.base.suit].id = playing_card
				  end
			    end
			  end
		    end
			if w.id ~= nil then
		      local s = ''
			  local top = 1
			  for i,v in pairs(m) do
			    if v.value > top then
			      s = i
			    end
			  end
			  m[s] = w
			end
			local up = false
		    for i,v in pairs(m) do
			  if v.id ~= nil then
			    up = true
			  end
			end
			if up then
		      mult = 1
		      for i,v in pairs(m) do
			    if v.id ~= nil and not v.id.debuff then
		          mult = mult * v.value
				end
			  end
		    end
		  end
		  card.joker_display_values.mult = mult
		end
	  }
	end
  }

  SMODS.Joker { -- Lily Enstomach
    name = "Lily Enstomach",
    key = 'enstomach',
    loc_txt = {
      name = "Lily Enstomach",
      text = {
        "After {C:attention}#1#{}/#2# Food Jokers consumed, selects a random",
        "applicable Joker (Food Jokers and Pockettes excluded).",
        "{C:green}#3# in #4#{} chance to {C:mult}destroy this card{} and significantly",
        "buff that Joker.  Otherwise, destroy the target Joker",
        "and double {X:mult,C:white}Xmult{}.",
        "{C:inactive}(Currently {X:mult,C:white}X#5#{C:inactive} mult){}"
      }
    },
    config = {
      extra = {
        counter = 1,
        tick = 1,
        odds = 5,
        Xmult = 2
      }
    },
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_enstomach'})
	  if FlowerPot then
	    card_progress = G.PROFILES[G.SETTINGS.profile].joker_usage[self.key] or {}
        table.insert(info_queue, {key = 'record_highest_xmult', set = 'Other', vars = {to_number((card_progress.records and card_progress.records.highest_xmult) or 1)}})
	  end
      return {
        vars = {
          card.ability.extra.tick,
          card.ability.extra.counter,
          ''..(G.GAME and G.GAME.probabilities.normal or 1),
          card.ability.extra.odds,
          card.ability.extra.Xmult
        }
      }
    end,
    rarity = 3,
    pos = { x = 6, y = 0 },
    soul_pos = { x = 6, y = 1 },
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    blueprint_compat = true,
    eternal_compat = false,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and (card.ability.extra.Xmult > 1) and context.joker_main then
        return {
          message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
          Xmult_mod = card.ability.extra.Xmult
        }
      end
      
      if context.after then
        if card.ability.extra.tick <= 0 and not context.blueprint then
          local f = find_enstomach_target()
          card.ability.extra.Xmult = card.ability.extra.Xmult * 2
		  card.ability.extra.counter = card.ability.extra.counter + 1
          card.ability.extra.tick = card.ability.extra.tick + card.ability.extra.counter
          if f == 0 then
          else
            x = {
              message = localize('k_enstomach_swallow'),
              colour = G.C.GREEN,
              card = card
            }
            f = G.jokers.cards[f]
            card_eval_status_text(card, 'jokers', nil, percent, nil, x)
            percent = (percent or 0) + (percent_delta or 0.08)
            G.E_MANAGER:add_event(Event({
              func = function()
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, blockable = false,
                  func = function()
                    G.jokers:remove_card(card)
                    card:remove()
                    f:juice_up(0.7, 0.5)
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.7, blockable = false,
                      func = function()
                        f:juice_up(0.7, 0.5)
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.7, blockable = false,
                          func = function()
                            f:juice_up(0.7, 0.5)
                            z = G.GAME.probabilities.normal/card.ability.extra.odds
                            if f.ability.name == 'Dementia Joker' and f.edition and f.edition.negative then
                              z = z * z
							elseif f.ability.eternal then
							  z = 1 - ((1 - z) * (1 - z) * (1 - z))
                            end
							zbuff = card.ability.extra.Xmult / 2
                            if (pseudorandom('lily-gulped') < z) then
                              card = nil
                              local z = {}
                              if f.estomach_compat ~= nil then
                                z = f.estomach_compat
                              elseif f.ability.estomach_compat ~= nil then
                                z = f.ability.estomach_compat
                              elseif f.ability.extra ~= nil and type(f.ability.extra) == "table" and f.ability.extra.estomach_compat ~= nil then
                                z = f.ability.extra.estomach_compat
                              elseif f.ability.name == 'Joker' then
                                z = {
                                  type = "chips",
                                  var = "mult"
                                }
                              elseif f.ability.name == 'Greedy Joker' or f.ability.name == 'Lusty Joker' or f.ability.name == 'Wrathful Joker' or f.ability.name == 'Gluttonous Joker' then
                                z = {
                                  type = "mult per card",
                                  var = "s_mult",
								  extra = true
                                }
                              elseif f.ability.name == 'Joker Stencil' then
                                z = {
                                  type = "Xmult per card",
                                  var = "x_mult",
								  extra = true
                                }
                              elseif f.ability.name == 'Green Joker' or f.ability.name == 'Flag Bearer' then
                                z = {
                                  type = "increment",
                                  var = "hand_add",
                                  extra = true
                                }
                              elseif f.ability.name == 'Riff-raff (Pockettes)' or f.ability.name == 'Fortune Teller (Pockettes)' then
                                z = {
                                  type = "increment",
                                  var = "extra"
                                }
                              elseif f.ability.name == 'Raised Fist (Pockettes)' then
                                z = {
                                  type = "increment",
                                  var = "v",
								  extra = true
                                }
                              elseif f.ability.name == 'Supernova' or f.ability.name == 'Swashbuckler (Pockettes)' then
                                z = {
                                  type = "Xmult per card",
                                  var = "v",
								  extra = true
                                }
                              elseif f.ability.name == '8 Ball' or f.ability.name == 'Business Card' or f.ability.name == 'Space Joker' or f.ability.name == 'Hallucination' then
                                z = {
                                  type = "probability",
                                  var = "extra"
                                }
                              elseif f.ability.name == 'Reserved Parking' or f.ability.name == 'Solar Flare Joker' then
                                z = {
                                  type = "probability",
                                  var = "odds",
                                  extra = true
                                }
                              elseif f.ability.name == 'Ride A Bull' then
                                z = {
                                  type = "decrease",
                                  var = "dollars",
                                  extra = true
                                }
                              elseif f.ability.name == 'Madness' then
                                z = {
                                  type = "chips",
                                  var = "x_mult"
                                }
                              elseif f.ability.name == 'Madness' then
                                z = {
                                  type = "evil",
                                  var = "x_mult"
                                }
                              elseif f.ability.name == 'Ceremonial Dagger' then
                                z = {
                                  type = "evil",
                                  var = "mult"
                                }
                              elseif f.ability.name == 'Serial Killer' then
                                z = {
                                  type = "evil",
                                  var = "Xmult"
                                }
                              elseif f.ability.name == 'Castle' or f.ability.name == 'Spade Archer' then
                                z = {
                                  type = "chips",
                                  var = "chips",
                                  extra = true
                                }
                              elseif f.ability.name == 'Campfire' then
                                z = {
                                  type = "Xmult reset",
                                  var = "x_mult"
                                }
                              elseif f.ability.name == 'Obelisk' or f.ability.name == 'Lucky Cat' or f.ability.name == 'Vampire' or f.ability.name == 'Hologram' or f.ability.name == 'Glass Joker' or f.ability.name == 'Yorick' then
                                z = {
                                  type = "Xmult",
                                  var = "x_mult"
                                }
                              elseif f.ability.name == 'Even Steven' or f.ability.name == 'Odd Todd' then
                                z = {
                                  type = "Xmult",
                                  var = "extra"
                                }
                              elseif f.ability.name == 'Canio' then
                                z = {
                                  type = "Xmult",
                                  var = "caino_xmult"
                                }
                              elseif f.ability.name == 'Mystic Summit' then
                                z = {
                                  type = "base as upgrade",
                                  var = "mult",
								  extra = true
                                }
                              elseif f.ability.name == 'Red Card' or f.ability.name == 'Flower Pot' or f.ability.name == 'The Idol' or f.ability.name == 'Seeing Double' or f.ability.name == 'Matador' or f.ability.name == "Driver's License" then
                                z = {
                                  type = "double",
                                  var = "extra"
                                }
                              elseif f.ability.name == 'Bloodstone' then
                                z = {
                                  type = "Xmult per card",
                                  var = "Xmult"
                                }
                              elseif f.ability.name == 'Fishclown' then
                                z = {
                                  type = "Xmult per card",
                                  var = "x_mult"
                                }
                              elseif f.ability.name == 'Baron' or f.ability.name == 'Baseball Card' or f.ability.name == 'Ancient Joker' then
                                z = {
                                  type = "Xmult per card",
                                  var = "Xmult",
                                  extra = true
                                }
                              elseif f.ability.name == 'Rocket' then
                                z = {
                                  type = "counter",
                                  var = "dollars"
                                }
                              elseif f.ability.name == 'Steel Joker' or f.ability.name == 'Constellation' or f.ability.name == 'Abstract Joker' or f.ability.name == 'Hiker' or f.ability.name == 'Camping Trip' or f.ability.name == 'Vagabond' or f.ability.name == 'Erosion' or f.ability.name == 'Stone Joker' or f.ability.name == 'Scary Face' or f.ability.name == 'Trading Card' or f.ability.name == 'Smiley Face' or f.ability.name == 'Golden Ticket' or f.ability.name == 'Throwback' or f.ability.name == 'Arrowhead' or f.ability.name == 'Onyx Agate' or f.ability.name == 'To the Moon' or f.ability.name == 'Banner' then
                                z = {
                                  type = "base as upgrade",
                                  var = "extra"
                                }
								if f.ability.name == 'To the Moon' then
								  z.interest = true
								end
                              elseif f.ability.name == 'Bootstraps' or f.ability.name == 'Club Wizard' then
                                z = {
                                  type = "base as upgrade",
                                  var = "mult",
                                  extra = true
                                }
                              elseif f.ability.name == 'Big Bang' or f.ability.name == 'Loyalty Card' then
                                z = {
                                  type = "base as upgrade",
                                  var = "Xmult",
                                  extra = true
                                }
                              elseif f.ability.name == 'Moorstone' then
                                z = {
                                  type = "base as upgrade",
                                  var = "chips_add2",
                                  extra = true
                                }
                              elseif f.ability.name == 'Scholar' or f.ability.name == 'Uncanny Face' then
                                z = {
                                  type = "base as upgrade - half double",
                                  var = "chips",
                                  var2 = "mult",
                                  extra = true
                                }
                              elseif f.ability.name == 'Commercial Driver' then
                                z = {
                                  type = "Xmult",
                                  var = "total",
                                  extra = true
                                }
                              elseif f.ability.name == 'Walkie Talkie' then
                                z = {
                                  type = "base as upgrade - double",
                                  var = "chips",
                                  var2 = "mult",
                                  extra = true
                                }
                              elseif f.ability.name == 'Flash Card' or f.ability.name == 'Spare Trousers' or f.ability.name == 'Collectible Chaos Card' then
                                z = {
                                  type = "mult",
                                  var = "mult"
                                }
                              elseif f.ability.extra ~= nil and type(f.ability.extra) == "table" then
                                if f.ability.extra.h_size ~= nil and f.ability.extra.h_size > 1 then
                                  z = {
                                    type = "increase",
                                    var = "h_size",
                                    extra = true,
                                    hand_size = true
                                  }
                                elseif f.ability.extra.hands ~= nil and f.ability.extra.hands > 1 then
                                  z = {
                                    type = "increase",
                                    var = "hands",
                                    extra = true,
                                    hands = true
                                  }
                                elseif f.ability.extra.d_size ~= nil and f.ability.extra.d_size > 1 then
                                  z = {
                                    type = "increase",
                                    var = "d_size",
                                    extra = true,
                                    discard = true
                                  }
                                elseif f.ability.extra.eee_mult ~= nil and f.ability.extra.eee_mult > 1 then
                                  z = {
                                    type = "EEEmult",
                                    var = "eee_mult",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEEmult ~= nil and f.ability.extra.EEEmult > 1 then
                                  z = {
                                    type = "EEEmult",
                                    var = "EEEmult",
                                    extra = true
                                  }
                                elseif f.ability.extra.eee_mult_mod ~= nil and f.ability.extra.eee_mult_mod > 1 then
                                  z = {
                                    type = "EEEmult",
                                    var = "eee_mult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEEmult_mod ~= nil and f.ability.extra.EEEmult_mod > 1 then
                                  z = {
                                    type = "EEEmult",
                                    var = "EEEmult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.ee_mult ~= nil and f.ability.extra.ee_mult > 1 then
                                  z = {
                                    type = "EEmult",
                                    var = "ee_mult",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEmult ~= nil and f.ability.extra.EEmult > 1 then
                                  z = {
                                    type = "EEmult",
                                    var = "EEmult",
                                    extra = true
                                  }
                                elseif f.ability.extra.ee_mult_mod ~= nil and f.ability.extra.ee_mult_mod > 1 then
                                  z = {
                                    type = "EEmult",
                                    var = "ee_mult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEmult_mod ~= nil and f.ability.extra.EEmult_mod > 1 then
                                  z = {
                                    type = "EEmult",
                                    var = "EEmult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.e_mult ~= nil and f.ability.extra.e_mult > 1 then
                                  z = {
                                    type = "Emult",
                                    var = "e_mult",
                                    extra = true
                                  }
                                elseif f.ability.extra.Emult ~= nil and f.ability.extra.Emult > 1 then
                                  z = {
                                    type = "Emult",
                                    var = "Emult",
                                    extra = true
                                  }
                                elseif f.ability.extra.e_mult_mod ~= nil and f.ability.extra.e_mult_mod > 1 then
                                  z = {
                                    type = "Emult",
                                    var = "e_mult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.Emult_mod ~= nil and f.ability.extra.Emult_mod > 1 then
                                  z = {
                                    type = "Emult",
                                    var = "Emult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.x_mult ~= nil and f.ability.extra.x_mult > 1 then
                                  z = {
                                    type = "Xmult",
                                    var = "x_mult",
                                    extra = true
                                  }
                                elseif f.ability.extra.Xmult ~= nil and f.ability.extra.Xmult > 1 then
                                  z = {
                                    type = "Xmult",
                                    var = "Xmult",
                                    extra = true
                                  }
                                elseif f.ability.extra.x_mult_mod ~= nil and f.ability.extra.x_mult_mod > 1 then
                                  z = {
                                    type = "Xmult",
                                    var = "x_mult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.Xmult_mod ~= nil and f.ability.extra.Xmult_mod > 1 then
                                  z = {
                                    type = "Xmult",
                                    var = "Xmult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.mult ~= nil and f.ability.extra.mult > 0 then
                                  z = {
                                    type = "mult",
                                    var = "mult",
                                    extra = true
                                  }
                                elseif f.ability.extra.t_mult ~= nil and f.ability.extra.t_mult > 0 then
                                  z = {
                                    type = "mult",
                                    var = "t_mult",
                                    extra = true
                                  }
                                elseif f.ability.extra.s_mult ~= nil and f.ability.extra.s_mult > 0 then
                                  z = {
                                    type = "mult per card",
                                    var = "s_mult",
                                    extra = true
                                  }
                                elseif f.ability.extra.mult_mod ~= nil and f.ability.extra.mult_mod > 0 then
                                  z = {
                                    type = "mult",
                                    var = "mult_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.eee_chips ~= nil and f.ability.extra.eee_chips > 0 then
                                  z = {
                                    type = "EEEchips",
                                    var = "eee_chips",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEEchips ~= nil and f.ability.extra.EEEchips > 0 then
                                  z = {
                                    type = "EEEchips",
                                    var = "EEEchips",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEEchips_mod ~= nil and f.ability.extra.EEEchips_mod > 0 then
                                  z = {
                                    type = "EEEchips",
                                    var = "EEEchips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.eee_chips_mod ~= nil and f.ability.extra.eee_chips_mod > 0 then
                                  z = {
                                    type = "EEEchips",
                                    var = "eee_chips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEEchip_mod ~= nil and f.ability.extra.EEEchip_mod > 0 then
                                  z = {
                                    type = "EEEchips",
                                    var = "EEEchip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.eee_chip_mod ~= nil and f.ability.extra.eee_chip_mod > 0 then
                                  z = {
                                    type = "EEEchips",
                                    var = "eee_chip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.ee_chips ~= nil and f.ability.extra.ee_chips > 0 then
                                  z = {
                                    type = "EEchips",
                                    var = "ee_chips",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEchips ~= nil and f.ability.extra.EEchips > 0 then
                                  z = {
                                    type = "EEchips",
                                    var = "EEchips",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEchips_mod ~= nil and f.ability.extra.EEchips_mod > 0 then
                                  z = {
                                    type = "EEchips",
                                    var = "EEchips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.ee_chips_mod ~= nil and f.ability.extra.ee_chips_mod > 0 then
                                  z = {
                                    type = "EEchips",
                                    var = "ee_chips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.EEchip_mod ~= nil and f.ability.extra.EEchip_mod > 0 then
                                  z = {
                                    type = "EEchips",
                                    var = "EEchip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.ee_chip_mod ~= nil and f.ability.extra.ee_chip_mod > 0 then
                                  z = {
                                    type = "EEchips",
                                    var = "ee_chip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.e_chips ~= nil and f.ability.extra.e_chips > 0 then
                                  z = {
                                    type = "Echips",
                                    var = "e_chips",
                                    extra = true
                                  }
                                elseif f.ability.extra.Echips ~= nil and f.ability.extra.Echips > 0 then
                                  z = {
                                    type = "Echips",
                                    var = "Echips",
                                    extra = true
                                  }
                                elseif f.ability.extra.Echips_mod ~= nil and f.ability.extra.Echips_mod > 0 then
                                  z = {
                                    type = "Echips",
                                    var = "Echips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.e_chips_mod ~= nil and f.ability.extra.e_chips_mod > 0 then
                                  z = {
                                    type = "Echips",
                                    var = "e_chips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.Echip_mod ~= nil and f.ability.extra.Echip_mod > 0 then
                                  z = {
                                    type = "Echips",
                                    var = "Echip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.e_chip_mod ~= nil and f.ability.extra.e_chip_mod > 0 then
                                  z = {
                                    type = "Echips",
                                    var = "e_chip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.x_chips ~= nil and f.ability.extra.x_chips > 0 then
                                  z = {
                                    type = "Xchips",
                                    var = "x_chips",
                                    extra = true
                                  }
                                elseif f.ability.extra.Xchips ~= nil and f.ability.extra.Xchips > 0 then
                                  z = {
                                    type = "Xchips",
                                    var = "Xchips",
                                    extra = true
                                  }
                                elseif f.ability.extra.Xchips_mod ~= nil and f.ability.extra.Xchips_mod > 0 then
                                  z = {
                                    type = "Xchips",
                                    var = "Xchips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.x_chips_mod ~= nil and f.ability.extra.x_chips_mod > 0 then
                                  z = {
                                    type = "Xchips",
                                    var = "x_chips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.Xchip_mod ~= nil and f.ability.extra.Xchip_mod > 0 then
                                  z = {
                                    type = "Xchips",
                                    var = "Xchip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.x_chip_mod ~= nil and f.ability.extra.x_chip_mod > 0 then
                                  z = {
                                    type = "Xchips",
                                    var = "x_chip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.chips ~= nil and f.ability.extra.chips > 0 then
                                  z = {
                                    type = "chips",
                                    var = "chips",
                                    extra = true
                                  }
                                elseif f.ability.extra.chips_mod ~= nil and f.ability.extra.chips_mod > 0 then
                                  z = {
                                    type = "chips",
                                    var = "chips_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.chip_mod ~= nil and f.ability.extra.chip_mod > 0 then
                                  z = {
                                    type = "chips",
                                    var = "chip_mod",
                                    extra = true
                                  }
                                elseif f.ability.extra.t_chips ~= nil and f.ability.extra.t_chips > 0 then
                                  z = {
                                    type = "chips",
                                    var = "t_chips",
                                    extra = true
                                  }
                                elseif f.ability.extra.s_chips ~= nil and f.ability.extra.s_chips > 0 then
                                  z = {
                                    type = "chips",
                                    var = "s_chips",
                                    extra = true
                                  }
                                elseif f.ability.extra.dollars ~= nil and f.ability.extra.dollars > 0 then
                                  z = {
                                    type = "double",
                                    var = "dollars",
                                    extra = true
                                  }
                                elseif f.ability.extra.extra ~= nil and f.ability.extra.extra > 0 then
                                  z = {
                                    type = "increment",
                                    var = "extra",
                                    extra = true
                                  }
                                end
                              elseif f.ability.h_size ~= nil and f.ability.h_size > 1 then
                                z = {
                                  type = "increase",
                                  var = "h_size",
                                  hand_size = true
                                }
                              elseif f.ability.hands ~= nil and f.ability.hands > 1 then
                                z = {
                                  type = "increase",
                                  var = "hands",
                                  hands = true
                                }
                              elseif f.ability.d_size ~= nil and f.ability.d_size > 1 then
                                z = {
                                  type = "increase",
                                  var = "d_size",
                                  discard = true
                                }
                              elseif f.ability.eee_mult ~= nil and f.ability.eee_mult > 1 then
                                z = {
                                  type = "EEmult",
                                  var = "ee_mult"
                                }
                              elseif f.ability.EEEmult ~= nil and f.ability.EEEmult > 1 then
                                z = {
                                  type = "EEEmult",
                                  var = "EEEmult"
                                }
                              elseif f.ability.eee_mult_mod ~= nil and f.ability.eee_mult_mod > 1 then
                                z = {
                                  type = "EEEmult",
                                  var = "eee_mult_mod"
                                }
                              elseif f.ability.EEEmult_mod ~= nil and f.ability.EEEmult_mod > 1 then
                                z = {
                                  type = "EEEmult",
                                  var = "EEEmult_mod"
                                }
                              elseif f.ability.ee_mult ~= nil and f.ability.ee_mult > 1 then
                                z = {
                                  type = "EEmult",
                                  var = "ee_mult"
                                }
                              elseif f.ability.EEmult ~= nil and f.ability.EEmult > 1 then
                                z = {
                                  type = "EEmult",
                                  var = "EEmult"
                                }
                              elseif f.ability.ee_mult_mod ~= nil and f.ability.ee_mult_mod > 1 then
                                z = {
                                  type = "EEmult",
                                  var = "ee_mult_mod"
                                }
                              elseif f.ability.EEmult_mod ~= nil and f.ability.EEmult_mod > 1 then
                                z = {
                                  type = "EEmult",
                                  var = "EEmult_mod"
                                }
                              elseif f.ability.e_mult ~= nil and f.ability.e_mult > 1 then
                                z = {
                                  type = "Emult",
                                  var = "e_mult"
                                }
                              elseif f.ability.Emult ~= nil and f.ability.Emult > 1 then
                                z = {
                                  type = "Emult",
                                  var = "Emult"
                                }
                              elseif f.ability.e_mult_mod ~= nil and f.ability.e_mult_mod > 1 then
                                z = {
                                  type = "Emult",
                                  var = "e_mult_mod"
                                }
                              elseif f.ability.Emult_mod ~= nil and f.ability.Emult_mod > 1 then
                                z = {
                                  type = "Emult",
                                  var = "Emult_mod"
                                }
                              elseif f.ability.x_mult ~= nil and f.ability.x_mult > 1 then
                                z = {
                                  type = "Xmult",
                                  var = "x_mult"
                                }
                              elseif f.ability.Xmult ~= nil and f.ability.Xmult > 1 then
                                z = {
                                  type = "Xmult",
                                  var = "Xmult"
                                }
                              elseif f.ability.x_mult_mod ~= nil and f.ability.x_mult_mod > 1 then
                                z = {
                                  type = "Xmult",
                                  var = "x_mult_mod"
                                }
                              elseif f.ability.Xmult_mod ~= nil and f.ability.Xmult_mod > 1 then
                                z = {
                                  type = "Xmult",
                                  var = "Xmult_mod"
                                }
                              elseif f.ability.mult ~= nil and f.ability.mult > 0 then
                                z = {
                                  type = "mult",
                                  var = "mult"
                                }
                              elseif f.ability.t_mult ~= nil and f.ability.t_mult > 0 then
                                z = {
                                  type = "mult",
                                  var = "t_mult"
                                }
                              elseif f.ability.s_mult ~= nil and f.ability.s_mult > 0 then
                                z = {
                                  type = "mult per card",
                                  var = "s_mult"
                                }
                              elseif f.ability.mult_mod ~= nil and f.ability.mult_mod > 0 then
                                z = {
                                  type = "mult",
                                  var = "mult_mod"
                                }
                              elseif f.ability.eee_chips ~= nil and f.ability.eee_chips > 0 then
                                z = {
                                  type = "EEEchips",
                                  var = "eee_chips"
                                }
                              elseif f.ability.EEEchips ~= nil and f.ability.EEEchips > 0 then
                                z = {
                                  type = "EEEchips",
                                  var = "EEEchips"
                                }
                              elseif f.ability.EEEchip_mod ~= nil and f.ability.EEEchip_mod > 0 then
                                z = {
                                  type = "EEEchips",
                                  var = "EEEchip_mod"
                                }
                              elseif f.ability.eee_chip_mod ~= nil and f.ability.eee_chip_mod > 0 then
                                z = {
                                  type = "EEEchips",
                                  var = "eee_chip_mod"
                                }
                              elseif f.ability.ee_chips ~= nil and f.ability.ee_chips > 0 then
                                z = {
                                  type = "EEchips",
                                  var = "ee_chips"
                                }
                              elseif f.ability.EEchips ~= nil and f.ability.EEchips > 0 then
                                z = {
                                  type = "EEchips",
                                  var = "EEchips"
                                }
                              elseif f.ability.EEchip_mod ~= nil and f.ability.EEchip_mod > 0 then
                                z = {
                                  type = "EEchips",
                                  var = "EEchip_mod"
                                }
                              elseif f.ability.ee_chip_mod ~= nil and f.ability.ee_chip_mod > 0 then
                                z = {
                                  type = "EEchips",
                                  var = "ee_chip_mod"
                                }
                              elseif f.ability.e_chips ~= nil and f.ability.e_chips > 0 then
                                z = {
                                  type = "Echips",
                                  var = "e_chips"
                                }
                              elseif f.ability.Echips ~= nil and f.ability.Echips > 0 then
                                z = {
                                  type = "Echips",
                                  var = "Echips"
                                }
                              elseif f.ability.Echip_mod ~= nil and f.ability.Echip_mod > 0 then
                                z = {
                                  type = "Echips",
                                  var = "Echip_mod"
                                }
                              elseif f.ability.e_chip_mod ~= nil and f.ability.e_chip_mod > 0 then
                                z = {
                                  type = "Echips",
                                  var = "e_chip_mod"
                                }
                              elseif f.ability.x_chips ~= nil and f.ability.x_chips > 0 then
                                z = {
                                  type = "Xchips",
                                  var = "x_chips"
                                }
                              elseif f.ability.Xchips ~= nil and f.ability.Xchips > 0 then
                                z = {
                                  type = "Xchips",
                                  var = "Xchips"
                                }
                              elseif f.ability.Xchip_mod ~= nil and f.ability.Xchip_mod > 0 then
                                z = {
                                  type = "Xchips",
                                  var = "Xchip_mod"
                                }
                              elseif f.ability.x_chip_mod ~= nil and f.ability.x_chip_mod > 0 then
                                z = {
                                  type = "Xchips",
                                  var = "x_chip_mod"
                                }
                              elseif f.ability.chips ~= nil and f.ability.chips > 0 then
                                z = {
                                  type = "chips",
                                  var = "chips"
                                }
                              elseif f.ability.chip_mod ~= nil and f.ability.chip_mod > 0 then
                                z = {
                                  type = "chips",
                                  var = "chip_mod"
                                }
                              elseif f.ability.t_chips ~= nil and f.ability.t_chips > 0 then
                                z = {
                                  type = "chips",
                                  var = "t_chips"
                                }
                              elseif f.ability.s_chips ~= nil and f.ability.s_chips > 0 then
                                z = {
                                  type = "chips",
                                  var = "s_chips"
                                }
                              elseif f.ability.dollars ~= nil and f.ability.dollars > 0 then
                                z = {
                                  type = "double",
                                  var = "dollars"
                                }
                              elseif f.ability.extra ~= nil and type(f.ability.extra) == "number" and f.ability.extra > 0 then
                                z = {
                                  type = "increment",
                                  var = "extra"
                                }
                              end
                              if f.ability.name == 'Credit Card' then
								f.ability.extra = f.ability.extra + 10 * zbuff
								G.GAME.bankrupt_at = G.GAME.bankrupt_at - 10 * zbuff
                              elseif f.ability.name == 'Optimist' then
                                if pseudorandom('lily-cointoss') < 0.5 then
                                  f.ability.extra.h_size = f.ability.extra.h_size + zbuff
                                  G.hand:change_size(zbuff)
                                else
                                  f.ability.extra.d_size = f.ability.extra.d_size + zbuff
                                  G.GAME.round_resets.discards = G.GAME.round_resets.discards + zbuff
                                end
                              elseif f.ability.name == 'Melancholy Phantom' then
							    f.ability.extra.x_mult = f.ability.extra.x_mult + zbuff / 2
							    f.ability.extra.chips = f.ability.extra.chips + 40 * zbuff
                              elseif f.ability.name == 'Dementia Joker' then
                                if f.edition and f.edition.negative then
                                  f.edition.negative = false
                                else
                                  f.ability.extra.mult = f.ability.extra.mult + zbuff
                                end
                              elseif f.ability.name == 'Flip-Flop' then
                                z2 = pseudorandom('lily-cointoss')
                                if f.ability.extra.side == "mult" then
                                  if z2 < 0.5 then
                                    f.ability.extra.hands = f.ability.extra.hands + zbuff
                                    G.hand:change_size(zbuff)
                                  else
                                    if f.ability.extra.mult2 == nil then
                                      f.ability.extra.mult2 = f.ability.extra.mult
                                    end
                                    f.ability.extra.mult = f.ability.extra.mult + (f.ability.extra.mult2 * 2) * zbuff
                                  end
                                elseif z2 < 0.5 then
                                  f.ability.extra.discards = f.ability.extra.discards + zbuff
                                  G.GAME.round_resets.discards = G.GAME.round_resets.discards + zbuff
                                else
                                  if f.ability.extra.chips2 == nil then
                                    f.ability.extra.chips2 = f.ability.extra.chips
                                  end
                                  f.ability.extra.chips = f.ability.extra.chips + (f.ability.extra.chips2 * 2) * zbuff
                                end
                              elseif f.ability.name == 'Hit the Road' then
                                f.ability.x_mult = f.ability.x_mult + 10
                                f.ability.extra = f.ability.extra + 0.1
                              elseif f.ability.name == 'Diamond Bard' then
                                if f.ability.extra.money_threshold > 1 then
                                  if f.ability.extra.money_threshold / 2 == math.floor(f.ability.extra.money_threshold / 2) then
                                    f.ability.extra.money_threshold = math.floor(f.ability.extra.money_threshold / 2)
                                  else
                                    f.ability.extra.money_threshold = math.floor(f.ability.extra.money_threshold / 2) + 1
                                  end
                                else
                                  f.ability.extra.mult = f.ability.extra.mult + zbuff
                                end
                              elseif f.ability.name == 'Heart Paladin' then
                                if f.ability.extra.popop == nil then
                                  f.ability.extra.popop = f.ability.extra.Xmult
                                end
                                if ((f.ability.extra.Xmult - math.floor(f.ability.extra.Xmult)) == 0) and f.ability.extra.odds > 1 and f.ability.extra.popop < f.ability.extra.Xmult then
                                  f.ability.extra.popop = f.ability.extra.Xmult
                                  f.ability.extra.odds = f.ability.extra.odds - 1
                                else
                                  f.ability.extra.Xmult = f.ability.extra.Xmult + 0.1 * zbuff
                                end
                              elseif f.ability.name == 'Camping Trip' then
                                if f.ability.extra.bonus2_base == nil then
                                  f.ability.extra.bonus2_base = f.ability.extra.bonus_base
                                end
                                f.ability.extra.bonus_base = f.ability.extra.bonus_base + f.ability.extra.bonus2_base * zbuff
                                f.ability.extra.bonus_final = f.ability.extra.bonus_final + (f.ability.extra.bonus2_base * 2) * zbuff
                              elseif f.ability.name == 'Dynamic Duo' then
                                f.ability.extra.chips = f.ability.extra.chips + 3 * zbuff
                                f.ability.extra.mult = f.ability.extra.mult + 3 * zbuff
                              elseif f.ability.name == 'Fibonacci' then
                                if f.ability.extra2 ~= nil then
                                  local m = f.ability.extra2
                                  f.ability.extra2 = f.ability.extra
                                  f.ability.extra = f.ability.extra + m
                                else
                                  f.ability.extra2 = 13
                                  f.ability.extra = 21
                                end
                              elseif z.type and z.type == "increment" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + zbuff
                                end
                                if z.hand_size then
                                  G.hand:change_size(zbuff)
                                elseif z.discard then
                                  G.GAME.round_resets.discards = G.GAME.round_resets.discards + zbuff
                                elseif z.hand then
                                  G.GAME.round_resets.hands = G.GAME.round_resets.hands + zbuff
								elseif z.interest then
								  G.GAME.interest_amount = G.GAME.interest_amount + zbuff
                                end
                              elseif z.type and z.type == "double" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] * (2 * zbuff)
                                else
                                  f.ability[z.var] = f.ability[z.var] * (2 * zbuff)
                                end
                              elseif z.type and z.type == "EEEmult reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + zbuff
                                end
                              elseif z.type and z.type == "EEEmult per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 0.06125 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 0.06125 * zbuff
                                end
                              elseif z.type and z.type == "EEEmult" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 0.5 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 0.5 * zbuff
                                end
                              elseif z.type and z.type == "EEmult reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 3 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 3 * zbuff
                                end
                              elseif z.type and z.type == "EEmult per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 0.125 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 0.125 * zbuff
                                end
                              elseif z.type and z.type == "EEmult" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + zbuff
                                end
                              elseif z.type and z.type == "Emult reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 13 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 13 * zbuff
                                end
                              elseif z.type and z.type == "Emult per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 0.25 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 0.25 * zbuff
                                end
                              elseif z.type and z.type == "Emult" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 3 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 3 * zbuff
                                end
                              elseif z.type and z.type == "Xmult reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 50 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 50 * zbuff
                                end
                              elseif z.type and z.type == "Xmult per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 0.5 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 0.5 * zbuff
                                end
                              elseif z.type and z.type == "Xmult" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 10 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 10 * zbuff
                                end
                              elseif z.type and z.type == "mult reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 200 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 200 * zbuff
                                end
                              elseif z.type and z.type == "mult per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 10 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 10 * zbuff
                                end
                              elseif z.type and z.type == "mult" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 40 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 40 * zbuff
                                end
                              elseif z.type and z.type == "EEEchips reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 2 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 2 * zbuff
                                end
                              elseif z.type and z.type == "EEEchips per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + zbuff
                                end
                              elseif z.type and z.type == "EEEchips" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + zbuff
                                end
                              elseif z.type and z.type == "EEchips reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 8 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 8 * zbuff
                                end
                              elseif z.type and z.type == "EEchips per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + zbuff
                                end
                              elseif z.type and z.type == "EEchips" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 2 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 2 * zbuff
                                end
                              elseif z.type and z.type == "Echips reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 31 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 31 * zbuff
                                end
                              elseif z.type and z.type == "Echips per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 2 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 2 * zbuff
                                end
                              elseif z.type and z.type == "Echips" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 6 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 6 * zbuff
                                end
                              elseif z.type and z.type == "Xchips reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 125 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 125 * zbuff
                                end
                              elseif z.type and z.type == "Xchips per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 7 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 7 * zbuff
                                end
                              elseif z.type and z.type == "Xchips" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 25 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 25 * zbuff
                                end
                              elseif z.type and z.type == "chips reset" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 500 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 500 * zbuff
                                end
                              elseif z.type and z.type == "chips per card" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 25 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 25 * zbuff
                                end
                              elseif z.type and z.type == "chips" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 100 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 100 * zbuff
                                end
                              elseif z.type and z.type == "evil" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 100 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 100 * zbuff
                                end
                              elseif z.type and z.type == "probability" then
                                if z.extra then
                                  if f.ability.extra[z.var] > 1 then
                                    f.ability.extra[z.var] = f.ability.extra[z.var] - 1
                                  end
                                else
                                  if f.ability[z.var] > 1 then
                                    f.ability[z.var] = f.ability[z.var] - 1
                                  end
                                end
                              elseif z.type and z.type == "decrease" then
                                if z.extra then
                                  if f.ability.extra[z.var] > 1 then
                                    f.ability.extra[z.var] = f.ability.extra[z.var] - zbuff
									if f.ability.extra[z.var] < 1 then
                                      f.ability.extra[z.var] = 1
									end
                                  end
                                else
                                  if f.ability[z.var] > 1 then
                                    f.ability[z.var] = f.ability[z.var] - zbuff
									if f.ability[z.var] < 1 then
                                      f.ability[z.var] = 1
									end
                                  end
                                end
                              elseif z.type and z.type == "counter" then
                                if z.extra then
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + 10 * zbuff
                                else
                                  f.ability[z.var] = f.ability[z.var] + 10 * zbuff
                                end
                              elseif z.type and z.type == "base as upgrade - half double" then
                                if z.extra then
                                  if f.ability.extra[z.var..'_enstomach'] == nil then
                                    f.ability.extra[z.var..'_enstomach'] = math.floor(f.ability.extra[z.var] / 2)
                                    f.ability.extra[z.var2..'_enstomach'] = math.floor(f.ability.extra[z.var2] / 2)
                                  end
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + f.ability.extra[z.var..'_enstomach'] * zbuff
                                  f.ability.extra[z.var2] = f.ability.extra[z.var2] + f.ability.extra[z.var2..'_enstomach'] * zbuff
                                else
                                  if f.ability[z.var..'_enstomach'] == nil then
                                    f.ability[z.var..'_enstomach'] = math.floor(f.ability[z.var] / 2)
                                    f.ability[z.var2..'_enstomach'] = math.floor(f.ability[z.var2] / 2)
                                  end
                                  f.ability[z.var] = f.ability[z.var] + f.ability[z.var..'_enstomach'] * zbuff
                                  f.ability[z.var2] = f.ability[z.var2] + f.ability[z.var2..'_enstomach'] * zbuff
                                end
                              elseif z.type and z.type == "base as upgrade - double" then
                                if z.extra then
                                  if f.ability.extra[z.var..'_enstomach'] == nil then
                                    f.ability.extra[z.var..'_enstomach'] = f.ability.extra[z.var]
                                    f.ability.extra[z.var2..'_enstomach'] = f.ability.extra[z.var2]
                                  end
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + f.ability.extra[z.var..'_enstomach'] * zbuff
                                  f.ability.extra[z.var2] = f.ability.extra[z.var2] + f.ability.extra[z.var2..'_enstomach'] * zbuff
                                else
                                  if f.ability[z.var..'_enstomach'] == nil then
                                    f.ability[z.var..'_enstomach'] = f.ability[z.var]
                                    f.ability[z.var2..'_enstomach'] = f.ability[z.var2]
                                  end
                                  f.ability[z.var] = f.ability[z.var] + f.ability[z.var..'_enstomach'] * zbuff
                                  f.ability[z.var2] = f.ability[z.var2] + f.ability[z.var2..'_enstomach'] * zbuff
                                end
                              elseif z.type and z.type == "base as upgrade" then
                                if z.extra then
                                  if f.ability.extra[z.var..'_enstomach'] == nil then
                                    f.ability.extra[z.var..'_enstomach'] = f.ability.extra[z.var]
                                  end
                                  f.ability.extra[z.var] = f.ability.extra[z.var] + f.ability.extra[z.var..'_enstomach'] * zbuff
								  if z.interest then
								    G.GAME.interest_amount = G.GAME.interest_amount + f.ability.extra[z.var..'_enstomach'] * zbuff
								  end
                                else
                                  if f.ability[z.var..'_enstomach'] == nil then
                                    f.ability[z.var..'_enstomach'] = f.ability[z.var]
                                  end
                                  f.ability[z.var] = f.ability[z.var] + f.ability[z.var..'_enstomach'] * zbuff
								  if z.interest then
								    G.GAME.interest_amount = G.GAME.interest_amount + f.ability[z.var..'_enstomach'] * zbuff
								  end
                                end
                              elseif f.ability.extra ~= nil and type(f.ability.extra) == "table" then
                                print('X/ability - '..serializeTable(f.ability.extra))
                              else
                                print('ability - '..serializeTable(f.ability))
                              end
                            else
                              G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2, blockable = false,
                                func = function()
                                  play_sound('tarot1')
                                  f.T.r = -0.2
                                  f:juice_up(0.3, 0.4)
                                  f.states.drag.is = true
                                  f.children.center.pinch.x = true
                                  G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                    func = function()
                                      G.jokers:remove_card(f)
                                      f:remove()
                                      f = nil
                                      return true
                                    end
                                  })) 
                                  return true
                                end
                              })) 
                              G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2.15, blockable = false,
                                func = function()
                                  local copy = copy_card(card)
                                  card = nil
                                  copy:add_to_deck()
                                  G.jokers:emplace(copy)
                                  x = {
                                    message = localize{'k_enstomach_return'},
                                    colour = G.C.GREEN,
                                    card = copy
                                  }
                                  card_eval_status_text(copy, 'jokers', nil, percent, nil, x)
                                  return true
                                end
                              })) 
                            end
                            return true
                          end
                        })) 
                        return true
                      end
                    })) 
                    return true
                  end
                })) 
                return true
              end
            })) 
          end
        end
      end
    end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          {
            border_nodes = {
              { text = "X" },
              { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" }
            }
          }
        },
		reminder_text = {
          { ref_table = "card.ability.extra", ref_value = "tick", retrigger_type = "mult" },
		  { text = "/" },
          { ref_table = "card.ability.extra", ref_value = "counter", retrigger_type = "mult" },
		}
	  }
	end
  }
  
  SMODS.Joker { -- Momo Ayase
      name = "Momo Ayase",
    key = 'ayase',
    loc_txt = {
      name = "Momo Ayase",
      text = {
        "Activates powers in the presence of a banana.",
		"While active, {C:green}#1# in #2#{} chance to create a",
		"{C:spectral}Spectral{} card at start of Blind.  If successful,",
		"{C:green}#3# in #4#{} chance to destroy the banana and replace",
		"it with a Golden #5#."
      }
    },
    config = {
      extra = {
	    chance1 = to_big(3),
		chance2 = to_big(3),
		banana = false
      }
    },
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_ayase'})
	  if SMODS.INIT.FusionJokers or SMODS.INIT.DeFused then
        return {
          vars = {
            ''..(G.GAME and G.GAME.probabilities.normal or 1),
		    card.ability.extra.chance1,
            ''..(G.GAME and G.GAME.probabilities.normal or 1),
		    card.ability.extra.chance2,
		    "Egg"
          }
        }
	  else
        return {
          vars = {
            ''..(G.GAME and G.GAME.probabilities.normal or 1),
		    card.ability.extra.chance1,
            ''..(G.GAME and G.GAME.probabilities.normal or 1),
		    card.ability.extra.chance2,
		    "Joker"
          }
        }
	  end
    end,
    rarity = 3,
    pos = { x = 9, y = 0 },
    soul_pos = { x = 9, y = 1 },
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
	  if context.setting_blind and card.ability.extra.banana and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
	    if pseudorandom('ayase_spectral') < G.GAME.probabilities.normal/card.ability.extra.chance1 then
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
              local card2 = create_card('Spectral',G.consumeables)
              card2:add_to_deck()
              G.consumeables:emplace(card2)
              G.GAME.consumeable_buffer = 0
            return true
          end)}))
		  z = G.GAME.probabilities.normal/card.ability.extra.chance2
		  if card.edition and card.edition.polychrome then
            z = z * z
		  end
		  if pseudorandom('ayase_banana') < z then
			    local f = {}
				for i,v in pairs(G.jokers.cards) do
	              if table.contains({'Gros Michel','Cavendish','Blue Java'},v.ability.name) then
				    table.insert(f,v)
				  end
				end
				f = pseudorandom_element(f, pseudoseed('ayase_banana'))
				f2 = f.edition
                G.E_MANAGER:add_event(Event({
                  func = function()
                    play_sound('tarot1')
                    f.T.r = -0.2
                    f:juice_up(0.3, 0.4)
                    f.states.drag.is = true
                    f.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                      func = function()
                        G.jokers:remove_card(f)
                        f:remove()
                        f = nil
                        G.E_MANAGER:add_event(Event({
                          trigger = 'before',
                          delay = 0.0,
                          func = (function()
						    f = 'j_golden'
							if SMODS.INIT.FusionJokers then
							  f = 'j_golden_egg'
							elseif SMODS.INIT.DeFused then
							  f = 'j_d_golden_egg'
							end
                            local card2 = create_card('Joker',G.jokers, nil, nil, nil, nil, f)
							card2.edition = f2
                            card2:add_to_deck()
                            G.jokers:emplace(card2)
                            return true
                          end)}))
                        return true
                      end
                    })) 
                    return true
                  end
                }))
                return {
                  message = localize('k_ayase_mistake'),
                  colour = G.C.GOLD,
                  card = card
                }
		      else
                return {
                  message = localize('k_ayase_success'),
                  colour = G.C.BLUE,
                  card = card
                }
		  end
		else
          return {
            message = localize('k_ayase_failure'),
            colour = G.C.BLUE,
            card = card
          }
		end
	  end
	end,
	update = function(self, card, dt)
      if not G.jokers or not G.jokers.cards then
	    return
	  end
	  local m = false
	  for i,v in pairs(G.jokers.cards) do
	    if table.contains({'Gros Michel','Cavendish','Blue Java'},v.ability.name) then
		  m = true
		end
	  end
      if m == true then
	    card.ability.extra.banana = true
	    card.children.center:set_sprite_pos({ x = 9, y = 2})
	  else
	    card.ability.extra.banana = false
	    card.children.center:set_sprite_pos({ x = 9, y = 0})
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { ref_table = "card.joker_display_values", ref_value = "active" }
        },
        calc_function = function(card)
		  if card.ability.extra.banana then
		    card.joker_display_values.active = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.chance1 } }
		  else
            card.joker_display_values.active = localize("jdis_inactive")
		  end
        end,
        style_function = function(card, text, reminder_text, extra)
		  if card.ability.extra.banana then
			text.children[1].config.colour = G.C.GREEN
		  else
			text.children[1].config.colour = G.C.UI.TEXT_INACTIVE
		  end
		  return true
        end
      }
	end
  }
  
  SMODS.Joker { -- Rapunzel
      name = "Rapunzel",
    key = 'rapunzel',
    loc_txt = {
      name = "Rapunzel",
      text = {
        "Gains {C:mult}+#1#{} mult each time the played hand",
        "is the same as the previously-played hand.",
        "Resets if the played hand changes.",
        "{C:inactive}(Currently {C:mult}#2#{C:inactive} mult for {C:attention}#3#{C:inactive}){}"
      }
    },
    config = {
      extra = {
        mult = to_big(3),
        total = to_big(0),
        hand = '>Unplayed<'
      }
    },
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_rapunzel'})
      if card.ability.extra.hand == '>Unplayed<' then
        table.insert(info_queue, { set = 'Other', key = 'j_rapunzel2'})
      end
	  if FlowerPot then
	    card_progress = G.PROFILES[G.SETTINGS.profile].joker_usage[self.key] or {}
        table.insert(info_queue, {key = 'record_highest_mult', set = 'Other', vars = {to_number(card_progress.records and card_progress.records.highest_mult or 0)}})
	  end
      return {
        vars = {
          card.ability.extra.mult,
          card.ability.extra.total,
          card.ability.extra.hand
        }
      }
    end,
    rarity = 2,
    pos = { x = 5, y = 0 },
    soul_pos = { x = 5, y = 1 },
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    blueprint_compat = true,
	add_to_deck = function(self, card, from_debuff)
      card.ability.extra.hand = G.GAME.last_hand_played
	end,
    calculate = function(self, card, context)
      if context.before and not context.blueprint then
        if context.scoring_name == card.ability.extra.hand then
          card.ability.extra.total = to_big(card.ability.extra.total) + to_big(card.ability.extra.mult)
        else
          card.ability.extra.total = to_big(0)
          card.ability.extra.hand = to_big(context.scoring_name)
          return {
            message = localize('k_rapunzel'),
            colour = G.C.BLACK,
            card = card
          }
        end
      end
  
      if context.cardarea == G.jokers and card.ability.extra.total > 0 and context.joker_main then
        return {
          message = localize{type='variable',key='a_mult',vars={card.ability.extra.total}},
          mult_mod = card.ability.extra.total
        }
      end
    end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { text = "+" },
          { ref_table = "card.ability.extra", ref_value = "total", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
		reminder_text = {
          { text = "(" },
          { ref_table = "card.ability.extra", ref_value = "hand", colour = G.C.ORANGE },
          { text = ")" },
		}
	  }
	end
  }
  
  SMODS.Joker { -- Thumbelina
      name = "Thumbelina",
    key = 'tommelise',
    loc_txt = {
      name = "Thumbelina",
      text = {
        "Gains {X:mult,C:white}X#1#{} of mult",
        "if hand played is exactly a {C:attention}King{} and a {C:attention}2{},",
        "Changes the {C:attention}2{} into a {C:attention}Queen{}.",
        "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} mult)"
      }
    },
    config = {
      extra = {
        Xmult = to_big(1),
        total = to_big(2)
      }
    },
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_tommelise'})
	  if FlowerPot then
	    card_progress = G.PROFILES[G.SETTINGS.profile].joker_usage[self.key] or {}
        table.insert(info_queue, {key = 'record_highest_xmult', set = 'Other', vars = {to_number((card_progress.records and card_progress.records.highest_xmult) or 2)}})
	  end
      return {
        vars = {
          card.ability.extra.Xmult,
          card.ability.extra.total
        }
      }
    end,
    rarity = 2,
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.before and next(context.poker_hands['High Card']) and #context.full_hand == 2 and not context.blueprint then
        if context.scoring_hand[1]:get_id() == 13 or context.scoring_hand[2]:get_id() == 13 then
          if context.full_hand[1]:get_id() == 2 or context.full_hand[2]:get_id() == 2 then
            card.ability.extra.total = to_big(card.ability.extra.total) + to_big(card.ability.extra.Xmult)
            local topromote = 0
            if context.full_hand[1]:get_id() == 2 then topromote = 1
            elseif context.full_hand[2]:get_id() == 2 then topromote = 2
            end
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.full_hand[topromote]:flip();play_sound('tarot2', percent, 0.6);context.full_hand[topromote]:juice_up(0.3, 0.3);return true end }))
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
              local cardx = context.full_hand[topromote]
              SMODS.change_base(cardx, nil, 'Queen')
            return true end }))
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.full_hand[topromote]:flip();play_sound('tarot2', percent, 0.6);context.full_hand[topromote]:juice_up(0.3, 0.3);return true end }))
            return {
              message = localize('k_transformed_ex'),
              colour = G.C.RED,
              card = card
            }
          end
        end
      end
  
      if context.cardarea == G.jokers and card.ability.extra.total > to_big(0) and context.joker_main then
        return {
          message = localize{type='variable',key='a_xmult',vars={card.ability.extra.total}},
          Xmult_mod = card.ability.extra.total
        }
      end
    end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          {
            border_nodes = {
              { text = "X" },
              { ref_table = "card.ability.extra", ref_value = "total", retrigger_type = "exp" }
            }
          }
        }
	  }
	end
  }
  
  SMODS.Joker { -- Tinker Bell
      name = "Tinker Bell",
    key = 'tinkerbell',
    loc_txt = {
      name = "Tinker Bell",
      text = {
        "Each {V:1}#1#{} card is drawn face down.",
        "First played card with {V:1}#2#{} suit gives {X:mult,C:white}X#3#{} Mult when scored.",
        "Playing five {V:1}#5#{} increases mult by {X:mult,C:white}X#6#",
        "Ignoring this card for a whole round decreases mult by {X:mult,C:white}X#4#{}.",
        "(suit changes each hand played)"
      }
    },
    config = {
      extra = {
        Xmult = to_big(2),
        XmultUp = to_big(0.25),
        XmultDown = to_big(0.1),
        Proc = to_big(0),
        Vsuit = 'Hearts',
        free = true
      }
    },
    loc_vars = function(self, info_queue, card)
      table.insert(info_queue, { set = 'Other', key = 'j_tinkerbell'})
	  if FlowerPot then
	    card_progress = G.PROFILES[G.SETTINGS.profile].joker_usage[self.key] or {}
        table.insert(info_queue, {key = 'record_highest_xmult', set = 'Other', vars = {to_number((card_progress.records and card_progress.records.highest_xmult) or 2)}})
	  end
      return {
        vars = {
          localize(card.ability.extra.Vsuit, 'suits_singular'), 
          localize(card.ability.extra.Vsuit, 'suits_singular'), 
          card.ability.extra.Xmult,
          card.ability.extra.XmultDown,
          localize(card.ability.extra.Vsuit, 'suits_plural'),
          card.ability.extra.XmultUp,
          localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
          localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'},
          card.ability.extra.Proc,
          colours = {G.C.SUITS[card.ability.extra.Vsuit]}
        }
      }
    end,
    rarity = 3,
    pos = { x = 3, y = 0 },
    soul_pos = { x = 3, y = 1 },
    atlas = "Pockettes",
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.setting_blind and not context.blueprint then
        card.ability.extra.Proc = to_big(0)
      end
      
      if context.before and not context.blueprint then
        local m = 0
        card.ability.extra.free = true
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i]:is_suit(card.ability.extra.Vsuit) and not context.scoring_hand[i].debuff then
            m = m + 1
          end
        end
        if m >= 5 then
          card.ability.extra.Xmult = to_big(card.ability.extra.Xmult) + to_big(card.ability.extra.XmultUp)
          return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
            colour = G.C.GOLD,
            card = card
          }
        end
      end
      
      if context.individual and context.cardarea == G.play then
        if context.other_card:is_suit(card.ability.extra.Vsuit) and (card.ability.extra.free == true or context.other_card.tinkproc) then
          if not blueprint then
            context.other_card.tinkproc = true
            card.ability.extra.Proc = card.ability.extra.Proc + to_big(1)
            card.ability.extra.free = false
          end
          return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
            card = card,
            Xmult_mod = card.ability.extra.Xmult
          }
        end
      end
      
      if context.final_scoring_step then
        for i,v in pairs(context.full_hand) do
          v.tinkproc = false
        end
      end
      
      if context.after and not context.blueprint then
        card.ability.extra.Vsuit = pseudorandom_element(SMODS.Suits, pseudoseed('tink'..G.GAME.round_resets.ante)).key
        return {
          message = localize('k_tink'),
          colour = G.C.GOLD,
          card = card
        }
      end
      
      if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
        if card.ability.extra.Proc <= to_big(0) then
          card.ability.extra.Xmult = to_big(card.ability.extra.Xmult) - to_big(card.ability.extra.XmultDown)
          if card.ability.extra.Xmult <= to_big(0) then
            G.E_MANAGER:add_event(Event({
              func = function()
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                  func = function()
                    G.jokers:remove_card(card)
                    card:remove()
                    card = nil
                    return true
                  end
                })) 
                return true
              end
            })) 
            return {
              message = localize('k_tink_dies'),
              colour = G.C.RED,
              card = card
            }
          else
            return {
              message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
              colour = G.C.RED,
              card = card
            }
          end
        end
      end
    end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          {
            border_nodes = {
              { text = "X" },
              { ref_table = "card.joker_display_values", ref_value = "Xmult", retrigger_type = "exp" }
            }
          }
        },
        reminder_text = {
          { text = "(" },
          { ref_table = "card.joker_display_values", ref_value = "ancient_card_suit" },
          { text = ")" }
        },
        calc_function = function(card)
          local count = 0
		  local count2 = 0
          local text, _, scoring_hand = JokerDisplay.evaluate_hand(JokerDisplay.current_hand or {}, true)
          local playing_hand = next(G.play.cards)
          for _, scoring_card in pairs(scoring_hand) do
            if scoring_card:is_suit(card.ability.extra.Vsuit) and count == 0 then
              count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
			end
		  end
          for _, playing_card in ipairs(G.hand.cards) do
            if playing_card.highlighted then
			  count2 = count2 + 1
			  if playing_card:is_suit(card.ability.extra.Vsuit) then
			    count2 = count2 - 1
			  end
	    	end
		  end
		  if count2 ~= 0 then
		    count = 0
		  end
          card.joker_display_values.Xmult = card.ability.extra.Xmult ^ count
          card.joker_display_values.ancient_card_suit = localize(card.ability.extra.Vsuit,'suits_plural')
        end,
        style_function = function(card, text, reminder_text, extra)
          if reminder_text and reminder_text.children[2] then
            reminder_text.children[2].config.colour = lighten(G.C.SUITS[card.ability.extra.Vsuit], 0.35)
          end
          return false
        end
	  }
	end
  }
  
end

if FlowerPot then
  FlowerPot.addRecord({
    key = "highest_occupancy",
    cards = {
	  "j_Dollhouse"
    },
    default = 0,
    add_tooltips = function(self, info_queue, card_progress, card)
      info_queue[#info_queue+1] = {key = 'record_highest_occupancy', set = 'Other', vars = {to_number((card_progress.records and card_progress.records.highest_occupancy) or self.default)}}
    end,
    check_record = function(self, card)
      return #card.ability.extra.occupants
    end
  })
  
  FlowerPot.rev_lookup_records["j_Dollhouse"] = copy_table(FlowerPot.records["highest_occupancy"])
  FlowerPot.rev_lookup_records["j_Dollhouse"].add_tooltips = function(self, info_queue, card_progress, card)
  end
  FlowerPot.rev_lookup_records["j_Dollhouse"].check_record = function(self, card)
    return #card.ability.extra.occupants
  end

  FlowerPot.rev_lookup_records["j_alice"] = copy_table(FlowerPot.records["highest_xmult"])
  FlowerPot.rev_lookup_records["j_alice"].add_tooltips = function(self, info_queue, card_progress, card)
  end
  FlowerPot.rev_lookup_records["j_alice"].check_record = function(self, card)
    return card.ability.extra.total
  end
  
  FlowerPot.rev_lookup_records["j_enstomach"] = copy_table(FlowerPot.records["highest_xmult"])
  FlowerPot.rev_lookup_records["j_enstomach"].add_tooltips = function(self, info_queue, card_progress, card)
  end
  FlowerPot.rev_lookup_records["j_enstomach"].check_record = function(self, card)
    return card.ability.extra.Xmult
  end
  
  FlowerPot.rev_lookup_records["j_rapunzel"] = copy_table(FlowerPot.records["highest_mult"])
  FlowerPot.rev_lookup_records["j_rapunzel"].add_tooltips = function(self, info_queue, card_progress, card)
  end
  FlowerPot.rev_lookup_records["j_rapunzel"].check_record = function(self, card)
    return card.ability.extra.total
  end
  
  FlowerPot.rev_lookup_records["j_tommelise"] = copy_table(FlowerPot.records["highest_xmult"])
  FlowerPot.rev_lookup_records["j_tommelise"].add_tooltips = function(self, info_queue, card_progress, card)
  end
  FlowerPot.rev_lookup_records["j_tommelise"].check_record = function(self, card)
    return card.ability.extra.total
  end
  
  FlowerPot.rev_lookup_records["j_tinkerbell"] = copy_table(FlowerPot.records["highest_xmult"])
  FlowerPot.rev_lookup_records["j_tinkerbell"].add_tooltips = function(self, info_queue, card_progress, card)
  end
  FlowerPot.rev_lookup_records["j_tinkerbell"].check_record = function(self, card)
    return card.ability.extra.Xmult
  end
end

function table.contains(table, element)
  for _, value in ipairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function find_enstomach_target()
  local opts = {}
  for i,v in ipairs(G.jokers.cards) do
    local z = {}
    if v.enstomach_compat ~= nil then
      z = v.enstomach_compat
    elseif v.ability.enstomach_compat ~= nil then
      z = v.ability.enstomach_compat
    elseif v.ability.extra ~= nil and type(v.ability.extra) == "table" and v.ability.extra.enstomach_compat ~= nil then
      z = v.ability.extra.enstomach_compat
	end
	if z.type and z.type == "incompatible" then                               -- mod devs can explicitly mark their jokers as incompatible
	elseif v.debuff and v.ability.perishable then                             -- She cannot buff perishable Jokers that have already perished
    elseif IsFoodJoker(v) then                                                -- Food Jokers expire and proc this in the first place.
    elseif table.contains(TinyLadies,v.ability.name) then                     -- Pockettes are too small to fall victim to Lily's trap
    elseif v.ability.name == "Collector's Dollhouse" then
    elseif table.contains(OtherIncompats,v.ability.name) then                 -- These are jokers that do not have values that can be buffed
	elseif z.type and (z.type == "probability" or z.type == "decrease") then  -- These jokers can be buffed, but only to a certain point
	  if z.extra then
	    if v.ability.extra[z.var] > 1 then
          table.insert(opts, i)
		end
	  elseif v.ability[z.var] > 1 then
        table.insert(opts, i)
	  end
    else
      table.insert(opts, i)
    end
  end
  if #opts == 0 then
    return 0
  else
    return pseudorandom_element(opts, pseudoseed('enstomach'))
  end
end

-- fixing a glitch with Ramen that is normally purely visual, but does affect how Lily Enstomach interacts with it
SMODS.Joker:take_ownership('ramen', {
  name = "Ramen (Pockettes)",
  config = {
    extra = {
      x_mult = 0.01,
      eaten = false
    },
	x_mult = 2
  },
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.x_mult, card.ability.extra.x_mult}}
  end,
  calculate = function(self, card, context)
    if context.discard and not context.blueprint then
      if (card.ability.x_mult - card.ability.extra.x_mult <= 1) and not card.ability.extra.eaten then
        card.ability.extra.eaten = true
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
              func = function()
                  G.jokers:remove_card(card)
                  card:remove()
                  card = nil
                return true; end})) 
            return true
          end
        })) 
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER,
          card = card
        }
      else
        card.ability.x_mult = card.ability.x_mult - card.ability.extra.x_mult
        return {
          delay = 0.2,
          message = localize{type='variable',key='a_xmult_minus',vars={card.ability.extra.x_mult}},
          colour = G.C.RED,
          card = card
        }
      end
    end
    
    if context.cardarea == G.jokers and card.ability.x_mult > 0 and context.joker_main then
      return {
        message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
        Xmult_mod = card.ability.extra.Xmult
      }
    end
  end,
  joker_display_def = function(JokerDisplay)
	return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      }
	}
	end
}, true)

-- taking control of jokers that should be compatible with Lily Enstomach, but are not
-- usually this takes the form of "joker displays a variable value in its description, but that variable does not actually take part in the joker's effect's code"
-- My takeover does not change the jokers' behavior when unbuffed, merely makes the variables actually relevant to the jokers' effect so she can buff them
SMODS.Joker:take_ownership('stencil', {
  config = {
    extra = {
      x_mult = 1
    },
	x_mult = 1
  },
  loc_txt = {
    name = "Joker Stencil",
    text = {
      "{X:red,C:white}X#1#{} Mult for each",
      "empty {C:attention}Joker{} slot",
      "{s:0.8}Joker Stencil included",
      "{C:inactive}(Currently {X:red,C:white}X#2#{C:inactive})",
    }
  },
  loc_vars = function(self, info_queue, card)
	if G.jokers == nil then
      return {
	    vars = {
	      card.ability.extra.x_mult,
		  card.ability.extra.x_mult * 5
	    }
	  }
	else
	  z = SMODS.find_card('j_stencil')
	  if z == nil or #z == 0 then
	    z = {""}
	  end
      return {
	    vars = {
	      card.ability.extra.x_mult,
		  card.ability.extra.x_mult * (G.jokers.config.card_limit - #G.jokers.cards + #z)
	    }
	  }
	end
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
	  card.ability.x_mult = (G.jokers.config.card_limit - #G.jokers.cards)
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.name == 'Joker Stencil' then card.ability.x_mult = card.ability.x_mult + 1 end
      end
	  card.ability.x_mult = card.ability.x_mult * card.ability.extra.x_mult
	  if card.ability.x_mult > 1 then
		return {
		  message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
          Xmult_mod = card.ability.x_mult
        }
	  end
    end
  end
}, true)

SMODS.Joker:take_ownership('raised_fist', {
  name = 'Raised Fist (Pockettes)',
  config = {
    extra = {
      v = 2
    },
  },
  loc_txt = {
    name="Raised Fist",
    text={
      "Adds {C:attention}#1#{} the rank",
      "of {C:attention}lowest{} ranked card",
      "held in hand to Mult",
    },
  },
  loc_vars = function(self, info_queue, card)
	if card.ability.extra.v == 2 then
      return { vars = { "double" } }
	elseif card.ability.extra.v == 3 then
      return { vars = { "triple" } }
	else
      return { vars = { card.ability.extra.v.."x" } }
	end
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.hand and context.individual and not context.end_of_round then
      local temp_Mult, temp_ID = 15, 15
      local raised_card = nil
      for i=1, #G.hand.cards do
        if temp_ID >= G.hand.cards[i].base.id and G.hand.cards[i].ability.effect ~= 'Stone Card' then temp_Mult = G.hand.cards[i].base.nominal; temp_ID = G.hand.cards[i].base.id; raised_card = G.hand.cards[i] end
      end
      if raised_card == context.other_card then 
        if context.other_card.debuff then
          return {
            message = localize('k_debuffed'),
            colour = G.C.RED,
            card = card,
          }
        else
          return {
            h_mult = card.ability.extra.v * temp_Mult,
            card = card,
          }
        end
      end
	end
  end
}, true)

SMODS.Joker:take_ownership('supernova', {
  config = {
    extra = {
	  v = 1
	}
  },
  loc_txt = {
    name="Supernova",
    text={
      "Adds {C:attention}#1#{}the number of times",
      "{C:attention}poker hand{} has been",
      "played this run to Mult",
    },
  },
  loc_vars = function(self, info_queue, card)
    if card.ability.extra.v == 1 then
	  return { vars = { '' } }
	else
	  return { vars = { card.ability.extra.v..'x ' } }
	end
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
      return {
        message = localize{type='variable',key='a_mult',vars={card.ability.extra.v*G.GAME.hands[context.scoring_name].played}},
        mult_mod = card.ability.extra.v*G.GAME.hands[context.scoring_name].played
      }
	end
  end
}, true)

SMODS.Joker:take_ownership('riff_raff', {
  name = "Riff-raff (Pockettes)",
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and not(card.getting_sliced) and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
      local jokers_to_create = math.min(card.ability.extra, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
      G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
      G.E_MANAGER:add_event(Event({
        func = function() 
          for i = 1, jokers_to_create do
            local card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, 'rif')
            card:add_to_deck()
            G.jokers:emplace(card)
            card:start_materialize()
            G.GAME.joker_buffer = 0
          end
          return true
        end}))   
      card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
	end
  end
}, true)

SMODS.Joker:take_ownership('fortune_teller', {
  name = "Fortune Teller (Pockettes)",
  loc_vars = function(self, info_queue, card)
    return {
	  vars = {
	    card.ability.extra,
		card.ability.extra * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)
	  }
	}
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and (context.consumeable.ability.set == "Tarot") then
	  G.E_MANAGER:add_event(Event({
        func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_mult',vars={card.ability.extra * G.GAME.consumeable_usage_total.tarot}}}); return true
      end}))
	end
	
    if context.cardarea == G.jokers and context.joker_main and G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot > 0 then
	  return {
        message = localize{type='variable',key='a_mult',vars={card.ability.extra * G.GAME.consumeable_usage_total.tarot}},
        mult_mod = card.ability.extra * G.GAME.consumeable_usage_total.tarot
      }
	end
  end
}, true)

SMODS.Joker:take_ownership('swashbuckler', {
  name = "Swashbuckler (Pockettes)",
  config = {
    extra = {
	  v = 1
	},
	mult = 0
  },
  loc_txt = {
    name="Swashbuckler",
    text={
      "Adds {C:attention}#1#{}the sell value",
      "of all other owned",
      "{C:attention}Jokers{} to Mult",
      "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
    }
  },
  loc_vars = function(self, info_queue, card)
    if card.ability.extra.v == 1 then
	  return { vars = { '', card.ability.mult } }
	else
	  return { vars = { card.ability.extra.v..'x ', card.ability.extra.v * card.ability.mult } }
	end
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
      return {
        message = localize{type='variable',key='a_mult',vars={card.ability.extra.v * card.ability.mult}},
        mult_mod = card.ability.extra.v * card.ability.mult
      }
	end
  end,
  update = function(self, card, dt)
    if G.jokers == nil then
	  return
	end
    local sell_cost = 0
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] ~= card and (G.jokers.cards[i].area and G.jokers.cards[i].area == G.jokers) then
        sell_cost = sell_cost + G.jokers.cards[i].sell_cost
      end
    end
    card.ability.mult = sell_cost
  end
}, true)

function alice_drink_buff(card)
  card.ability.extra.totalB = card.ability.extra.totalB + card.ability.extra.XmultC
  card.ability.extra.total = card.ability.extra.totalB
  local x = {
    message = localize('k_drinkme'),
    colour = G.C.BLUE,
    card = card
  }
  card_eval_status_text(card, 'jokers', nil, percent, nil, x)
  percent = (percent or 0) + (percent_delta or 0.08)
end

function enstomach_tick(card)
  card.ability.extra.tick = card.ability.extra.tick - 1
  local x = {
    message = localize('k_enstomach_tick'),
    colour = G.C.GREEN,
    card = card
  }
  card_eval_status_text(card, 'jokers', nil, percent, nil, x)
  percent = (percent or 0) + (percent_delta or 0.08)
  if card.ability.extra.tick <= 0 then
    juice_card_until(card, function(card) return (card.ability.extra.tick > 0) end, true)
  end
end

local old_blind_stayflipped = Blind.stay_flipped
function Blind:stay_flipped(area, card)
  if area == G.hand and G.GAME.blind.in_blind then
    for k, v in pairs(SMODS.find_card('j_pocket_tinkerbell')) do
      if card:is_suit(v.ability.extra.Vsuit) then
        return true
      end
    end
    for k, v in pairs(SMODS.find_card('j_tinkerbell')) do
      if card:is_suit(v.ability.extra.Vsuit) then
        return true
      end
    end
  end
  if not self.disabled then
    local obj = self.config.blind
    if obj and obj.stay_flipped and type(obj.stay_flipped) == 'function' then
      return obj:stay_flipped(area, card)
    end
    if area == G.hand then
      if self.name == 'The Wheel' and pseudorandom(pseudoseed('wheel')) < G.GAME.probabilities.normal/7 then
        return true
      end
      if self.name == 'The House' and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
        return true
      end
      if self.name == 'The Mark' and card:is_face(true) then
        return true
      end
      if self.name == 'The Fish' and self.prepped then 
        return true
      end
    end
  end
end

local old_localize = localize
function localize(args, misc_cat)
  if args then
    local m = args
    if type(args) == 'table' then
      m = args[key]
    end
    if m == 'k_drank_ex' then
      for k, v in pairs(SMODS.find_card('j_pocket_alice')) do
        alice_drink_buff(v)
      end
      for k, v in pairs(SMODS.find_card('j_alice')) do
        alice_drink_buff(v)
      end
    elseif m == 'k_eaten_ex' or m == 'k_melted_ex' then
      for k, v in pairs(SMODS.find_card('j_pocket_enstomach')) do
        enstomach_tick(v)
      end
      for k, v in pairs(SMODS.find_card('j_enstomach')) do
        enstomach_tick(v)
      end
    end
  end
  return old_localize(args, misc_cat)
end


----------------------------------------------
------------MOD CODE END----------------------
