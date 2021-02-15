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
        
    app.get("combination", ":modificator", ":key") { req -> String in
        if let modificatorCode = UInt16(req.parameters.get("modificator")!), let keyCode = UInt16(req.parameters.get("key")!) {
            KeyboardController().keyboardDoubleCombination(pressedKey: keyCode, modificatorKey: modificatorCode)
            return "Keys combination: \(modificatorCode) + \(keyCode)"
        } else {
            return "No key code in req"
        }
    }
}
