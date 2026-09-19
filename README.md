Koltera Evolved- Game Development Specification
Godot 4 Roguelike Deckbuilding Creature Battler
Project Overview
Koltera Evolved is a roguelike deckbuilding game combining Slay the Spire style progression with Pokemon-inspired creature collection and team building.
Design Pillars
Strategic Team Building; Deck Synergy; Roguelike Progression; Meaningful Resource Allocation.
Core Gameplay Loop
When the Player starts a run, they receive a starting deck and will select a starter creature, which adds that creature’s signature card to their deck. They will then progress through stages and defeats three floor bosses to win.
Stage Types
Battle, Event Room, Shop, Healing Location.
Creature System
Creatures are the core progression units of Koltera Evolved. They determine the player’s combat options, influence deck composition, and evolve over the course of a run. Each creature has a type, stat profile, unique card pool, and role within the team.
Starting team size: 1. Maximum fielded in battle slots is 3. (But relics and events can increase the maximum team size to greater than 3). Creatures will have a type, a unique starting card, a unique set of acquirable cards, and stats.
Creatures will be acquired periodically through events, or winning battles. This should be about 2-3 per floor
Creatures gain stats at the end of battle. A random creature from the active team gets to have a stat of the players choice increased. 
While on the stage selection screen (run map), the player can apply their creatures to either a battle slot, resource collection slot, or leave them in the creature bank to be applied if their other creatures unalive (reach 0 HP). Creatures that are at 0 HP remain in the bank after the battle they unalived in, so that they can be revived.
Creatures in the battle slot have their unique cards (starter or acquired) added to the player’s deck. They participate in combats. They gains full stat growth from battles.
As the run progresses, creatures can increase their stats by winning battles while on a team or through events.
Creatures can be applied to resource slots. There are a maximum of 2 resource slots. Creatures in their resource slots create at base 1 mana of their type per turn. This can be increased at the end of some combats.
Creatures that are not actively battling or collecting resources will slowly decrease in stats. (This is creatures that are in the bank) They can be swapped in in the map selection scene for a battle or resource creature. This decreases 1 random STAT every other battle. This cannot go below 0.
Creatures that are gained latter in the run have their stats increased on a growth curve based on each stage that has passed.
Creature Types
There are 4 types that a creature can be: Earth, Air, Energy, Water. These types restrict what cards can be played to attack with that creatures. This also determines what type of creature the creature is effective/weak against (the moves the use or have used against them will do more/less damage accordingly)

Type restricts which cards a creature can use. A creature can only play cards matching its type unless a relic or event overrides this rule.

Creatures only produce resources, while in a resource slot, of their type
Earth > Air > Water > Energy > Earth
Creature Stats
Creatures will have the following stats: Health, Attack, Ability Power, Defense, Magic Resist, speed, and resource collection.
Health will be the number of points of damage the creature can take.
Attack is the increase in damage that the creature does when it uses a physical attack card.
Ability is the increase in damage that the creature does when it uses an Ability card.
Defense is the decreased damage that the creature takes from physical cards.
Magic Resist is the decreased damage that the creature takes from Ability cards.
Speed determines the turn order of the creatures in the battle.
Resource collection determines how many resources they produce per turn.
Creature Passives
Creatures will have a passive unique to their type.
-	Air creatures resist Slow
-	Water creatures resist Burn
-	 Energy creatures resist Gust
-	Earth creatures resist Stun
There is a chance that this can be a passive that is unique to the creature. This is displayed when hovered when the player is deciding what creature to acquire. This will be something like: Apply 1 burn at the end of each round. This creature creates x2 resource.

Revival
When revival occurs from a healing station. The creature comes back at ¼ health. There are some relics that will revive a creature to full health. And cards to revive a creature to 1 health.
Creature Unique Cards
Creatures will all have a unique card that is added to the players deck if they are applied to a battle slot, and removed if they are removed from a battle slot.
If the player acquires a creature during the run AND the creature is not dead, they can select from a series of unique cards
Signature cards cannot be removed from the deck by choice. Only when the creature is put in the bank.
Enemies
There will be a small subset of creatures that can be normal enemies.  Another small subset will be elites. And there will be multiple that can be bosses at the end of each floor. I want the bosses to appear significantly larger than the creatures that the player can collect. The player’s creatures will be small and friendly. The elites will be slightly larger and formidable. The bosses are large and downright mean.
Multiple enemies may appear in the same stage. They increase in difficulty as the stages progress. They need their own stats. They need a subset of moves that they can use in a fight.
Turn order is going to be displayed on the top with rectangles of the profile picture of each of the creatures in battle slots and the enemies.

Relics
Relics will be items that grant a permanent alteration to the game. Add a resource slot, add a battle slot, all creatures get +1 speed, bosses deal 25% less damage. Etc.
Card System
Shared deck architecture containing attacks, skills, powers and signature cards.
Cards will have a cost, effect, and resource gain. The resource gain is displayed in the bottom right and, when discarded, gives the player that amount of resources to use on playing other cards.  The cost of the card will be displayed in the upper left and will consume that many resources when played. The effect of the card can be anything from dealing damage, shielding, applying a status effect, to healing. The cards can target a single target, multiple targets, self, or all targets based on the card. The card must have valid targets in order to be played.
Combat System
Creature action order is determined by speed.
At the start of each turn cycle the player draws 6 cards (max hand size of 12). 
They then discard cards to gain resources.
They spend the resources to play cards. 
There are cards that do not utilize creature actions, otherwise creatures only get one action per turn cycle. 
The player must then drag and drop the card to play it. If it is an attack, they must select a valid creature to initiate the attack, and then select valid targets for the attack. They can right click to cancel the selection.
After all selections are made and the player selects ready. The cards are played in turn order, with the enemies doing their attacks when their turn is indicated. 
Effects are granted when indicated by the effect. This could be the beginning of turn or end of turn.
The battle ends when either the enemies or the battle slot creatures have all reached 0 hp.
Mana Pool
The player has a mana pool for each resource type. This will be displayed in a circle with X displaying the amount of that type of mana. Each type of mana that is added to the circle divides it further. Each division shows that types amount of mana left. When all of a type of mana is utilized its division is removed from the circle. 
The mana cannot go below 0, so if there is not enough mana to pay a card’s cost. It is not played.
There will be generic costs on cards. When a generic cost card is played, the mana circle gets bigger and the player clicks the divisions for each mana to spend of a type to pay for the generic cost. The user can undo a click with CTRL + Z until the final color is clicked and the card is played.
Mana is added to the pool by creatures in resource slots AND by discarding cards for their resource addition displayed in the bottom right.
Manapool resets each combat cycle.
Ascension
•  After a first successful run, unlock an "Ascension" modifier track (Slay the Spire style): each level adds one compounding difficulty rule (enemies +10% stats, bench decay doubled, fewer shop nodes, etc.). 
•  Ascension level is a meta-progression stat shown in the Catalog screen alongside unlocked creatures/card
Tutorial
flag as a needed section once core systems stabilize; several interlocking systems (types, three creature slots, bench decay, mana allocation) hit new players at once.
Currency
•	Gold dropped from battles (scaling with node depth) and found in event rooms.
•	Shop node sells: 3–5 random cards (typed to your current roster), 1–2 relics, a card-removal service (cost scales up each time it's used in a run), and a stat-boost consumable.
•	Elite/boss fights award bonus gold plus guaranteed relic choice, distinct from the "add a creature" reward at the run's starting node.

2. Status Effect Formulas
Effect	Suggested Mechanic
Burn	Deals damage equal to 1 + (0.5 × stack count), rounded down, at end of turn. Stacks refresh (don't add) on reapplication — prevents runaway burn stacking from trivializing fights.
Stun	Creature skips its action entirely for 1 turn. Does not stack (reapplying refreshes duration, doesn't extend it).
Slow	Creature's effective Speed is treated as lowest possible for turn-order calculation only; does not stack.
Gust	Creature's effective Speed is treated as highest possible for turn-order calculation only; does not stack.
Stacks decay	1 stack removed at the start of the affected creature's turn (not globally at end of round) — this way turn order and effect resolution stay deterministic even with mixed speeds.
Technical Architecture
1. Project Setup
Godot 4 project scaffolding, Git + .gitignore configured
Autoloads established (GameState, SaveManager, EventBus/signal bus)
Base Resource classes stubbed: CardData, CreatureData, RelicData, EnemyData
Architecture diagram + backlog committed to repo
Exit criteria: empty scenes load, autoloads initialize, one dummy Resource round-trips through save/load
2. Card & Resource Framework (in progress)
CardData resource (cost, effect placeholder, resource-gain value)
Card.gd scene: display, drag component, cost/resource-gain UI
Hand, draw pile, discard pile, play zone with signal-driven flow
Mana pool UI (typed circle-and-divisions) and generic-cost manual allocation with Ctrl+Z undo
Turn cycle skeleton: draw 6 → discard-for-resources → spend → end turn, pool resets each cycle
Exit criteria: a placeholder deck can be drawn, discarded for resources, and spent on dummy-effect cards in a scene with no creatures or enemies present
3. Creature Framework
CreatureData resource: type, stat block (HP/Attack/Ability/Defense/MR/Speed/Resource Collection), signature card reference, passive
Battle slot / resource slot / bank state machine (assign, swap, decay tick, revival)
Signature card add/remove on slot assignment, tied into the Card Framework's deck
Stat growth (post-battle random-stat-choice) and bench decay (per the numbers agreed in the design supplement)
Exit criteria: a creature can be created, slotted into battle/resource/bank, its signature card correctly enters/leaves the deck, and decay/growth apply correctly over several simulated battles
4. Combat Prototype
Enemy framework: EnemyData, stat block, move subset, normal/elite/boss tiers and scale
Turn-order calculation (Speed, Slow/Gust effects) and top-of-screen order display
Targeting flow: drag card → select acting creature → select valid targets → ready-up → resolve in order
Type effectiveness matrix applied to damage calc
Status effects (Stun/Slow/Gust/Burn) with the agreed stack/decay rules
Exit criteria: one player creature can fully fight one enemy to a win/loss state, with type effectiveness, at least one status effect, and correct turn order all functioning
5. Map Progression
Node graph generation (branching lattice, node-type weighting by depth)
Stage types wired to their scenes: Battle, Elite, Shop, Healing, Event
Run-level state (gold, relics, roster) persisting across node transitions
Save/load at the specified checkpoints (stage start/end, post-loot return to map)
Exit criteria: a full run can be played start-to-boss-node through the map with saves surviving an app restart mid-run
6. Meta Systems
Main menu (Continue/New/Catalog/Settings/Exit) and Catalog unlock-tracking
Ascension modifier track and meta-progression stat
Relic effects framework (the "permanent alteration" hooks)
Developer tools (Battle Sandbox, Auto-Resolve) — recommend pulling these earlier, right after Milestone 4, since their whole purpose is to accelerate balancing during Combat Prototype and Map Progression work, not after
Exit criteria: full main-menu loop functions, Catalog reflects real unlock state, at least one Ascension level and one relic are implemented end-to-end
Map System
The map should be a horizontal display that begins and ends on a single node. This branches into multiple paths. The second to first and last node is always 3 nodes. This is always 12 nodes total, that branches. The nodes are most likely to be battle scenes. With a chance of being an elite. Otherwise, they can be shops, healing, or random event nodes.
The end node is the boss. The beginning node always allows addition of another creature.
Saving The Game
The game will automatically save at the beginning and end of each stage. This is after the player defeats all enemies or is defeated. And After the user goes back to the map select screen after choosing their end of stage loot.
Main Menu
Continue Run button -> This will allow the user to continue the last run. Starting at the beginning of the last battle they entered OR load into the beginning of the last event they entered OR be at the map to select the next stage. Wherever they were.
New Run button -> This start a new run, entering into the character select screen. This deletes any saved run that would be able to be continued.
Catalog -> This contains a catalog of all unlocked, cards, characters, all seen enemies, and augments. Anything not interacted with should be grayed out and some will have explanations on how to unlock them.
Settings -> This opens the settings menu
Exit -> Closes the game
Claude Code Instructions
Act as Senior Godot Technical Lead. Prioritize maintainability, data-driven design, typed GDScript and incremental implementation.
Environment Setup Instructions
Verify Godot and Git, create project structure, configure gitignore, establish autoloads, define resource classes, architecture diagrams, backlog and technical risk review.
Developer tools
Tool 1 — Battle Sandbox (build first)
•	Standalone scene: one player creature, one enemy, a deck.
•	Buttons: Reset Battle, Spawn Creature (dropdown by ID), Spawn Enemy (dropdown by ID), Add Card to Deck (dropdown by ID), Edit Stats (inline numeric fields per stat on any unit in the scene).
•	Purpose: isolate the resource/combat math for balancing without needing a full run.
Tool 2 — Auto-Resolve / Fast-Forward (build second)
•	A toggle available on any battle/map screen in dev builds.
•	On activation: instantly resolves the current battle as a win, applies stat growth and card/creature rewards automatically, and advances to the next map node.
•	Purpose: let you traverse many stages quickly to test scaling curves across a full run, not just a single fight.
Both tools:
•	Gated behind a single OS.has_feature("dev_build") (or equivalent autoload flag) check so they never ship in a release build by accident.
Working Notes
Use the space below to continue refining the game design and implementation details.
________________________________________________________________________
_____________Add hover over creature to show stats in battle, can’t see stats unless they have been on a team in the past. Have catalog on main screen that also shows stats of previously acquired creatures.___________________________________________________________
________________________________________________________________________
___________________Ask what to put in technical architecture to determine what things to use to generate resources/visuals_____________________________________________________
__________________Add a section for needed development tools to expedite balanceing______________________________________________________
________________________________________________________________________
________________________________________________________________________
________________________________________________________________________
________________________________________________________________________
________________________________________________________________________
________________________________________________________________________
________________________________________________________________________
________________________________________________________________________
________________________________________________________________________
________________________________________________________________________
