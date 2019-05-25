class Team {
    
    func descriptionCharacter() { // function here to describe caracs of each hero.
        print("Please compose your team by choosing 3 heroes :")
        print("1. WARRIOR / Weapon: sword / LifePoints: 100 / Damages: 10.")
        print("2. DWARF / Weapon: axe / LifePoints: 80 / Damages: 15.")
        print("3. COLOSSUS / Weapon: shield / LifePoints: 130 / Damages: 5.")
        print("4. MAGICIAN / Weapon: staff / LifePoints: 70 / Damages: 8.")
    }

    func composingTeam() { // Function for creating 3 characters for each team.
        var arrayForComposingTeam = [Character]()
        
        while arrayForComposingTeam.count < GameManager.maximumCharactersPerTeam {
            if let choiceUser = readLine() {
                switch choiceUser {
                case "1":
                    print("Le personnage choisi est un combattant.")
                    arrayForComposingTeam.append(Warrior(nameCharacter: nameCharacter))
                case "2":
                    print("Le personnage choisi est un nain.")
                    arrayForComposingTeam.append(Dwarf(nameCharacter: String))
                case "3":
                    print("Le personnage choisi est un colosse.")
                    arrayForComposingTeam.append(Colossus(nameCharacter: String))
                case "4":
                    print("Le personnage choisi est un mage.")
                    arrayForComposingTeam.append(Mage(nameCharacter: String))
                default:
                    print("Votre équipe doit se composer de 3 soldats.")
                }
            } // créer 3 instances de Characters et une instance de Team, et stocker dans le tableau, et déplacer dans GM.
        }
    }
    
    
    
    func choosingFighter() {
        
    }
}

