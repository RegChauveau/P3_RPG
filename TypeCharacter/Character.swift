// Character's class defines caracs and properties of a hero.

class Character {
    let nameCharacter: String
    var life: Int
    var weapon: Weapons
    var descriptionClassCharacter: String
    
    // Class' init
    init(nameCharacter: String, life: Int, weapon: Weapons, descriptionClassCharacter: String) {
        self.nameCharacter = nameCharacter
        self.life = life
        self.weapon = weapon
        self.descriptionClassCharacter = descriptionClassCharacter
        
        
        
    func takeDamages(damages: Int) { // Fonction appelée lors de la prise de dégâts
        self.life = self.life - damages
        
        if self.life < 0 {
            self.life = 0
            print("Le personnage est mort")
        }
    }
    
    func attack(character: Character) { // Fonction appelée quand un personnage fait des dégâts à l'adversaire
        character.takeDamages(damages: self.weapon.damages)
    }
    
    func healing(damages: Int) { // Fonction appelée lorsque le mage soigne un membre de son équipe
        self.life = self.life - damages
    }
    
    func description (name: String, life: Int) { // Fonction appelée à chaque tour de jeu pour afficher quel personnage va jouer et ses points de vie restants
        print("Nom : " + self.nameCharacter)
        print("Vie : \(self.life)")
    }
}

}
