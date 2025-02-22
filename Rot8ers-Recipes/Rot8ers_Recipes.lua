--- STEAMODDED HEADER
--- MOD_NAME: Rot8er's Recipes
--- MOD_ID: Rot8er
--- MOD_AUTHOR: [Rot8er_ConeX]
--- MOD_DESCRIPTION: Fairly obvious fusions that are missing
--- BADGE_COLOUR: 00BABA
--- PRIORITY: -10000
--- PREFIX: rot8
----------------------------------------------
------------MOD CODE -------------------------

G.localization.misc.v_dictionary.joker_couples = {"+#1#chips +#2#mult"}

SMODS.Atlas {
  -- Key for code to find it with
  key = "rot8er",
  -- The name of the file, for the code to pull the atlas from
  path = "rot8er.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

local Rot8_Joker = {}
Rot8_Joker.fusions = {
    { jokers = {
		{ name = "j_square", carry_stat = nil, extra_stat = false },
		{ name = "j_trousers", carry_stat = nil, extra_stat = false }
	}, result_joker = "j_square_trousers", cost = 10 },
    { jokers = {
		{ name = "j_jolly", carry_stat = "t_mult", extra_stat = false },
		{ name = "j_sly", carry_stat = "t_chips", extra_stat = false }
	}, result_joker = "j_sneaky_duo", cost = 10 },
    { jokers = {
		{ name = "j_zany", carry_stat = "t_mult", extra_stat = false },
		{ name = "j_wily", carry_stat = "t_chips", extra_stat = false }
	}, result_joker = "j_quirky_duo", cost = 10 },
    { jokers = {
		{ name = "j_mad", carry_stat = "t_mult", extra_stat = false },
		{ name = "j_clever", carry_stat = "t_chips", extra_stat = false }
	}, result_joker = "j_distracted_duo", cost = 10 },
    { jokers = {
		{ name = "j_crazy", carry_stat = "t_mult", extra_stat = false },
		{ name = "j_devious", carry_stat = "t_chips", extra_stat = false }
	}, result_joker = "j_devilish_duo", cost = 10 },
    { jokers = {
		{ name = "j_droll", carry_stat = "t_mult", extra_stat = false },
		{ name = "j_crafty", carry_stat = "t_chips", extra_stat = false }
	}, result_joker = "j_decorative_duo", cost = 10 },
    { jokers = {
		{ name = "j_rocket", carry_stat = nil, extra_stat = false },
		{ name = "j_to_the_moon", carry_stat = nil, extra_stat = false }
	}, result_joker = "j_countdown", cost = 10 },
}

local SMODS_Joker_inject=SMODS.Joker.inject
SMODS.Joker.inject =function(self)
  if SMODS.INIT.FusionJokers and not(SMODS.INIT.DeFused) then
	self.rarity = 5
  end
  SMODS_Joker_inject(self)
end

local function has_joker(val)
	for k, v in pairs(G.jokers.cards) do
		if v.ability.set == 'Joker' and v.config.center_key == val then 
			return k
		end
	end
	return -1
end

function SMODS.INIT.Rot8er()
  local mod_id = "Rot8er"
  local mod_obj = SMODS.findModByID(mod_id)
  
  table.insert(G.P_JOKER_RARITY_POOLS, {})
  table.insert(G.C.RARITY, HEX("FFABAF"))

  loc_colour("mult", nil)
  G.ARGS.LOC_COLOURS["rot8er"] = G.C.RARITY[5]
  
  if SMODS.INIT.FusionJokers then
    for _, fusion in ipairs(Rot8_Joker.fusions) do
      table.insert(FusionJokers.fusions, fusion)
	end
  end
  
  SMODS.Joker { -- Square Trousers
    key = 'square_trousers',
	loc_txt = {
	  name = "Square Trousers",
	  text = {
	    "Gains {X:mult,C:white}X#1#{} of mult",
    	"if hand played is exactly a Two Pair,",
	    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} mult)",
		"{C:inactive}(#3# + #4#)"
	  }
	},
	config = {
	  extra = {
	    Xmult = 0.25,
		total = 1,
        joker1 = "j_square",
		joker2 = "j_trousers"
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return {
		vars = {
		  card.ability.extra.Xmult,
	      card.ability.extra.total, 
		  localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
		  localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'}
		}
	  }
	end,
    rarity = 3,
    pos = { x = 5, y = 0},
	atlas = "rot8er",
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.before and next(context.poker_hands['Two Pair']) and #context.full_hand == 4 and not context.blueprint then
        card.ability.extra.total = card.ability.extra.total + card.ability.extra.Xmult
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.RED,
          card = card
        }
      end

	  if context.cardarea == G.jokers and card.ability.extra.Xmult > 0 and context.joker_main then
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
              { ref_table = "card.ability.extra", ref_value = "total" }
            }
          }
        }
	  }
	end,
	enstomach_compat = {
      type = "Xmult",
      var = "total",
      extra = true
    }
  }
	
  SMODS.Joker { -- Deceptive Date
    key = 'sneaky_duo',
	loc_txt = {
	  name = "Deceptive Date",
	  text = {
	    "{C:chips}+#1# Chips{} and {C:mult}+#2# Mult{}",
		"if played hand contains",
		"a {C:attention}#3#{}.",
		"{C:inactive}(#4# + #5#){}"
	  }
	},
	config = {
	  t_chips = 50,
	  t_mult = 8,
	  type = 'Pair',
	  extra = {
		joker1 = "j_jolly",
		joker2 = "j_sly"
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return {
		vars = {
		  card.ability.t_chips,
	      card.ability.t_mult,
		  localize(card.ability.type, 'poker_hands'),
		  localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
		  localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'}
		}
	  }
	end,
    rarity = 2,
    pos = { x = 0, y = 0},
	atlas = "rot8er",
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.joker_main and next(context.poker_hands['Pair']) then
        return {
    	  message = localize{type='variable',key='joker_couples',vars={card.ability.t_chips,card.ability.t_mult}},
   		  chip_mod = card.ability.t_chips,
    	  mult_mod = card.ability.t_mult,
    	}
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { text = "+", colour = G.C.CHIPS },
          { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
		  { text = ", " },
		  { text = "+", colour = G.C.MULT },
          { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
          local _, poker_hands, _ = JokerDisplay.evaluate_hand()
          card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
          if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            card.joker_display_values.chips = card.ability.t_chips
            card.joker_display_values.mult = card.ability.t_mult
		  else
            card.joker_display_values.chips = 0
            card.joker_display_values.mult = 0
		  end
        end
	  }
	end,
	enstomach_compat = {
      type = "base as upgrade - half double",
      var = "t_chips",
      var2 = "t_mult"
    }
  }
  
  SMODS.Joker { -- Distinctive Date
    key = 'quirky_duo',
	loc_txt = {
	  name = "Distinctive Date",
	  text = {
	    "{C:chips}+#1# Chips{} and {C:mult}+#2# Mult{}",
		"if played hand contains",
		"a {C:attention}#3#{}.",
		"{C:inactive}(#4# + #5#){}"
	  }
	},
	config = {
	  t_chips = 100,
	  t_mult = 12,
	  type = 'Three of a Kind',
	  extra = {
		joker1 = "j_zany",
		joker2 = "j_wily"
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return {
		vars = {
		  card.ability.t_chips,
	      card.ability.t_mult,
		  localize(card.ability.type, 'poker_hands'),
		  localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
		  localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'}
		}
	  }
	end,
    rarity = 2,
    pos = { x = 1, y = 0},
	atlas = "rot8er",
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.joker_main and next(context.poker_hands['Three of a Kind']) then
        return {
    	  message = localize{type='variable',key='joker_couples',vars={card.ability.t_chips,card.ability.t_mult}},
   		  chip_mod = card.ability.t_chips,
    	  mult_mod = card.ability.t_mult,
    	}
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { text = "+", colour = G.C.CHIPS },
          { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
		  { text = ", " },
		  { text = "+", colour = G.C.MULT },
          { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
          local _, poker_hands, _ = JokerDisplay.evaluate_hand()
          card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
          if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            card.joker_display_values.chips = card.ability.t_chips
            card.joker_display_values.mult = card.ability.t_mult
		  else
            card.joker_display_values.chips = 0
            card.joker_display_values.mult = 0
		  end
        end
	  }
	end,
	enstomach_compat = {
      type = "base as upgrade - half double",
      var = "t_chips",
      var2 = "t_mult"
    }
  }
  
  SMODS.Joker { -- Distracting Date
    key = 'distracted_duo',
	loc_txt = {
	  name = "Distracting Date",
	  text = {
	    "{C:chips}+#1# Chips{} and {C:mult}+#2# Mult{}",
		"if played hand contains",
		"a {C:attention}#3#{}.",
		"{C:inactive}(#4# + #5#){}"
	  }
	},
	config = {
	  t_chips = 80,
	  t_mult = 10,
	  type = 'Two Pair',
	  extra = {
		joker1 = "j_mad",
		joker2 = "j_clever"
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return {
		vars = {
		  card.ability.t_chips,
	      card.ability.t_mult,
		  localize(card.ability.type, 'poker_hands'),
		  localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
		  localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'}
		}
	  }
	end,
    rarity = 2,
    pos = { x = 2, y = 0},
	atlas = "rot8er",
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.joker_main and next(context.poker_hands['Two Pair']) then
        return {
    	  message = localize{type='variable',key='joker_couples',vars={card.ability.t_chips,card.ability.t_mult}},
   		  chip_mod = card.ability.t_chips,
    	  mult_mod = card.ability.t_mult,
    	}
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { text = "+", colour = G.C.CHIPS },
          { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
		  { text = ", " },
		  { text = "+", colour = G.C.MULT },
          { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
          local _, poker_hands, _ = JokerDisplay.evaluate_hand()
          card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
          if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            card.joker_display_values.chips = card.ability.t_chips
            card.joker_display_values.mult = card.ability.t_mult
		  else
            card.joker_display_values.chips = 0
            card.joker_display_values.mult = 0
		  end
        end
	  }
	end,
	enstomach_compat = {
      type = "base as upgrade - half double",
      var = "t_chips",
      var2 = "t_mult"
    }
  }
  
  SMODS.Joker { -- Devilish Date
    key = 'devilish_duo',
	loc_txt = {
	  name = "Devilish Date",
	  text = {
	    "{C:chips}+#1# Chips{} and {C:mult}+#2# Mult{}",
		"if played hand contains",
		"a {C:attention}#3#{}.",
		"{C:inactive}(#4# + #5#){}"
	  }
	},
	config = {
	  t_chips = 100,
	  t_mult = 12,
	  type = 'Straight',
	  extra = {
		joker1 = "j_crazy",
		joker2 = "j_devious"
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return {
		vars = {
		  card.ability.t_chips,
	      card.ability.t_mult,
		  localize(card.ability.type, 'poker_hands'),
		  localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
		  localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'}
		}
	  }
	end,
    rarity = 2,
    pos = { x = 3, y = 0},
	atlas = "rot8er",
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.joker_main and next(context.poker_hands['Straight']) then
        return {
    	  message = localize{type='variable',key='joker_couples',vars={card.ability.t_chips,card.ability.t_mult}},
   		  chip_mod = card.ability.t_chips,
    	  mult_mod = card.ability.t_mult,
    	}
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { text = "+", colour = G.C.CHIPS },
          { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
		  { text = ", " },
		  { text = "+", colour = G.C.MULT },
          { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
          local _, poker_hands, _ = JokerDisplay.evaluate_hand()
          card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
          if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            card.joker_display_values.chips = card.ability.t_chips
            card.joker_display_values.mult = card.ability.t_mult
		  else
            card.joker_display_values.chips = 0
            card.joker_display_values.mult = 0
		  end
        end
	  }
	end,
	enstomach_compat = {
      type = "base as upgrade - half double",
      var = "t_chips",
      var2 = "t_mult"
    }
  }
  
  SMODS.Joker { -- Decorative Date
    key = 'decorative_duo',
	loc_txt = {
	  name = "Decorative Date",
	  text = {
	    "{C:chips}+#1# Chips{} and {C:mult}+#2# Mult{}",
		"if played hand contains",
		"a {C:attention}#3#{}.",
		"{C:inactive}(#4# + #5#){}"
	  }
	},
	config = {
	  t_chips = 80,
	  t_mult = 10,
	  type = 'Flush',
	  extra = {
		joker1 = "j_droll",
		joker2 = "j_crafty"
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return {
		vars = {
		  card.ability.t_chips,
	      card.ability.t_mult,
		  localize(card.ability.type, 'poker_hands'),
		  localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
		  localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'}
		}
	  }
	end,
    rarity = 2,
    pos = { x = 4, y = 0},
	atlas = "rot8er",
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.joker_main and next(context.poker_hands['Flush']) then
        return {
    	  message = localize{type='variable',key='joker_couples',vars={card.ability.t_chips,card.ability.t_mult}},
   		  chip_mod = card.ability.t_chips,
    	  mult_mod = card.ability.t_mult,
    	}
	  end
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
          { text = "+", colour = G.C.CHIPS },
          { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
		  { text = ", " },
		  { text = "+", colour = G.C.MULT },
          { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
          local _, poker_hands, _ = JokerDisplay.evaluate_hand()
          card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
          if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            card.joker_display_values.chips = card.ability.t_chips
            card.joker_display_values.mult = card.ability.t_mult
		  else
            card.joker_display_values.chips = 0
            card.joker_display_values.mult = 0
		  end
        end
	  }
	end,
	enstomach_compat = {
      type = "base as upgrade - half double",
      var = "t_chips",
      var2 = "t_mult"
    }
  }
  
  SMODS.Joker { -- Countdown to Liftoff
    key = 'countdown',
	loc_txt = {
	  name = "Countdown to Liftoff",
	  text = {
        "Earn an extra {C:money}$#1#{} of",
        "{C:attention}interest{} for every {C:money}$5{} you",
        "have at end of round.",
        "Interest payout increases by {C:money}$#2#{}",
        "when {C:attention}Boss Blind{} is defeated",
		"{C:inactive}(#3# + #4#){}"
	  }
	},
	config = {
	  extra = {
	    payout = 1,
		increase = 1,
		joker1 = "j_rocket",
		joker2 = "j_to_the_moon"
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return {
		vars = {
		  card.ability.extra.payout,
	      card.ability.extra.increase,
		  localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
		  localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'}
		}
	  }
	end,
    rarity = 3,
    pos = { x = 6, y = 0},
	atlas = "rot8er",
    cost = 20,
    blueprint_compat = false,
    calculate = function(self, card, context)
      if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind.boss then
        card.ability.extra.payout = card.ability.extra.payout + card.ability.extra.increase
        G.GAME.interest_amount = G.GAME.interest_amount + card.ability.extra.increase
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MONEY
        }
	  end
	end,
	add_to_deck = function(self, card, from_debuff)
      G.GAME.interest_amount = G.GAME.interest_amount + card.ability.extra.payout
	end,
	remove_from_deck = function(self, card, from_debuff)
      G.GAME.interest_amount = G.GAME.interest_amount - card.ability.extra.payout
	end,
    joker_display_def = function(JokerDisplay)
	  return {
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            card.joker_display_values.dollars = G.GAME and G.GAME.dollars and
                math.max(math.min(math.floor(G.GAME.dollars / 5), G.GAME.interest_cap / 5), 0) * card.ability.extra.payout
            card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        end
	  }
	end,
	enstomach_compat = {
	  type = "increment",
	  interest = true,
	  extra = true,
	  var = "payout"
	}
  }
  
end

if FlowerPot then
  FlowerPot.rev_lookup_records["j_square_trousers"] = copy_table(FlowerPot.records["highest_xmult"])
  FlowerPot.rev_lookup_records["j_square_trousers"].check_record = function(self, card)
    return card.ability.extra.total
  end
end

----------------------------------------------
------------MOD CODE END----------------------