// GameManager file is the most important part of the program. It groups all the code lines which permit the program to interact with users, and it launches the game.

class GameManager {
    // propriété team tableau de teams
    static let maximumCharactersPerTeam = 3
    
    private func introductionToGame() { // Small function to create a context
        print("After days walking trough jungle, you and your mates finally discover the pyramid that book of the ancient gods speaks so much about.")
        print("By entering, you can note that air is pretty wet and full of dust. You can see as well as through a shovel. Nobody comes here for centuries.")
        print("You solve all the puzzles. You’re still alive after all the traps. Fabled golden relics of the ancient gods are just right in front of you.")
        print("But an other group of adventurers appears, and they don’t want to share with you posterity and wealth. Fight is inevitable…")
    }
    
    func gameLauncher() {
        print("Welcome to Virtual Fighting of WarcraftLike of the Killing Death.")
        introductionToGame()
        // méthode qui va composer les deux équipe (nom, 3 types de heros...) stocké dans un array
        fight()
        win()
        print("Thank you guys. See you soon for an other rumble.")
    } // boucler pour répétition du code afin de stocker dans le tableau déclaré
    
    
    
    func fight() {
        // utiliser loop while (condition vérifier qu'une des deux équipes à zero combattant)
        // soit vérifier qu'il n'y a plus de character dans le tableau, soit 
    }
    
    func win() {
        
    }
    
    func chooseTeamName() -> String { // record team names and check if they are single
        var teamName: String = ""
        var arrayForTeamName = [String]()
        
        print("Please choose a name for your team :")
        repeat {
            if let input = readLine() {
                teamName = input
                if arrayForTeamName.contains(teamName) {
                    print("Sorry but this team name already exists. Please choose another one.")
                } else {
                    arrayForTeamName.append(teamName)
                    print("\(teamName) is now ready to fight !")
                }
            }
        } while teamName == ""
        return teamName
    } // remarques:
    // changer ma condition while
    // préparer une var bool isNameChosen = false par défaut pour remplacer le teamName
    
    func chooseCharacterName() -> String { // same as chooseTeamNames but for hero names
        var arrayforCharacterName = [String]()
        var nameCharacter: String = ""
        
        repeat {
            print("Please choose a name for your character :")
            if let input = readLine() {
                nameCharacter = input
                if arrayforCharacterName.contains(nameCharacter) {
                    print("Sorry but this character name has been already chosen. Please give your character another one.")
                } else {
                    arrayforCharacterName.append(nameCharacter)
                    print("\(nameCharacter) is nos ready to fight !")
                }
            }
        } while nameCharacter == ""
        return nameCharacter
}
