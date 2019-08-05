// Warrior class inherits from class Character and initializes what a warrior is.

class Warrior: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 100, maxLife: 100, weapon: BiggoronSword(), descriptionClassCharacter: "Warrior")
    }
}
