    // Le fichier main.swift sert de point d'entrée de l'application.
    
    // Fonction permettant de demander à l'utilisateur d'entrer un nombre entier
    func input() -> Int {
        let strData = readLine();
        
        return Int(strData!)!
    }
    
    var choiceUser1_1: Int // Choix de la classe du personnage 1 du joueur 1
    var choiceUser1_2: Int // Choix de la classe du personnage 2 du joueur 1
    var choiceUser1_3: Int // Choix de la classe du personnage 3 du joueur 1
    var choiceUser2_1: Int // Choix de la classe du personnage 1 du joueur 2
    var choiceUser2_2: Int // Choix de la classe du personnage 2 du joueur 2
    var choiceUser2_3: Int // Choix de la classe du personnage 3 du joueur 2
    var typeCharacter1_1: TypeCharacter! // Classe personnage 1 du joueur 1
    var typeCharacter1_2: TypeCharacter! // Classe personnage 2 du joueur 1
    var typeCharacter1_3: TypeCharacter! // Classe personnage 3 du joueur 1
    var typeCharacter2_1: TypeCharacter! // Classe personnage 1 du joueur 2
    var typeCharacter2_2: TypeCharacter! // Classe personnage 2 du joueur 2
    var typeCharacter2_3: TypeCharacter! // Classe personnage 3 du joueur 2
    var nameCharacter1_1: String! // Nom du personnage 1 du joueur 1
    var nameCharacter1_2: String! // Nom du personnage 2 du joueur 1
    var nameCharacter1_3: String! // Nom du personnage 3 du joueur 1
    var nameCharacter2_1: String! // Nom du personnage 1 du joueur 2
    var nameCharacter2_2: String! // Nom du personnage 2 du joueur 2
    var nameCharacter2_3: String! // Nom du personnage 3 du joueur 2
    //==============================================================================================
    
    // On demande au joueur 1 de choisir la classe de chacun de ses 3 personnages
    // Personnage 1
    repeat {
        print("Joueur 1, veuillez choisir la classe du personnage n°1 (de 1 à 4): ")
        print("1. Combattant: L'attaquant classique. Un bon guerrier !")
        print("2. Mage: Son talent ? Soigner les membres de son équipe.")
        print("3. Colosse: Imposant et très résistant, mais il ne vous fera pas bien mal")
        print("4. Nain: Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.")
        choiceUser1_1 = input()
        
        switch choiceUser1_1 {
        case 1: typeCharacter1_1 = .warrior
        case 2: typeCharacter1_1 = .mage
        case 3: typeCharacter1_1 = .tank
        case 4: typeCharacter1_1 = .dwarf
        default:
            break
        }
        
        // Renseignement du nom
        print("Veuillez maintenant renseigner le nom de votre personnage: ")
        if let nameCharacter1_1 = readLine() {
            if choiceUser1_1 == 1 {
                print("Bonjour \(nameCharacter1_1), le combattant !")
            }
            else if choiceUser1_1 == 2 {
                print("Bonjour \(nameCharacter1_1), le mage !")
            }
            else if choiceUser1_1 == 3 {
                print("Bonjour \(nameCharacter1_1), le colosse !")
            }
            else {
                print("Bonjour \(nameCharacter1_1), le nain !")
            }
        }
    } while choiceUser1_1 != 1 && choiceUser1_1 != 2 && choiceUser1_1 != 3 && choiceUser1_1 != 4
    
    // Personnage 2
    repeat {
        print("Joueur 1, veuillez choisir la classe du personnage n°2 (de 1 à 4): ")
        print("1. Combattant: L'attaquant classique. Un bon guerrier !")
        print("2. Mage: Son talent ? Soigner les membres de son équipe.")
        print("3. Colosse: Imposant et très résistant, mais il ne vous fera pas bien mal")
        print("4. Nain: Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.")
        choiceUser1_2 = input()
        
        switch choiceUser1_2 {
        case 1: typeCharacter1_2 = .warrior
        case 2: typeCharacter1_2 = .mage
        case 3: typeCharacter1_2 = .tank
        case 4: typeCharacter1_2 = .dwarf
        default:
            break
        }
        
        // Renseignement du nom
        print("Veuillez maintenant renseigner le nom de votre personnage: ")
        if let nameCharacter1_2 = readLine() {
            if nameCharacter1_1 == nameCharacter1_2 {
                print("Ce nom est déjà pris.")
                break
            }
            if choiceUser1_2 == 1 {
                print("Bonjour \(nameCharacter1_2), le combattant !")
            }
            else if choiceUser1_2 == 2 {
                print("Bonjour \(nameCharacter1_2), le mage !")
            }
            else if choiceUser1_2 == 3 {
                print("Bonjour \(nameCharacter1_2), le colosse !")
            }
            else {
                print("Bonjour \(nameCharacter1_2), le nain !")
            }
        }
    } while choiceUser1_2 != 1 && choiceUser1_2 != 2 && choiceUser1_2 != 3 && choiceUser1_2 != 4
    
    // Personnage 3
    repeat {
        print("Joueur 1, veuillez choisir la classe du personnage n°3 (de 1 à 4): ")
        print("1. Combattant: L'attaquant classique. Un bon guerrier !")
        print("2. Mage: Son talent ? Soigner les membres de son équipe.")
        print("3. Colosse: Imposant et très résistant, mais il ne vous fera pas bien mal")
        print("4. Nain: Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.")
        choiceUser1_3 = input()
        
        switch choiceUser1_3 {
        case 1: typeCharacter1_3 = .warrior
        case 2: typeCharacter1_3 = .mage
        case 3: typeCharacter1_3 = .tank
        case 4: typeCharacter1_3 = .dwarf
        default:
            break
        }
        
        // Renseignement du nom
        print("Veuillez maintenant renseigner le nom de votre personnage: ")
        if let nameCharacter1_3 = readLine() {
            if nameCharacter1_3 == nameCharacter1_2 || nameCharacter1_3 == nameCharacter1_1 {
                print("Ce nom est déjà pris.")
                break
            }
            if choiceUser1_3 == 1 {
                print("Bonjour \(nameCharacter1_3), le combattant !")
            }
            else if choiceUser1_3 == 2 {
                print("Bonjour \(nameCharacter1_3), le mage !")
            }
            else if choiceUser1_3 == 3 {
                print("Bonjour \(nameCharacter1_3), le colosse !")
            }
            else {
                print("Bonjour \(nameCharacter1_3), le nain !")
            }
        }
    } while choiceUser1_3 != 1 && choiceUser1_3 != 2 && choiceUser1_3 != 3 && choiceUser1_3 != 4
    
    // On demande au joueur 2 de choisir la classe de chacun de ses 3 personnages
    // Personnage 1
    repeat {
        print("Joueur 2, veuillez choisir la classe du personnage n°1 (de 1 à 4): ")
        print("1. Combattant: L'attaquant classique. Un bon guerrier !")
        print("2. Mage: Son talent ? Soigner les membres de son équipe.")
        print("3. Colosse: Imposant et très résistant, mais il ne vous fera pas bien mal")
        print("4. Nain: Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.")
        choiceUser2_1 = input()
        
        switch choiceUser2_1 {
        case 1: typeCharacter2_1 = .warrior
        case 2: typeCharacter2_1 = .mage
        case 3: typeCharacter2_1 = .tank
        case 4: typeCharacter2_1 = .dwarf
        default:
            break
        }
        
        // Renseignement du nom
        print("Veuillez maintenant renseigner le nom de votre personnage: ")
        if let nameCharacter2_1 = readLine() {
            if nameCharacter2_1 == nameCharacter1_1 || nameCharacter2_1 == nameCharacter1_2 || nameCharacter2_1 == nameCharacter1_3 {
                print("Ce nom est déjà pris.")
                break
            }
            if choiceUser2_1 == 1 {
                print("Bonjour \(nameCharacter2_1), le combattant !")
            }
            else if choiceUser2_1 == 2 {
                print("Bonjour \(nameCharacter2_1), le mage !")
            }
            else if choiceUser2_1 == 3 {
                print("Bonjour \(nameCharacter2_1), le colosse !")
            }
            else {
                print("Bonjour \(nameCharacter2_1), le nain !")
            }
        }
    } while choiceUser2_1 != 1 && choiceUser2_1 != 2 && choiceUser2_1 != 3 && choiceUser2_1 != 4
    
    // Personnage 2
    repeat {
        print("Joueur 2, veuillez choisir la classe du personnage n°2 (de 1 à 4): ")
        print("1. Combattant: L'attaquant classique. Un bon guerrier !")
        print("2. Mage: Son talent ? Soigner les membres de son équipe.")
        print("3. Colosse: Imposant et très résistant, mais il ne vous fera pas bien mal")
        print("4. Nain: Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.")
        choiceUser2_2 = input()
        
        switch choiceUser2_2 {
        case 1: typeCharacter2_2 = .warrior
        case 2: typeCharacter2_2 = .mage
        case 3: typeCharacter2_2 = .tank
        case 4: typeCharacter2_2 = .dwarf
        default:
            break
        }
        
        // Renseignement du nom
        print("Veuillez maintenant renseigner le nom de votre personnage: ")
        if let nameCharacter2_2 = readLine() {
            if nameCharacter2_2 == nameCharacter1_1 || nameCharacter2_2 == nameCharacter1_2 || nameCharacter2_2 == nameCharacter1_3 || nameCharacter2_2 == nameCharacter2_1 {
                print("Ce nom est déjà pris.")
                break
            }
            if choiceUser2_2 == 1 {
                print("Bonjour \(nameCharacter2_2), le combattant !")
            }
            else if choiceUser2_2 == 2 {
                print("Bonjour \(nameCharacter2_2), le mage !")
            }
            else if choiceUser2_2 == 3 {
                print("Bonjour \(nameCharacter2_2), le colosse !")
            }
            else {
                print("Bonjour \(nameCharacter2_2), le nain !")
            }
        }
    } while choiceUser2_2 != 1 && choiceUser2_2 != 2 && choiceUser2_2 != 3 && choiceUser2_2 != 4
    
    // Personnage 3
    repeat {
        print("Joueur 2, veuillez choisir la classe du personnage n°3 (de 1 à 4): ")
        print("1. Combattant: L'attaquant classique. Un bon guerrier !")
        print("2. Mage: Son talent ? Soigner les membres de son équipe.")
        print("3. Colosse: Imposant et très résistant, mais il ne vous fera pas bien mal")
        print("4. Nain: Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.")
        choiceUser2_3 = input()
        
        switch choiceUser2_3 {
        case 1: typeCharacter2_3 = .warrior
        case 2: typeCharacter2_3 = .mage
        case 3: typeCharacter2_3 = .tank
        case 4: typeCharacter2_3 = .dwarf
        default:
            break
        }
        
        // Renseignement du nom
        print("Veuillez maintenant renseigner le nom de votre personnage: ")
        if let nameCharacter2_3 = readLine() {
            if nameCharacter2_3 == nameCharacter1_1 || nameCharacter2_3 == nameCharacter1_2 || nameCharacter2_3 == nameCharacter1_3 || nameCharacter2_3 == nameCharacter2_1 || nameCharacter2_3 == nameCharacter2_2 {
                print("Ce nom est déjà pris.")
                break
            }
            if choiceUser2_3 == 1 {
                print("Bonjour \(nameCharacter2_3), le combattant !")
            }
            else if choiceUser2_3 == 2 {
                print("Bonjour \(nameCharacter2_3), le mage !")
            }
            else if choiceUser2_3 == 3 {
                print("Bonjour \(nameCharacter2_3), le colosse !")
            }
            else {
                print("Bonjour \(nameCharacter2_3), le nain !")
            }
        }
    } while choiceUser2_3 != 1 && choiceUser2_3 != 2 && choiceUser2_3 != 3 && choiceUser2_3 != 4
    
    // -----------------------------------------------------------------------------------------
    // Module pour s'assurer de l'unicité des noms de personnage
    if nameCharacter1_1 == nameCharacter1_2 || nameCharacter1_1 == nameCharacter1_3 || nameCharacter1_1 == nameCharacter2_1 || nameCharacter1_1 == nameCharacter2_2 || nameCharacter1_1 == nameCharacter2_3 || nameCharacter1_2 == nameCharacter1_3 || nameCharacter1_2 == nameCharacter2_1 || nameCharacter1_2 == nameCharacter2_2 || nameCharacter1_2 == nameCharacter2_3 || nameCharacter1_3 == nameCharacter2_1 ||
        nameCharacter1_3 == nameCharacter2_2 || nameCharacter1_3 == nameCharacter2_3 ||
        nameCharacter2_1 == nameCharacter2_2 || nameCharacter2_1 == nameCharacter2_3 ||
        nameCharacter2_2 == nameCharacter2_3 {
        print("Ce nom est déjà pris.")
    }
    // -----------------------------------------------------------------------------------------

