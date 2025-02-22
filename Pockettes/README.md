# included jokers:

- **Alice** - Starts at x3 mult.  Loses xMult when Queens or Hearts are scored, or if a Queen of Hearts is played (even if not scored).  Resets and increases xMult if a Drink-based joker is consumed.
- **Arrietty** - Allows you to use or take 1 extra card from booster packs
- **Gadget** - Every 3 hands, has a chance to create a Blueprint (must have room).  If successful, time until next attempt increases.
- **Gallica** - If scored hand includes a face card, adds the product of the lowest-ranked card from each suit not in the played hand, to mult.
- **Lily Enstomach** - Starts at x2 mult.  When a Food-based joker is consumed, she picks a random joker to be eaten by.  She has a chance to either:
-- destroy the target joker and double her own xMult.  If this occurs, the number of Food-based jokers before she can do this again increases.
-- be herself destroyed, and buff the target joker based on her current xMult.  (See below)
- **Momo Ayase** - if you have a banana, has a chance to create a Spectral card at the start of each blind.  If successful, has a chance to destroy the banana.
- **Rapunzel** - gains mult every time you play the same hand you played last hand (even between rounds).  Resets to 0 if you play a different hand.
- **Thumbelina** - starts at x2 mult.  Gains x1 mult each time your played hand is only a King and a 2.  Changes that 2 into a Queen.
- **Tinker Bell** - Each hand, chooses a suit.  Cards of that suit are drawn face down, and the first scored card of that suit will give xMult.  Increases xMult given if you play a hand of five of the target suit.  Decreases xMult if entirely ignored for a full round.

# for mod devs
Lily Enstomach can buff jokers.  However, each joker is buffed differently based on what it does.  You can tell my mod how she should buff your mod's jokers, by including something like this within your joker's SMODS.Joker definition:
```lua
    enstomach_compat = {
      type = "Xmult",
      var = "total",
      extra = true
    }
```
this can be included at the highest level, within the `config` variable, or even within the `config.extra` variable.  If multiple are included, the highest level will be read.

