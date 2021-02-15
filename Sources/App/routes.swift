import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "Server works"
    }
    
    app.get(":keyCode") { req -> String in
        let code = req.parameters.get("keyCode")!
        if let keyCode: UInt16 = UInt16(code) {
            KeyboardController().pressKey(keyCode: keyCode, modificatorKeyCode: 0)
            return "Key code = \(keyCode)"
        } else {
            return "Error. No valid key code in request"
        }
    }
        
    app.get("combination", ":modificator", ":key") { req -> String in
        if let modificatorCode = UInt16(req.parameters.get("modificator")!), let keyCode = UInt16(req.parameters.get("key")!) {
            KeyboardController().pressKey(keyCode: keyCode, modificatorKeyCode: modificatorCode)
            return "OK"
        } else {
            return "Error. No valid key codes combination in request"
        }
    }
}
