# Flappy Bird - Pause & Medals Update 🐦

## Overview
A Flappy Bird clone built with Lua and LÖVE2D, featuring a robust state machine (Title, Countdown, Play, Score). This version introduces a fully functional pause system, dynamic obstacle generation, and a rewarding medal system.

## Custom Features
* **Seamless Pause System:** Added a custom `PauseState`. Pressing `p` mid-game saves the exact state of the bird, pipes, timer, and score. It pauses the background music, plays a specific sound, and allows you to seamlessly resume where you left off.
* **Dynamic Pipe Spacing:** Replaced the fixed 2-second pipe spawn interval with a randomized timer (`1` to `5` seconds) to make gameplay less predictable.
* **Medal System:** Entirely reworked the `ScoreState` to award medals based on performance thresholds:
  * 🥉 **Bronze:** 5+ points
  * 🥈 **Silver:** 7+ points
  * 🥇 **Gold:** 9+ points
