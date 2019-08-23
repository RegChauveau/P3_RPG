// Character's class defines caracteristics and properties of a hero, then manages damagers attacks and the random weapon

class Character {
    // class properties
    let nameCharacter: String
    var life: Int
    // Maximum pool of life even if the hero receive a heal that normally exceed it
    let maxLife: Int
    var weapon: Weapons
    // Property for type of character used only for prints
    var descriptionClassCharacter: String
    
    init(nameCharacter: String, life: Int, maxLife: Int, weapon: Weapons, descriptionClassCharacter: String) {
        self.nameCharacter = nameCharacter
        self.life = life
        self.maxLife = maxLife
        self.weapon = weapon
        self.descriptionClassCharacter = descriptionClassCharacter
    }
    
    // Method checks if the character is alive or not, if the target is alive or not, and reduces target life with weapon damages
    func attack(target: Character, character: Character) {
        // Checks if the target is alive or not
        if target.life > 0 {
            // Decreases target life with weapon damages
            target.life -= weapon.damages
            // Shows to players the consequences of the attack
            if weapon.weaponName == "Unlucky Mass" {
                print("\(target.nameCharacter) gains 15 life points.")
            } else {
                print("\(target.nameCharacter) looses \(weapon.damages) life points.")
            }
        }
    }
    
    // Method that permits the randomly substitution of heroes' weapons by another one
    func changeWeapon(character: Character) -> Weapons {
        // Bonus weapons list
        let newWeaponList = [
            Weapons(damages: -15, weaponName: "Unlucky Mass"),
            Weapons(damages: 50, weaponName: "That's not fair"),
            Weapons(damages: character.weapon.damages, weaponName: "The sword of absolute no change"),
            Weapons(damages: 25, weaponName: "Far better staff"),
            Weapons(damages: 5, weaponName: "So lame")
        ]
        // Random roll of dices for choosing a new weapon in the array
        let randomValue = newWeaponList[Int.random(in: 0...4)]
        
        return randomValue
    }
}
