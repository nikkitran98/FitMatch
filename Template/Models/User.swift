import SceneKit

struct User {
    let id: String
    let email: String
    let username: String
    let models: [SCNScene]
    
    init(id: String, email: String, username: String, models: [SCNScene]) {
        self.id = id
        self.email = email
        self.username = username
        self.models = models
    }
}
