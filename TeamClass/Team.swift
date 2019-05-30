class Team {
    var teamName: String
    
    
    init(teamName: String) {
        self.teamName = teamName
    }
}

private func descriptionCharacter() { // function here to describe caracs of each hero.
    print("Please compose your team by choosing 3 heroes :")
    print("1. WARRIOR / Weapon: Biggoron Sword / LifePoints: 100 / Damages: 10.")
    print("2. DWARF / Weapon: Same Axe as Gimli / LifePoints: 80 / Damages: 15.")
    print("3. COLOSSUS / Weapon: Shield of Azzinoth / LifePoints: 130 / Damages: 5.")
    print("4. MAGICIAN / Weapon: Staff of a Thousand Moons / LifePoints: 70 / Damages: 8.")
}

func composingTeam() { // Function for creating 3 characters for each team.
    
    for _ in 1..<GameManager.maximumCharactersPerTeam {
        var choiceUser: Int = 0
        var arrayForComposingTeam = [Character]()
        
        descriptionCharacter()
        repeat {
            if let input = readLine() {
                if let intInput = Int(input) {
                    choiceUser = intInput
                }
            }
        } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4
        let characterName = GameManager()
        let createHero = characterName.chooseCharacterName() //???????????????????????????????????????
        switch choiceUser {
        case 1:
            print("You added a warrior to your team.")
            arrayForComposingTeam.append(Warrior(nameCharacter: createHero))
        case 2:
            print("Here comes a dwarf with you.")
            arrayForComposingTeam.append(Dwarf(nameCharacter: createHero))
        case 3:
            print("A colossus joins your team.")
            arrayForComposingTeam.append(Colossus(nameCharacter: createHero))
        case 4:
            print("Here comes the magician !")
            arrayForComposingTeam.append(Mage(nameCharacter: createHero))
        default:
            print("Your team must have 3 heroes.")
        }
    }
}

func choosingFighter() {
    
}
