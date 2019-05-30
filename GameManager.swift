// GameManager file is the most important part of the program. It groups all the code lines which permit the program to interact with users, and it launches the game.

class GameManager {
    
    static let maximumCharactersPerTeam = 3
    private var arrayTeams = [Team]()
    
    func gameLauncher() {
        print("Welcome to Virtual Fighting of WarcraftLike of the Killing Death.")
        introductionToGame() // Launch the context
        for _ in 1..<2 {
            _ = chooseTeamName() // User choose a name for his team
            let newTeam = Team(teamName: "")
            newTeam.composingTeam() // Instance of Team() for a new team
            arrayTeams.append(newTeam) // Stock the new instance in an array
        }// boucler pour répétition du code afin de stocker dans le tableau déclaré
        // méthode qui va composer les deux équipe (nom, 3 types de heros...) stocké dans un array
        fight()
        win()
        print("Thank you guys. See you soon for an other rumble.")
    }
    
    private func introductionToGame() { // Small function to create a context
        print("After days walking through jungle, you and your mates finally discover the pyramid that book of the ancient gods speaks so much about.")
        print("By entering, you can note that air is pretty wet and full of dust. You can see as well as through a shovel. Nobody comes here for centuries.")
        print("You solve all the puzzles. You’re still alive after all the traps. Fabled golden relics of the ancient gods are just right in front of you.")
        print("But an other group of adventurers appears, and they don’t want to share with you posterity and wealth. Fight is inevitable…")
    }
    
    func fight() {
        
        // utiliser loop while (condition vérifier qu'une des deux équipes à zero combattant)
        // soit vérifier qu'il n'y a plus de character dans le tableau (à la mort d'un héros, l'enlever du tableau), soit le garder dans le tableau et si sélection par le user affichez un message d'erreur.
    }
    
    func win() {
        
    }
    
    func chooseTeamName() -> String { // record team names and check if they are single
        var arrayForTeamName = [String]()
        var teamName: String = ""
        var isNameChosen: Bool = false
        
        print("Please choose a name for your team :")
        repeat {
            if let input = readLine() {
                teamName = input
                if arrayForTeamName.contains(teamName) {
                    print("Sorry but this team name already exists. Please choose another one.")
                } else if teamName == "" {
                    print("Make an effort lazy boy and find a real name to your team, come on !")
                } else {
                    isNameChosen = true
                    arrayForTeamName.append(teamName)
                    print("\(teamName) is now ready to fight !")
                }
            }
        } while isNameChosen == false
        return teamName
    }
    
    func chooseCharacterName() -> String { // same as chooseTeamNames but for hero names
        var arrayforCharacterName = [String]()
        var nameCharacter: String = ""
        var isNameChosen: Bool = false
        
        print("Please choose a name for your character :")
        repeat {
            if let input = readLine() {
                nameCharacter = input
                if arrayforCharacterName.contains(nameCharacter) {
                    print("Sorry but this character name has been already chosen. Please give your character another one.")
                } else if nameCharacter == "" {
                    print("Your character cannot be unnamed. Please find a name for your hero.")
                } else {
                    isNameChosen = true
                    arrayforCharacterName.append(nameCharacter)
                    print("\(nameCharacter) is nos ready to fight !")
                }
            }
        } while isNameChosen == false
        return nameCharacter
    }
}
