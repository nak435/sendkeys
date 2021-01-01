import Foundation

public class KeyPressCommandMatcher: CommandMatcher {
    public init() {
        super.init(try! NSRegularExpression(pattern: "\\<[ck]:(.|[\\w]+)(:([,\\w⌘^⌥⇧]+))?\\>"))
    }

    override public func createCommand(_ arguments: [String?]) -> Command {
        var args = [arguments[1]!]
        if arguments[3] != nil {
            args.append(arguments[3]!)
        }
        return Command(.keyPress, args)
    }
}
