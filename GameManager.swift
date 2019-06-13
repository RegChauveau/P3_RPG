// GameManager file is the most important part of the program. It groups all the code lines which permit the program to interact with users, and it launches the game.

class GameManager {
    var arrayForTeamName = [String]()
    var arrayTeams = [Team]()
    var useClassProperties = true
    
    func gameLauncher() {
        print("Welcome to Virtual Fighting of WarcraftLike of the Killing Death.")
        print("")
        introductionToGame() // Launch the context
        if useClassProperties == true { // on développe le parcours utilisateur normalement et dans sa totalité
            for _ in 1..<3 {
                let teamName = chooseTeamName() // User choose a name for his team
                let newTeam = Team(teamName: teamName) // obligation de passer un paramètre car pas d'init dans GM (il va chercher l'init de Team() qui a lui un init avec un paramètre. Il aurait accepté juste les () si pas d'init dans Team().
                newTeam.composingTeam() // Instance of Team() for a new team
                self.arrayTeams.append(newTeam) // Stock the new instance in an array
                print("\(newTeam.teamName) is now complete.")
            }
        } else { // on utilise des tableaux d'équipes préremplis pour gagner du temps et sauter les étapes choix du nom d'équipe, choix des noms de perso, choix des classes des persos.
            print("")
        }
        print("Both teams are ready.")
        print("")
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
    
    func teamsResumeBeforeFight() { // Calls func statisticsTeam before each round of the game to show how many heroes are still in the array (type character, pool of life, weapon damages...)
        for i in 0..<self.arrayTeams.count {
            let team = self.arrayTeams[i]
            print("Team \(self.arrayForTeamName[i])") // displays team name choosen by users
            team.descriptionTeam()
        }
    }
    
    //MARK: méthode du combat
    
    // Launch fight, select a hero to play, select a target in the other team
    private func fight() {
        var choiceUser: Int = 0
        
        print("")
        print("-------------------")
        print("3...")
        print("2...")
        print("1...")
        print("FIGHT !")
        print("-------------------")
        
        // utiliser une boucle while pour vérifier que le J2 a encore des perso dans le tableau (tant qu'il reste des combattants dans les tableaux pour les deux équipes) en remplacement de la boucle for
        for i in 0..<self.arrayTeams.count {
            print("Team \(self.arrayForTeamName[i]), please choose the hero who's gonna play (from 1 to 3):")
            var selectedCharacter: Character
            let team = self.arrayTeams[i]
            team.descriptionTeam()
            
            repeat { // Select a team hero
                if let input = readLine() {
                    if let intInput = Int(input) {
                        choiceUser = intInput
                    }
                }
            } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
            /*
             switch choiceUser {
             case 1:
             print("\(Team.arrayforCharacterName[0]) moves forward...")
             
             case 2:
             print("\(Team.arrayforCharacterName[1]) moves forward...")
             
             case 3:
             print("\(Team.arrayforCharacterName[2]) moves forward...")
             
             default:
             print("")
             } */
            print("\(Team.arrayforCharacterName[choiceUser - 1]) moves forward...")
            selectedCharacter = arrayTeams[i].arrayForComposingTeam[choiceUser - 1]
            if let magician = selectedCharacter as? Mage {
                print("Please select the hero you gonna heal (from 1 to 3):")
                team.descriptionTeam()
                repeat {
                    if let input = readLine() {
                        if let intInput = Int(input) {
                            choiceUser = intInput
                        }
                    }
                } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
                magician.heal(target: arrayTeams[i].arrayForComposingTeam[choiceUser - 1])
            } else if ((selectedCharacter as? Warrior) != nil) || ((selectedCharacter as? Dwarf) != nil) || ((selectedCharacter as? Colossus) != nil) {
                if i == 0 {
                    let enemyTeam = arrayTeams[i+1]
                    chooseTargetToAttack(enemyTeam: arrayTeams[i+1], selectedHero: selectedCharacter, arrayIndex: i)
                    if enemyTeam.heroDeadOrNot() {
                        return
                    }
                } else {
                    let enemyTeam = arrayTeams[i-1]
                    chooseTargetToAttack(enemyTeam: arrayTeams[i-1], selectedHero: selectedCharacter, arrayIndex: i)
                    if enemyTeam.heroDeadOrNot() {
                        return
                    }
                }
            }
        }
    }
    
    func win() {
        
    }
    
    func chooseTeamName() -> String { // record team names and check if they are single
        
        var teamName: String = ""
        var isNameChosen: Bool = false
        
        print("Please choose a name for your team :")
        repeat {
            if let input = readLine() {
                teamName = input
                if self.arrayForTeamName.contains(teamName) {
                    print("Sorry but this team name already exists. Please choose another one.")
                } else if teamName == "" {
                    print("Make an effort lazy boy and find a real name to your team, come on !")
                } else {
                    isNameChosen = true
                    self.arrayForTeamName.append(teamName)
                    print("\(teamName) is now created !")
                }
            }
        } while isNameChosen == false
        return teamName
    }
    
    private func chooseTargetToAttack(enemyTeam: Team, selectedHero: Character, arrayIndex: Int) {
        print("Player \(arrayIndex+1), choose a hero from the opposing team to attack him : ")
        enemyTeam.descriptionTeam()
        let opponent: Character = enemyTeam.arrayForComposingTeam[userChoice() - 1]
        selectedHero.attack(target: opponent)
    }
    
    private func userChoice() -> Int {
        var choiceUser: Int = 0
        
        repeat {
            if let input = readLine() {
                if let intInput = Int(input) {
                    choiceUser = intInput
                }
            }
        } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
        return choiceUser
    }
    
}
