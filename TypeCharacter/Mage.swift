// Mage class inherits from class Character and initializes what a mage is.

class Mage: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 70, weapon: Staff(), descriptionClassCharacter: "Magi")
    }
}
