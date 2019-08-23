// Dwarf class inherits from master class Character and initializes what a dwarf is.

class Dwarf: Character {
    init(nameCharacter: String) {
        super.init(nameCharacter: nameCharacter, life: 50, maxLife: 80, weapon: SameAxeAsGimli(), descriptionClassCharacter: "Dwarf")
    }
}
