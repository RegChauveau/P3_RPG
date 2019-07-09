// Character's class defines caracteristics and properties of a hero.

class Character {
    let nameCharacter: String
    var life: Int
    // Maximum pool of life even if the hero receive a heal that normally exceed it
    let maxLife: Int
    var weapon: Weapons
    var descriptionClassCharacter: String
    
    init(nameCharacter: String, life: Int, maxLife: Int, weapon: Weapons, descriptionClassCharacter: String) {
        self.nameCharacter = nameCharacter
        self.life = life
        self.maxLife = maxLife
        self.weapon = weapon
        self.descriptionClassCharacter = descriptionClassCharacter
    }
    
    // Method checks if the character is alive or not, if the target is alive or not, and reduces target life with weapon damages
    func attack(target: Character) {
        // Checks if the attacker is alive or not
        if life > 0 {
            // Checks if the target is alive or not
            if target.life > 0 {
                // Reduces target life with weapon damages
                target.life -= weapon.damages
                // Shows to players the consequences of the attack
                print("\(target.nameCharacter) looses \(weapon.damages) life points.")
            } else {
                // Error message if the target is already dead
                print("To hit a dead body is not really fair play. Target someone else !")
            }
        } else {
            // Error message if the attacker is already dead
            print("Have you ever seen someone doing something when he is dead ?")
        }
    }
}
