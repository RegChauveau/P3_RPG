// Class that essentially displays team making process, giving names to characters and checks if hero is dead or not

class Team {
    // Type property to limit the maximum number of heroes per team
    static let maximumCharactersPerTeam = 3
    let teamName: String
    // Array stocking characters for both teams
    var arrayForComposingTeam = [Character]()
    // Array stocking heroes names
    static var arrayforCharacterName = [String]()
    
    init(teamName: String) {
        self.teamName = teamName
    }
    
    // Method describing caracteristics of each hero to help users making their choices
    private func descriptionCharacter() {
        print("Please choose which type of character it is :")
        print("1. WARRIOR / Weapon: Biggoron Sword / LifePoints: 100 / Damages: 10.")
        print("2. DWARF / Weapon: Same Axe as Gimli / LifePoints: 80 / Damages: 15.")
        print("3. COLOSSUS / Weapon: Shield of Azzinoth / LifePoints: 130 / Damages: 5.")
        print("4. MAGICIAN / Weapon: Staff of a Thousand Moons / LifePoints: 70 / Damages: 8.")
    }
    
    // Method to record characters names and check if they are single or not
    private func chooseCharacterName() -> String {
        var nameCharacter: String = ""
        // Bool property to check if chosen hero name is unic or not
        var isNameChosen: Bool = false
        
        print("Please choose a name for your character :")
        repeat {
            // Record user's input
            if let input = readLine() {
                nameCharacter = input
                // Error message if the input is already existing
                if Team.arrayforCharacterName.contains(nameCharacter) {
                    print("Sorry but this character name has been already chosen. Please give your character another one.")
                    // Error message if there is no input
                } else if nameCharacter == "" {
                    print("Your character cannot be unnamed. Please find a name for your hero.")
                } else {
                    isNameChosen = true
                    // Add new hero name to array
                    Team.arrayforCharacterName.append(nameCharacter)
                    // Message if all the process is good
                    print("\(nameCharacter) is now ready to fight !")
                }
            }
        } while isNameChosen == false
        return nameCharacter
    }
    
    // Method for creating 3 characters for each team.
    func composingTeam() {
        
        for _ in 0..<Team.maximumCharactersPerTeam {
            // Property for choosing the name of the hero
            let characterName = chooseCharacterName()
            
            descriptionCharacter()
            let choiceUser: Int = inputUser()
            // Switch between 4 types of heroes, then we add the new heroe to his team array
            switch choiceUser {
            case 1:
                print("You added a warrior to your team.")
                arrayForComposingTeam.append(Warrior(nameCharacter: characterName))
            case 2:
                print("Here comes a dwarf with you.")
                arrayForComposingTeam.append(Dwarf(nameCharacter: characterName))
            case 3:
                print("A colossus joins your team.")
                arrayForComposingTeam.append(Colossus(nameCharacter: characterName))
            case 4:
                print("Here comes the magician !")
                arrayForComposingTeam.append(Mage(nameCharacter: characterName))
            default:
                print("Your team must have 3 heroes.")
            }
        }
    }
    
    // Method that shows how many heroes are still in the array for each team before each round of the game (life, weapon damages...)
    func descriptionTeam() {
        for i in 0..<arrayForComposingTeam.count {
            let character = arrayForComposingTeam[i]
            // We check if the hero is dead (removed from the array) or not
            if character.life > 0 {
                // Property to check/displays if the fighter is a damager or a healer
                let characterAction: String
                // If it's a healer
                if character is Mage {
                    characterAction = "heal power"
                    // If it's a hero that makes damages
                } else {
                    characterAction = "damages"
                }
                // Displays dynamic caracteristics of each of each hero in both teams (dynamic as life)
                print("\(i+1) - \(character.nameCharacter) - \(character.descriptionClassCharacter) - life: \(character.life) - maxLife: \(character.maxLife) - \(characterAction): \(character.weapon.damages)")
            }
        }
        print("-------------------")
    }
    
    // Method that checks if a hero is dead or not, and if it is, we remove it from the array of his team
    func isHeroDead(target: Character) -> Bool {
        // Bool property to check if the target is dead or not: false when he is alive, go true when he dies
        var isDead: Bool = false
        
        // We look over the array of the enemy team
        for target in arrayForComposingTeam {
            // We check life of the target
            if target.life <= 0 {
                // if he is actually dead
                isDead = true
                print("\(target.nameCharacter) is dead.")
                // Find the index of the hero in the enemy array
                let index = arrayForComposingTeam.firstIndex(where: { $0 === target })
                if let unwrappedIndex = index {
                    // Remove dead hero from the enemy array
                    arrayForComposingTeam.remove(at: unwrappedIndex)
                }
            } else {
                isDead = false
            }
        }
        return isDead
    }
    
    // Method to record inputs of users and decrease the number of code lines in other methods
    private func inputUser() -> Int {
        var choiceUser: Int = 0
        repeat {
            // Record user's input
            if let input = readLine() {
                // Unwrap it
                if let intInput = Int(input) {
                    choiceUser = intInput
                }
            }
            if choiceUser < 1 || choiceUser > 4 {
                print("Please choose un number between 1 and 4.")
            }
        } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4
        return choiceUser
    }
    
}
