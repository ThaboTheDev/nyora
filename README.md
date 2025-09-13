# nyora – Iteration 1: Skeleton & Movement

This is **Iteration 1** of a terminal-based open-world adventure game built in Dart.  
At this stage the game is a simple ASCII world where a player character (`@`) can move around a map using keyboard controls.

---

## 🎯 Goals of Iteration 1

- Set up the Dart project structure.
- Build the core game loop (`input → update → render`).
- Create a small hard-coded ASCII map.
- Implement a movable player character with collision detection.
- Render everything in the terminal using ANSI characters.
- Provide a clean exit (`q` to quit).

---

## 🗂 Project Structure (Iteration 1)

```bash
adventure_game/
├─ bin/
│  └─ main.dart          # Entry point – starts the game
├─ lib/
│  ├─ core/
│  │  ├─ game.dart       # Main game loop
│  │  ├─ input.dart      # Handles keyboard input
│  │  └─ renderer.dart   # Draws the world in the terminal
│  ├─ world/
│  │  └─ world.dart      # Map data & terrain logic
│  └─ entities/
│     └─ player.dart     # Player entity
└─ README.md
```

## Controls

| Key | Action     |
| --- | ---------- |
| `W` | Move Up    |
| `A` | Move Left  |
| `S` | Move Down  |
| `D` | Move Right |
| `Q` | Quit Game  |

## 🛠 Features Implemented in This Iteration

- Core game loop in Game class.

- Hardcoded ASCII map and terrain.

- Player entity with position and movement.

- Collision detection with walls.

- Terminal rendering using ANSI escape codes.

- Simple input handling from the keyboard.

## 🔜 Next Steps (Future Iterations)

- Load maps from external files instead of hardcoding.

- Add NPCs and items to interact with.

- Add combat, inventory, and quests.

- Build a multiplayer skeleton using Dart server + WebSockets.
