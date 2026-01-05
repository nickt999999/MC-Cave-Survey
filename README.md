# Disto in Minecraft [Java 1.21.11]

Disto in Minecraft (real)
<br>
<br>
The datapack adds 4 custom items into Minecraft: the (modified) Disto™ X310, Wite-Out, flagging tape, and the Zebralight H600Fd Mk IV 18650 XHP50.2 Floody 5000K High CRI headlamp. The resourcepack adds custom item textures for each. Both are compatible with **Minecraft Java 1.21.11**, for singleplayer or multiplayer (*I think, not very tested) worlds. You can use these to set stations and take in-game measurements for a pencil-and-paper Minecraft cave survey sketch.

![Title photo — player with cave survey tools](Media/Title%20Screenshot.png)

## Installation/Setup Instructions

### Resourcepack Installation

1. Click the latest release under **Releases** in GitHub. Download and extract **CaveSurveyResourcepack.zip**
2. Locate your Minecraft resourcepack folder — in the Minecraft **Options** menu (from the title screen or esc menu), click **Resource Packs**, then **Open Pack Folder**
    - For multiplayer servers, it's a good idea to add this as a server resourcepack too
3. Move the extracted **CaveSurveyResourcepack** folder into your Minecraft resourcepack folder
4. Go back to the **Select Resource Packs** menu in Minecraft — hover over the **CaveSurveyResourcepack** under the "**Available**" resourcepacks and click the right arrowhead icon to move it under the "**Selected**" resourcepacks
5. Click **Done** and wait for it to load. This won't change any regular textures, it just adds textures to the custom datapack items
    - If datapack items show as missing textures (black and purple cubes) later on then the resourcepack isn't installed correctly — check that it shows up under the "**Selected**" resourcepacks or that you're running the right Minecraft version

### Datapack Installation

1. Click the latest release under **Releases** in GitHub. Download and extract **CaveSurveyDatapack.zip**
2. Locate your world datapack folder in Minecraft
    - For a new singleplayer world: open this from the **Create New World** menu by clicking on **More**, then **Data Packs**, then **Open Pack Folder**
    - For an existing singleplayer world: select your world from the world list, click on **Edit**, then **Open World Folder** — inside the world folder, open the **datapacks** folder
3. Move the extracted **CaveSurveyDatapack** folder into your world datapack folder
    - If you're adding to a new singleplayer world: go back to the **Select Data Packs** menu in Minecraft, hover over the **CaveSurveyDatapack** under the "**Available**" datapacks, and click the right arrowhead icon to move it under the "**Selected**" datapacks (like with the resourcepack)
4. Open your world in Minecraft — a "Cave Survey datapack enabled" message should show up
    - If not, use the **/datapack** command to enable the datapack
5. Give yourself the datapack op perms tag — type **/tag @s add survey.op** and a "command permissions granted" message should show up
    - Type **/trigger survey.help** for a list of datapack /trigger commands, including commands to get each custom item

## Using the Datapack

### Disto™ X310

You can craft a Disto™ X310 from a noticeable 8 netherite blocks and 1 beacon, or spawn it using **/trigger survey.give_disto**. Right-click it to take a measurement shot between you and the position you're looking at and you'll see an azimuth/inclination/distance readout in chat. The distance and angles are measured between the shot starting position and where you're looking.
<br>
<br>
The actionbar message (and sound effect) gives you a starting position that tells you where the player is holding the Disto for each shot. By default, this is the "body" position, which is the center of your regular hitbox (0.9 blocks above the ground). If you're near a Wite-Out blot, the starting position snaps to the nearest blot instead. But if the line of sight is blocked for either of these or you aren't standing up, the Disto is held at your eye level. For accuracy, it's a good idea to place Wite-Out blots to mark your exact starting and target positions for each shot (just make sure there aren't any blocks in the way).
<br>
<br>
The Disto beeps twice any time you take 3 similar measurements in a row, so you can check if your shots are consistent by trying it multiple times. You can also swap hands twice quickly with the Disto to toggle "backsight mode" where the azimuth and inclination angles are inverted, useful for double-checking your shots.

### Wite-Out

You can craft Wite-Out from a glass bottle, a slimeball, and white dye, or spawn it using **/trigger survey.give_witeout**. Right-click it to place or remove a Wite-Out blot on a block. Wite-Out blots are also cleared if you break the block they're placed on.

### Flagging Tape

You can craft flagging tape from paper and a slimeball, or spawn it using **/trigger survey.give_flagging_tape**. Right-clicking opens a book-and-quill page for writing text — type what you want to write on the tape and click **Done** to place a flagging tape piece on a block, or click **Done** with an empty book to remove a flagging tape piece. Flagging tape text has a limit of 12 characters on 1 line. Flagging tape pieces are also cleared if you break the block they're placed on.

### Zebralight H600Fd Mk IV 18650 XHP50.2 Floody 5000K High CRI Headlamp

You can craft a Zebralight H600Fd Mk IV 18650 XHP50.2 Floody 5000K High CRI Headlamp from an iron ingot, a redstone lamp, and string, or spawn it using **/trigger survey.give_headlamp**. Hold or wear the headlamp to shine light close in front of you and in the direction you're looking, up to 75 blocks away.

## Contributors & Contact

Nick Travisano — nicktravisano1@gmail.com