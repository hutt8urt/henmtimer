```md id="mq7zpl"
# AnyTimer

AnyTimer is an Ashita v4 addon that provides a compact ImGui interface for managing repeating custom timers.

The addon allows players to quickly create, start, and stop repeating countdown timers through a simple UI instead of manually tracking mechanics during combat or events.

Designed for HNMs, endgame encounters, spawn tracking, reminders, and general encounter coordination, AnyTimer helps improve group awareness with automatic countdown announcements and a live timer display.

# Features
- Compact ImGui UI
- Adjustable repeating timer
- Fully customizable event/message label
- Automatic countdown announcements
- Real-time countdown display
- Simple start/stop controls
- Lightweight and minimal

# Installation
Place the addon folder inside:

Ashita/addons/

Load the addon in-game:

/addon load anytimer

# Usage

## Timer Length
Set the timer length in seconds.

Example:
"47"

> Creates a repeating 47 second timer.

## Message
Set the custom message label used for countdown announcements.

Examples:
* ADDS
* PHASE
* SPAWN
* STUN
* METEOR
* CHARM

## Start Timer
Starts the repeating timer.

## Stop Timer
Stops the repeating timer.

# Countdown Warnings
The addon automatically announces:
* 10 seconds
* 3 seconds
* 2 seconds
* NOW

# Example Output
* ADDS IN 10s
* ADDS IN 3s
* ADDS IN 2s
* ADDS NOW!

# UI Display
The timer window displays:
* Current timer length
* Custom event label
* Start/Stop controls
* Live countdown

Example:
"Next Event: 18s"

# Notes
AnyTimer does not automate gameplay in any way.

The addon only:
* tracks local timers
* displays UI information
* sends chat countdown messages

No combat automation, targeting, movement, packet interaction, or unattended gameplay functionality is included.

# Author
Toogood @ Horizon
```
