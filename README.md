````md id="bqkzvr"
# HENM Timer

HENM Timer is an Ashita v4 addon that provides a lightweight ImGui interface for managing repeating encounter timers during HNMs and endgame content.

The addon was designed primarily for encounters with recurring add spawns or repeating mechanics where countdown reminders are useful for raid coordination.

Instead of manually tracking timers or typing countdowns, HENM Timer provides a simple UI for starting and stopping repeating alerts.

---

# Features

- Compact ImGui interface
- Adjustable repeating timer
- Customizable alert message
- Automatic countdown reminders
- Repeating encounter cycles
- Real-time countdown display
- Lightweight and simple setup

---

# Installation

Place the addon folder inside:

```text
Ashita/addons/
````

Load the addon in-game:

```text id="b0lnlk"
/addon load henm_timer
```

---

# Usage

## Timer Length

Set the encounter timer length in seconds.

Example:

```text id="y0r8yn"
47
```

This creates a repeating 47-second timer cycle.

---

## Message

Set the encounter message displayed in party chat.

Examples:

```text id="5z6h1j"
ADDS
CRAB
SPAWN
PHASE
```

---

## Start Timer

Begins the repeating encounter timer.

The addon will automatically post countdown warnings and restart the timer after each cycle.

---

## Stop Timer

Stops the repeating timer cycle.

---

# Countdown Warnings

The addon automatically announces:

```text id="w1i6cf"
10 seconds
3 seconds
2 seconds
NOW
```

for every cycle.

---

# Example Output

```text id="jlwm8u"
>>> ADDS IN 10s <<<
>>> ADDS IN 3s <<<
>>> ADDS IN 2s <<<
>>> ADDS NOW! <<<
```

---

# Example Use Cases

* HENM add waves
* Repeating spawn mechanics
* Timed phase transitions
* Spawn window reminders
* Dynamis wave timing
* Event coordination

---

# Notes

HENM Timer does not automate gameplay in any way.

The addon only:

* tracks local timers
* displays UI information
* sends chat countdown messages

No combat automation, targeting, movement, packet interaction, or unattended gameplay functionality is included.

---

# Author

toogood

```
```
