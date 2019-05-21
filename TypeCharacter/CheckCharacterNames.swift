// Class for creating names for each character and for checking if hero names are different.

import Foundation

class CheckCharacterNames {
    var arrayforCharacterName = [String]()
    
    func chooseCharacterName() -> String {
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
}
