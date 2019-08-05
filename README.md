# P3_RPG

Project n°3 / Creating you first rpg videogame ever with Swift !

Game rule : 2 players. Each one compose his team choosing 3 characters with names and types (described in following lines). The winner is declared when there are no heroes alive in one of the two teams.

Heroes can be :

- WARRIOR :
    - Life : 100
    - Weapon : Biggoron Sword / 10 damages
    
- DWARF :
    - Life : 80
    - Weapon : Same Axe As Gimli / 15 damages
    
- COLOSSUS :
    - Life : 120
    - Weapon : Shield Of Azzinoth / 5 damages

- MAGE :
    - Life : 70
    - Weapon : Staff Of A Thousand Moons / 20 healing power
    - Only hero that could heal partners
    
When a mage is the only survivor in his team, he becomes a warrior. He can no longer heal himself, gets all warrior's capacities, but he keeps lifepoints he got before the switch.

Each time a hero is going to attack/heal, a magic chest could randomly appear. There is inside a new weapon with better/lower capacity. The hero has to wear it, and the only possibility to change weapon again is to find a new chest later in the game. List of magic weapon in the chest :
- The Unlucky Mass / -15 damages (your attacks give life points to your target)
- That's not fair / 50 damages
- The sword of absolute no change / same damages as usual weapon of the hero
- Far better staff / 25 damages
- So lame / 5 damages
