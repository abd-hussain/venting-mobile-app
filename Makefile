# Prefer project Flutter via FVM when available.
FLUTTER := $(shell command -v fvm >/dev/null 2>&1 && echo "fvm flutter" || echo "flutter")

# Branch / CI can override these. Defaults = production.
FLAVOR ?= prod
ENTRYPOINT ?= lib/main_prod.dart
DART_DEFINE_FILE ?= .env/config.prod.json
PACKAGE_NAME ?= com.vent.ventingMobileApp
AAB_PATH ?= build/app/outputs/bundle/prodRelease/app-prod-release.aab

BUILD_ARGS := --flavor $(FLAVOR) -t $(ENTRYPOINT) --dart-define-from-file=$(DART_DEFINE_FILE)

deploy-android:
	@echo "╠ Flavor=$(FLAVOR) entrypoint=$(ENTRYPOINT)"
	@echo "╠ Package=$(PACKAGE_NAME)"
	@echo "╠ Updating build number with current date (unified format)..."
	./scripts/update_build_date.sh
	@echo "╠ Building AAB with Flutter ($(FLAVOR) release)..."
	$(FLUTTER) build appbundle --release $(BUILD_ARGS)
	@echo "╠ Sending Android Build to Closed Testing (alpha / draft)..."
	cd android && bundle install
	@echo "╠ bundle installed"
	cd android/fastlane && \
		PACKAGE_NAME="$(PACKAGE_NAME)" \
		AAB_PATH="$(AAB_PATH)" \
		FLAVOR="$(FLAVOR)" \
		bundle exec fastlane deploy
	@echo "╠ FINISHED ╠"

deploy-ios:
	@echo "╠ Updating build number with current date (unified format)..."
	./scripts/update_build_date.sh
	@echo "╠ Sending iOS Build to TestFlight..."
	cd ios/fastlane && bundle update cocoapods
	@echo "╠ cocoapods updated"
	cd ios/fastlane && bundle install
	@echo "╠ bundle installed"
	cd ios/fastlane && bundle exec fastlane deploy
	@echo "╠ FINISHED ╠"

update-build-date:
	@echo "╠ Updating build number with current date (unified format)..."
	./scripts/update_build_date.sh
	@echo "╠ Build number updated ╠"

deploy: deploy-android deploy-ios

.PHONY: deploy-android deploy-ios update-build-date deploy
