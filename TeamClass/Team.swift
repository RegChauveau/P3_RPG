class Team {
    static let maximumCharactersPerTeam = 3 // As her name says
    let teamName: String
    var arrayForComposingTeam = [Character]()
    static var arrayforCharacterName = [String]() // For checking if hero names are single
    
    init(teamName: String) {
        self.teamName = teamName
    }
    
    private func descriptionCharacter() { // function here to describe caracs of each hero to the user.
        print("Please choose which type of character it is :")
        print("1. WARRIOR / Weapon: Biggoron Sword / LifePoints: 100 / Damages: 10.")
        print("2. DWARF / Weapon: Same Axe as Gimli / LifePoints: 80 / Damages: 15.")
        print("3. COLOSSUS / Weapon: Shield of Azzinoth / LifePoints: 130 / Damages: 5.")
        print("4. MAGICIAN / Weapon: Staff of a Thousand Moons / LifePoints: 70 / Damages: 8.")
    }
    
    func chooseCharacterName() -> String { // same as chooseTeamNames but for hero names
        var nameCharacter: String = ""
        var isNameChosen: Bool = false
        
        print("Please choose a name for your character :")
        repeat {
            if let input = readLine() {
                nameCharacter = input
                if Team.arrayforCharacterName.contains(nameCharacter) {
                    print("Sorry but this character name has been already chosen. Please give your character another one.")
                } else if nameCharacter == "" {
                    print("Your character cannot be unnamed. Please find a name for your hero.")
                } else {
                    isNameChosen = true
                    Team.arrayforCharacterName.append(nameCharacter)
                    print("\(nameCharacter) is now ready to fight !")
                }
            }
        } while isNameChosen == false
        return nameCharacter
    }
    
    func composingTeam() { // Function for creating 3 characters for each team.
        
        for _ in 0..<Team.maximumCharactersPerTeam {
            var choiceUser: Int = 0
            let characterName = chooseCharacterName() // For choosing the name of the hero
            
            descriptionCharacter() // For choosing the class of a hero (from line 48 to 69)
            repeat {
                if let input = readLine() {
                    if let intInput = Int(input) {
                        choiceUser = intInput
                    }
                }
            } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4
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
    
    func statisticsTeam() {

    }
    
}

