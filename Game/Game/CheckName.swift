class CheckName {
    var characterName: [String] = []
    
    func nameCharacter() -> String {
        var nameChoice = ""
        repeat {
            print("Please enter a name for your character !")
            if let answer = readLine() {
                nameChoice = answer
                if characterName.contains(nameChoice) {
                    print("")
                    print("\(nameChoice)' has been used ! Please enter a new one !")
                    nameChoice = ""
                } else {
                    characterName.append(nameChoice)
                    print("Got it, thanks !")
                }
            }
        } while nameChoice == ""
        return nameChoice
    }
}
