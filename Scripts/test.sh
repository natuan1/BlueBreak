#!/usr/bin/env bash
#
# Builds Debug and runs every test suite in the repository. Used unchanged by CI
# so a green local run means a green CI run.
#
# Warnings are errors, enforced here rather than in the checked-in build settings
# so that an in-progress local build stays workable. Xcode compiles local package
# targets with -suppress-warnings, which conflicts with -warnings-as-errors, hence
# the SWIFT_SUPPRESS_WARNINGS=NO override.

set -euo pipefail

cd "$(dirname "$0")/.."

PACKAGES=(
	BlueBreakDomain
	BlueBreakApplication
	BlueBreakPlatformMac
	BlueBreakPersistence
	BlueBreakDesignSystem
	BlueBreakFeatures
)

for package in "${PACKAGES[@]}"; do
	echo "==> Packages/$package"
	swift test --package-path "Packages/$package" -Xswiftc -warnings-as-errors
done

echo "==> BlueBreak.app and ArchitectureTests"
xcodebuild test \
	-project BlueBreak.xcodeproj \
	-scheme BlueBreak \
	-configuration Debug \
	-destination 'platform=macOS' \
	-derivedDataPath .build/DerivedData \
	SWIFT_SUPPRESS_WARNINGS=NO \
	SWIFT_TREAT_WARNINGS_AS_ERRORS=YES \
	GCC_TREAT_WARNINGS_AS_ERRORS=YES
