## Stat Hack

## What is this?

This cheat allows to set player card stats to 130 base or the choice of the hacker.

![Demonstration of The Hack](https://cdn.discordapp.com/attachments/556927628666470402/566766701627047976/unknown.png)

## What is the use case for this?

During the tournaments user can create a team with minimum requirements, however make all of his 80 overall minimum limit players to play like they're all prime icons.
Thus gaining unfair competitive advantage over others.

This cheat currently (20th of June, 2019) works in VSA and H2H.
User can activate this cheat, and complete a whole game with no issues.

## How to add players into the cheat file?

They follow the following structure in order to work.

```lua
edit('94;78;37;109;78;106;91;72::29', 94) -- Balotelli 95
```

Line is structured as, from left to right.
```
var firstEight = [ 'ACC', 'AGG', 'AWR', 'BAC', 'CRO', 'DRI', 'HEA', 'LPA'];

ACC = Acceleration
AGG = Aggression
AWR = Interceptions
BAC = Ball Control
CRO = Crossing
DRI = Dribbling
HEA = Heading
LPA = Long Pass Accuracy
```

This is the way to define a player.
User has to go through a service like FIFA RenderZ or game market to find these values.

Player cards can be added as the following:
```lua
-- ACC, AGG, AWR, BAC, CRO, DRI, HEA, LPA
edit('94;78;37;109;78;106;91;72::29', 94) -- Balotelli 95
edit('97;100;95;104;81;102;64;100::29', 97) -- Nainggolan 95
edit('113;71;47;106;95;108;54;79::29', 113) -- Gnabry 93
edit('101;82;35;103;96;107;58;80::29', 101) -- Bolaise 91
edit('88;67;52;95;77;94;98;72::29', 88) -- Klose 89
edit('85;49;72;99;86;97;68;85::29', 85) -- Draxler 86
edit('83;64;42;89;68;90;79;71::29', 83) -- Uth 84
edit('69;89;91;69;50;44;89;70::29', 69) -- Nastasic 84
edit('96;67;47;96;76;99;75;73::29', 96) -- Traore 84
```

All of the players listed here will go to 130 base stats if the "hack.lua" file is not edited for example.

## How to use it?

1. Save the hack.lua file in your device.
2. Open GameGuardian.
3. Launch FIFA Mobile.
4. Launch GameGuardian GUI by clicking/tapping on it.
5. Click/tap on the "play script" button from the rightmost menu.
6. Select the "hack.lua" file, and execute it.
7. Wait until process is finished.
8. Go to "My Team" screen, and check stats for edited players. They will have 130 base stats for the unedited hack in "hack.lua" file.

## Making all stats go "1"?

![Demonstration of The Hack](https://cdn.discordapp.com/attachments/512393145351274507/591051460637097993/unknown.png)

If edit the `edit` function parameters as:
```lua
edit('94;78;37;109;78;106;91;72::29', 94, 1) -- Balotelli 95 # Added 1 as the last parameter to make it not "nil"
```

This will make all stats of Balotelli go 1.
Certain usage scenario is in LvLs where user can make defenders less useful and easier to beat.

## What's not a solution?

Changing the method of detection, eitherway card is loaded into the memory and can be found.
Obsfucation won't be a solution for this.

## What's a solution?

There are two approaches.

### Inefficient way

Occasionally make the game client check for the individual player stat summation.
(Considering that there are 27 individual stats for a single player at max.)
No player in the game can exceed 3510 total stats just like that.

Upon detection of this behaviour crash the app or simply ban the user.
However there's a more efficient way.

### Efficient way

Players who uses this cheat has to load VSA or H2H match.
During the load screen download 11 player information and check if the math checks out for a few stats (or all).

For example "Balotelli 95" from our previous examples supposed to have "19 marking" at 97 + 6 rating.
If user has 130 marking stat simply disconnect that user from the match, and don't allow them to pass the loading screen.

Alternatively I know that Electronic Arts have rating calculation formulas, use that and compare entirety of the stats.
If something doesn't match, disconnect/ban the user.

## Conclusion

This cheat can be completely stopped and destroyed.
