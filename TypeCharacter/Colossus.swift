// Colossus class inherits from master class Character and initializes what a colossus is.

class Colossus: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 50, maxLife: 120, weapon: ShieldOfAzzinoth(), descriptionClassCharacter: "Colossus")
    }
}
