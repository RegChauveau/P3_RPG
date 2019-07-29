// GameManager groups all the code lines which permit the program to interact with users, and it launches the game.
class GameManager {
    // Variable array stocking team names
    var arrayForTeamName = [String]()
    // Variable array stocking both team names and characters for both teams
    var arrayTeams = [Team]()
    // Variable array stocking characters for both teams
    var arrayForComposingTeam = [Character]()
    // Variable managing switch to avoid or not first part of the program. If true, the user has ton give names to his team and choose characters types and names. If false, the program uses already existing arrays to facilitate tests.
    var askUserForData = true
    
    // It launches the game, manages the composition of teams and the fight and shows the winner
    func gameLauncher() {
        print("Welcome to Virtual Fighting of WarcraftLike of the Killing Death.")
        print("")
        // It launches the context
        introductionToGame()
        // Condition if == true. Users have to execute the entire program (they have to give teams their names, choose types of heroes and give their names...).
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
            // Condition if == false. The program skips the code between lines 20 to 30, and calls useStaticDatas.
        } else {
            useStaticDatas()
        }
        print("Both teams are ready.")
        print("")
        teamsResumeBeforeFight()
        fight()
    }
    
    //
    private func useStaticDatas() {
        // Variables to create 6 characters
        let vizinoob = Character(nameCharacter: "Vizinoob", life: 30, maxLife: 30, weapon: BiggoronSword(), descriptionClassCharacter: "Warrior")
        let buharok = Character(nameCharacter: "Buharok", life: 30, maxLife: 30, weapon: StaffOfAThousandMoons(), descriptionClassCharacter: "Magician")
        let osgoroth = Character(nameCharacter: "Osgoroth", life: 30, maxLife: 30, weapon: SameAxeAsGimli(), descriptionClassCharacter: "Dwarf")
        let murtonn = Character(nameCharacter: "Murtonn", life: 30, maxLife: 30, weapon: ShieldOfAzzinoth(), descriptionClassCharacter: "Colossus")
        let krenshar = Character(nameCharacter: "Krenshar", life: 30, maxLife: 30, weapon: StaffOfAThousandMoons(), descriptionClassCharacter: "Magician")
        let naïreh = Character(nameCharacter: "Naïreh", life: 30, maxLife: 30, weapon: SameAxeAsGimli(), descriptionClassCharacter: "Dwarf")
        // Variables to create 2 teams with name for each
        let firstTeamName = "Maëstrom"
        let secondTeamName = "Nephilïm"
        arrayForTeamName.append(firstTeamName)
        arrayForTeamName.append(secondTeamName)
        // Variables to stock the two new instances of Team
        let team1 = Team(teamName: firstTeamName)
        let team2 = Team(teamName: secondTeamName)
        // The 6 characters are added to team arrays
        team1.arrayForComposingTeam.append(Warrior(nameCharacter: "Vizinoob"))
        team1.arrayForComposingTeam.append(Mage(nameCharacter: "Buharok"))
        team1.arrayForComposingTeam.append(Dwarf(nameCharacter: "Osgoroth"))
        team2.arrayForComposingTeam.append(Colossus(nameCharacter: "Murtonn"))
        team2.arrayForComposingTeam.append(Dwarf(nameCharacter: "Naïreh"))
        team2.arrayForComposingTeam.append(Mage(nameCharacter: "Krenshar"))
        
        arrayTeams.append(team1)
        arrayTeams.append(team2)
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
                    print("Congratulations \(arrayForTeamName[0]), you win the fight in \(round) rounds.")
                    
                } else {
                    
                    print("Team \(self.arrayForTeamName[i]), please choose the hero you gonna play with (from 1 to 3):")
                    let team = self.arrayTeams[i]
                    team.descriptionTeam()
                    
                    // Call of method fightConditions
                    fightConditions(indexOfPlayingTeam: i)
                    
                    // Checks if index0 of arrayTeams is empty. If true, the fight stops; if false, the fight continues
                    if arrayTeams[0].arrayForComposingTeam.isEmpty {
                        print("Congratulations \(arrayForTeamName[1]), you win the fight in \(round) rounds.")
                    }
                }
            }
        }
    }
    
    // Method to select a fighter and a target. It also manages differences between damagers and healers, and removes characters when they die.
    func fightConditions(indexOfPlayingTeam: Int) {
        // Variables for recording the input of user
        let choiceUser = userChoice(dynamicSizeOfArray: arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count)
        let team = self.arrayTeams[indexOfPlayingTeam]
        // Variable to stock the hero who is gonna play
        var myAttacker: Character
        
        // Displays the name of the attacker
        myAttacker = arrayTeams[indexOfPlayingTeam].arrayForComposingTeam[choiceUser - 1]
        print("\(myAttacker.nameCharacter) moves forward...")
        
        // Condition if selected attacker is a magician
        if let magician = myAttacker as? Mage {
            // Checks if the magician is the only survivor of his team
            if arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count == 1 {
                // Calling substitution method to change the magician to a warrior
                substituteMagicianToWarrior(myAttacker: myAttacker, indexOfPlayingTeam: indexOfPlayingTeam)
                // Calling attack method
                callAttackMethod(myAttacker: myAttacker, indexOfPlayingTeam: indexOfPlayingTeam)
            } else {
            print("Please select the hero you gonna heal (from 1 to 3):")
            team.descriptionTeam()
            let inputUser = userChoice(dynamicSizeOfArray: arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count)
            // Choosing healer's target
            magician.heal(target: arrayTeams[indexOfPlayingTeam].arrayForComposingTeam[inputUser - 1])
            }
            // Condition if selected attacker is a damager
        } else if (((myAttacker as? Warrior) != nil) || ((myAttacker as? Dwarf) != nil) || ((myAttacker as? Colossus) != nil)) {
            callAttackMethod(myAttacker: myAttacker, indexOfPlayingTeam: indexOfPlayingTeam)
        }
    }
    
    // Method to sub a magician with a warrior when the magician is alone in his team
    private func substituteMagicianToWarrior(myAttacker: Character, indexOfPlayingTeam: Int) {
        // Temporary variables to stock magician name and life
        let subtituteLife = myAttacker.life
        let subtituteName = myAttacker.nameCharacter
        // Create a new warrior with life and name of the magician
        let warriorSub = Warrior(nameCharacter: subtituteName)
        warriorSub.life = subtituteLife
        myAttacker.weapon.damages = 10
        // Adding the new warrior to team
        arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.append(warriorSub)
        // Remove magician from the team
        arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.remove(at: 0)
        print("ABRACADABRA ! If last hero in the team is a magician, it becomes a warrior.")
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
        let choiceUser = userChoice(dynamicSizeOfArray: enemyTeam.arrayForComposingTeam.count)
        let opponent: Character = enemyTeam.arrayForComposingTeam[choiceUser - 1]
        myAttacker.attack(target: opponent)
        return (choiceUser - 1)
    }
    
    // Methpd to call attack method in fightConditions method
    private func callAttackMethod(myAttacker: Character, indexOfPlayingTeam: Int) {
        // Variable to stock the index of defending team
        let indexOfTargetTeam: Int
        // Switch between both columns of arrayTeams to determine the index of attacking team
        if indexOfPlayingTeam == 0 {
            indexOfTargetTeam = 1
        } else {
            indexOfTargetTeam = 0
        }
        //
        let enemyTeam = arrayTeams[indexOfTargetTeam]
        // Calls the method to choose a target to attack
        let indexOfTargetCharacter = chooseTargetToAttack(enemyTeam: arrayTeams[indexOfTargetTeam], myAttacker: myAttacker, arrayIndex: indexOfPlayingTeam)
        // Calls the method to check if the target is dead
        _ = enemyTeam.isHeroDead(target: arrayTeams[indexOfTargetTeam].arrayForComposingTeam[indexOfTargetCharacter])
    }
    
    private func mysteryChest() {
        print("""
        ------------------
        MYSTERY CHEST
        ------------------
        A chest appears next to the hero. He opens it, and replaces his usual weapon by the new weapon inside...
        """)
        
        
    }
    
    // Method to record inputs of users and decrease the number of code lines in other methods
    private func userChoice(dynamicSizeOfArray: Int) -> Int {
        var choiceUser: Int = 0
        
        repeat {
            // Record user's input
            if let input = readLine() {
                // Unwrap it
                if let intInput = Int(input) {
                    choiceUser = intInput
                    // If the input is not inside a range between 0 and the number of columns in team array, it displays the print in line 229
                    if choiceUser < 1 || choiceUser > dynamicSizeOfArray {
                        print("Please enter a number between 1 and \(dynamicSizeOfArray).")
                    }
                } else {
                    // If the input is not an Int
                    print("Please enter a number.")
                }
            }
            // It loops if the input is superior than the number of columns of team array
        } while choiceUser > dynamicSizeOfArray
        return choiceUser
    }
    
}

