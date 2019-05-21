// Class for creating team names and to check if team names are different.

import Foundation

class CheckTeamNames {
    var arrayForTeamName = [String]()
    
func chooseTeamName() -> String {
    var teamName: String = ""

    repeat {
        print("Please choose a name for your team :")
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
    }
}
