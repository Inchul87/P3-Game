class Warrior: Characters {
    init(name: String) {
        super.init(charactersName: name, healthPoints: 100, weapon: sword, type: "Warrior")
    }
}

var warrior = Warrior(name: "")
