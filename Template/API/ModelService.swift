import SceneKit

func getModels() -> [SCNScene] {
    var models = [SCNScene]()
    
    guard let scene1 = SCNScene(named: "robot.usdz") else { return models }
    guard let scene2 = SCNScene(named: "pancakes.usdz") else { return models }
    guard let scene3 = SCNScene(named: "biplane.usdz") else { return models }
    guard let scene4 = SCNScene(named: "drummer.usdz") else { return models }
    guard let scene5 = SCNScene(named: "tv.usdz") else { return models }
    guard let scene6 = SCNScene(named: "guitar.usdz") else { return models }
    guard let scene7 = SCNScene(named: "gramophone.usdz") else { return models }
    
    models.append(scene1)
    models.append(scene2)
    models.append(scene3)
    models.append(scene4)
    models.append(scene5)
    models.append(scene6)
    models.append(scene7)
    
    return models
}
