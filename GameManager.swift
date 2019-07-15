// GameManager groups all the code lines which permit the program to interact with users, and it launches the game.
class GameManager {
    // Variable array stocking team names
    var arrayForTeamName = [String]()
    // Variable array stocking both team names and characters for both teams
    var arrayTeams = [Team]()
    // Variable array stocking characters for both teams
    var arrayForComposingTeam = [Character]()
    // Variable managing switch to avoid or not first part of the program. If true, the user has ton give names to his team and choose characters types and names. If false, the program uses already existing arrays to facilitate tests.
    var askUserForData = false
    
    // It launches the game, manages the composition of teams and the fight and shows the winner
    func gameLauncher() {
        print("Welcome to Virtual Fighting of WarcraftLike of the Killing Death.")
        print("")
        // It launches the context
        introductionToGame()
        // Condition if == true. Users have to execute the entire program.
        if askUserForData == true {
            for _ in 1..<3 {
                // User choose a name for his team
                let teamName = chooseTeamName()
                // New instance of Team class to create new team and stock team name
                let newTeam = Team(teamName: teamName)
                // Calls composingTeam() to choose type and name for each of the 3 characters for both team
                newTeam.composingTeam()
                // Stocks the new instance in an array
                self.arrayTeams.append(newTeam)
                print("\(newTeam.teamName) is now complete.")
            }
            // Condition if == false. The program skips the code between lines 20 to 30.
        } else {
            // Variables to create 6 characters
            let entaar = Character(nameCharacter: "Entaar", life: 30, maxLife: 30, weapon: BiggoronSword(), descriptionClassCharacter: "Warrior", typeNumber: 1)
            let buharok = Character(nameCharacter: "Buharok", life: 30, maxLife: 30, weapon: StaffOfAThousandMoons(), descriptionClassCharacter: "Magician", typeNumber: 4)
            let osty = Character(nameCharacter: "Osty", life: 30, maxLife: 30, weapon: SameAxeAsGimli(), descriptionClassCharacter: "Dwarf", typeNumber: 2)
            let murtonn = Character(nameCharacter: "Murtonn", life: 30, maxLife: 30, weapon: ShieldOfAzzinoth(), descriptionClassCharacter: "Colossus", typeNumber: 3)
            let krenshar = Character(nameCharacter: "Krenshar", life: 30, maxLife: 30, weapon: StaffOfAThousandMoons(), descriptionClassCharacter: "Magician", typeNumber: 4)
            let naïreh = Character(nameCharacter: "Naïreh", life: 30, maxLife: 30, weapon: SameAxeAsGimli(), descriptionClassCharacter: "Dwarf", typeNumber: 2)
            // Variables to create 2 teams with name for each
            let teamName1 = "Maëstrom"
            let teamName2 = "Le Sang de la Terre"
            arrayForTeamName.append(teamName1)
            arrayForTeamName.append(teamName2)
            // Variables to stock the two new instances of Team
            let team1 = Team(teamName: teamName1)
            let team2 = Team(teamName: teamName2)
            // The 6 characters are added to team arrays
            team1.arrayForComposingTeam.append(Warrior(nameCharacter: "Entaar"))
            team1.arrayForComposingTeam.append(Mage(nameCharacter: "Buharok"))
            team1.arrayForComposingTeam.append(Dwarf(nameCharacter: "Osty"))
            team2.arrayForComposingTeam.append(Colossus(nameCharacter: "Murtonn"))
            team2.arrayForComposingTeam.append(Dwarf(nameCharacter: "Naïreh"))
            team2.arrayForComposingTeam.append(Mage(nameCharacter: "Krenshar"))
            
            arrayTeams.append(team1)
            arrayTeams.append(team2)
        }
        print("Both teams are ready.")
        print("")
        teamsResumeBeforeFight()
        fight()
    }
    
    // Method to create a context
    private func introductionToGame() {
        print("After days walking through jungle, you and your mates finally discover the pyramid that book of the ancient gods speaks so much about.")
        print("By entering, you can note that air is pretty wet and full of dust. You can see as well as through a shovel. Nobody comes here for centuries.")
        print("You solve all the puzzles. You’re still alive after all the traps. Fabled golden relics of the ancient gods are just right in front of you.")
        print("But an other group of adventurers appears, and they don’t want to share with you posterity and wealth. Fight is inevitable…")
        print("")
    }
    
    // Calls func statisticsTeam before each round of the game to show how many heroes are still in the array (type character, pool of life, weapon damages...)
    func teamsResumeBeforeFight() {
        for i in 0..<self.arrayTeams.count {
            let team = self.arrayTeams[i]
            // Displays team name choosen by users
            print("Team \(self.arrayForTeamName[i])")
            team.descriptionTeam()
        }
    }
    
    //MARK: Fighting methods
    
    // It launches the fight and regroups conditions to stop or continue the execution of the program
    private func fight() {
        // Variable for recording how many turns in the game
        var round = 0
        
        print("""
        ------------------
        3...
        2...
        1...
        FIGHT !
        -------------------
        """)
        
        // Condition to stop the fight
        while !arrayTeams[0].arrayForComposingTeam.isEmpty && !arrayTeams[1].arrayForComposingTeam.isEmpty {
            
            // Add 1 to round when Player 1 is playing
            print("Round : \(round)")
            round += 1
            
            for i in 0..<arrayTeams.count {
                
                // Checks if index1 of arrayTeams is empty. If true, the fight stops; if false, the fight continues
                if arrayTeams[1].arrayForComposingTeam.isEmpty {
                    print("congrats team 1")
                    
                } else {
                    
                    print("Team \(self.arrayForTeamName[i]), please choose the hero you gonna play with (from 1 to 3):")
                    let team = self.arrayTeams[i]
                    team.descriptionTeam()
                    
                    // Call of method fightConditions
                    fightConditions(indexOfPlayingTeam: i)
                    
                    
                }
            }
        }
    }
    
    // Method to select a fighter and a target. It also manages differences between damagers and healers, and removes characters when they die.
    func fightConditions(indexOfPlayingTeam: Int) {
        // Variables for recording the input of user
        let choiceUser = userChoice()
        let team = self.arrayTeams[indexOfPlayingTeam]
        // Variable to stock the hero who is gonna play
        var myAttacker: Character
        
        // Displays the name of the attacker
        myAttacker = arrayTeams[indexOfPlayingTeam].arrayForComposingTeam[choiceUser - 1]
        print("\(myAttacker.nameCharacter) moves forward...")
        
        // Condition if selected attacker is a magician
        if let magician = myAttacker as? Mage {
            // Checks if the magician is the only survivor of his team
            if arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count == 1 && ((myAttacker as? Mage) != nil) {
                print("\(arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count)")
                if myAttacker.typeNumber == 4 {
                    myAttacker.typeNumber = 1
                    print("ABRACADABRA ! If last hero in the team is a magician, it becomes a warrior.")
                }
            }
            print("Please select the hero you gonna heal (from 1 to 3):")
            team.descriptionTeam()
            let inputUser = userChoice()
            // Choosing healer's target
            magician.heal(target: arrayTeams[indexOfPlayingTeam].arrayForComposingTeam[inputUser - 1])
            
            // Condition if selected attacker is a damager
        } else if (((myAttacker as? Warrior) != nil) || ((myAttacker as? Dwarf) != nil) || ((myAttacker as? Colossus) != nil)) || (arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count == 1 && ((myAttacker as? Mage) != nil)) {
            // Variable to stock the index of defending team
            let indexOfTargetTeam: Int
            // Switch between both columns of arrayTeams to determine the index of attacking team
            if indexOfPlayingTeam == 0 {
                indexOfTargetTeam = 1
            } else {
                indexOfTargetTeam = 0
            }
            
            let enemyTeam = arrayTeams[indexOfTargetTeam]
            // Calls the method to choose a target to attack
            let indexOfTargetCharacter = chooseTargetToAttack(enemyTeam: arrayTeams[indexOfTargetTeam], myAttacker: myAttacker, arrayIndex: indexOfPlayingTeam)
            // Calls the method to check if the target is dead
            let result = enemyTeam.isHeroDead(target: arrayTeams[indexOfTargetTeam].arrayForComposingTeam[indexOfTargetCharacter])
            
            // Checks if index0 of arrayTeams is empty. If true, the fight stops; if false, the fight continues
        if arrayTeams[0].arrayForComposingTeam.isEmpty {
            print("congrats team 2")
        }
    }
    }
    
    // It records team names and check if they are single or not
    func chooseTeamName() -> String {
        var teamName: String = ""
        // Bool variable to check if chosen team name is unic or not
        var isNameChosen: Bool = false
        
        print("Please choose a name for your team :")
        repeat {
            // Record user's input
            if let input = readLine() {
                teamName = input
                // Error message if the input is already existing
                if self.arrayForTeamName.contains(teamName) {
                    print("Sorry but this team name already exists. Please choose another one.")
                    // Error message if there is no input
                } else if teamName == "" {
                    print("Make an effort lazy boy and find a real name to your team, come on !")
                    // Message if all the process is good
                } else {
                    isNameChosen = true
                    // Add new team name to array
                    self.arrayForTeamName.append(teamName)
                    print("\(teamName) is now created !")
                }
            }
        } while isNameChosen == false
        return teamName
    }
    
    // Method to select a target to attack
    private func chooseTargetToAttack(enemyTeam: Team, myAttacker: Character, arrayIndex: Int) -> Int {
        print("Player \(arrayIndex+1), choose a hero from the opposing team to attack him : ")
        enemyTeam.descriptionTeam()
        let choiceUser = userChoice()
        let opponent: Character = enemyTeam.arrayForComposingTeam[choiceUser - 1]
        myAttacker.attack(target: opponent)
        return (choiceUser - 1)
    }
    
    // Method to record inputs of users and decrease the number of code lines in other methods
    private func userChoice() -> Int { // passer en paramètre la taille du tableau via un entier puis l'utiliser dans le while
        var choiceUser: Int = 0
        
        repeat {
            // Record user's input
            if let input = readLine() {
                // Unwrap it
                if let intInput = Int(input) {
                    choiceUser = intInput
                } else {
                    print("Please enter a number between 1 and 3")
                }
            }
        } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
        return choiceUser
    }
    
}

