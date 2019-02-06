class Warrior: Characters {
    init(name: String) {
        super.init(charactersName: name, healthPoints: 100, maxHealthPoints: 100, weapon: Sword(), type: "Warrior")
    }
}
