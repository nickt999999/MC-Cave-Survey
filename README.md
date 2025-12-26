# Minecraft Cave Survey Datapack & Resourcepack [Java 1.21.8]

Create accurate maps of Minecraft caves with in-game cave survey tools! The datapack and resourcepack add custom items to take distance and angle measurements in your Minecraft world. Using a pencil-and-paper cave sketchpad and a cave survey compass (see below), you can create an in-game cave map just like cavers use to survey real-world caves!
<br>
<br>
The datapack adds 4 custom items into Minecraft: the (modified) Disto-X2, Wite-Out blots, flagging tape, and a Zebralight headlamp. The resourcepack adds custom item textures for each. Both are compatible with Minecraft **Java 1.21.8**, for singleplayer or multiplayer (I think) worlds. Check below for an overview of the datapack and how you can sketch out a Minecraft cave map!

## Installation/Setup Instructions

### Resourcepack Installation

1. Download and unzip the "**Cave Survey Resourcepack**" folder
2. Locate your Minecraft resourcepack folder — in the **Options** menu (from the title screen or esc menu), click **Resource Packs** (left), then **Open Pack Folder** (bottom)
    - For multiplayer servers, it's a good idea to add this as a server resourcepack too
3. Move the unzipped "**Cave Survey Resourcepack**" folder into your Minecraft resourcepack folder
4. Go back to the **Resource Packs** menu in Minecraft — hover over the **Cave Survey Resourcepack** under the "**Avaiable**" resourcepacks and click the right arrowhead icon to move it under the "**Selected**" resourcepacks
5. Click **Done** and wait for it to load. This won't change any regular textures, it just adds textures to the custom datapack items
    - If datapack items show as missing textures (black and purple cubes) once it's running then the resourcepack isn't installed correctly — check that it shows up under the **Selected** resourcepacks or that you're running the right Minecraft version

### Datapack Installation

1. Download and unzip the "**Cave Survey Datapack**" folder
2. Locate your world datapack folder
    - For a new singleplayer world, open this from the **Create New World** menu by clicking on **More** (top right), then **Data Packs**, then **Open Pack Folder**
    - For an existing singleplayer world, open this from the singleplayer world list by clicking on **Edit** (bottom left) with your world selected, then **Open World Folder** — inside the world folder, open the "**datapacks**" folder
3. Move the unzipped "**Cave Survey Datapack**" folder into your world datapack folder
4. Open your world in Minecraft — a "Cave Survey datapack enabled" message should show up
    - If not, use the **/datapack** command to enable the datapack
5. Give yourself the datapack op perms tag — type **/tag @s add survey.op** and a "command permissions granted" message should show up
    - Type "**/trigger survey.help**" for a list of datapack /trigger commands, including commands to get each custom item

## Using the Cave Survey Datapack

\* Datapack item commands will only work if you have the datapack op perms tag — see **Datapack Installation** above

### Disto-X2

You can craft a Disto-X2 from a noticible 8 netherite blocks and 1 beacon or spawn it using **/trigger survey.give_disto**. Right-click it to take a measurement shot between you and the position you're looking at and you'll see an azimuth/inclination/distance readout in chat. The azimuth angle is your horizontal/compass (left/right) angle, the inclination is your vertical (down/up) angle, and the distance is between you and your target position. These 3 numbers let you pinpoint your target position relative to your position, useful for mapping accurately.
<br>
<br>
The actionbar message (and sound effect) gives you a starting position that tells you where your player is holding the Disto for each shot. By default, this is the "body" position, which is the center of your regular hitbox (0.9 blocks above the ground). If you're near a Wite-Out blot, the starting position snaps to the nearest one instead. But if the line of sight is blocked for either of these or you aren't standing up, the disto is held at your eye level. For accuracy, it's a good idea to place Wite-Out blots to mark your exact starting and target positions for each shot — just make sure there aren't any blocks in the way!
<br>
<br>
The Disto beeps twice any time you take 3 similar measurements in a row, so you can check if your shots are consistent by trying it multiple times. You can also swap hands twice quickly with the Disto to toggle "backsight mode" where the azimuth and inclination angles are inverted, useful for double-checking your shots.

### Wite-Out

You can craft Wite-Out from a glass bottle, a slimeball, and white dye or spawn it using **/trigger survey.give_witeout**. Right-click it to place or remove a Wite-Out blot on a block. Wite-Out blots are also cleared if you break the block they're placed on.

### Flagging Tape

You can craft flagging tape from paper and a slimeball or spawn it using **/trigger survey.give_flagging_tape**. Right-clicking opens a book-and-quill page for writing text — type what you want to write on the tape and click **Done** to place a flagging tape piece, or click **Done** with an empty book to remove a flagging tape piece. Flagging tape text has a limit of 12 characters on 1 line. Flagging tape pieces are also cleared if you break the block they're placed on.

### Zebralight H600Fd Mk IV 18650 XHP50.2 Floody 5000K High CRI Headlamp

You can craft a Zebralight H600Fd Mk IV 18650 XHP50.2 Floody 5000K High CRI Headlamp from an iron ingot, a redstone lamp, and string or spawn it using **/trigger survey.give_headlamp**. Hold or wear the headlamp to shine light close in front of you and in the direction you're looking. The Zebralight H600Fd Mk IV 18650 XHP50.2 Floody 5000K High CRI Headlamp has a 75 block range limit.

## Surveying Minecraft Caves

This datapack is designed to mirror the survey process that cavers use to build maps of real-world caves! Parts of cave survey can be complex or subjective, so this is intended as a quick overview for trying it out in Minecraft.
<br>
<br>
For making a cave map, you'll want a cave survey compass, survey data/graph pages, and a pencil. The survey compass is a small plastic piece with a short ruler and azimuth dial useful for sketching point-to-point lines with the right horizontal distance and azimuth angle. As of 2025, they're sold for $11.00 + shipping by Final Frontier Sports. Survey pages are also sold on waterproof paper by cave gear retailers, but for the datapack, printing or annotating a pdf works well. Derek Bristol provides downloadable pdf files for survey data and graph pages on his website at https://www.derekbristol.com/survey-efficiency.
<br>
<br>
Aside from taking measurement shots and sketching features in Minecraft, the mapping/sketching process mirrors the cave survey process that cavers use to build maps of real-world caves! There's some good resources online for learning the cave survey process — Derek Bristol, the Out of Bounds Grotto, and cavediggers.com have some good guides/info on this. When taking in-game Disto shots, it's best to make sure each shot's starting position is the nearest Wite-Out blot. If the starting position is the player's eyes instead, reposition the nearby Wite-Out blot so there's a clear line of sight between each point and try again. It's also good to double-check each shot by shooting backwards from the target blot back to your original starting position and making sure the angles and distance match (0.05m distance and 1° angle tolerances are pretty good). Try to place blots along the walls at points that are good references for sketching in important cave features like formations, passage junctions, or room openings. You can place blots, take Disto shots, and sketch the passage yourself, or you can divide the roles up for speed.