// Mage class inherits from class Character and initializes what a mage is.

class Mage: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 30, maxLife: 70, weapon: StaffOfAThousandMoons(), descriptionClassCharacter: "Magician", typeNumber: 4)
    }
    
    // override func attack() {}
    // Le mage ne peut attaquer que s'il est le seul rescapé de son équipe.
    // Vérifier que le tableau d'équipe ne contient plus que le mage.
    // Modifier les damages de son arme.
    // Impossibilité de se soigner soi-même.
    // Autre possibilité : le transformer en une autre classe
    
    // This function checks if the magician is alive or not, if his target is alive or not, then add life points to his target.
    func heal(target: Character){
        // Checks if magician is alive
        if life > 0 {
            // Checks if the target is alive, with life points under maxLife
            if target.life > 0 && target.life < maxLife {
                // Adds life points to the target
                target.life += weapon.damages
                print("\(target.nameCharacter) recovers \(weapon.damages) life points.")
                // If healing points + target life points exceed target maximum life points, we limit life points to maximum life points
                if target.life >= target.maxLife {
                    target.life = target.maxLife
                }
            // Error message if the user try to select a hero with his maximum life pool
            } else if target.life == target.maxLife {
                print("Life of your mate is already at his top. Next time, you gonna pay attention to what you do.")
            // Error message if the target is already dead
            } else {
                print("Your mate is already dead dude.")
            }
        // Error message if magician is dead
        } else {
            print("Have you ever seen someone doing something when he is dead ?")
        }
    }
}

