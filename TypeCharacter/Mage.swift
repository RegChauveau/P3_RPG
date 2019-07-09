// Mage class inherits from class Character and initializes what a mage is.

class Mage: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 30, maxLife: 70, weapon: StaffOfAThousandMoons(), descriptionClassCharacter: "Magician")
    }
    
    // override func attack() {}
    // Le mage ne peut attaquer que s'il est le seul rescapé de son équipe.
    // Vérifier que le tableau d'équipe ne contient plus que le mage.
    // Modifier les damages de son arme.
    // Impossibilité de se soigner soi-même.
    // Autre possibilité : le transformer en une autre classe
    
    // This function checks if the magician is alive or not, if his target is alive or not, then add life points to his target.
    func heal(target: Character){
        
        if life > 0 { // If magician is alive
            if target.life > 0 && target.life < maxLife { // If his target is alive
                target.life += weapon.damages
                print("\(target.nameCharacter) recovers \(weapon.damages) life points.")
                if target.life >= target.maxLife {
                    target.life = target.maxLife
                }
            } else if target.life == target.maxLife {
                print("Life of your mate is already at his top. Next time, you gonna pay attention to what you do.")
            } else { // If his target is dead
                print("Your mate is already dead dude.")
            }
        } else { // If magician is dead
            print("Have you ever seen someone doing something when he is dead ?")
        }
    }
}

