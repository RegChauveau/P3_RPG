// gameManager is the main class of the program, managing the fight process, switching between static and dynamic datas, calling the random weapon.
class GameManager {
    // Array stocking team names
    var arrayForTeamName = [String]()
    // VArray stocking both team names and characters for both teams
    var arrayTeams = [Team]()
    // Array stocking characters for both teams
    var arrayForComposingTeam = [Character]()
    // Property managing switch to avoid or not first part of the program. If true, the user has ton give names to his team and choose characters types and names. If false, the program uses already existing arrays to facilitate tests.
    var askUserForData = false
    
    // It launches the game, manages the composition of teams and the fight and shows the winner
    func gameLauncher() {
        print("Welcome to Virtual Fighting of WarcraftLike of the Killing Death.")
        print("")
        introductionToGame()
        // If condition is true : users have to execute the entire program (they have to give teams their names, choose types of heroes and give their names...).
        if askUserForData == true {
            for _ in 1..<3 {
                // User choose a name for his team
                let teamName = chooseTeamName()
                // New instance of Team
                let newTeam = Team(teamName: teamName)
                // Choosing type/name for each of the 3 characters for both team
                newTeam.composingTeam()
                // Stocks the new instance in an array
                self.arrayTeams.append(newTeam)
                print("\(newTeam.teamName) is now complete.")
            }
            // If condition is false : the program uses static datas to save time for tests
        } else {
            useStaticDatas()
        }
        print("Both teams are ready.")
        print("")
        teamsResume()
        fight()
    }
    
    // Method thats permits the program to use static datas to save time during the tests
    private func useStaticDatas() {
        // Properties to create 2 teams with name for each
        let firstTeamName = "Maëstrom"
        let secondTeamName = "Nephilïm"
        arrayForTeamName.append(firstTeamName)
        arrayForTeamName.append(secondTeamName)
        // Properties to stock the instances of Team
        let firstTeam = Team(teamName: firstTeamName)
        let secondTeam = Team(teamName: secondTeamName)
        // The 6 characters are added to team arrays
        firstTeam.arrayForComposingTeam.append(Warrior(nameCharacter: "Vizinoob"));
        firstTeam.arrayForComposingTeam.append(Mage(nameCharacter: "Buharok"));
        firstTeam.arrayForComposingTeam.append(Dwarf(nameCharacter: "Osgoroth"));
        secondTeam.arrayForComposingTeam.append(Colossus(nameCharacter: "Murtonn"));
        secondTeam.arrayForComposingTeam.append(Mage(nameCharacter: "Krenshar"));
        secondTeam.arrayForComposingTeam.append(Dwarf(nameCharacter: "Naïreh"));
        
        arrayTeams.append(firstTeam);
        arrayTeams.append(secondTeam)
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
    private func teamsResume() {
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
        // Property for recording how many turns the fight lasts
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
                
                // Checks if index1 of arrayTeams is empty. If true the fight stops, if false the fight continues
                if arrayTeams[1].arrayForComposingTeam.isEmpty {
                    print("Congratulations \(arrayForTeamName[0]), you win the fight in \(round) rounds.")
                    
                } else {
                    
                    print("Team \(self.arrayForTeamName[i]), please choose the hero you gonna play with (from 1 to 3):")
                    let team = self.arrayTeams[i]
                    team.descriptionTeam()
                    
                    fightConditions(indexOfPlayingTeam: i)
                    
                    // Checks if index0 of arrayTeams is empty. If true the fight stops, if false the fight continues
                    if arrayTeams[0].arrayForComposingTeam.isEmpty {
                        print("Congratulations \(arrayForTeamName[1]), you win the fight in \(round) rounds.")
                    }
                }
            }
        }
    }
    
    // Method to select a fighter and a target. It also manages differences between actions of damagers and healers
    private func fightConditions(indexOfPlayingTeam: Int) {
        // Property for recording the input of user using UserChoice()
        let choiceUser = userChoice(dynamicSizeOfArray: arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count)
        let team = self.arrayTeams[indexOfPlayingTeam]
        // Property to stock the hero who is gonna play
        var myAttacker: Character
        
        // Displays the name of the attacker
        myAttacker = arrayTeams[indexOfPlayingTeam].arrayForComposingTeam[choiceUser - 1]
        print("\(myAttacker.nameCharacter) moves forward...")
        
        occurrenceOfMysteryChest(myAttacker: myAttacker)
        
        // Condition if myAttacker is a magician
        if let magician = myAttacker as? Mage {
            // Checks if the magician is the only survivor of his team
            if arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count == 1 {
                substituteMagicianToWarrior(myAttacker: myAttacker, indexOfPlayingTeam: indexOfPlayingTeam)
                damagersAttacks(myAttacker: myAttacker, indexOfPlayingTeam: indexOfPlayingTeam)
            } else {
                print("Please select the hero you gonna heal (from 1 to 3):")
                team.descriptionTeam()
                // User chooses healer's target
                let inputUser = userChoice(dynamicSizeOfArray: arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.count)
                magician.heal(target: arrayTeams[indexOfPlayingTeam].arrayForComposingTeam[inputUser - 1])
            }
            // Condition if myAttacker is a damager
        } else if (((myAttacker as? Warrior) != nil) || ((myAttacker as? Dwarf) != nil) || ((myAttacker as? Colossus) != nil)) {
            damagersAttacks(myAttacker: myAttacker, indexOfPlayingTeam: indexOfPlayingTeam)
        }
    }
    
    // Method to sub a magician with a warrior when the magician is alone in his team
    private func substituteMagicianToWarrior(myAttacker: Character, indexOfPlayingTeam: Int) {
        // Temporary propperties to stock magician name and life
        let subtituteLife = myAttacker.life
        let subtituteName = myAttacker.nameCharacter
        // Create a new instance of warrior with life and name of the magician
        let warriorSub = Warrior(nameCharacter: subtituteName)
        // Add magician life to the new warrior
        warriorSub.life = subtituteLife
        // Change magician weapon damages to warrior weapon damages
        myAttacker.weapon.damages = 10
        // Adding the new warrior to the team
        arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.append(warriorSub)
        // Remove magician from the team
        arrayTeams[indexOfPlayingTeam].arrayForComposingTeam.remove(at: 0)
        print("ABRACADABRA ! If last hero in the team is a magician, it becomes a warrior.")
    }
    
    // It records team names and check if they are single or not
    private func chooseTeamName() -> String {
        var teamName: String = ""
        // Bool property to check if chosen team name is unic or not
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
                } else {
                    isNameChosen = true
                    // Add new team name to array
                    self.arrayForTeamName.append(teamName)
                    // Message if all the process is good
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
        // Asks user to choose a hero in enemy team
        let choiceUser = userChoice(dynamicSizeOfArray: enemyTeam.arrayForComposingTeam.count)
        let opponent: Character = enemyTeam.arrayForComposingTeam[choiceUser - 1]
        myAttacker.attack(target: opponent, character: myAttacker)
        return (choiceUser - 1)
    }
    
    // Method to call attack method in fightConditions method
    private func damagersAttacks(myAttacker: Character, indexOfPlayingTeam: Int) {
        // Property to stock the index of defending team
        let indexOfTargetTeam: Int
        // Switch between both columns of arrayTeams to determine the index of attacking team
        if indexOfPlayingTeam == 0 {
            indexOfTargetTeam = 1
        } else {
            indexOfTargetTeam = 0
        }
        // Property to know which is going to be attacked
        let enemyTeam = arrayTeams[indexOfTargetTeam]
        let indexOfTargetCharacter = chooseTargetToAttack(enemyTeam: arrayTeams[indexOfTargetTeam], myAttacker: myAttacker, arrayIndex: indexOfPlayingTeam)
        _ = enemyTeam.isHeroDead(target: arrayTeams[indexOfTargetTeam].arrayForComposingTeam[indexOfTargetCharacter])
    }
    
    // Method that calls changeWeapon method, permits appearance of a new weapon and manages differences between healer and damagers prints
    private func mysteryChest(character: Character) {
        print("""
        ------------------
        MYSTERY CHEST
        ------------------
        A chest appears next to the hero. He opens it, and switches his usual weapon with the new weapon inside...
        """)
        // Property to stock which kind of weapon is gonna appear
        let newWeapon = character.changeWeapon(character: character)
        // Switch character's usual weapon with new weapon
        character.weapon = newWeapon
        // Condition if selected hero is a mage
        if ((character as? Mage) != nil) {
            if newWeapon.weaponName == "Unlucky Mass" {
                print("\(character.nameCharacter) collects <<\(newWeapon.weaponName)>> and now has capacity to heal 15 life points.")
                newWeapon.damages = 15
            } else {
                print("\(character.nameCharacter) collects <<\(newWeapon.weaponName)>> and now has capacity to heal \(newWeapon.damages) life points.")
            }
            // Condition if selected hero is a damager
        } else {
            if newWeapon.weaponName == "Unlucky Mass" {
                print("\(character.nameCharacter) collects <<\(newWeapon.weaponName)>> and now gives back 15 life points to his enemy !")
            } else {
                print("\(character.nameCharacter) collects <<\(newWeapon.weaponName)>> and now causes \(newWeapon.damages) damages.")
            }
        }
    }
    
    // Method that manages the roll of dices for the random occurrence of the chest
    private func occurrenceOfMysteryChest(myAttacker: Character) {
        // Property for the roll of dices twice a round
        let randomChest = Int.random(in: 0...100)
        print("Roll of the dice: \(randomChest)")
        // Nearly 33% chances for the chest to occurre each time a hero is gonna play
        if randomChest >= 66 {
            mysteryChest(character: myAttacker)
        }
    }
    
    // Method to record inputs of users and decrease the number of code lines in other methods
    func userChoice(dynamicSizeOfArray: Int) -> Int {
        var choiceUser: Int = 0
        
        repeat {
            // Record user's input
            if let input = readLine() {
                // Unwrap it
                if let intInput = Int(input) {
                    choiceUser = intInput
                    // If the input is 0
                    if choiceUser == 0 {
                        print("Please enter a number between 1 and \(dynamicSizeOfArray).")
                        choiceUser = 4
                    }
                        // If the input is not inside a range between 1 and the number of columns in team array, it displays the print in line 229
                    else if choiceUser < 1 || choiceUser > dynamicSizeOfArray {
                        print("Please enter a number between 1 and \(dynamicSizeOfArray).")
                    }
                } else {
                    // If the input is not an Int
                    print("Please enter a number.")
                    choiceUser = 4
                }
            }
            // It loops if the input is superior than the number of columns of team array
        } while choiceUser > dynamicSizeOfArray
        return choiceUser
    }
    
}
