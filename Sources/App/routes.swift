import Vapor


func routes(_ app: Application) throws {
    app.get { req in
        return "Server works"
    }

        
    app.get(":keyCode") { req -> String in
        let code = req.parameters.get("keyCode")!
        if let keyCode: UInt16 = UInt16(code) {
            KeyboardController().pressKey(keyCode: keyCode)
            return "Key code = \(keyCode)"
        } else {
            return "No key code in req"
        }
        
    }
}
