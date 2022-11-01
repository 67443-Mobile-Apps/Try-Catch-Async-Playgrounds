import SwiftUI

// MARK: Starting with Tasks
// Syncronous code running on main actor
print("Starting some work on the main actor")
let sum = (1...10000000).reduce(0, +)
print("Work done: 1 + 2 + 3 ... 100000 = \(sum)")
print("Completed work on the main actor")

// Wrapping this in a task
print("\n================")

Task {
  print("Starting some work on a task")
  let sum = (1...100000).reduce(0, +)
  print("First task done: 1 + 2 + 3 ... 100000 = \(sum)")
}
print("Starting some work on the main actor")


// Tasks run asynchronously on background queue
print("\n================")

Task {
  print("Doing some work on an unnamed task")
  let sum = (1...100000).reduce(0, +)
  print("Unnamed task done: 1 + 2 + 3 ... 100000 = \(sum)")
}
print("Doing some work on the main actor")
print("Doing more work on the main actor")

let task = Task {
  print("Doing some work on a named task")
  let sum = (1...100000).reduce(0, +)
  print("Named task done: 1 + 2 + 3 ... 100000 = \(sum)")
}
print("Doing yet more work on the main actor")


// Checking to see if we are on the main actor
print("\n================")

let specificKey = DispatchSpecificKey<String>()
DispatchQueue.main.setSpecific(key: specificKey, value: "main")
if DispatchQueue.getSpecific(key: specificKey) == "main" {
  print("\nPlayground runs on main actor")
}

// Note that task doesn't run on main actor
Task {
  print("Doing some work on a task")
  if DispatchQueue.getSpecific(key: specificKey) == "main" {
    print("Task runs on main actor")
  } else {
    print("Task doesn't run on main actor")
  }
}


// MARK: Starting into Async
// sleep(_:) blocks thread
print("\n================")
print("sleeping...")
sleep(2)
print("Wake up, Neo...")


//print("\n================")
//
Task {
  print("The Matrix has you...")
  // try Task.sleep(until: .now + .seconds(2), clock: .continuous)
  // need to use await because Task.sleep is async...
  try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
  print("Follow the white rabbit")
}
