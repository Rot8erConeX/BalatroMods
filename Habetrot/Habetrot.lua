--- STEAMODDED HEADER
--- MOD_NAME: Habetrot
--- MOD_ID: Habetrot
--- MOD_AUTHOR: [Rot8er_ConeX]
--- MOD_DESCRIPTION: New legendary joker
--- BADGE_COLOUR: 622312
--- PRIORITY: -9999
--- PREFIX: habetrot
----------------------------------------------
------------MOD CODE -------------------------

--Creates an atlas for cards to use
SMODS.Atlas {
  -- Key for code to find it with
  key = "Habetrot",
  -- The name of the file, for the code to pull the atlas from
  path = "Habetrot.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

function SMODS.INIT.Habetrot()
  local mod_id = "Habetrot"
  local mod_obj = SMODS.findModByID(mod_id)
  
  table.insert(G.P_JOKER_RARITY_POOLS, {})
  table.insert(G.C.RARITY, HEX("622312"))

  loc_colour("mult", nil)
  G.ARGS.LOC_COLOURS["Habetrot"] = G.C.RARITY[5]
  
  SMODS.Joker { -- Habetrot
    name = 'Habetrot',
    key = 'habetrot',
	loc_txt = {
	  name = "Habetrot",
	  text = {
	    "Add up all poker hands",
		"within the played hand,",
		"and use the sum as the",
		"{C:attention}base{} {C:chips}chips{} and {C:mult}mult{}."
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return { vars = {} }
	end,
	config = {
	  extra = {
	    chips = 0,
		mult = 0
	  }
	},
	unlocked = true,
    rarity = 4,
    pos = { x = 0, y = 0},
    soul_pos = { x = 1, y = 0},
    atlas = "Habetrot",
    cost = 8,
    blueprint_compat = false,
    calculate = function(self, card, context)
	  if context.before and context.cardarea == G.jokers then
	    card.ability.extra.chips = 0
	    card.ability.extra.mult = 0
	    local m
		for i,v in pairs(G.GAME.hands) do
		  if i == context.scoring_name then
		  elseif next(context.poker_hands[i]) then
            local x = {
              message = localize(i, 'poker_hands'),
			  chip_mod = v.chips,
			  mult_mod = v.mult,
			  colour = G.C.PURPLE,
            }
	        card.ability.extra.chips = card.ability.extra.chips + v.chips
	        card.ability.extra.mult = card.ability.extra.mult + v.mult
			if m == nil then
			  m = x
			else
			  x.extra = m
			  m = x
			end
		  end
		end
		return m
	  end
	end
  }
end

local Blind_modify_hand = Blind.modify_hand
function Blind:modify_hand(cards, poker_hands, text, mult, hand_chips)
  for k, v in pairs(SMODS.find_card('j_habetrot')) do
	hand_chips = hand_chips + v.ability.extra.chips
	mult = mult + v.ability.extra.mult
  end
  if self.config and self.config.blind then -- original SMODS function
    return Blind_modify_hand(self, cards, poker_hands, text, mult, hand_chips)
  end
  if self.name == "The Flint" then -- Flint is included here in case it doesn't have self.config
    self.triggered = true
    return math.max(math.floor(mult*0.5 + 0.5), 1), math.max(math.floor(hand_chips*0.5 + 0.5), 0), true
  end
  return mult, hand_chips, false
end

----------------------------------------------
------------MOD CODE END----------------------
