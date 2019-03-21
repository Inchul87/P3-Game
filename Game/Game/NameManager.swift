
class NameManager {
    static private var usedNames = [String]()
    
    static func getName() -> String {
        print("Please enter a name !")
        if let name = readLine() {
            if usedNames.contains(name) {
                print("This name is already taken ! Please enter a new one !")
                return getName()
            } else {
                usedNames.append(name)
                return name
            }
        } else {
            print("Something went wrong ! Please try again !")
            return getName()
        }
    }
}
