# Welcome to The Fire Mage!

![gif of demo for The Fire Mage](https://raw.githubusercontent.com/isalevine/the-fire-mage-frontend/master/firemage-demo.gif)

The Fire Mage is a proof-of-concept game for the underlying vanilla JavaScript engine, tentatively titled Real-Time Unit Mover (RTUM). 

It is a top-down, mouse-based interface with controls and game logic based on Warcraft II, and an art style paying homage to The Legend of Zelda--special thanks to [Jerom on OpenGameArt.org for the art!](https://opengameart.org/content/16x16-fantasy-tileset)

  
  

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