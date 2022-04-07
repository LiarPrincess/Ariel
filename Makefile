# cSpell:ignore workdir xcodeproj xcodebuild Xfrontend

.PHONY: all
all: build

# ==================
# == Usual things ==
# ==================

.PHONY: build run test clean

build:
	swift build

run:
	swift run Ariel

test:
	swift test

clean:
	swift package clean

# =================
# == Lint/format ==
# =================

.PHONY: lint format spell

# If you are using any other reporter than 'emoji' then you are doing it wrong...
lint:
	SwiftLint lint --reporter emoji

format:
	SwiftFormat --config ./.swiftformat "./Sources" "./Tests"

# cSpell is our spell checker
# See: https://github.com/streetsidesoftware/cspell/tree/master/packages/cspell
spell:
	cspell --no-progress --relative --config "./.cspell.json" \
		"./Sources/**" \
		"./Tests/**" \
		"./Code of Conduct.md" \
		"./LICENSE" \
		"./Makefile" \
		"./Package.swift" \
		"./README.md"

# ===========
# == Xcode ==
# ===========

.PHONY: xcode

xcode:
	swift package generate-xcodeproj
	@echo ''
	@echo 'Remember to add SwiftLint build phase!'
	@echo 'See: https://github.com/realm/SwiftLint#xcode'
