import PlaygroundSupport

func getLength(_ word: String?) -> Int {
    
    guard let word else { return 0 }
    
    return word.count
}

print(getLength(nil))
print(getLength("test"))
