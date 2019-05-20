// Classe Personnage

class Character {
    var name: String
    var life: Int
    var weapon: Weapons
    var typeCharacter: TypeCharacter // Variable représentant le type de classe choisi
    
    // Initialisation de la Classe Personnage
    init(name: String, typeCharacter: TypeCharacter) {
        self.name = name
        self.typeCharacter = typeCharacter
        
        switch typeCharacter {
        case .warrior: // Dans le cas où c'est un combattant
            life = 100
            weapon = Sword()
        case .dwarf: // Dans le cas où c'est un nain
            life = 80
            weapon = Axe()
        case .colossus: // Dans le cas où c'est un colosse
            life = 130
            weapon = Shield()
        case .mage: // Dans le cas où c'est un mage
            life = 70
            weapon = Staff()
        }
    }
    
    
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
        print("Nom : " + self.name)
        print("Vie : \(self.life)")
    }
}

