    // Le fichier main.swift sert de point d'entrée de l'application.
    
    // Fonction permettant de demander à l'utilisateur d'entrer un nombre entier
    func input() -> Int {
        let strData = readLine();
        
        return Int(strData!)!
    }
    

// créer une instance de la classe GameManager
//  afficher les règles du jeu
// appeler func printRules pour afficher les règles du jeu (qui sera dans GameManager)
