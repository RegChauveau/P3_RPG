// Colossus class inherits from class Character and initializes what a colossus is.

class Colossus: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 120, weapon: Shield(), descriptionClassCharacter: "Colossus")
    }
}
