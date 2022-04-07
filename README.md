# Ariel

Ariel is a tiny executable that prints module interface (all of the `open`/`public` declarations). Examples are in the `Example output` directory.

This module was once a part of [Violet - Python VM written in Swift](https://github.com/LiarPrincess/Violet), but due to Xcode version dependency it was moved to separate repository.

> Important!
>
> Under the hood Ariel uses [apple/swift-syntax](https://github.com/apple/swift-syntax).
>
> Due to how `swift-syntax` works, we have to pin the specific Xcode version in our `Package.swift`. If you get compilation errors then compare your Xcode version with the one provided in `Package.swift`.

## Usage

```
OVERVIEW: Tool to dump module interface (all of the 'public' and 'open'
declarations).

USAGE: arguments [--verbose] [--min-access-level <access-level>] [--output-path <path>] <input-path>

ARGUMENTS:
  <input-path>            Path to a single Swift file or to a directory that
                          contains such files (recursive).

OPTIONS:
  --verbose               Print additional messages.
  --min-access-level <access-level>
                          Minimum access level needed for the declaration to be
                          visible in the output. Note that the declaration may
                          be visible anyway, if one of the nested declarations
                          is visible. (default: public)
  --output-path <path>    Path at which the generated file will be written
                          (default: standard output). If the value represents a
                          path to a file then the output will be written to
                          this file. If the value represents a directory then
                          new file will be created in this directory (name of
                          the file depends on the input name).
  --version               Show the version.
  -h, --help              Show help information.
```





## Code style

- 2-space indents and no tabs at all
- 80 characters per line
    - You will get a [SwiftLint](https://github.com/realm/SwiftLint) warning if you go over 100.
    - Over 120 will result in a compilation error.
    - If 80 doesn't give you enough room to code, your code is too complicated - consider using subroutines (advice from [PEP-7](https://www.python.org/dev/peps/pep-0007/)).
- Required `self` in methods and computed properties
    - All of the other method arguments are named, so we will require it for this one.
    - `Self`/`type name` for static methods is recommended, but not required.
    - I’m sure that they will depreciate the implicit `self` in the next major Swift version 🤞. All of that source breakage is completely justified.
- No whitespace at the end of the line
    - Some editors may remove it as a matter of routine and we don’t want weird git diffs.
- (pet peeve) Try to introduce a named variable for every `if` condition.
    - You can use a single logical operator - something like `if !isPrincess` or `if isDisnepCharacter && isPrincess` is allowed.
    - Do not use `&&` and `||` in the same expression, create a variable for one of them.
    - If you need parenthesis then it is already too complicated.

Anyway, just use [SwiftLint](https://github.com/realm/SwiftLint) and [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) with provided presets (see [.swiftlint.yml](.swiftlint.yml) and [.swiftformat](.swiftformat) files).

## License

Ariel is licensed under the MIT License.
See [LICENSE](LICENSE) file for more information.
