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
        
        func createCharacter(nameCharacter: String, life: Int, weapon: Weapons, descriptionClassCharacter: String) {
            
        }
        
        func attack(character: Character) { // Fonction appelée quand un personnage fait des dégâts à l'adversaire
            
        }
        
        func description (name: String, life: Int) { // Fonction appelée à chaque tour de jeu pour afficher quel personnage va jouer et ses points de vie restants
            print("Nom : " + self.nameCharacter)
            print("Vie : \(self.life)")
        }
    }
    
}

// Ici tableau allCharacters
// Ajouter propriété weapon
