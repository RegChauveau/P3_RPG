class Team {
    var arrayForComposingTeam = [Character]()
    
    
    private func descriptionCharacter() { // function here to describe caracs of each hero.
        print("Please compose your team by choosing 3 heroes :")
        print("1. WARRIOR / Weapon: sword / LifePoints: 100 / Damages: 10.")
        print("2. DWARF / Weapon: axe / LifePoints: 80 / Damages: 15.")
        print("3. COLOSSUS / Weapon: shield / LifePoints: 130 / Damages: 5.")
        print("4. MAGICIAN / Weapon: staff / LifePoints: 70 / Damages: 8.")
    }
    
    func composingTeam() { // Function for creating 3 characters for each team.
        
        for _ in 1..<GameManager.maximumCharactersPerTeam {
            var choiceUser: Int = 0
            
            descriptionCharacter()
            repeat {
                if let input = readLine() {
                    if let intInput = Int(input) {
                        choiceUser = intInput
                    }
                }
            } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4
            switch choiceUser {
            case 1:
                print("You have just added a warrior to your team.")
                arrayForComposingTeam.append(Warrior(nameCharacter: <#String#>))
            case 2:
                print("Here comes a dwarf with you.")
                arrayForComposingTeam.append(Dwarf(nameCharacter: <#String#>))
            case 3:
                print("A colossus joins your team.")
                arrayForComposingTeam.append(Colossus(nameCharacter: <#String#>))
            case 4:
                print("Here comes the magician !")
                arrayForComposingTeam.append(Mage(nameCharacter: <#String#>))
            default:
                print("Your team must have 3 heroes.")
            }
        } // créer 3 instances de Characters et une instance de Team, et stocker dans le tableau, et déplacer dans GM.
    }
}

func choosingFighter() {
    
}


