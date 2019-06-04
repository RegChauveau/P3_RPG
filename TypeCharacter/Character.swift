// Character's class defines caracs and properties of a hero.

class Character {
    let nameCharacter: String
    var life: Int
    let maxLife: Int
    var weapon: Weapons
    var descriptionClassCharacter: String
    
    init(nameCharacter: String, life: Int, maxLife: Int, weapon: Weapons, descriptionClassCharacter: String) { // Class' initializer
        self.nameCharacter = nameCharacter
        self.life = life
        self.maxLife = maxLife
        self.weapon = weapon
        self.descriptionClassCharacter = descriptionClassCharacter
        
        func attack(target: Character) { // The function checks if the character is alive or not, if the target is alive or not, manages target life by reducing with weapon damages, then says if the target is dead after the action.
            if life > 0 {
                if target.life > 0 {
                    target.life -= weapon.damages
                    if target.life <= 0 {
                        target.life = 0
                        print("Congrats! \(target.nameCharacter) is dead !") //
                    }
                } else {
                    print("To hit a dead body is not really fair play. Target someone else !")
                }
            } else {
                print("Have you ever seen someone doing something when he is dead ?")
            }
        }
    }
}

// Ici tableau allCharacters
