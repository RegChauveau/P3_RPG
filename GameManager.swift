// GameManager file is the most important part of the program. It groups all the code lines which permit the program to interact with users, and it launches the game.

class GameManager {
    static var arrayForTeamName = [String]()
    var arrayTeams = [Team]()
    
    func gameLauncher() {
        print("Welcome to Virtual Fighting of WarcraftLike of the Killing Death.")
        print("")
        introductionToGame() // Launch the context
        for _ in 1..<3 {
            let teamName = chooseTeamName() // User choose a name for his team
            let newTeam = Team(teamName: teamName) // obligation de passer un paramètre car pas d'init dans GM (il va chercher l'init de Team() qui a lui un init avec un paramètre. Il aurait accepté juste les () si pas d'init dans Team().
            newTeam.composingTeam() // Instance of Team() for a new team
            arrayTeams.append(newTeam) // Stock the new instance in an array
            print("\(newTeam.teamName) is now complete.")
        }
        print("Both teams are ready.")
        teamsResumeBeforeFight()
        fight()
        win()
        print("Thank you guys. See you soon for an other rumble.")
    }
    
    private func introductionToGame() { // Small function to create a context
        print("After days walking through jungle, you and your mates finally discover the pyramid that book of the ancient gods speaks so much about.")
        print("By entering, you can note that air is pretty wet and full of dust. You can see as well as through a shovel. Nobody comes here for centuries.")
        print("You solve all the puzzles. You’re still alive after all the traps. Fabled golden relics of the ancient gods are just right in front of you.")
        print("But an other group of adventurers appears, and they don’t want to share with you posterity and wealth. Fight is inevitable…")
        print("")
    }
    
    private func teamsResumeBeforeFight() { // Calls func statisticsTeam before each round of the game to show how many heroes are still in the array (type character, pool of life, weapon damages...)
        for i in 0..<arrayTeams.count {
            let team = arrayTeams[i]
            print("Team \(GameManager.arrayForTeamName[i])")
            team.statisticsTeam()
    }
    }
    
    func fight() {
        // S'il choisit un mage on affiche le tableau de son équipe, sinon on affiche le tableau de l'autre équipe.
        // utiliser loop while (condition vérifier qu'une des deux équipes à zero combattant)
        // soit vérifier qu'il n'y a plus de character dans le tableau (à la mort d'un héros, l'enlever du tableau), soit le garder dans le tableau et si sélection par le user affichez un message d'erreur.
    }
    
    func win() {
        
    }
    
    private func chooseTeamName() -> String { // record team names and check if they are single
        
        var teamName: String = ""
        var isNameChosen: Bool = false
        
        print("Please choose a name for your team :")
        repeat {
            if let input = readLine() {
                teamName = input
                if GameManager.arrayForTeamName.contains(teamName) {
                    print("Sorry but this team name already exists. Please choose another one.")
                } else if teamName == "" {
                    print("Make an effort lazy boy and find a real name to your team, come on !")
                } else {
                    isNameChosen = true
                    GameManager.arrayForTeamName.append(teamName)
                    print("\(teamName) is now created !")
                }
            }
        } while isNameChosen == false
        return teamName
    }

}
