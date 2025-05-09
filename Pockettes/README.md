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
- **Collector's Dollhouse** - any of the above jokers that form an unbroken chain with this joker, do not take up any joker slots.

# for mod devs
Lily Enstomach can buff jokers.  However, each joker is buffed differently based on what it does.  You can tell my mod how she should buff your mod's jokers, by including something like this within your joker's SMODS.Joker definition:
```lua
    enstomach_compat = {
      type = "Xmult",
      var = "total",
      extra = true
    }
```
this can be included at the highest level, within the `config` table, or even within the `config.extra` table.  If multiple are included, the highest level will be read.

- `type` is the type of buff achieved (see below)
- `var` (and `var2` if applicable) is the name of the variable that will be affected.
- `extra` is whether or not the variable in question is within the `config.extra` table.  If false, Lily will look in the base `config` table.

Other values:
- `hand_size` (boolean) tells Lily that your joker affects hand size.
- `hands` (boolean) tells Lily that your joker affects hands per round.
- `discard` (boolean) tells Lily that your joker affects discards per round.
- `interest` (boolean) tells Lily that your joker affects the amount of interest given per $5 at the end of round.

# types of buffs
- **`increment`** - this is a flat buff of 1.  Vanilla jokers with this type of buff include Green Joker (on the amount of mult gained per hand) and Riff-Raff (on the amount of jokers produced at the start of round)
- **`double`** - doubles the value of the target variable.  Vanilla jokers with this type of buff include Red Card (on the amount of mult gained per skipped booster) and Matador (on the amount of money gained)
- **`evil`** - increases the target variable by 100.  This should be reserved for jokers that take joy in killing.  Vanilla jokers with this type of buff include the Ceremonial Dagger (on the current mult counter) and Madness (on the current xMult counter)
- **`probability`** - decreases the denominator of a probability by 1.  This is not affected by Lily's current xMult.  If the denominator is already 1, the joker cannot be buffed and Lily ignores this joker.  Vanilla jokers with this type of buff include 8 Ball, Business Card, and Space Joker.
- **`decrease`** - decreases the target variable by 1.  If the target variable is already 1, the joker cannot be buffed and Lily ignores this joker.  Jokers with this type of buff include Vultbines Joker's Fight A Bull (on the amount of money required to get the buff of the joker)
- **`counter`** - icreases the target variable by 10.  Vanilla jokers with this type of buff include Rocket (on the amount of money gained per round).
- **`base as upgrade`** - increases the target variable by its default amount.  Vanilla jokers with this type of buff include Loyalty Card (on the amount of xMult given) and To The Moon (on the amount of interest given).
- **`base as upgrade - double`** (requires `var2` to be defined) - inncreases two target variables by their default amount.  Vailla jokers with this type of buff include Walkie Talkie (on the amount of chips and mult given).
- **`base as upgrade - half double`** (requires `var2` to be defined) - increases two target variables by half their default amount.  Vanilla jokers with this type of buff include Scholar (on the amount of chips and mult given).

- **`chips`** - increases the amount of chips given by this joker by 100.
- **`Xchips`** - increases the amount of Xchips given by this joker by 25 (requires Talisman to be installed).
- **`Echips`** - increases the amount of Echips given by this joker by 6 (requires Talisman to be installed).
- **`EEchips`** - increases the amount of EEchips given by this joker by 2 (requires Talisman to be installed).
- **`EEEchips`** - increases the amount of EEEchips given by this joker by 1 (requires Talisman to be installed).
- **`mult`** - increases the amount of mult given by this joker by 40.
- **`Xmult`** - increases the amount of Xmult given by this joker by 10.
- **`Emult`** - increases the amount of Emult given by this joker by 3 (requires Talisman to be installed).
- **`EEmult`** - increases the amount of EEmult given by this joker by 1 (requires Talisman to be installed).
- **`EEEmult`** - increases the amount of EEEmult given by this joker by 0.5 (requires Talisman to be installed).

All of the chip and mult-based buffs can be given the following modifiers:
- **`_ per card` ("chips per card")** - the buff per card is 25% of the default buff per full hands (chip-based buffs round to whole numbers, mult-based buffs can be decimals).
- **`_ reset` ("mult reset")** - this is for jokers that reset on a timer (the only vanilla joker like this is Campfire).  The buff is 5x the default buff.


If your joker does not have `enstomach_compat` defined, she will search for variables in the following order, and try to buff them accordingly:
- **`h_size`** - treated as a hand-size buff
- **`hands`** - treated as a hand count buff
- **`d_size`** - treated as a discard buff
- **`eee_mult`**
- **`EEEmult`**
- **`eee_mult_mod`**
- **`EEEmult_mod`**
- **`ee_mult`**
- **`EEmult`**
- **`ee_mult_mod`**
- **`EEmult_mod`**
- **`e_mult`**
- **`Emult`**
- **`e_mult_mod`**
- **`Emult_mod`**
- **`x_mult`**
- **`Xmult`**
- **`x_mult_mod`**
- **`Xmult_mod`**
- **`mult`**
- **`t_mult`**
- **`s_mult`** - treated as a mult-per-card buff
- **`mult_mod`**
- **`eee_chips`**
- **`EEEchips`**
- **`eee_chips_mod`**
- **`EEEchips_mod`**
- **`eee_chip_mod`**
- **`EEEchip_mod`**
- **`ee_chips`**
- **`EEchips`**
- **`ee_chips_mod`**
- **`EEchips_mod`**
- **`ee_chip_mod`**
- **`EEchip_mod`**
- **`e_chips`**
- **`Echips`**
- **`e_chips_mod`**
- **`Echips_mod`**
- **`e_chip_mod`**
- **`Echip_mod`**
- **`x_chips`**
- **`Xchips`**
- **`x_chips_mod`**
- **`Xchips_mod`**
- **`x_chip_mod`**
- **`Xchip_mod`**
- **`chips`**
- **`t_chips`**
- **`s_chips`** - treated as a chips-per-card buff
- **`chips_mod`**
- **`chip_mod`**
- **`dollars`** - treated as a double buff
- **`extra` (not a table)** - treated as an increment buff.
If `config.extra` is a table, she looks in there.  Otherwise, she looks in `config`.
