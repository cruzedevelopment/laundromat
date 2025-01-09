# Laundromat Script for FiveM (Quasar University Tutorial)

## Description
This is a basic Laundromat script for FiveM designed as part of a Quasar University tutorial. The script allows players to clean dirty clothes using washing machines and sell cleaned clothes for money. The script includes skill checks for washing clothes, inventory interactions, and custom notifications.

---

## Features
- **Interactive Blip**: A blip on the map marking the Laundromat location.
- **Washing Machines**: Multiple machines where players can clean dirty clothes.
- **Skill Check**: Players must complete a skill check to successfully clean their clothes.
- **Selling Mechanism**: Players can sell cleaned clothes for in-game currency.
- **Inventory Integration**: Full support for `ox_inventory` for item handling.
- **Custom Notifications**: Success and error messages for various scenarios.

---

## Requirements

To use this script, you will need:

1. **FiveM Server**
2. **ox_lib**
3. **ox_inventory**
4. **ox_target**

---

## Installation

1. **Clone or Download**
   - Clone this repository or download the ZIP file.
   - Place the folder in your server's `resources` directory.

2. **Ensure Dependencies**
   - Make sure `ox_lib`, `ox_inventory`, and `ox_target` are installed and properly configured on your server.

3. **Add to `server.cfg`**
   - Add the following line to your `server.cfg`:
     ```
     ensure laundromat
     ```

4. **Configure Blips and Locations**
   - Edit the `shared/config.lua` file to change blip locations, laundromat coordinates, or other configurations to fit your server.

5. **Restart Your Server**
   - Start or restart your server and check for any errors.

---

## Configuration

The script comes with a configuration file (`shared/config.lua`) where you can modify the following:

- **Blip Settings**: Change the blip's sprite, color, scale, and coordinates.
- **Washing Machine Locations**: Add or remove laundry machine locations.
- **Skill Check**: Adjust the difficulty and input keys.
- **Items**: Define the input (dirty clothes) and output (clean clothes) items.
- **Selling Prices**: Change the price per item for selling cleaned clothes.
- **Notifications**: Customize notification messages for different events.

---

## Usage

### Cleaning Clothes
1. Go to a washing machine marked on the map.
2. Interact with the machine using the `ox_target` prompt.
3. If you have dirty clothes in your inventory, a skill check will start.
4. If successful, dirty clothes will be removed, and clean clothes will be added to your inventory.

### Selling Clean Clothes
1. Go to the selling point marked on the map.
2. Interact with the selling location using the `ox_target` prompt.
3. If you have clean clothes in your inventory, they will be sold for in-game currency.

---

## Known Issues
- None reported at this time.
