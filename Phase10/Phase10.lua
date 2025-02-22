--- STEAMODDED HEADER
--- MOD_NAME: Phase10
--- MOD_ID: Phase10
--- MOD_AUTHOR: [Rot8er_ConeX]
--- MOD_DESCRIPTION: New joker based on Phase 10 rules
--- BADGE_COLOUR: 014A97
--- PRIORITY: -9999
--- PREFIX: phase10
----------------------------------------------
------------MOD CODE -------------------------

--Creates an atlas for cards to use
SMODS.Atlas {
  -- Key for code to find it with
  key = "Phase10",
  -- The name of the file, for the code to pull the atlas from
  path = "Phase10.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}


function SMODS.INIT.Phase10()
  local mod_id = "Phase10"
  local mod_obj = SMODS.findModByID(mod_id)
  
  table.insert(G.P_JOKER_RARITY_POOLS, {})
  table.insert(G.C.RARITY, HEX("014A97"))

  loc_colour("mult", nil)
  G.ARGS.LOC_COLOURS["Phase10"] = G.C.RARITY[5]
  
  SMODS.Joker { -- Phase 10 Rules Card
    name = 'Phase 10 Rules Card',
    key = 'phase10_rules',
	loc_txt = {
	  name = "Phase10",
	  text = {
	    "Runs can be played, and score",
		"as a Set of the same size.",
		"(ex. {C:attention}10 9 8{} scores as a",
		"{C:attention}Three of a Kind{}.)",
		"{C:inactive}(Concept: DoomMustard){}"
	  }
	},
	loc_vars = function(self, info_queue, card)
	  return { vars = {} }
	end,
	unlocked = true,
    rarity = 3,
    pos = { x = 0, y = 0},
    atlas = "Phase10",
    cost = 8,
    blueprint_compat = false
  }
end

G.localization.misc.poker_hands["Run of 2"] = "Run of 2"
G.localization.misc.poker_hands["Run of 3"] = "Run of 3"
G.localization.misc.poker_hands["Run of 4"] = "Run of 4"
G.localization.misc.poker_hands["Run of 5"] = "Run of 5"
G.localization.misc.poker_hands["Runny Flush"] = "Runny Flush"
G.localization.misc.poker_hands["Set of 2"] = "Set of 2"
G.localization.misc.poker_hands["Set of 3"] = "Set of 3"
G.localization.misc.poker_hands["Set of 4"] = "Set of 4"
G.localization.misc.poker_hands["Set of 5"] = "Set of 5"
G.localization.misc.poker_hands["Settled Flush"] = "Settled Flush"

G.FUNCS.get_poker_hand_info = function(_cards)
    local poker_hands = evaluate_poker_hand(_cards)
    local scoring_hand = {}
    local text,disp_text,loc_disp_text = 'NULL','NULL', 'NULL'
    if next(poker_hands["Flush Five"]) then text = "Flush Five"; scoring_hand = poker_hands["Flush Five"][1]
    elseif next(poker_hands["Flush House"]) then text = "Flush House"; scoring_hand = poker_hands["Flush House"][1]
    elseif next(poker_hands["Five of a Kind"]) then text = "Five of a Kind"; scoring_hand = poker_hands["Five of a Kind"][1]
    elseif next(poker_hands["Straight Flush"]) then text = "Straight Flush"; scoring_hand = poker_hands["Straight Flush"][1]
    elseif next(poker_hands["Four of a Kind"]) then text = "Four of a Kind"; scoring_hand = poker_hands["Four of a Kind"][1]
    elseif next(poker_hands["Full House"]) then text = "Full House"; scoring_hand = poker_hands["Full House"][1]
    elseif next(poker_hands["Flush"]) then text = "Flush"; scoring_hand = poker_hands["Flush"][1]
    elseif next(poker_hands["Straight"]) then text = "Straight"; scoring_hand = poker_hands["Straight"][1]
    elseif next(poker_hands["Three of a Kind"]) then text = "Three of a Kind"; scoring_hand = poker_hands["Three of a Kind"][1]
    elseif next(poker_hands["Two Pair"]) then text = "Two Pair"; scoring_hand = poker_hands["Two Pair"][1]
    elseif next(poker_hands["Pair"]) then text = "Pair"; scoring_hand = poker_hands["Pair"][1]
    elseif next(poker_hands["High Card"]) then text = "High Card"; scoring_hand = poker_hands["High Card"][1] end

    disp_text = text
    if text =='Straight Flush' then
        local min = 10
        for j = 1, #scoring_hand do
            if scoring_hand[j]:get_id() < min then min =scoring_hand[j]:get_id() end
        end
        if min >= 10 then 
            disp_text = 'Royal Flush'
        end
	elseif text=='Pair' or text=='Three of a Kind' or text=='Four of a Kind' or text=='Five of a Kind' then
		m = 2
		if text=='Three of a Kind' then m = 3
		elseif text=='Four of a Kind' then m = 4
		elseif text=='Five of a Kind' then m = 5
		end
		if scoring_hand[1]:get_id() ~= scoring_hand[2]:get_id() then
			disp_text = 'Run of '..m
		elseif next(find_joker('Phase 10 Rules Card')) then
			disp_text = 'Set of '..m
		end
	elseif text=='Flush Five' then
		if scoring_hand[1]:get_id() ~= scoring_hand[2]:get_id() then
			disp_text = 'Runny Flush'
		elseif next(find_joker('Phase 10 Rules Card')) then
			disp_text = 'Settled Flush'
		end
    end
    loc_disp_text = localize(disp_text, 'poker_hands')
    return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end

local old_same = get_X_same
function get_X_same(num, hand, or_more)
  f = get_run(num,hand)
  m = next(find_joker('Phase 10 Rules Card'))
  if m and (f ~= nil) and (#f > 0) then
    return f
  end
  return old_same(num, hand, or_more)
end

function get_run(size,hand)
  local ret = {}
  local t = {}
  local IDS = {}
  for i=1, #hand do
    local id = hand[i]:get_id()
    if id > 1 and id < 15 then
      if IDS[id] then
        IDS[id][#IDS[id]+1] = hand[i]
      else
        IDS[id] = {hand[i]}
      end
    end
  end

  local straight_length = 0
  local straight = false
  local can_skip = next(find_joker('Shortcut')) 
  local skipped_rank = false
  for j = 1, 14 do
    if IDS[j == 1 and 14 or j] then
      straight_length = straight_length + 1
      skipped_rank = false
      for k, v in ipairs(IDS[j == 1 and 14 or j]) do
        t[#t+1] = v
      end
    elseif can_skip and not skipped_rank and j ~= 14 then
      skipped_rank = true
    else
      straight_length = 0
      skipped_rank = false
      if not straight then t = {} end
      if straight then break end
    end
    if straight_length >= size then straight = true end 
  end
  if not straight then return ret end
  table.insert(ret, t)
  return ret
end

----------------------------------------------
------------MOD CODE END----------------------
