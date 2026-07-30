# ArchitectureTests

Tests about the shape of the codebase rather than its behaviour. They live in an
Xcode target rather than inside a package because they assert things *across* all
six packages, and no single package is entitled to see its siblings.

Run them with:

```bash
xcodebuild test -project BlueBreak.xcodeproj -scheme BlueBreak -destination 'platform=macOS'
```
