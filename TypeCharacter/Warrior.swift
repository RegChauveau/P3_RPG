// Warrior class inherits from master class Character and initializes what a warrior is.

class Warrior: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 50, maxLife: 100, weapon: BiggoronSword(), descriptionClassCharacter: "Warrior")
    }
}
