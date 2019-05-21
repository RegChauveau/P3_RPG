// Le fichier GameManager regroupe tous morceaux de codes qui permettra d'intéragir avec l'utilisateur
class GameManager {
    
static let maximumCharactersPerTeam = 3

func composingTeam() { // Fonction appelée pour la création des 3 personnages de l'équipe
    var arrayForComposingTeam = [Character]()
    print("Veuillez choisir les 3 soldats qui composeront votre équipe:")
    print("1. Le COMBATTANT / Arme: Epée / Pv: 100 / Pa: 10.")
    print("2. Le NAIN / Arme: Hache / Pv: 80 / Pa: 15.")
    print("3. Le COLOSSE / Arme: Bouclier / Pv: 130 / Pa: 5.")
    print("4. Le MAGE / Arme: Bâton / Pv: 70 / Pa: 8 / Soin: 8")
    
    while arrayForComposingTeam.count < GameManager.maximumCharactersPerTeam {
        if let choiceUser = readLine() {
            switch choiceUser {
            case "1":
                print("Le personnage choisi est un combattant.")
                arrayForComposingTeam.append(Warrior(life: <#Int#>))
            case "2":
                print("Le personnage choisi est un nain.")
                arrayForComposingTeam.append(Dwarf())
            case "3":
                print("Le personnage choisi est un colosse.")
                arrayForComposingTeam.append(Colossus())
            case "4":
                print("Le personnage choisi est un mage.")
                arrayForComposingTeam.append(Mage())
            default:
                print("Votre équipe doit se composer de 3 soldats.")
            }
        }
    }
}

}
