// Colossus class inherits from class Character and initializes what a colossus is.

class Colossus: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 30, maxLife: 120, weapon: ShieldOfAzzinoth(), descriptionClassCharacter: "Colossus", typeNumber: 3)
    }
}
