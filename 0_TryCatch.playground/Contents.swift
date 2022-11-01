import Foundation


//let contents: Data?
//do {
//  let someURL = URL(string: "cmuis.net")
//  contents = try Data(contentsOf: someURL!)
//}
//catch {
//  contents = nil
//}

// ===========

//func encrypt(_ str: String, withPassword password: String) -> String {
//    // complicated encryption goes here
//    let encrypted = password + str + password
//    return String(encrypted.reversed())
//}
//
//let encrypted = encrypt("secret", withPassword: "12345")
//print(encrypted)

// ===========

//func encrypt(_ str: String, withPassword password: String) throws -> String {
//    // complicated encryption goes here
//    let encrypted = password + str + password
//    return String(encrypted.reversed())
//}
//
//do {
//  let encrypted = try encrypt("secret", withPassword: "12345")
//  print(encrypted)
//}
//catch {
//  print("Something went wrong!")
//}

// ===========

enum EncryptionError: Error {
  case empty
  case short
}

func encrypt(_ str: String, withPassword password: String) throws -> String {
  guard password.count > 0 else { throw EncryptionError.empty }
  guard password.count >= 5 else { throw EncryptionError.short }

  // complicated encryption goes here
  let encrypted = password + str + password
  return String(encrypted.reversed())
}

do {
  let encrypted = try encrypt("secret", withPassword: "12345")
  print("Encrypted value: \(encrypted)")
}
catch EncryptionError.empty {
  print("You must provide a password .")
}
catch EncryptionError.short {
  print("Passwords must be at least five characters, preferably eight or more.")
}
catch {
  print("Something went wrong!")
}


