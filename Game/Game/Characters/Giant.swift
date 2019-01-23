class Giant: Characters {
    init(name: String) {
        super.init(charactersName: name, healthPoints: 80, weapon: hammer, type: "Giant")
    }
}

var giant = Giant(name: "")
