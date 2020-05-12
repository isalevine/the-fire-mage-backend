# Welcome to The Fire Mage!

![gif of demo for The Fire Mage](https://raw.githubusercontent.com/isalevine/the-fire-mage-frontend/master/firemage-demo.gif)

The Fire Mage a vanilla JavaScript engine, featuring the proof-of-concept game, "The Fire Mage"! (Original title, huh?)

It is a top-down, mouse-based interface with controls and game logic based on Warcraft II, and an art style paying homage to The Legend of Zelda--special thanks to [Jerom on OpenGameArt.org for the art!](https://opengameart.org/content/16x16-fantasy-tileset)


## Highlights
### 1. [Playable demo on Heroku here!](https://the-fire-mage.herokuapp.com/)
May require a refresh to ensure that both the frontend and backend dynos on Heroku are active.

A mouse is recommended for ease of left- and right-clicking (as the controls are based on Starcraft / Warcraft unit selection), but is not required.

### 2. A collision-detector [written completely in vanilla JavaScript!](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/collider.js)
As part of the core game engine, the `collider` object listens for [collisions between different types of cells](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/collider.js#L47) (such as Units and Items), or [cells and the border of the map](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/collider.js#L9).

This is achieved by storing cell location data as state (and [in the database](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/database-functions.js#L235) to be persisted between browser reloads), and having each cell have a hitbox div within it. When the `collider` detects the hitboxes of two cells overlapping, it [triggers an event](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/collider.js#L91).

Additionally, to ensure that cells do not get "stuck" when colliding with the border of the map, there is a "bounce" implemented to [rebound moving units away from the map border by several pixels](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/collider.js#L23).

The game starts listening for collisions when cell movement is detected, and [listens for collisions every 50 milliseconds until all movement stops](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/unit-movement.js#L47).

### 3. Unit movements are [animated by vanilla JavaScript and CSS style manipulation](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/unit-movement.js#L13)!
The code uses [a dynamic CSS style to keep unit speed consistent](https://github.com/isalevine/the-fire-mage-frontend/blob/46797f43fc221b7ba6cf32e61b98cfd73aa37123/app/unit-movement.js#L27), regardless of how far they are moving.

### 4. Game sessions are persisted between browser refreshes!
Persisted data includes the randomly-generated terrain, the location of all cells, and any items in your inventory.

### 5. Check out the [Contribution Guide](https://github.com/isalevine/the-fire-mage-frontend/blob/master/CONTRIBUTION_GUIDE.md), [Changelog](https://github.com/isalevine/the-fire-mage-frontend/blob/master/CHANGELOG.md), and [Refactor Notes](https://github.com/isalevine/the-fire-mage-frontend/blob/master/REFACTOR_NOTES.md) as part of my effort to open-source this engine!
  

## Overview
The Fire Mage's code can be used and modified to create new games. [A quick writeup on the JavaScript frontend and its files can be found here.](https://github.com/isalevine/the-fire-mage-frontend) 

Currently, this backend API is still in demo mode--it was designed to handle some data (specifically terrain-tile data for saved games) in an inefficient manner to practice stress testing and debugging. A newer version is planned that will store the current data (240 rows containing only repetitive filepaths as strings) as one row per game (all strings shortened and combined into one to be parsed later).
  

## Install
Clone this repo onto your machine. ```cd the-fire-mage-backend-api``` to move into the folder.

In your console, run ```bundle install``` to install Ruby gems.

Run ```rails s``` to start the API server on localhost:3000.

Make sure you have the JavaScript frontend cloned down, installed, and running on localhost:3001. [Directions can be found here.](https://github.com/isalevine/the-fire-mage-frontend)

Open your browser (Chrome recommended), and navigate to localhost:3001 to play the game--or visit the API at "localhost:3000/api/v1/". Enjoy!


## Release Notes
I do not consider this project finished! Even though it was a one-week assignment, I have been encouraged by  [Brian Pak](https://dev.to/bouhm)  to clean up and open source this engine. Here are my goals and next step related to that:

#### TO BE READY FOR OPEN-SOURCE:
1.  Clean up the code, add comments for clarity, and restore console.logs that generate useful debugging information (such as click-event positions).
2.  Expand the Readme to describe how to create units, items, terrain, and collision events.
3.  Create a non-game-specific version of the engine—currently, the engine is inseparable from the proof-of-concept game I made for it, “The Fire Mage.”

#### TO EXPAND ON THE ENGINE:
1.  Add in the database pseudo-garbage-collection for completed and expired game sessions.
2.  Change how terrain data is saved into the database.
3.  Deploy a testable version on Heroku, and test in other browsers.
4.  (STRETCH GOAL) Use Rails’ Action Cable to enable multiplayer by allowing multiple browsers to access and update the same game session.
5.  (STRETCH GOAL) Add in basic attacking/combat functionality, in the style of the original Zelda (select item in inventory, trigger attack, render attack animation and collision events)

## Credits
I wrote a blog after completing this version that includes many of the wonderful resources used to help create this game engine: [https://dev.to/isalevine/how-i-accidentally-made-a-game-engine-from-scratch-with-vanilla-js-4m80](https://dev.to/isalevine/how-i-accidentally-made-a-game-engine-from-scratch-with-vanilla-js-4m80)

Special thanks to Steve Geluso at Flatiron School Seattle for helping me challenge myself with certain aspects of the backend design.

And once again, [bravo to Jerom for the beautiful game art!](https://opengameart.org/content/16x16-fantasy-tileset)