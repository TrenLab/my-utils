# Install Tasks

export HOMEBREW_NO_AUTO_UPDATE = 1

install-carthage:
	brew remove carthage --force || true
	brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/99f1f4fb87bfd047c7ccd43e58b46b8e44b63167/Formula/carthage.rb

install-%:
	true

install-cocoapods:
	sudo gem install cocoapods

# Run Tasks

test-iOS:
	xcodebuild \
	-project MYUtils.xcodeproj \
	-scheme MYUtils-iOS \
	-configuration Release \
	-destination "name=iPhone 7,OS=10.1"

test-macOS:
	xcodebuild \
	-project MYUtils.xcodeproj \
	-scheme MYUtils-macOS \
	-configuration Release

test-tvOS:
	xcodebuild \
	-project MYUtils.xcodeproj \
	-scheme MYUtils-tvOS \
	-configuration Release \
	-destination "platform=tvOS Simulator,name=Apple TV 1080p"

test-carthage:
	carthage build \
	--no-skip-current \
	--configuration Release \
	--verbose \
	ls Carthage/build/Mac/MYUtils.framework
	ls Carthage/build/iOS/MYUtils.framework
	ls Carthage/build/tvOS/MYUtils.framework
	ls Carthage/build/watchOS/MYUtils.framework

test-cocoapods:
	- pod lib lint --quick
