# SNAPSHOT DEL PROYECTO OFVE
Generado: Tue Nov  3 03:37:45 UTC 2026

## 📂 ESTRUCTURA DE CARPETAS
```
.
├── OFVE_PROJECT_SNAPSHOT.md
├── README.md
├── analysis_options.yaml
├── assets
│   └── icons
│       ├── bolsas.webp
│       ├── brujula.webp
│       ├── corona.webp
│       ├── cupones.webp
│       ├── ganancias.webp
│       ├── inventario.webp
│       ├── metricas.webp
│       ├── microfono.webp
│       ├── oferta.webp
│       ├── planifica.webp
│       ├── pools.webp
│       ├── regalo.webp
│       ├── reseña.webp
│       ├── robot-ia.webp
│       └── robot.webp
├── dump_ofve.sh
├── flutter
│   ├── AUTHORS
│   ├── CHANGELOG.md
│   ├── CODEOWNERS
│   ├── CODE_OF_CONDUCT.md
│   ├── CONTRIBUTING.md
│   ├── DEPS
│   ├── LICENSE
│   ├── PATENT_GRANT
│   ├── README.md
│   ├── TESTOWNERS
│   ├── agent-artifacts
│   │   └── README.md
│   ├── analysis_options.yaml
│   ├── bin
│   │   ├── cache
│   │   │   ├── LICENSE.dart_sdk_archive.md
│   │   │   ├── artifacts
│   │   │   ├── dart-sdk
│   │   │   ├── downloads
│   │   │   ├── engine-dart-sdk.stamp
│   │   │   ├── engine.realm
│   │   │   ├── engine.stamp
│   │   │   ├── engine_stamp.json
│   │   │   ├── engine_stamp.stamp
│   │   │   ├── flutter.version.json
│   │   │   ├── flutter_sdk.stamp
│   │   │   ├── flutter_tools.snapshot
│   │   │   ├── flutter_tools.stamp
│   │   │   ├── flutter_web_sdk
│   │   │   ├── flutter_web_sdk.stamp
│   │   │   ├── font-subset.stamp
│   │   │   ├── gradle_wrapper.stamp
│   │   │   ├── ios-deploy.stamp
│   │   │   ├── libimobiledevice.stamp
│   │   │   ├── libimobiledeviceglue.stamp
│   │   │   ├── libplist.stamp
│   │   │   ├── libusbmuxd.stamp
│   │   │   ├── linux-sdk.stamp
│   │   │   ├── lockfile
│   │   │   ├── material_fonts.stamp
│   │   │   ├── openssl.stamp
│   │   │   └── pkg
│   │   ├── dart
│   │   ├── dart.bat
│   │   ├── flutter
│   │   ├── flutter-dev
│   │   ├── flutter-dev.bat
│   │   ├── flutter.bat
│   │   └── internal
│   │       ├── README.md
│   │       ├── canvaskit.version
│   │       ├── content_aware_hash.ps1
│   │       ├── content_aware_hash.sh
│   │       ├── engine.version
│   │       ├── exit_with_errorlevel.bat
│   │       ├── flutter_packages.version
│   │       ├── fuchsia-linux.version
│   │       ├── gradle_wrapper.version
│   │       ├── ios-deploy.version
│   │       ├── last_engine_commit.ps1
│   │       ├── last_engine_commit.sh
│   │       ├── libimobiledevice.version
│   │       ├── libimobiledeviceglue.version
│   │       ├── libplist.version
│   │       ├── libusbmuxd.version
│   │       ├── libzip.version
│   │       ├── material_fonts.version
│   │       ├── openssl.version
│   │       ├── release-candidate-branch.version
│   │       ├── shared.bat
│   │       ├── shared.sh
│   │       ├── update_dart_sdk.ps1
│   │       ├── update_dart_sdk.sh
│   │       ├── update_engine_version.ps1
│   │       └── update_engine_version.sh
│   ├── buildtools
│   │   └── README.md
│   ├── dartdoc_options.yaml
│   ├── dev
│   │   ├── README.md
│   │   ├── a11y_assessments
│   │   │   ├── GEMINI.md
│   │   │   ├── README.md
│   │   │   ├── analysis_options.yaml
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   ├── analysis_options.yaml
│   │   ├── automated_tests
│   │   │   ├── README.md
│   │   │   ├── flutter_test
│   │   │   ├── icon
│   │   │   ├── integration_test
│   │   │   ├── pubspec.yaml
│   │   │   └── test_smoke_test
│   │   ├── benchmarks
│   │   │   ├── README.md
│   │   │   ├── complex_layout
│   │   │   ├── imitation_game_flutter
│   │   │   ├── imitation_game_swiftui
│   │   │   ├── macrobenchmarks
│   │   │   ├── microbenchmarks
│   │   │   ├── multiple_flutters
│   │   │   ├── platform_channels_benchmarks
│   │   │   ├── platform_views_layout
│   │   │   ├── platform_views_layout_hybrid_composition
│   │   │   └── test_apps
│   │   ├── bots
│   │   │   ├── README.md
│   │   │   ├── allowlist.dart
│   │   │   ├── analysis_options.yaml
│   │   │   ├── analyze.dart
│   │   │   ├── analyze_snippet_code.dart
│   │   │   ├── browser.dart
│   │   │   ├── check_code_samples.dart
│   │   │   ├── check_tests_cross_imports.dart
│   │   │   ├── codelabs_build_test.sh
│   │   │   ├── custom_rules
│   │   │   ├── docs.sh
│   │   │   ├── post_process_docs.dart
│   │   │   ├── prepare_package
│   │   │   ├── prepare_package.dart
│   │   │   ├── pubspec.yaml
│   │   │   ├── run_command.dart
│   │   │   ├── service_worker_test.dart
│   │   │   ├── serviceaccount.enc
│   │   │   ├── suite_runners
│   │   │   ├── test
│   │   │   ├── test.dart
│   │   │   ├── tool_subsharding.dart
│   │   │   ├── unpublish_package.dart
│   │   │   └── utils.dart
│   │   ├── checks
│   │   ├── customer_testing
│   │   │   ├── README.md
│   │   │   ├── ci.bat
│   │   │   ├── ci.dart
│   │   │   ├── ci.sh
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── run_tests.dart
│   │   │   ├── test
│   │   │   └── tests.version
│   │   ├── devicelab
│   │   │   ├── README.md
│   │   │   ├── analysis_options.yaml
│   │   │   ├── bin
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   ├── docs
│   │   │   ├── README.md
│   │   │   ├── analysis_options.yaml
│   │   │   ├── analytics-footer.html
│   │   │   ├── analytics-header.html
│   │   │   ├── assets
│   │   │   ├── dartdoc_options.yaml
│   │   │   ├── dashing.json
│   │   │   ├── favicon.ico
│   │   │   ├── firebase.json
│   │   │   ├── firebase_rules.json
│   │   │   ├── lib
│   │   │   ├── opensearch.html
│   │   │   ├── platform_integration
│   │   │   ├── renderers
│   │   │   ├── snippets.html
│   │   │   ├── styles.html
│   │   │   └── survey.html
│   │   ├── forbidden_from_release_tests
│   │   │   ├── README.md
│   │   │   ├── bin
│   │   │   └── pubspec.yaml
│   │   ├── integration_tests
│   │   │   ├── README.md
│   │   │   ├── android_engine_test
│   │   │   ├── android_hardware_smoke_test
│   │   │   ├── android_module_host_with_custom_build_v2_embedding
│   │   │   ├── android_semantics_testing
│   │   │   ├── android_verified_input
│   │   │   ├── android_views
│   │   │   ├── channels
│   │   │   ├── darwin_add2app_swiftpm
│   │   │   ├── data_asset_app
│   │   │   ├── data_asset_package
│   │   │   ├── deferred_components_test
│   │   │   ├── display_cutout_rotation
│   │   │   ├── external_textures
│   │   │   ├── flavors
│   │   │   ├── flutter_gallery
│   │   │   ├── hook_user_defines
│   │   │   ├── hybrid_android_views
│   │   │   ├── ios_add2app_life_cycle
│   │   │   ├── ios_add2app_uiscene
│   │   │   ├── ios_app_with_extensions
│   │   │   ├── ios_host_app
│   │   │   ├── ios_host_app_swift
│   │   │   ├── ios_platform_view_tests
│   │   │   ├── keyboard_hot_restart
│   │   │   ├── link_hook
│   │   │   ├── module_host_with_custom_build
│   │   │   ├── module_host_with_custom_build_v2_embedding
│   │   │   ├── new_gallery
│   │   │   ├── platform_interaction
│   │   │   ├── pure_android_host_apps
│   │   │   ├── record_use_test_app
│   │   │   ├── record_use_test_package
│   │   │   ├── release_smoke_test
│   │   │   ├── spell_check
│   │   │   ├── ui
│   │   │   ├── web_compile_tests
│   │   │   ├── web_e2e_tests
│   │   │   ├── wide_gamut_test
│   │   │   ├── widget_preview_scaffold
│   │   │   ├── windowing_test
│   │   │   └── windows_startup_test
│   │   ├── manual_tests
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   ├── missing_dependency_tests
│   │   │   ├── analysis_options.yaml
│   │   │   ├── pubspec.yaml
│   │   │   ├── trivial_expectation.txt
│   │   │   └── trivial_test.dart
│   │   ├── packages_autoroller
│   │   │   ├── README.md
│   │   │   ├── analysis_options.yaml
│   │   │   ├── bin
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── run
│   │   │   └── test
│   │   ├── snippets
│   │   │   ├── README.md
│   │   │   ├── bin
│   │   │   ├── config
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   ├── tools
│   │   │   ├── android_driver_extensions
│   │   │   ├── bin
│   │   │   ├── create_api_docs.dart
│   │   │   ├── dart_skills_lint.yaml
│   │   │   ├── dartdoc_checker.dart
│   │   │   ├── examples_smoke_test.dart
│   │   │   ├── format.bat
│   │   │   ├── format.sh
│   │   │   ├── gen_defaults
│   │   │   ├── gen_keycodes
│   │   │   ├── lib
│   │   │   ├── localization
│   │   │   ├── mega_gallery.dart
│   │   │   ├── pubspec.yaml
│   │   │   ├── repackage_gradle_wrapper.sh
│   │   │   ├── test
│   │   │   ├── update_icons.dart
│   │   │   └── vitool
│   │   └── tracing_tests
│   │       ├── README.md
│   │       ├── lib
│   │       ├── pubspec.yaml
│   │       └── test
│   ├── docs
│   │   ├── Flutter-Self-Service-Index.md
│   │   ├── In-case-of-emergency.md
│   │   ├── README.md
│   │   ├── about
│   │   │   ├── Flutter's-repository-architecture.md
│   │   │   ├── Glossary.md
│   │   │   ├── Project-teams.md
│   │   │   ├── The-Engine-architecture.md
│   │   │   ├── The-Framework-architecture.md
│   │   │   └── Values.md
│   │   ├── contributing
│   │   │   ├── Android-API-And-Related-Versions.md
│   │   │   ├── Chat.md
│   │   │   ├── Contributor-access.md
│   │   │   ├── Data-driven-Fixes.md
│   │   │   ├── Design-Documents.md
│   │   │   ├── Feature-flags.md
│   │   │   ├── Labeling-PRs.md
│   │   │   ├── Setting-up-the-Framework-development-environment.md
│   │   │   ├── Signing-commits.md
│   │   │   ├── Style-guide-for-Flutter-repo.md
│   │   │   ├── Tree-hygiene.md
│   │   │   ├── Using-the-Dart-analyzer.md
│   │   │   ├── What-should-I-work-on.md
│   │   │   ├── issue_hygiene
│   │   │   ├── testing
│   │   │   └── use-reliable-links.md
│   │   ├── ecosystem
│   │   │   ├── Package-migration-to-1.0.0.md
│   │   │   ├── Plugins-and-Packages-repository-structure.md
│   │   │   ├── README.md
│   │   │   ├── contributing
│   │   │   ├── release
│   │   │   └── testing
│   │   ├── engine
│   │   │   ├── Crashes.md
│   │   │   ├── Custom-Flutter-Engine-Embedders.md
│   │   │   ├── Custom-Flutter-Engine-Embedding-in-AOT-Mode.md
│   │   │   ├── Debugging-the-engine.md
│   │   │   ├── Engine-disk-footprint.md
│   │   │   ├── Engine-specific-Service-Protocol-extensions.md
│   │   │   ├── Flutter's-modes.md
│   │   │   ├── Flutter-Android-Engine-Flags.md
│   │   │   ├── Flutter-engine-operation-in-AOT-Mode.md
│   │   │   ├── Image-Codecs-in-the-Flutter-Engine.md
│   │   │   ├── Life-of-a-Flutter-Frame.md
│   │   │   ├── README.md
│   │   │   ├── Supporting-legacy-platforms.md
│   │   │   ├── Using-Sanitizers-with-the-Flutter-Engine.md
│   │   │   ├── Using-the-Dart-Development-Service-(DDS)-and-Flutter-DevTools-with-a-custom-Flutter-Engine-Embedding.md
│   │   │   ├── app_anatomy.svg
│   │   │   ├── benchmarks
│   │   │   ├── ci
│   │   │   ├── contributing
│   │   │   ├── dart_split_aot_compilation.svg
│   │   │   ├── deferred_components_architecture.svg
│   │   │   ├── deferred_components_call_lifecycle.svg
│   │   │   ├── flutter_overview.svg
│   │   │   ├── impeller
│   │   │   ├── monorepo
│   │   │   ├── rbe
│   │   │   ├── release
│   │   │   └── testing
│   │   ├── examples
│   │   │   └── Running-examples.md
│   │   ├── infra
│   │   │   ├── Adding-a-new-Test-Shard.md
│   │   │   ├── Autorollers.md
│   │   │   ├── Autosubmit-bot.md
│   │   │   ├── Bumping-the-Dart-SDK-version.md
│   │   │   ├── Ci-Best-Practices.md
│   │   │   ├── Dashboards.md
│   │   │   ├── Experimental-Branch.md
│   │   │   ├── Flutter-FirebaseLab-Tests.md
│   │   │   ├── Flutter-Framework-Gardener-Rotation.md
│   │   │   ├── Flutter-Infrastructure-Foundation.md
│   │   │   ├── Flutter-Installation-Bundles.md
│   │   │   ├── GitHub-Action-Workflows.md
│   │   │   ├── How-to-add-a-new-integration-test-to-Framework-CI.md
│   │   │   ├── How-to-download-a-timeline-from-a-benchmark.md
│   │   │   ├── Landing-Changes-With-Autosubmit.md
│   │   │   ├── Packages-Gardener-Rotation.md
│   │   │   ├── README.md
│   │   │   ├── Reducing-Test-Flakiness.md
│   │   │   ├── Rolling-Dart.md
│   │   │   ├── Running-Devicelab-Tests-For-PR.md
│   │   │   ├── Security.md
│   │   │   ├── Understanding-Google-Testing.md
│   │   │   ├── Understanding-a-LUCI-build-failure.md
│   │   │   ├── Unified-Check-Run.md
│   │   │   ├── Updating-dependencies-in-Flutter.md
│   │   │   └── merge_queue.md
│   │   ├── libraries
│   │   │   └── material
│   │   ├── platforms
│   │   │   ├── Hybrid-Composition.md
│   │   │   └── desktop
│   │   ├── postmortems
│   │   │   ├── Postmortem-AndroidX-plugin-migration.md
│   │   │   ├── Postmortem-Beta-1-Release.md
│   │   │   ├── Postmortem-Build-Breakage-on-2016-11-08.md
│   │   │   ├── Postmortem-Flutter-3.32.3-Release.md
│   │   │   ├── Postmortem-Platform-View-android-14-regression.md
│   │   │   ├── Postmortem-Widespread-Gradle-failures-on-Flutter-v1.12.13-hotfix.5.md
│   │   │   ├── Postmortem-Windows-Defender-alert-on-2023-03-26.md
│   │   │   ├── Postmortem-flutter.dev-outage-on-August-26-2023.md
│   │   │   ├── README.md
│   │   │   ├── Retrospective-Flutter-2.8-Stable-Release.md
│   │   │   └── postmortem-template.md
│   │   ├── releases
│   │   │   ├── Bad-Builds.md
│   │   │   ├── Flutter-Cherrypick-Process.md
│   │   │   ├── Flutter-build-release-channels.md
│   │   │   ├── Hotfix-Documentation-Best-Practices.md
│   │   │   ├── Quality-Assurance.md
│   │   │   ├── Release-versioning.md
│   │   │   ├── Where's-my-commit.md
│   │   │   └── archive
│   │   ├── roadmap
│   │   │   ├── Roadmap.md
│   │   │   └── [Archive]-Old-Roadmaps.md
│   │   ├── rules
│   │   │   ├── README.md
│   │   │   ├── rules.md
│   │   │   ├── rules_10k.md
│   │   │   ├── rules_1k.md
│   │   │   └── rules_4k.md
│   │   ├── tool
│   │   │   ├── Engine-artifacts.md
│   │   │   ├── Managing-template-image-assets.md
│   │   │   ├── README.md
│   │   │   ├── The-flutter-run-variants.md
│   │   │   └── Using-custom-embedders-with-the-Flutter-CLI.md
│   │   ├── triage
│   │   │   ├── Flutter-Web-Triage.md
│   │   │   ├── Infra-Triage.md
│   │   │   └── README.md
│   │   └── wiki_archive
│   │       ├── Experimental-Add-Flutter-Fragment-ViewPager.md
│   │       ├── Experimental-Add-Flutter-View.md
│   │       ├── Experimental-Launch-Flutter-with-non-main-entrypoint.md
│   │       ├── Experimental-Reuse-FlutterEngine-across-screens.md
│   │       ├── Experimental-Use-old-plugins-with-new-embedding.md
│   │       ├── Flutter-migrate.md
│   │       ├── IntelliJ---Flutter-Setup-Tips-and-Tricks.md
│   │       ├── Manual-Engine-Roll-with-Breaking-Commits.md
│   │       ├── Multi-device-debugging-in-VS-Code.md
│   │       ├── Upgrading-Flutter-projects-from-using-PlatformMessages-to-using-channels.md
│   │       ├── User-documentation-index.md
│   │       └── Workarounds-for-common-issues.md
│   ├── engine
│   │   ├── README.md
│   │   ├── scripts
│   │   │   ├── rbe.gclient
│   │   │   └── standard.gclient
│   │   └── src
│   │       ├── AUTHORS
│   │       ├── BUILD.gn
│   │       ├── LICENSE
│   │       ├── README.md
│   │       ├── build_overrides
│   │       ├── flutter
│   │       └── tools
│   ├── examples
│   │   ├── README.md
│   │   ├── api
│   │   │   ├── README.md
│   │   │   ├── analysis_options.yaml
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── test
│   │   │   └── test_driver
│   │   ├── flutter_gallery.readme
│   │   ├── flutter_view
│   │   │   ├── README.md
│   │   │   ├── assets
│   │   │   ├── lib
│   │   │   └── pubspec.yaml
│   │   ├── hello_world
│   │   │   ├── README.md
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── test
│   │   │   └── test_driver
│   │   ├── image_list
│   │   │   ├── README.md
│   │   │   ├── images
│   │   │   ├── lib
│   │   │   └── pubspec.yaml
│   │   ├── layers
│   │   │   ├── README.md
│   │   │   ├── analysis_options.yaml
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── raw
│   │   │   ├── rendering
│   │   │   ├── services
│   │   │   ├── test
│   │   │   └── widgets
│   │   ├── multiple_windows
│   │   │   ├── README.md
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   ├── platform_channel
│   │   │   ├── README.md
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── test
│   │   │   └── test_driver
│   │   ├── platform_channel_swift
│   │   │   ├── README.md
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test_driver
│   │   ├── platform_view
│   │   │   ├── README.md
│   │   │   ├── assets
│   │   │   ├── lib
│   │   │   └── pubspec.yaml
│   │   ├── splash
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   └── texture
│   │       ├── README.md
│   │       ├── lib
│   │       ├── pubspec.yaml
│   │       ├── test
│   │       └── test_driver
│   ├── flutter_console.bat
│   ├── packages
│   │   ├── analysis_options.yaml
│   │   ├── flutter
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── analysis_options.yaml
│   │   │   ├── build.yaml
│   │   │   ├── dart_test.yaml
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── test
│   │   │   ├── test_fixes
│   │   │   ├── test_private
│   │   │   ├── test_profile
│   │   │   └── test_release
│   │   ├── flutter_driver
│   │   │   ├── analysis_options.yaml
│   │   │   ├── dart_test.yaml
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── test
│   │   │   ├── test_driver
│   │   │   └── test_fixes
│   │   ├── flutter_goldens
│   │   │   ├── README.md
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   ├── flutter_localizations
│   │   │   ├── README.md
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   ├── flutter_test
│   │   │   ├── analysis_options.yaml
│   │   │   ├── dart_test.yaml
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   ├── test
│   │   │   └── test_fixes
│   │   ├── flutter_tools
│   │   │   ├── README.md
│   │   │   ├── analysis_options.yaml
│   │   │   ├── bin
│   │   │   ├── dart_test.yaml
│   │   │   ├── doc
│   │   │   ├── gradle
│   │   │   ├── ide_templates
│   │   │   ├── lib
│   │   │   ├── pubspec.lock
│   │   │   ├── pubspec.yaml
│   │   │   ├── static
│   │   │   ├── templates
│   │   │   ├── test
│   │   │   └── tool
│   │   ├── flutter_web_plugins
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   ├── fuchsia_remote_debug_protocol
│   │   │   ├── lib
│   │   │   ├── pubspec.yaml
│   │   │   └── test
│   │   └── integration_test
│   │       ├── CHANGELOG.md
│   │       ├── README.md
│   │       ├── analysis_options.yaml
│   │       ├── example
│   │       ├── integration_test_macos
│   │       ├── lib
│   │       ├── pubspec.yaml
│   │       ├── test
│   │       └── test_fixes
│   ├── pubspec.lock
│   ├── pubspec.yaml
│   └── third_party
│       └── ninja
│           └── README.flutter
├── lib
│   ├── auth_gate.dart
│   ├── config.dart
│   ├── controllers
│   │   ├── account_settings_controller.dart
│   │   ├── admin_broadcast_controller.dart
│   │   ├── admin_categories_controller.dart
│   │   ├── admin_controller.dart
│   │   ├── admin_offers_controller.dart
│   │   ├── admin_users_controller.dart
│   │   ├── admin_validation_controller.dart
│   │   ├── admin_zones_controller.dart
│   │   ├── ai_assistant_controller.dart
│   │   ├── all_offers_controller.dart
│   │   ├── auth_controller.dart
│   │   ├── categories_controller.dart
│   │   ├── client_ai_controller.dart
│   │   ├── client_announcements_controller.dart
│   │   ├── client_controller.dart
│   │   ├── client_favorites_controller.dart
│   │   ├── client_orders_controller.dart
│   │   ├── client_plan_controller.dart
│   │   ├── client_plans_controller.dart
│   │   ├── client_points_controller.dart
│   │   ├── client_pools_controller.dart
│   │   ├── client_store_controller.dart
│   │   ├── client_validation_controller.dart
│   │   ├── coupon_controller.dart
│   │   ├── guided_purchase_controller.dart
│   │   ├── merchant_ads_controller.dart
│   │   ├── merchant_earnings_controller.dart
│   │   ├── merchant_pools_controller.dart
│   │   ├── merchant_profile_controller.dart
│   │   ├── merchant_reviews_controller.dart
│   │   ├── merchant_scan_controller.dart
│   │   ├── merchant_store_controller.dart
│   │   ├── nearby_offers_controller.dart
│   │   ├── nearby_offers_map_screen.dart
│   │   ├── notifications_controller.dart
│   │   ├── offer_controller.dart
│   │   ├── owner_audit_controller.dart
│   │   ├── owner_config_controller.dart
│   │   ├── owner_config_screen.dart
│   │   ├── owner_controller.dart
│   │   ├── owner_financial_controller.dart
│   │   ├── owner_plans_controller.dart
│   │   ├── purchase_controller.dart
│   │   ├── report_controller.dart
│   │   ├── subscription_request_controller.dart
│   │   ├── user_controller.dart
│   │   ├── voice_offer_controller.dart
│   │   └── zones_controller.dart
│   ├── core
│   │   └── theme
│   │       └── app_theme.dart
│   ├── main.dart
│   ├── screens
│   │   ├── account_settings_screen.dart
│   │   ├── add_product_screen.dart
│   │   ├── add_product_screen2.dart
│   │   ├── admin_animal_requests_screen.dart
│   │   ├── admin_broadcast_screen.dart
│   │   ├── admin_categories_screen.dart
│   │   ├── admin_dashboard_screen.dart
│   │   ├── admin_dashboard_screen2.dart
│   │   ├── admin_market_intelligence.dart
│   │   ├── admin_moderation_screen.dart
│   │   ├── admin_offers_screen.dart
│   │   ├── admin_support_screen.dart
│   │   ├── admin_users_screen.dart
│   │   ├── admin_validation_screen.dart
│   │   ├── admin_validation_screen2.dart
│   │   ├── admin_zones_screen.dart
│   │   ├── ai_assistant_screen.dart
│   │   ├── ai_settings_screen.dart
│   │   ├── all_offers_screen.dart
│   │   ├── chat_screen.dart
│   │   ├── client_ai_assistant_screen.dart
│   │   ├── client_announcements_screen.dart
│   │   ├── client_checkout_screen.dart
│   │   ├── client_dashboard_tab.dart
│   │   ├── client_dashboard_tab2.dart
│   │   ├── client_favorites_screen.dart
│   │   ├── client_followed_stores_screen.dart
│   │   ├── client_guided_purchase_screen.dart
│   │   ├── client_orders_screen.dart
│   │   ├── client_plan_purchase_screen.dart
│   │   ├── client_plan_results_screen.dart
│   │   ├── client_points_screen.dart
│   │   ├── client_pools_screen.dart
│   │   ├── client_store_profile_screen.dart
│   │   ├── client_validation_screen.dart
│   │   ├── client_vip_plans_screen.dart
│   │   ├── create_offer_screen.dart
│   │   ├── create_offer_screen2.dart
│   │   ├── home_screen.dart
│   │   ├── home_screen2.dart
│   │   ├── login_screen.dart
│   │   ├── login_screen2.dart
│   │   ├── main.dart
│   │   ├── map_picker_screen.dart
│   │   ├── map_screen.dart
│   │   ├── merchant_ads_screen.dart
│   │   ├── merchant_coupons_screen.dart
│   │   ├── merchant_dashboard_tab.dart
│   │   ├── merchant_dashboard_tab2.dart
│   │   ├── merchant_demand_radar.dart
│   │   ├── merchant_demand_radar2.dart
│   │   ├── merchant_earnings_screen.dart
│   │   ├── merchant_edit_store_screen.dart
│   │   ├── merchant_metrics_screen.dart
│   │   ├── merchant_metrics_screen2.dart
│   │   ├── merchant_offers_tab.dart
│   │   ├── merchant_plans_screen.dart
│   │   ├── merchant_pools_screen.dart
│   │   ├── merchant_profile_screen.dart
│   │   ├── merchant_profile_screen2.dart
│   │   ├── merchant_reviews_screen.dart
│   │   ├── merchant_scanner_screen.dart
│   │   ├── merchant_screen.dart
│   │   ├── merchant_status_screen.dart
│   │   ├── nearby_offers_map_screen.dart
│   │   ├── notifications_screen.dart
│   │   ├── offer_form_screen.dart
│   │   ├── offer_review_screen.dart
│   │   ├── owner_assign_plan_screen.dart
│   │   ├── owner_assign_plan_screen2.dart
│   │   ├── owner_audit_screen.dart
│   │   ├── owner_dashboard_screen.dart
│   │   ├── owner_dashboard_screen2.dart
│   │   ├── owner_financial_screen.dart
│   │   ├── owner_manual_payments_screen.dart
│   │   ├── owner_plans_management_screen.dart
│   │   ├── owner_plans_management_screen2.dart
│   │   ├── owner_settings_screen.dart
│   │   ├── owner_settings_screen2.dart
│   │   ├── owner_user_management_screen.dart
│   │   ├── owner_user_management_screen2.dart
│   │   ├── payment_request_modal.dart
│   │   ├── planificar_compra_screen.dart
│   │   ├── purchase_qr_screen.dart
│   │   ├── report_modal_screen.dart
│   │   ├── reset_password_screen.dart
│   │   ├── update_password_screen.dart
│   │   └── voice_offer_screen.dart
│   ├── services
│   │   ├── auth_service.dart
│   │   └── bcv_service.dart
│   └── widgets
│       └── notification_bell.dart
├── ofve_app.iml
├── pubspec.lock
├── pubspec.yaml
└── test
    └── widget_test.dart

255 directories, 496 files
```

## 📦 PUBSPEC.YAML
```yaml
name: ofve_app
description: "A new Flutter project."
publish_to: 'none' 

version: 1.0.0+1

environment:
  sdk: ^3.13.5

dependencies:
  flutter:
    sdk: flutter
  http: ^1.6.0
  supabase_flutter: ^2.5.0
  flutter_secure_storage: ^9.0.0
  speech_to_text: ^6.3.0
  flutter_tts: ^3.8.3
  url_launcher: ^6.2.6
  uuid: ^4.3.3
  qr_flutter: ^4.1.0
  mobile_scanner: ^5.2.3
  cupertino_icons: ^1.0.8
  web: ^1.1.2
  sentry_flutter: ^10.2.0
  flutter_map: ^8.3.2
  latlong2: ^0.10.1
  geolocator: ^14.0.2
  flutter_map_tile_switcher: ^0.0.5
  image_picker: ^1.2.4
  image: ^4.12.0
  file_picker: ^8.1.2
  path: ^1.9.0
  intl: ^0.19.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true
  assets:
   - assets/icons/```

## 💻 CÓDIGO DART (lib/)
### 📄 lib/auth_gate.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // Evaluamos si hay una sesión activa
        final session = snapshot.data?.session ?? supabase.auth.currentSession;

        if (session == null) {
          // Si no hay sesión (o acabamos de hacer signOut), muestra el Login
          return const LoginScreen();
        }

        // Si hay sesión, va al Home
        return const HomeScreen();
      },
    );
  }
}```

### 📄 lib/config.dart
```dart
// lib/config.dart
const String supabaseUrl = 'https://icuajnirhqemsuqbflcm.supabase.co';
const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImljdWFqbmlyaHFlbXN1cWJmbGNtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTIyOTkwNDcsImV4cCI6MjEwNzg3NTA0N30.x4EVJQ8zWTGwjFHiXLWlILvjoJ11_A6hc5Aes9-SN7M';```

### 📄 lib/controllers/account_settings_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountSettingsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isSaving = false;
  String? errorMessage;
  String? successMessage;

  // Datos del usuario
  String email = '';
  String nombre = '';
  String telefono = '';
  String rol = 'user';
  String tipoPlan = 'Básico';
  int puntos = 0;

  AccountSettingsController() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    isLoading = true;
    notifyListeners();

    try {
      final user = _supabase.auth.currentUser;
      if (user == null) throw Exception('No hay sesión activa');

      email = user.email ?? '';

      final response = await _supabase
          .from('usuarios')
          .select('nombre, telefono, rol, tipo_plan, puntos_acumulados')
          .eq('id', user.id)
          .single();

      nombre = response['nombre'] ?? '';
      telefono = response['telefono'] ?? '';
      rol = response['rol'] ?? 'user';
      tipoPlan = response['tipo_plan'] ?? 'Básico';
      puntos = response['puntos_acumulados'] ?? 0;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateProfile({required String newName, required String newPhone}) async {
    isSaving = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      await _supabase.from('usuarios').update({
        'nombre': newName.trim(),
        'telefono': newPhone.trim(),
      }).eq('id', userId);

      // Actualizar también en los metadatos del Auth
      await _supabase.auth.updateUser(
        UserAttributes(data: {'nombre': newName.trim()}),
      );

      nombre = newName.trim();
      telefono = newPhone.trim();
      successMessage = 'Perfil actualizado correctamente.';
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future<bool> changePassword(String newPassword) async {
    isSaving = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      await _supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
      successMessage = 'Contraseña actualizada correctamente.';
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future<bool> deleteAccount() async {
    try {
      // En producción, esto debería hacerse via Edge Function con service_role
      // Por ahora, solo cerramos sesión
      await _supabase.auth.signOut();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    }
  }
}```

### 📄 lib/controllers/admin_broadcast_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminBroadcastController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isSending = false;
  List<dynamic> announcements = [];
  String? errorMessage;

  AdminBroadcastController() {
    loadAnnouncements();
  }

  Future<void> loadAnnouncements() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('anuncios_globales')
          .select('*')
          .order('fecha_creacion', ascending: false);
      announcements = response;
    } catch (e) {
      debugPrint('Error cargando anuncios: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> sendAnnouncement(String title, String message) async {
    if (title.trim().isEmpty || message.trim().isEmpty) {
      errorMessage = 'El título y el mensaje no pueden estar vacíos.';
      notifyListeners();
      return false;
    }

    isSending = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _supabase.from('anuncios_globales').insert({
        'titulo': title.trim(),
        'mensaje': message.trim(),
        'activo': true,
      });
      
      await loadAnnouncements();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isSending = false;
      notifyListeners();
    }
  }

  Future<void> toggleAnnouncementStatus(String id, bool currentStatus) async {
    try {
      await _supabase.from('anuncios_globales').update({
        'activo': !currentStatus
      }).eq('id', id);
      
      await loadAnnouncements();
    } catch (e) {
      debugPrint('Error al cambiar estado del anuncio: $e');
    }
  }
}```

### 📄 lib/controllers/admin_categories_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminCategoriesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> categories = [];

  AdminCategoriesController() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('categorias')
          .select('*')
          .order('nombre', ascending: true);
      categories = response;
    } catch (e) {
      debugPrint('Error cargando categorias: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addCategory(String name) async {
    if (name.trim().isEmpty) return false;
    
    try {
      await _supabase.from('categorias').insert({
        'nombre': name.trim(),
      });
      await loadCategories();
      return true;
    } catch (e) {
      debugPrint('Error creando categoria: $e');
      return false;
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _supabase.from('categorias').delete().eq('id', id);
      await loadCategories();
    } catch (e) {
      debugPrint('Error eliminando categoria: $e');
    }
  }
}```

### 📄 lib/controllers/admin_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  int comerciosPendientes = 0;
  int reportesPendientes = 0;
  int ticketsSoporte = 5; // Placeholder

  AdminController() {
    loadAdminStats();
  }

  Future<void> loadAdminStats() async {
    isLoading = true;
    notifyListeners();
    try {
      final comercios = await _supabase.from('comercios').select('id').eq('estatus_verificacion', 'En Revision').count();
      final reportes = await _supabase.from('reportes_moderacion').select('id').eq('estado', 'Pendiente').count();
      
      comerciosPendientes = comercios.count;
      reportesPendientes = reportes.count;
    } catch (e) {
      debugPrint('Error cargando métricas admin: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/admin_offers_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> offers = [];
  String? errorMessage;

  AdminOffersController() {
    loadOffers();
  }

  Future<void> loadOffers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // Hacemos JOIN con comercios para obtener el nombre de la tienda
      final response = await _supabase
          .from('ofertas')
          .select('*, comercios(nombre_comercial)')
          .order('fecha_creacion', ascending: false);
      offers = response;
    } catch (e) {
      debugPrint('Error cargando ofertas (Admin): $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleOfferStatus(String offerId, String currentStatus) async {
    try {
      final newStatus = currentStatus == 'Activa' ? 'Suspendida' : 'Activa';
      await _supabase.from('ofertas').update({
        'estado': newStatus,
      }).eq('id', offerId);
      
      await loadOffers(); // Recargar
    } catch (e) {
      debugPrint('Error al suspender/reactivar oferta: $e');
    }
  }

  Future<void> deleteOffer(String offerId) async {
    try {
      await _supabase.from('ofertas').delete().eq('id', offerId);
      await loadOffers();
    } catch (e) {
      debugPrint('Error al eliminar oferta: $e');
    }
  }
}```

### 📄 lib/controllers/admin_users_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminUsersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> allUsers = [];
  List<dynamic> filteredUsers = [];
  String searchQuery = '';

  AdminUsersController() {
    loadUsers();
  }

  Future<void> loadUsers() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('usuarios')
          .select('id, nombre, email, rol, estado_cuenta, estado_baneado')
          .order('fecha_creacion', ascending: false);
      
      allUsers = response;
      _applyFilter();
    } catch (e) {
      debugPrint('Error cargando usuarios: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void search(String query) {
    searchQuery = query.toLowerCase();
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (searchQuery.isEmpty) {
      filteredUsers = allUsers;
    } else {
      filteredUsers = allUsers.where((u) {
        final name = (u['nombre'] ?? '').toString().toLowerCase();
        final email = (u['email'] ?? '').toString().toLowerCase();
        return name.contains(searchQuery) || email.contains(searchQuery);
      }).toList();
    }
  }

  Future<void> toggleUserBan(String userId, bool currentStatus) async {
    try {
      final newStatus = !currentStatus;
      await _supabase.from('usuarios').update({
        'estado_baneado': newStatus,
        'estado_cuenta': newStatus ? 'Suspendido' : 'Activo',
      }).eq('id', userId);

      // Actualizamos la lista localmente para evitar recargar toda la pantalla
      final index = allUsers.indexWhere((u) => u['id'] == userId);
      if (index != -1) {
        allUsers[index]['estado_baneado'] = newStatus;
        allUsers[index]['estado_cuenta'] = newStatus ? 'Suspendido' : 'Activo';
        _applyFilter();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error al banear/desbanear usuario: $e');
    }
  }
}```

### 📄 lib/controllers/admin_validation_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminValidationController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  
  bool isLoading = true;
  List<dynamic> comerciosPendientes = [];

  AdminValidationController() {
    loadComercios();
  }

  Future<void> loadComercios() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _supabase.from('comercios').select('*').eq('estatus_verificacion', 'En Revision');
      comerciosPendientes = response;
    } catch (e) {
      debugPrint('Error cargando comercios: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> actualizarEstado(String comercioId, String nuevoEstado) async {
    try {
      await _supabase.from('comercios').update({'estatus_verificacion': nuevoEstado}).eq('id', comercioId);
      await loadComercios(); // Recargar la lista
    } catch (e) {
      debugPrint('Error actualizando estado: $e');
    }
  }
}```

### 📄 lib/controllers/admin_zones_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminZonesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> zones = [];
  String? errorMessage;

  AdminZonesController() {
    loadZones();
  }

  Future<void> loadZones() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _supabase
          .from('geo_zonas')
          .select('*')
          .order('estado', ascending: true)
          .order('municipio', ascending: true);
      zones = response;
    } catch (e) {
      debugPrint('Error cargando zonas: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addZone({
    required String estado,
    required String municipio,
    required String parroquia,
  }) async {
    try {
      await _supabase.from('geo_zonas').insert({
        'estado': estado.trim(),
        'municipio': municipio.trim(),
        'parroquia': parroquia.trim(),
      });
      await loadZones();
      return true;
    } catch (e) {
      debugPrint('Error creando zona: $e');
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> deleteZone(String id) async {
    try {
      await _supabase.from('geo_zonas').delete().eq('id', id);
      await loadZones();
    } catch (e) {
      debugPrint('Error eliminando zona: $e');
    }
  }
}```

### 📄 lib/controllers/ai_assistant_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AiAssistantController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? generatedDescription;
  String? errorMessage;

  Future<void> generateDescription({required String productName, required String category}) async {
    isLoading = true;
    errorMessage = null;
    generatedDescription = null;
    notifyListeners();

    try {
      final response = await _supabase.functions.invoke(
        'generate-offer-description',
        body: {
          'product_name': productName,
          'category': category,
        },
      );

      if (response.status == 200 && response.data != null) {
        generatedDescription = response.data['description'];
      } else {
        throw Exception('La IA no pudo generar el texto.');
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/all_offers_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AllOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> offers = [];
  List<dynamic> filteredOffers = [];
  String? selectedCategory;

  final List<String> categories = [
    'Todas', 'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 
    'Salud y Belleza', 'Hogar y Ferretería', 'Supermercado', 
    'Farmacia', 'Servicios', 'Otros'
  ];

  AllOffersController() {
    loadAllOffers();
  }

  Future<void> loadAllOffers() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .order('fecha_inicio', ascending: false);

      offers = response;
      _applyFilter();
    } catch (e) {
      debugPrint('Error cargando ofertas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void filterByCategory(String? category) {
    selectedCategory = category;
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (selectedCategory == null || selectedCategory == 'Todas') {
      filteredOffers = offers;
    } else {
      filteredOffers = offers.where((o) => o['categoria'] == selectedCategory).toList();
    }
  }
}```

### 📄 lib/controllers/auth_controller.dart
```dart
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  
  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.login(email, password);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    required String role,
    required String name,
    required bool isAdult,
    String? storeName,
    String? rif,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.register(
        email: email, password: password, role: role, 
        name: name, isAdult: isAdult, storeName: storeName, rif: rif
      );
      
      // Cierre de sesión automático para forzar login manual tras registro
      await _authService.logout();
      
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> resetPassword(String email) async {
    isLoading = true;
    notifyListeners();
    try {
      await _authService.resetPassword(email);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/categories_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoriesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<String> categories = [];

  CategoriesController() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('categorias')
          .select('nombre')
          .order('nombre', ascending: true);
      
      categories = response.map<String>((c) => c['nombre'].toString()).toList();
      
      // Si por alguna razón la tabla está vacía, ponemos un fallback
      if (categories.isEmpty) {
        categories = ['Alimentos y Bebidas', 'Tecnología', 'Otros'];
      }
    } catch (e) {
      debugPrint('Error cargando categorías: $e');
      categories = ['Alimentos y Bebidas', 'Tecnología', 'Otros'];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/client_ai_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientAiController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? aiMessage;
  List<dynamic> recommendedOffers = [];
  String? errorMessage;

  Future<void> askAssistant(String prompt) async {
    if (prompt.trim().isEmpty) return;

    isLoading = true;
    errorMessage = null;
    aiMessage = null;
    recommendedOffers.clear();
    notifyListeners();

    try {
      // 1. Llamar a la Edge Function
      final response = await _supabase.functions.invoke(
        'client-ai-assistant',
        body: {'prompt': prompt},
      );

      if (response.status != 200) {
        throw Exception('Error en el servidor');
      }

      final data = response.data;
      aiMessage = data['message'];
      final List<String> ids = List<String>.from(data['recommended_ids'] ?? []);

      // 2. Si la IA recomendó productos, los buscamos en la base de datos
      if (ids.isNotEmpty) {
        final offersRes = await _supabase
            .from('ofertas')
            .select('*')
            .inFilter('id', ids);
        recommendedOffers = offersRes;
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/client_announcements_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientAnnouncementsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> announcements = [];
  int unreadCount = 0;

  ClientAnnouncementsController() {
    loadAnnouncements();
  }

  Future<void> loadAnnouncements() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('anuncios_globales')
          .select('*')
          .eq('activo', true)
          .order('fecha_creacion', ascending: false);

      announcements = response;
      // Simulamos un contador de "no leídos" basado en la cantidad de anuncios
      unreadCount = announcements.length; 
    } catch (e) {
      debugPrint('Error cargando anuncios para el cliente: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void markAsRead() {
    unreadCount = 0;
    notifyListeners();
  }
}```

### 📄 lib/controllers/client_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoadingOffers = true;
  List<dynamic> offers = [];

  ClientController() {
    loadOffers();
  }

  Future<void> loadOffers() async {
    isLoadingOffers = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .order('fecha_inicio', ascending: false)
          .limit(5);
      offers = response;
    } catch (e) {
      debugPrint('Error cargando ofertas: $e');
    } finally {
      isLoadingOffers = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/client_favorites_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientFavoritesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> favorites = [];
  List<String> favoriteIds = []; // <-- NUEVO: Lista rápida de IDs

  ClientFavoritesController() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      final response = await _supabase
          .from('favoritos')
          .select('oferta_id, ofertas(*)')
          .eq('usuario_id', userId)
          .order('fecha_agregado', ascending: false);

      favorites = response.map((f) => f['ofertas']).toList();
      // Guardamos solo los IDs para búsquedas rápidas
      favoriteIds = favorites.map((o) => o['id'].toString()).toList(); 
    } catch (e) {
      debugPrint('Error cargando favoritos: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool isFavorite(String ofertaId) {
    return favoriteIds.contains(ofertaId);
  }

  Future<void> toggleFavorite(String ofertaId) async {
    try {
      final userId = _supabase.auth.currentUser!.id;

      final existing = await _supabase
          .from('favoritos')
          .select('id')
          .eq('usuario_id', userId)
          .eq('oferta_id', ofertaId)
          .maybeSingle();

      if (existing != null) {
        await _supabase.from('favoritos').delete().eq('id', existing['id']);
        favoriteIds.remove(ofertaId);
        favorites.removeWhere((o) => o['id'] == ofertaId);
      } else {
        await _supabase.from('favoritos').insert({
          'usuario_id': userId,
          'oferta_id': ofertaId,
        });
        // No recargamos toda la lista para no perder el scroll, solo actualizamos localmente
        favoriteIds.add(ofertaId);
        loadFavorites(); // Recargamos en segundo plano para traer los datos completos
      }
      
      notifyListeners();
    } catch (e) {
      debugPrint('Error al cambiar favorito: $e');
    }
  }
}```

### 📄 lib/controllers/client_orders_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientOrdersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> orders = [];

  ClientOrdersController() {
    loadOrders();
  }

  Future<void> loadOrders() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // Buscamos las compras del usuario y hacemos un JOIN con la tabla comercios para traer el nombre del local
      final response = await _supabase
          .from('compras')
          .select('*, comercios(nombre_comercial)')
          .eq('usuario_id', userId)
          .order('fecha_compra', ascending: false);

      orders = response;
    } catch (e) {
      debugPrint('Error cargando historial de compras: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/client_plan_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPlanController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  
  // Resultados de la búsqueda
  List<Map<String, dynamic>> resultados = [];
  double totalEstimado = 0.0;

  Future<bool> generarPlanificacion({
    required List<Map<String, dynamic>> items,
    required double lat,
    required double lng,
    required DateTime fechaCompra,
  }) async {
    isLoading = true;
    errorMessage = null;
    resultados.clear();
    totalEstimado = 0.0;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Guardar el plan en la base de datos (Opcional, para historial)
      await _supabase.from('planes_compra').insert({
        'usuario_id': userId,
        'items_solicitados': items,
        'estado': 'Buscando ofertas',
        'fecha_planificada': fechaCompra.toIso8601String(),
        'latitud_centro': lat,
        'longitud_centro': lng,
        'radio_metros': 1000,
      });

      // 2. Obtener todas las ofertas cercanas en 1KM usando nuestra función RPC
      final ofertasCercanas = await _supabase.rpc('obtener_ofertas_cercanas', params: {
        'lat': lat,
        'lng': lng,
        'radio_metros': 1000,
      });

      if (ofertasCercanas == null || (ofertasCercanas as List).isEmpty) {
        throw Exception('No hay ofertas disponibles en un radio de 1KM.');
      }

      // 3. Cruzar los items solicitados con las ofertas encontradas
      for (var item in items) {
        final nombreBuscado = item['nombre'].toString().toLowerCase();
        
        // Buscar la oferta más barata que coincida con el nombre
        final mejoresOfertas = ofertasCercanas.where((o) => 
          o['nombre_oferta'].toString().toLowerCase().contains(nombreBuscado)
        ).toList();

        if (mejoresOfertas.isNotEmpty) {
          // Como ya vienen ordenadas por precio desde el RPC, la primera es la más barata
          final mejor = mejoresOfertas.first;
          final precio = (mejor['precio'] as num).toDouble();
          final cantidad = int.tryParse(item['cantidad'].toString()) ?? 1;

          resultados.add({
            'item_solicitado': item,
            'oferta': mejor,
            'subtotal': precio * cantidad,
          });

          totalEstimado += precio * cantidad;
        } else {
          resultados.add({
            'item_solicitado': item,
            'oferta': null, // No se encontró
            'subtotal': 0.0,
          });
        }
      }

      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/client_plans_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPlansController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> plans = [];
  String currentPlanName = 'Básico'; // Por defecto

  ClientPlansController() {
    loadPlans();
  }

  Future<void> loadPlans() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Obtener el plan actual del usuario
      final userRes = await _supabase
          .from('usuarios')
          .select('tipo_plan')
          .eq('id', userId)
          .maybeSingle();
      
      if (userRes != null && userRes['tipo_plan'] != null) {
        currentPlanName = userRes['tipo_plan'];
      }

      // 2. Obtener todos los planes disponibles
      final response = await _supabase
          .from('planes_suscripcion')
          .select('*')
          .eq('activo', true)
          .order('precio', ascending: true);

      plans = response;
    } catch (e) {
      debugPrint('Error cargando planes de cliente: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> requestPlanUpgrade(String planName) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // En un sistema real, aquí se procesaría el pago. 
      // Para esta demostración, actualizamos el plan directamente.
      await _supabase
          .from('usuarios')
          .update({'tipo_plan': planName})
          .eq('id', userId);

      currentPlanName = planName;
      notifyListeners();
    } catch (e) {
      debugPrint('Error al actualizar plan: $e');
    }
  }
}```

### 📄 lib/controllers/client_points_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPointsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  int currentPoints = 0;
  List<dynamic> history = [];
  String? errorMessage;
  String? successMessage;

  ClientPointsController() {
    loadPoints();
  }

  Future<void> loadPoints() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Obtener puntos actuales
      final userRes = await _supabase
          .from('usuarios')
          .select('puntos_acumulados')
          .eq('id', userId)
          .single();
      currentPoints = userRes['puntos_acumulados'] ?? 0;

      // 2. Obtener historial
      final historyRes = await _supabase
          .from('historial_puntos')
          .select('*')
          .eq('usuario_id', userId)
          .order('fecha', ascending: false)
          .limit(20);
      history = historyRes;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> redeemPoints(int points) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      await _supabase.rpc('canjear_puntos', params: {
        'p_usuario_id': userId,
        'p_cantidad': points,
      });
      await loadPoints();
      successMessage = '¡Has canjeado $points puntos! Se aplicarán como descuento en tu próxima compra.';
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    }
  }
}```

### 📄 lib/controllers/client_pools_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPoolsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> activePools = [];

  ClientPoolsController() {
    loadPools();
  }

  Future<void> loadPools() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('pools_comunitarios')
          .select('*, pools_participantes(count)')
          .eq('estado', 'Recaudando')
          .order('fecha_creacion', ascending: false);

      activePools = response;
    } catch (e) {
      debugPrint('Error cargando pools: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> joinPool(String poolId, int cantidad) async {
    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Unirse al pool
      await _supabase.from('pools_participantes').insert({
        'pool_id': poolId,
        'usuario_id': userId,
        'cantidad_comprometida': cantidad,
      });

      // 2. Incrementar contador en el pool (RPC en producción, aquí lo hacemos directo)
      final pool = await _supabase.from('pools_comunitarios').select('usuarios_comprometidos').eq('id', poolId).single();
      final currentCount = pool['usuarios_comprometidos'] ?? 0;
      
      await _supabase.from('pools_comunitarios').update({
        'usuarios_comprometidos': currentCount + 1
      }).eq('id', poolId);

      await loadPools(); // Recargar
      return true;
    } catch (e) {
      debugPrint('Error uniéndose al pool: $e');
      return false;
    }
  }
}```

### 📄 lib/controllers/client_store_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientStoreController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isFollowing = false;
  bool isActionLoading = false;
  Map<String, dynamic>? storeData;
  List<dynamic> storeOffers = [];

  Future<void> loadStoreProfile(String comercioId) async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Cargar datos de la tienda
      final storeRes = await _supabase
          .from('comercios')
          .select('*')
          .eq('id', comercioId)
          .single();
      storeData = storeRes;

      // 2. Cargar ofertas de la tienda
      final offersRes = await _supabase
          .from('ofertas')
          .select('*')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Activa');
      storeOffers = offersRes;

      // 3. Verificar si el cliente ya sigue a esta tienda
      final followRes = await _supabase
          .from('seguidores_comercios')
          .select('id')
          .eq('usuario_id', userId)
          .eq('comercio_id', comercioId)
          .maybeSingle();
      isFollowing = followRes != null;

    } catch (e) {
      debugPrint('Error cargando perfil de tienda: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFollow(String comercioId) async {
    isActionLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      if (isFollowing) {
        await _supabase
            .from('seguidores_comercios')
            .delete()
            .eq('usuario_id', userId)
            .eq('comercio_id', comercioId);
        isFollowing = false;
      } else {
        await _supabase.from('seguidores_comercios').insert({
          'usuario_id': userId,
          'comercio_id': comercioId,
        });
        isFollowing = true;
      }
    } catch (e) {
      debugPrint('Error al seguir/dejar de seguir: $e');
    } finally {
      isActionLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/client_validation_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientValidationController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> pendingValidations = [];

  ClientValidationController() {
    loadPendingValidations();
  }

  Future<void> loadPendingValidations() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // Buscamos compras completadas que NO hayan sido validadas por el cliente
      final response = await _supabase
          .from('compras')
          .select('*, comercios(nombre_comercial, logo_url)')
          .eq('usuario_id', userId)
          .eq('estado', 'Completado')
          .eq('validado_por_cliente', false)
          .order('fecha_compra', ascending: false);

      pendingValidations = response;
    } catch (e) {
      debugPrint('Error cargando validaciones: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> submitValidation({
    required String compraId,
    required bool recibido,
    required bool buenEstado,
    DateTime? fechaCaducidad,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      await _supabase.rpc('validate_purchase', params: {
        'p_compra_id': compraId,
        'p_recibido': recibido,
        'p_buen_estado': buenEstado,
        'p_fecha_caducidad': fechaCaducidad?.toIso8601String().split('T')[0], // Solo la fecha YYYY-MM-DD
      });

      await loadPendingValidations(); // Recargar la lista
      return true;
    } catch (e) {
      debugPrint('Error al validar compra: $e');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/coupon_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CouponController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> coupons = [];
  String? errorMessage;

  CouponController() {
    loadCoupons();
  }

  Future<void> loadCoupons() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      final response = await _supabase
          .from('cupones')
          .select('*')
          .eq('comercio_id', comercioId)
          .order('fecha_expiracion', ascending: true);

      coupons = response;
    } catch (e) {
      debugPrint('Error cargando cupones: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createCoupon({
    required String code,
    required int discount,
    required int maxUses,
    required DateTime expirationDate,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      await _supabase.from('cupones').insert({
        'codigo': code.toUpperCase().trim(),
        'comercio_id': comercioId,
        'descuento_porcentaje': discount,
        'usos_maximos': maxUses,
        'fecha_expiracion': expirationDate.toIso8601String(),
      });

      await loadCoupons();
      return true;
    } catch (e) {
      debugPrint('Error creando cupón: $e');
      errorMessage = 'Error al crear el cupón. Asegúrate de que el código no exista.';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCoupon(String couponId) async {
    try {
      await _supabase.from('cupones').delete().eq('id', couponId);
      await loadCoupons();
    } catch (e) {
      debugPrint('Error eliminando cupón: $e');
    }
  }
}```

### 📄 lib/controllers/guided_purchase_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GuidedPurchaseController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  
  List<Map<String, dynamic>> optimizedBasket = [];
  List<Map<String, dynamic>> outOfBudgetItems = [];
  double totalSpent = 0.0;

  Future<bool> optimizeBasket({
    required double budget,
    required String category,
    required List<Map<String, dynamic>> requestedItems,
  }) async {
    isLoading = true;
    errorMessage = null;
    optimizedBasket.clear();
    outOfBudgetItems.clear();
    totalSpent = 0.0;
    notifyListeners();

    try {
      // 1. Obtener todas las ofertas activas de la categoría
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .eq('categoria', category);

      List<dynamic> allOffers = response;
      
      if (allOffers.isEmpty) {
        throw Exception('No hay ofertas disponibles en esta categoría.');
      }

      // 2. Encontrar la oferta más barata para cada producto solicitado
      List<Map<String, dynamic>> availableItems = [];

      for (var requested in requestedItems) {
        final productName = requested['nombre'].toString().toLowerCase();
        final quantity = int.tryParse(requested['cantidad'].toString()) ?? 1;

        // Filtrar ofertas que coincidan con el nombre
        final matches = allOffers.where((o) => 
          o['producto_nombre'].toString().toLowerCase().contains(productName)
        ).toList();

        if (matches.isNotEmpty) {
          // Ordenar para encontrar el más barato
          matches.sort((a, b) {
            final priceA = (a['precio_oferta'] as num?)?.toDouble() ?? (a['precio_regular'] as num).toDouble();
            final priceB = (b['precio_oferta'] as num?)?.toDouble() ?? (b['precio_regular'] as num).toDouble();
            return priceA.compareTo(priceB);
          });

          final cheapest = matches.first;
          final unitPrice = (cheapest['precio_oferta'] as num?)?.toDouble() ?? (cheapest['precio_regular'] as num).toDouble();
          final totalCost = unitPrice * quantity;

          availableItems.add({
            'oferta': cheapest,
            'requested_qty': quantity,
            'unit_price': unitPrice,
            'total_cost': totalCost,
          });
        }
      }

      // 3. Aplicar Algoritmo Voraz (Greedy): Ordenar por costo total (más baratos primero)
      availableItems.sort((a, b) => (a['total_cost'] as double).compareTo(b['total_cost'] as double));

      double currentSpent = 0.0;

      for (var item in availableItems) {
        final cost = item['total_cost'] as double;

        if (currentSpent + cost <= budget) {
          optimizedBasket.add(item);
          currentSpent += cost;
        } else {
          // Si no cabe, intentar comprar menos unidades
          final unitPrice = item['unit_price'] as double;
          int affordableQty = ((budget - currentSpent) / unitPrice).floor();

          if (affordableQty > 0) {
            item['requested_qty'] = affordableQty; // Reducir cantidad
            item['total_cost'] = unitPrice * affordableQty;
            optimizedBasket.add(item);
            currentSpent += (unitPrice * affordableQty);
          } else {
            outOfBudgetItems.add(item);
          }
        }
      }

      totalSpent = currentSpent;
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
```

### 📄 lib/controllers/merchant_ads_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantAdsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isProcessing = false;
  List<dynamic> myOffers = [];
  List<dynamic> myCampaigns = [];
  
  String? errorMessage;
  String? successMessage;

  // Precios configurables (En producción, esto vendría de una tabla de configuración)
  final double precioPorDia = 1.0; // $1 por día

  MerchantAdsController() {
    loadData();
  }

  Future<void> loadData() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // 1. Cargar ofertas activas del comercio
      final offersRes = await _supabase
          .from('ofertas')
          .select('*')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Activa')
          .order('fecha_creacion', ascending: false);
      myOffers = offersRes;

      // 2. Cargar campañas activas del comercio
      final campaignsRes = await _supabase
          .from('campanas_publicidad')
          .select('*, ofertas(producto_nombre)')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Activa')
          .order('fecha_fin', ascending: true);
      myCampaigns = campaignsRes;

    } catch (e) {
      debugPrint('Error cargando datos de anuncios: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> buyAd({required String offerId, required int days}) async {
    isProcessing = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Calcular monto
      final total = precioPorDia * days;
      final fechaFin = DateTime.now().add(Duration(days: days));

      // Insertar la campaña
      await _supabase.from('campanas_publicidad').insert({
        'comercio_id': comercioId,
        'oferta_id': offerId,
        'dias_duracion': days,
        'monto_pagado': total,
        'estado': 'Activa',
        'fecha_fin': fechaFin.toIso8601String(),
      });

      successMessage = '¡Campaña creada con éxito! Tu oferta aparecerá destacada por $days días.';
      await loadData();
      return true;
    } catch (e) {
      debugPrint('Error al comprar anuncio: $e');
      errorMessage = e.toString();
      return false;
    } finally {
      isProcessing = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/merchant_earnings_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantEarningsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> transactions = [];
  
  double totalHoy = 0.0;
  double totalSemana = 0.0;
  double totalMes = 0.0;
  double totalHistorico = 0.0;

  MerchantEarningsController() {
    loadEarnings();
  }

  Future<void> loadEarnings() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Buscamos las compras completadas
      final response = await _supabase
          .from('compras')
          .select('*, usuarios(nombre)')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Completado')
          .order('fecha_compra', ascending: false);

      transactions = response;

      // Calculamos los totales
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final startOfMonth = DateTime(now.year, now.month, 1);

      double tHoy = 0, tSemana = 0, tMes = 0, tHist = 0;

      for (var t in transactions) {
        final amount = (t['total_pagado'] as num).toDouble();
        final date = DateTime.parse(t['fecha_compra']).toLocal();
        
        tHist += amount;

        if (date.isAfter(startOfMonth)) tMes += amount;
        if (date.isAfter(startOfWeek)) tSemana += amount;
        if (date.isAfter(startOfDay)) tHoy += amount;
      }

      totalHoy = tHoy;
      totalSemana = tSemana;
      totalMes = tMes;
      totalHistorico = tHist;

    } catch (e) {
      debugPrint('Error cargando ganancias: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/merchant_pools_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantPoolsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isCreating = false;
  List<dynamic> myPools = [];
  String? errorMessage;

  MerchantPoolsController() {
    loadMyPools();
  }

  Future<void> loadMyPools() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Nota: La tabla pools_comunitarios en tu esquema actual no tiene comercio_id.
      // Si no lo tiene, simplemente traemos todos los pools.
      final response = await _supabase
          .from('pools_comunitarios')
          .select('*, pools_participantes(count)')
          .order('fecha_creacion', ascending: false);

      myPools = response;
    } catch (e) {
      debugPrint('Error cargando pools: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createPool({
    required String productName,
    required int targetUsers,
    required double wholesalePrice,
  }) async {
    isCreating = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _supabase.from('pools_comunitarios').insert({
        'producto_nombre': productName.trim(),
        'meta_usuarios': targetUsers,
        'precio_mayorista_sugerido': wholesalePrice,
        'estado': 'Recaudando',
      });

      await loadMyPools();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isCreating = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/merchant_profile_controller.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class MerchantProfileController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  bool isSuccess = false;

  // Archivos en memoria
  Uint8List? logoBytes; String? logoName;
  Uint8List? fachadaBytes; String? fachadaName;
  Uint8List? rifBytes; String? rifName;
  Uint8List? legalBytes; String? legalName;
  Uint8List? cedulasBytes; String? cedulasName;

  // Geolocalización
  double? latitud;
  double? longitud;

  void setImage(String type, Uint8List bytes, String name) {
    if (type == 'logo') { logoBytes = bytes; logoName = name; }
    if (type == 'fachada') { fachadaBytes = bytes; fachadaName = name; }
    notifyListeners();
  }

  void setPdf(String type, Uint8List bytes, String name) {
    if (type == 'rif') { rifBytes = bytes; rifName = name; }
    if (type == 'legal') { legalBytes = bytes; legalName = name; }
    if (type == 'cedulas') { cedulasBytes = bytes; cedulasName = name; }
    notifyListeners();
  }

  void setLocation(double lat, double lng) {
    latitud = lat;
    longitud = lng;
    notifyListeners();
  }

  Future<String?> _uploadToBucket(Uint8List bytes, String fileName, String bucket, String prefix) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final ext = p.extension(fileName);
      final finalName = '${prefix}_$userId$ext';
      final path = '$userId/$finalName';

      await _supabase.storage.from(bucket).uploadBinary(path, bytes, fileOptions: const FileOptions(upsert: true));

      if (bucket == 'comercios_assets') return _supabase.storage.from(bucket).getPublicUrl(path);
      return path;
    } catch (e) {
      debugPrint('❌ Error subiendo a $bucket: $e');
      return null;
    }
  }

  Future<bool> submitProfile({
    required String name,
    required String rif,
    required String address,
    required String branch,
    required String repName,
    required String repCedula,
    required String phone,
    required String email,
    required String ig,
    required String tiktok,
    required String fb,
    required String x,
    required String wa,
    required String tipoComercio,
    required String categoria,
    required bool aceptaDelivery,
    required int parroquiaId, // <-- NUEVO PARÁMETRO
  }) async {
    isLoading = true;
    errorMessage = null;
    isSuccess = false;
    notifyListeners();

    final userId = _supabase.auth.currentUser!.id;

    try {
      final logoUrl = await _uploadToBucket(logoBytes!, logoName!, 'comercios_assets', 'logo');
      final fachadaUrl = await _uploadToBucket(fachadaBytes!, fachadaName!, 'comercios_assets', 'fachada');
      final docRifUrl = await _uploadToBucket(rifBytes!, rifName!, 'documentos_comercios', 'rif');
      final docLegalUrl = await _uploadToBucket(legalBytes!, legalName!, 'documentos_comercios', 'legal');
      final docCedulasUrl = await _uploadToBucket(cedulasBytes!, cedulasName!, 'documentos_comercios', 'cedulas');

      if (logoUrl == null || fachadaUrl == null || docRifUrl == null || docLegalUrl == null || docCedulasUrl == null) {
        throw Exception('No se pudieron subir todos los archivos.');
      }

      final redes = {
        'instagram': ig.trim(), 'tiktok': tiktok.trim(),
        'facebook': fb.trim(), 'x': x.trim(), 'whatsapp': wa.trim(),
      };

      final pointWkt = 'POINT($longitud $latitud)';

      await _supabase.from('comercios').update({
        'nombre_comercial': name.trim(),
        'tipo_comercio': tipoComercio,
        'categoria': categoria,
        'rif': rif.trim(),
        'direccion_texto': address.trim(),
        'rama': branch.trim(),
        'representante': repName.trim(),
        'cedula': repCedula.trim(),
        'telefono_empresa': phone.trim(),
        'email_empresa': email.trim(),
        'acepta_delivery': aceptaDelivery,
        'redes_sociales': redes,
        'logo_url': logoUrl,
        'foto_fachada_url': fachadaUrl,
        'doc_rif_url': docRifUrl,
        'doc_constitutivo_url': docLegalUrl,
        'doc_cedulas_url': docCedulasUrl,
        'estatus_verificacion': 'En Revision', 
        'latitud': latitud,
        'longitud': longitud,
        'ubicacion_fisica': pointWkt,
        'parroquia_id': parroquiaId, // <-- GUARDAMOS LA PARROQUIA
      }).eq('usuario_id', userId);

      // Invocación a la IA en segundo plano
      try {
        final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
        await _supabase.functions.invoke('validate-merchant-docs', body: {
          'merchant_id': comercioData['id'],
          'doc_rif_path': docRifUrl,
          'doc_legal_path': docLegalUrl,
          'doc_cedulas_path': docCedulasUrl,
          'form_data': {'rif': rif.trim(), 'nombre': name.trim()}
        });
      } catch (e) {
        debugPrint('⚠️ Error IA: $e');
      }

      isSuccess = true;
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/merchant_reviews_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantReviewsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> reviews = [];
  
  double averageRating = 0.0;
  double averageProductQuality = 0.0;
  double averageService = 0.0;

  MerchantReviewsController() {
    loadReviews();
  }

  Future<void> loadReviews() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Buscamos las compras completadas y validadas por el cliente
      final response = await _supabase
          .from('compras')
          .select('*, usuarios(nombre)')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Completado')
          .eq('validado_por_cliente', true)
          .order('fecha_validacion', ascending: false);

      // Filtramos solo las que tienen calificación
      reviews = response.where((r) => r['calificacion_estado'] != null && r['calificacion_atencion'] != null).toList();

      if (reviews.isNotEmpty) {
        double sumTotal = 0;
        double sumQuality = 0;
        double sumService = 0;

        for (var r in reviews) {
          final quality = (r['calificacion_estado'] as num).toDouble();
          final service = (r['calificacion_atencion'] as num).toDouble();
          
          sumQuality += quality;
          sumService += service;
          sumTotal += (quality + service) / 2;
        }

        averageProductQuality = sumQuality / reviews.length;
        averageService = sumService / reviews.length;
        averageRating = sumTotal / reviews.length;
      }

    } catch (e) {
      debugPrint('Error cargando reseñas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/merchant_scan_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantScanController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? purchaseData;
  bool isSuccess = false;

  // Porcentaje de comisión de la plataforma (5%)
  final double commissionRate = 5.0; 

  Future<void> processScan(String qrToken) async {
    isLoading = true;
    errorMessage = null;
    isSuccess = false;
    purchaseData = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Obtener el ID del comercio
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // 2. Buscar la compra por el token del QR
      final compra = await _supabase
          .from('compras')
          .select('*, usuarios(nombre)')
          .eq('qr_token', qrToken)
          .maybeSingle();

      if (compra == null) {
        throw Exception('Código QR no válido o compra no encontrada.');
      }

      // 3. Validar que la compra sea de este comercio
      if (compra['comercio_id'] != comercioId) {
        throw Exception('Esta compra pertenece a otro comercio.');
      }

      // 4. Validar que no esté ya completada
      if (compra['estado'] == 'Completado') {
        throw Exception('Esta compra ya fue escaneada y completada.');
      }

      // 5. Actualizar el estado de la compra
      await _supabase.from('compras').update({
        'estado': 'Completado',
        'fecha_validacion': DateTime.now().toIso8601String(),
      }).eq('id', compra['id']);

      // 6. Registrar la comisión para el Owner
      try {
        await _supabase.rpc('registrar_comision', params: {
          'p_compra_id': compra['id'],
          'p_porcentaje': commissionRate,
        });
      } catch (e) {
        // Si falla la comisión, no bloqueamos la venta
        debugPrint('⚠️ Error registrando comisión: $e');
      }

      purchaseData = compra;
      isSuccess = true;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/merchant_store_controller.dart
```dart
import 'dart:typed_data'; // <-- IMPORTACIÓN QUE FALTABA
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class MerchantStoreController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isSaving = false;
  String? errorMessage;
  String? successMessage;

  // Datos de la tienda
  String nombre = '';
  String categoria = 'Otros';
  String direccion = '';
  String telefono = '';
  String email = '';
  String logoUrl = '';
  bool aceptaDelivery = false;
  
  // Redes sociales
  String instagram = '';
  String tiktok = '';
  String facebook = '';
  String whatsapp = '';
  String x = '';

  Uint8List? _newLogoBytes;
  String? _newLogoName;

  MerchantStoreController() {
    loadStoreData();
  }

  Future<void> loadStoreData() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final data = await _supabase
          .from('comercios')
          .select('*')
          .eq('usuario_id', userId)
          .single();

      nombre = data['nombre_comercial'] ?? '';
      categoria = data['categoria'] ?? 'Otros';
      direccion = data['direccion_texto'] ?? '';
      telefono = data['telefono_empresa'] ?? '';
      email = data['email_empresa'] ?? '';
      logoUrl = data['logo_url'] ?? '';
      aceptaDelivery = data['acepta_delivery'] ?? false;
      
      final redes = data['redes_sociales'] as Map<String, dynamic>? ?? {};
      instagram = redes['instagram'] ?? '';
      tiktok = redes['tiktok'] ?? '';
      facebook = redes['facebook'] ?? '';
      whatsapp = redes['whatsapp'] ?? '';
      x = redes['x'] ?? '';
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setNewLogo(Uint8List bytes, String name) {
    _newLogoBytes = bytes;
    _newLogoName = name;
    notifyListeners();
  }

  Future<bool> saveChanges({
    required String newName,
    required String newCategory,
    required String newAddress,
    required String newPhone,
    required String newEmail,
    required bool newDelivery,
    required String newIg,
    required String newTiktok,
    required String newFb,
    required String newWa,
    required String newX,
  }) async {
    isSaving = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Si hay un logo nuevo, lo subimos a Storage
      String finalLogoUrl = logoUrl;
      if (_newLogoBytes != null && _newLogoName != null) {
        final ext = p.extension(_newLogoName!);
        final finalName = 'logo_${DateTime.now().millisecondsSinceEpoch}$ext';
        final path = '$userId/$finalName';

        await _supabase.storage.from('comercios_assets').uploadBinary(
          path, _newLogoBytes!, fileOptions: const FileOptions(upsert: true)
        );
        finalLogoUrl = _supabase.storage.from('comercios_assets').getPublicUrl(path);
      }

      // 2. Actualizamos la base de datos
      await _supabase.from('comercios').update({
        'nombre_comercial': newName.trim(),
        'categoria': newCategory,
        'direccion_texto': newAddress.trim(),
        'telefono_empresa': newPhone.trim(),
        'email_empresa': newEmail.trim(),
        'acepta_delivery': newDelivery,
        'logo_url': finalLogoUrl,
        'redes_sociales': {
          'instagram': newIg.trim(),
          'tiktok': newTiktok.trim(),
          'facebook': newFb.trim(),
          'whatsapp': newWa.trim(),
          'x': newX.trim(),
        }
      }).eq('usuario_id', userId);

      nombre = newName.trim();
      categoria = newCategory;
      direccion = newAddress.trim();
      telefono = newPhone.trim();
      email = newEmail.trim();
      aceptaDelivery = newDelivery;
      logoUrl = finalLogoUrl;

      successMessage = '¡Información actualizada con éxito!';
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/nearby_offers_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NearbyOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  String? errorMessage;
  List<dynamic> nearbyOffers = [];
  Position? currentPosition;

  NearbyOffersController() {
    loadNearbyOffers();
  }

  Future<void> loadNearbyOffers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. Verificar permisos de GPS
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception('Por favor, activa tu GPS.');

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) throw Exception('Permisos de ubicación denegados.');
      }

      // 2. Obtener posición actual
      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 3. Consultar ofertas en un radio de 5000 metros (5KM)
      final response = await _supabase.rpc('obtener_ofertas_cercanas', params: {
        'lat': currentPosition!.latitude,
        'lng': currentPosition!.longitude,
        'radio_metros': 5000, 
      });

      nearbyOffers = response;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/nearby_offers_map_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../core/theme/app_theme.dart';
import '../controllers/nearby_offers_controller.dart';
import 'client_checkout_screen.dart';

class NearbyOffersMapScreen extends StatefulWidget {
  const NearbyOffersMapScreen({super.key});

  @override
  State<NearbyOffersMapScreen> createState() => _NearbyOffersMapScreenState();
}

class _NearbyOffersMapScreenState extends State<NearbyOffersMapScreen> {
  final _mapController = MapController();
  final _nearbyController = NearbyOffersController();
  dynamic _selectedOffer;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _nearbyController,
      builder: (context, child) {
        if (_nearbyController.isLoading) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.primaryPurple),
                  SizedBox(height: 16),
                  Text('Buscando ofertas cerca de ti...', style: TextStyle(color: AppColors.textLight)),
                ],
              ),
            ),
          );
        }

        if (_nearbyController.errorMessage != null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Ofertas Cercanas')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_off, size: 80, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(_nearbyController.errorMessage!, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textDark)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _nearbyController.loadNearbyOffers,
                    child: const Text('Reintentar'),
                  )
                ],
              ),
            ),
          );
        }

        final userLat = _nearbyController.currentPosition!.latitude;
        final userLng = _nearbyController.currentPosition!.longitude;

        return Scaffold(
          appBar: AppBar(title: const Text('Ofertas Cercanas')),
          body: Stack(
            children: [
              // MAPA
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(userLat, userLng),
                  initialZoom: 14.0,
                  onTap: (_, __) => setState(() => _selectedOffer = null), // Cierra la tarjeta al tocar el mapa
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.ofve.app',
                  ),
                  
                  // MARCADORES DE OFERTAS
                  MarkerLayer(
                    markers: _nearbyController.nearbyOffers.map((oferta) {
                      return Marker(
                        point: LatLng(oferta['latitud'], oferta['longitud']),
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedOffer = oferta);
                            _mapController.move(LatLng(oferta['latitud'], oferta['longitud']), 15.0);
                          },
                          child: const Icon(Icons.location_on, color: AppColors.primaryPurple, size: 45),
                        ),
                      );
                    }).toList(),
                  ),

                  // MARCADOR DEL CLIENTE
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(userLat, userLng),
                        width: 40,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.info.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.my_location, color: AppColors.info, size: 24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // BOTÓN DE RECARGAR
              Positioned(
                top: 16,
                right: 16,
                child: FloatingActionButton.small(
                  backgroundColor: AppColors.white,
                  onPressed: _nearbyController.loadNearbyOffers,
                  child: const Icon(Icons.refresh, color: AppColors.primaryPurple),
                ),
              ),

              // TARJETA DE OFERTA SELECCIONADA
              if (_selectedOffer != null)
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10))],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_selectedOffer['nombre_comercio'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textDark)),
                        const SizedBox(height: 4),
                        Text(_selectedOffer['direccion'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                        const Divider(height: 24),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: (_selectedOffer['fachada_url'] != null && _selectedOffer['fachada_url'].toString().isNotEmpty)
                                  ? Image.network(_selectedOffer['fachada_url'], width: 60, height: 60, fit: BoxFit.cover)
                                  : Container(width: 60, height: 60, color: Colors.grey[200], child: const Icon(Icons.store, color: Colors.grey)),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_selectedOffer['nombre_oferta'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Text('A ${(_selectedOffer['distancia_metros'] as num).toStringAsFixed(0)} metros de ti', style: const TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Text('\$${_selectedOffer['precio']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPurple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              // Navegar al Checkout pasando la oferta seleccionada
                              Navigator.push(context, MaterialPageRoute(
                                builder: (_) => ClientCheckoutScreen(
                                  oferta: {
                                    'id': _selectedOffer['oferta_id'],
                                    'comercio_id': _selectedOffer['comercio_id'],
                                    'producto_nombre': _selectedOffer['nombre_oferta'],
                                    'precio_oferta': _selectedOffer['precio'],
                                    'precio_regular': _selectedOffer['precio'],
                                    'imagen_url': _selectedOffer['fachada_url'],
                                  },
                                ),
                              ));
                            },
                            child: const Text('Ver y Comprar', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}```

### 📄 lib/controllers/notifications_controller.dart
```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  
  StreamSubscription<List<Map<String, dynamic>>>? _subscription;
  List<Map<String, dynamic>> notifications = [];
  int unreadCount = 0;

  NotificationsController() {
    _initRealtime();
  }

  void _initRealtime() {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    // Escuchar en tiempo real los cambios en la tabla
    _subscription = _supabase
        .from('notificaciones')
        .stream(primaryKey: ['id'])
        .eq('usuario_id', userId)
        .order('created_at')
        .listen((data) {
      notifications = data;
      unreadCount = notifications.where((n) => n['leida'] == false).length;
      notifyListeners();
    });
  }

  Future<void> markAsRead(String id) async {
    try {
      await _supabase.from('notificaciones').update({'leida': true}).eq('id', id);
    } catch (e) {
      debugPrint('Error marcando notificación como leída: $e');
    }
  }

  Future<void> markAllAsRead() async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      await _supabase.from('notificaciones').update({'leida': true}).eq('usuario_id', userId).eq('leida', false);
    } catch (e) {
      debugPrint('Error marcando todas como leídas: $e');
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}```

### 📄 lib/controllers/offer_controller.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class OfferController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;

  Future<String?> _uploadImage(Uint8List imageBytes, String imageName) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final ext = p.extension(imageName);
      final finalName = 'oferta_${DateTime.now().millisecondsSinceEpoch}$ext';
      final path = '$userId/$finalName';

      await _supabase.storage.from('productos_imagenes').uploadBinary(
        path, 
        imageBytes,
        fileOptions: const FileOptions(upsert: true),
      );

      return _supabase.storage.from('productos_imagenes').getPublicUrl(path);
    } catch (e) {
      debugPrint('Error subiendo imagen: $e');
      return null;
    }
  }

  Future<bool> createOffer({
    required String nombre,
    required String descripcion,
    required String categoria,
    required double precioRegular,
    required double precioOferta,
    required int stock,
    Uint8List? imageBytes,
    String? imageName,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. MODERACIÓN CON IA (ANTES DE GUARDAR)
      final aiResponse = await _supabase.functions.invoke(
        'moderate-content',
        body: {'title': nombre, 'description': descripcion},
      );

      if (aiResponse.status != 200) throw Exception('Error en el servidor de moderación.');
      
      final aiData = aiResponse.data;

      // Si contiene contenido prohibido, bloqueamos
      if (aiData['es_prohibido'] == true) {
        throw Exception('Publicación bloqueada: ${aiData['motivo_rechazo']}');
      }

      // Si contiene un animal no permitido, guardamos solicitud y bloqueamos
      if (aiData['contiene_animal'] == true && aiData['animal_permitido'] == false) {
        final userId = _supabase.auth.currentUser!.id;
        await _supabase.from('solicitudes_animales').insert({
          'usuario_id': userId,
          'nombre_animal': aiData['animal_solicitado'] ?? nombre,
          'descripcion_venta': descripcion,
        });
        throw Exception('Este animal no está permitido para venta directa. Hemos enviado una solicitud al Administrador para su aprobación.');
      }

      // 2. SUBIR IMAGEN Y GUARDAR
      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercioData['id'];

      String? imageUrl;
      if (imageBytes != null && imageName != null) {
        imageUrl = await _uploadImage(imageBytes, imageName);
      }

      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': nombre.trim(),
        'descripcion': descripcion.trim(),
        'categoria': categoria,
        'precio_regular': precioRegular,
        'precio_oferta': precioOferta,
        'es_oferta': true,
        'stock': stock,
        'imagen_url': imageUrl,
        'estado': 'Activa',
        'fecha_inicio': DateTime.now().toIso8601String(),
        'fecha_fin': DateTime.now().add(const Duration(days: 7)).toIso8601String(),
      });

      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createInventoryProduct({
    required String nombre,
    required String descripcion,
    required String categoria,
    required double precioRegular,
    required int stock,
    Uint8List? imageBytes,
    String? imageName,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. MODERACIÓN CON IA (ANTES DE GUARDAR)
      final aiResponse = await _supabase.functions.invoke(
        'moderate-content',
        body: {'title': nombre, 'description': descripcion},
      );

      if (aiResponse.status != 200) throw Exception('Error en el servidor de moderación.');
      
      final aiData = aiResponse.data;

      // Si contiene contenido prohibido, bloqueamos
      if (aiData['es_prohibido'] == true) {
        throw Exception('Publicación bloqueada: ${aiData['motivo_rechazo']}');
      }

      // Si contiene un animal no permitido, guardamos solicitud y bloqueamos
      if (aiData['contiene_animal'] == true && aiData['animal_permitido'] == false) {
        final userId = _supabase.auth.currentUser!.id;
        await _supabase.from('solicitudes_animales').insert({
          'usuario_id': userId,
          'nombre_animal': aiData['animal_solicitado'] ?? nombre,
          'descripcion_venta': descripcion,
        });
        throw Exception('Este animal no está permitido para venta directa. Hemos enviado una solicitud al Administrador.');
      }

      // 2. SUBIR IMAGEN Y GUARDAR
      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercioData['id'];

      String? imageUrl;
      if (imageBytes != null && imageName != null) {
        imageUrl = await _uploadImage(imageBytes, imageName);
      }

      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': nombre.trim(),
        'descripcion': descripcion.trim(),
        'categoria': categoria,
        'precio_regular': precioRegular,
        'precio_oferta': null, // Sin oferta
        'es_oferta': false,
        'stock': stock,
        'imagen_url': imageUrl,
        'estado': 'Activo',
        'fecha_inicio': DateTime.now().toIso8601String(),
      });

      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/owner_audit_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerAuditController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> logs = [];
  String selectedFilter = 'Todos';

  final List<String> filters = ['Todos', 'Comercios', 'Ofertas', 'Pagos'];

  OwnerAuditController() {
    loadLogs();
  }

  Future<void> loadLogs() async {
    isLoading = true;
    notifyListeners();

    try {
      // 1. Iniciamos la consulta SIN el order ni limit todavía
      var query = _supabase
          .from('audit_logs')
          .select('*, usuarios(nombre, email)');

      // 2. Aplicamos el filtro si es necesario
      if (selectedFilter != 'Todos') {
        String tableName = '';
        if (selectedFilter == 'Comercios') tableName = 'comercios';
        if (selectedFilter == 'Ofertas') tableName = 'ofertas';
        if (selectedFilter == 'Pagos') tableName = 'solicitudes_suscripcion';
        
        query = query.eq('tabla_afectada', tableName);
      }

      // 3. AHORA SÍ, ordenamos y limitamos al final
      final response = await query
          .order('created_at', ascending: false)
          .limit(100);
          
      logs = response;
    } catch (e) {
      debugPrint('Error cargando auditoría: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setFilter(String filter) {
    selectedFilter = filter;
    loadLogs();
  }
}```

### 📄 lib/controllers/owner_config_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerConfigController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  String? errorMessage;

  // Variables de estado
  bool iaGlobalActiva = true;
  bool poolsActivos = true;
  bool appEnMantenimiento = false;
  bool soporteActivo = true;
  bool notificacionesActivas = true;

  OwnerConfigController() {
    loadConfig();
  }

  Future<void> loadConfig() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _supabase
          .from('configuracion_global')
          .select('*')
          .eq('id', 1)
          .single();

      iaGlobalActiva = response['ia_global_activa'] ?? true;
      poolsActivos = response['pools_activos'] ?? true;
      appEnMantenimiento = response['app_en_mantenimiento'] ?? false;
      soporteActivo = response['soporte_activo'] ?? true;
      notificacionesActivas = response['notificaciones_activas'] ?? true;
    } catch (e) {
      debugPrint('Error cargando configuración global: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleConfig(String column, bool value) async {
    try {
      // Actualizamos la base de datos
      await _supabase
          .from('configuracion_global')
          .update({column: value})
          .eq('id', 1);

      // Actualizamos el estado local
      if (column == 'ia_global_activa') iaGlobalActiva = value;
      if (column == 'pools_activos') poolsActivos = value;
      if (column == 'app_en_mantenimiento') appEnMantenimiento = value;
      if (column == 'soporte_activo') soporteActivo = value;
      if (column == 'notificaciones_activas') notificacionesActivas = value;

      notifyListeners();
    } catch (e) {
      debugPrint('Error al cambiar configuración: $e');
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/owner_config_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_config_controller.dart';

class OwnerConfigScreen extends StatefulWidget {
  const OwnerConfigScreen({super.key});

  @override
  State<OwnerConfigScreen> createState() => _OwnerConfigScreenState();
}

class _OwnerConfigScreenState extends State<OwnerConfigScreen> {
  final _configController = OwnerConfigController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _configController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Configuración Global')),
          body: _configController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ALERTA DE MANTENIMIENTO
                      if (_configController.appEnMantenimiento)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.error.withOpacity(0.1),
                            border: Border.all(color: AppColors.error),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 30),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'La app está en MANTENIMIENTO. Ningún cliente podrá acceder hasta que desactives esta opción.',
                                  style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                      const Text('Módulos de la Aplicación', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),

                      // TARJETA DE CONFIGURACIÓN
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: Column(
                          children: [
                            // 1. MANTENIMIENTO
                            SwitchListTile(
                              title: const Text('Modo Mantenimiento', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Bloquea el acceso a los clientes'),
                              value: _configController.appEnMantenimiento,
                              activeColor: AppColors.error,
                              secondary: const Icon(Icons.build_circle, color: AppColors.error),
                              onChanged: (val) => _configController.toggleConfig('app_en_mantenimiento', val),
                            ),
                            const Divider(height: 1),

                            // 2. IA GLOBAL
                            SwitchListTile(
                              title: const Text('Asistente IA', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Habilita/Deshabilita el uso de IA en toda la app'),
                              value: _configController.iaGlobalActiva,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.smart_toy, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('ia_global_activa', val),
                            ),
                            const Divider(height: 1),

                            // 3. POOLS COMUNITARIOS
                            SwitchListTile(
                              title: const Text('Pools Comunitarios', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Permite a los usuarios unirse a compras grupales'),
                              value: _configController.poolsActivos,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.groups, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('pools_activos', val),
                            ),
                            const Divider(height: 1),

                            // 4. SOPORTE
                            SwitchListTile(
                              title: const Text('Módulo de Soporte', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Permite a los usuarios abrir tickets de ayuda'),
                              value: _configController.soporteActivo,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.support_agent, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('soporte_activo', val),
                            ),
                            const Divider(height: 1),

                            // 5. NOTIFICACIONES
                            SwitchListTile(
                              title: const Text('Notificaciones Push', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Habilita el envío de alertas a los usuarios'),
                              value: _configController.notificacionesActivas,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.notifications_active, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('notificaciones_activas', val),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // NOTA INFORMATIVA
                      const Text(
                        'Nota: Los cambios realizados aquí se aplican en tiempo real en toda la plataforma. Úsalos con precaución.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
```

### 📄 lib/controllers/owner_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  int totalUsuarios = 0;
  int totalComercios = 0;
  int totalOfertas = 0;

  OwnerController() {
    loadGlobalStats();
  }

  Future<void> loadGlobalStats() async {
    isLoading = true;
    notifyListeners();
    try {
      final users = await _supabase.from('usuarios').select('id').count();
      final merchants = await _supabase.from('comercios').select('id').count();
      final offers = await _supabase.from('ofertas').select('id').count();

      totalUsuarios = users.count;
      totalComercios = merchants.count;
      totalOfertas = offers.count;
    } catch (e) {
      debugPrint('Error cargando métricas owner: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/owner_financial_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerFinancialController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  
  double totalSuscripciones = 0.0;
  double totalPublicidad = 0.0;
  double totalVentasApp = 0.0;
  double totalComisiones = 0.0; // <-- NUEVA VARIABLE

  OwnerFinancialController() {
    loadStats();
  }

  Future<void> loadStats() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase.rpc('get_owner_financial_stats');
      
      final data = response as Map<String, dynamic>;
      totalSuscripciones = (data['suscripciones'] as num?)?.toDouble() ?? 0.0;
      totalPublicidad = (data['publicidad'] as num?)?.toDouble() ?? 0.0;
      totalVentasApp = (data['ventas_app'] as num?)?.toDouble() ?? 0.0;
      totalComisiones = (data['comisiones'] as num?)?.toDouble() ?? 0.0; // <-- PARSEAMOS LA COMISIÓN
      
    } catch (e) {
      debugPrint('Error cargando finanzas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/owner_plans_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerPlansController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> planes = [];
  bool iaGlobalActiva = true;

  OwnerPlansController() {
    loadData();
  }

  Future<void> loadData() async {
    isLoading = true;
    notifyListeners();

    try {
      // 1. Obtener planes con sus características
      final planesRes = await _supabase
          .from('planes_suscripcion')
          .select('*, plan_caracteristicas(*)')
          .order('precio', ascending: true);
      
      // 2. Obtener configuración global de la IA
      final configRes = await _supabase
          .from('configuracion_global')
          .select('ia_global_activa')
          .eq('id', 1)
          .single();
      
      planes = planesRes;
      iaGlobalActiva = configRes['ia_global_activa'] ?? true;
    } catch (e) {
      debugPrint('Error cargando planes en Owner: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleGlobalIA(bool value) async {
    try {
      await _supabase
          .from('configuracion_global')
          .update({'ia_global_activa': value})
          .eq('id', 1);
      iaGlobalActiva = value;
      notifyListeners();
    } catch (e) {
      debugPrint('Error al cambiar IA global: $e');
    }
  }

  Future<void> updatePlanAI(String planId, bool enabled, int quota) async {
    try {
      await _supabase.from('planes_suscripcion').update({
        'ia_habilitada': enabled,
        'ia_cuota_mensual': quota,
      }).eq('id', planId);
      
      await loadData(); // Recargar para reflejar cambios
    } catch (e) {
      debugPrint('Error al actualizar IA del plan: $e');
    }
  }
  
  Future<void> editarPrecio(String planId, double nuevoPrecio) async {
    try {
      await _supabase
          .from('planes_suscripcion')
          .update({'precio': nuevoPrecio})
          .eq('id', planId);
      await loadData();
    } catch (e) {
      debugPrint('Error al actualizar precio: $e');
    }
  }
}```

### 📄 lib/controllers/purchase_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class PurchaseController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  
  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? purchaseData;

  // Validar y aplicar el cupón (Llama a la función SQL)
  Future<int?> validarCupon(String codigo, String comercioId) async {
    try {
      final response = await _supabase.rpc('validate_and_apply_coupon', params: {
        'p_codigo': codigo,
        'p_comercio_id': comercioId,
      });
      
      return (response as num).toInt(); 
    } catch (e) {
      debugPrint('Error validando cupón: $e');
      errorMessage = e is PostgrestException ? e.message : e.toString();
      return null;
    }
  }

  Future<bool> createPurchase({
    required String comercioId,
    required String ofertaId,
    required double montoFinal, // El monto ya con descuento aplicado
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final qrToken = const Uuid().v4();

      final response = await _supabase.from('compras').insert({
        'usuario_id': userId,
        'comercio_id': comercioId,
        'total_pagado': montoFinal,
        'estado': 'Pendiente',
        'qr_token': qrToken,
        'datos_pago': {'metodo': 'Efectivo/Pago Móvil'},
      }).select().single();

      // OTORGAR PUNTOS AL USUARIO
      await _supabase.rpc('otorgar_puntos_compra', params: {
        'p_compra_id': response['id'],
      });

      purchaseData = response;
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/report_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReportController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<bool> submitReport({
    required String comercioId,
    required String motivo,
    required String descripcion,
  }) async {
    isLoading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Obtener el usuario_id del dueño del comercio (para reportarlo a él)
      final comercio = await _supabase
          .from('comercios')
          .select('usuario_id')
          .eq('id', comercioId)
          .single();
      
      final reportadoId = comercio['usuario_id'];

      // 2. Insertar el reporte en la base de datos
      await _supabase.from('reportes_moderacion').insert({
        'reportante_id': userId,
        'reportado_id': reportadoId,
        'motivo': motivo,
        'descripcion': descripcion.trim(),
        'estado': 'Pendiente',
      });

      successMessage = 'Reporte enviado. Nuestro equipo de moderación lo revisará pronto.';
      return true;
    } catch (e) {
      debugPrint('Error al enviar reporte: $e');
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/subscription_request_controller.dart
```dart
import 'dart:convert'; // <-- IMPORTACIÓN AGREGADA
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SubscriptionRequestController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<bool> submitRequest({
    required String planName,
    required String method,
    required double amount,
    required String reference,
    Uint8List? imageBytes,
    String? imageName,
  }) async {
    isLoading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      String? comprobanteUrl;

      // 1. Subir comprobante a Storage (si existe)
      if (imageBytes != null && imageName != null) {
        final ext = p.extension(imageName);
        final fileName = 'pago_${DateTime.now().millisecondsSinceEpoch}$ext';
        final path = '$userId/$fileName';

        await _supabase.storage.from('comprobantes_pago').uploadBinary(
          path, imageBytes, fileOptions: const FileOptions(upsert: true)
        );
        comprobanteUrl = _supabase.storage.from('comprobantes_pago').getPublicUrl(path);
      }

      // 2. Crear la solicitud en la BD
      final response = await _supabase.from('solicitudes_suscripcion').insert({
        'usuario_id': userId,
        'plan_solicitado': planName,
        'metodo_pago': method,
        'monto': amount,
        'referencia': reference,
        'comprobante_url': comprobanteUrl,
      }).select('id').single();

      final solicitudId = response['id'];

      // 3. Invocar a la Edge Function para verificación
      await _supabase.functions.invoke('verify-payment', body: {
        'solicitud_id': solicitudId,
        'method': method,
        'reference': reference,
        'amount': amount,
        'image_base64': imageBytes != null ? base64Encode(imageBytes) : null,
      });

      successMessage = 'Solicitud enviada. Si la verificación es automática, tu plan se activará en segundos. De lo contrario, un administrador la revisará.';
      return true;

    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}```

### 📄 lib/controllers/user_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  String role = 'user';
  String userName = 'Usuario';
  String userEmail = '';
  String storeName = 'Mi Comercio';
  String planName = 'Básico';
  String category = 'Sin categoría';
  int puntos = 0; // <-- Inicializado en 0

  UserController() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    isLoading = true;
    notifyListeners();

    final user = _supabase.auth.currentUser;
    if (user != null) {
      String detectedRole = 'user';

      try {
        await _supabase.auth.refreshSession();
        // Traemos tanto el rol como los puntos reales
        final dbUser = await _supabase
            .from('usuarios')
            .select('rol, puntos_acumulados')
            .eq('id', user.id)
            .single();
        
        detectedRole = dbUser['rol'] ?? 'user';
        puntos = dbUser['puntos_acumulados'] ?? 0;
      } catch (e) {
        debugPrint('Error consultando rol/puntos: $e');
        detectedRole = user.appMetadata['rol'] ?? user.userMetadata?['rol'] ?? 'user';
      }

      role = detectedRole;
      userName = user.userMetadata?['nombre']?.toString().toUpperCase() ?? 'USUARIO';
      userEmail = user.email ?? '';

      if (role == 'merchant') {
        try {
          var comercio = await _supabase
              .from('comercios')
              .select('nombre_comercial, categoria, planes_suscripcion(nombre)')
              .eq('usuario_id', user.id)
              .maybeSingle();

          if (comercio != null) {
            storeName = comercio['nombre_comercial'] ?? 'Mi Comercio';
            planName = comercio['planes_suscripcion']?['nombre'] ?? 'Básico';
            category = comercio['categoria'] ?? 'Sin categoría';
          }
        } catch (e) {
          debugPrint('Error al cargar comercio: $e');
        }
      }
    }
    
    isLoading = false;
    notifyListeners();
  }
}```

### 📄 lib/controllers/voice_offer_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:supabase_flutter/supabase_flutter.dart';

class VoiceOfferController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool isListening = false;
  bool isLoading = false;
  String transcript = '';
  String? errorMessage;
  bool isSuccess = false;

  Future<void> startListening() async {
    errorMessage = null;
    isSuccess = false;
    
    bool available = await _speech.initialize(
      onError: (val) => debugPrint('Error en voz: $val'),
      onStatus: (val) {
        if (val == 'done' || val == 'notListening') {
          isListening = false;
          notifyListeners();
        }
      },
    );

    if (available) {
      isListening = true;
      notifyListeners();
      
      _speech.listen(
        onResult: (val) {
          transcript = val.recognizedWords;
          notifyListeners();
        },
        localeId: 'es_ES', // Idioma español
        listenMode: stt.ListenMode.dictation,
      );
    } else {
      errorMessage = 'El micrófono no está disponible o no se dieron permisos.';
      notifyListeners();
    }
  }

  void stopListening() {
    _speech.stop();
    isListening = false;
    notifyListeners();
  }

  Future<bool> publishFastOffer() async {
    if (transcript.trim().isEmpty) {
      errorMessage = 'No hay texto para publicar.';
      notifyListeners();
      return false;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase.from('comercios').select('id, categoria').eq('usuario_id', userId).single();
      final comercioId = comercioData['id'];
      final categoria = comercioData['categoria'] ?? 'Otros';

      // Guardamos la transcripción como descripción y un nombre genérico por defecto
      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': 'Oferta por Voz (${DateTime.now().hour}:${DateTime.now().minute})',
        'descripcion': transcript.trim(),
        'categoria': categoria,
        'precio_regular': 0.0, // Por defecto, el comercio debe editarlo luego
        'precio_oferta': 0.0,
        'es_oferta': false, // Se crea como inventario hasta que se edite
        'stock': 1,
        'estado': 'Activo',
        'fecha_inicio': DateTime.now().toIso8601String(),
      });

      isSuccess = true;
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _speech.stop();
    super.dispose();
  }
}```

### 📄 lib/controllers/zones_controller.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ZonesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> allZones = [];

  // Listas filtradas para los dropdowns
  List<String> estados = [];
  List<String> municipios = [];
  List<String> parroquias = [];

  // Selecciones actuales
  String? selectedEstado;
  String? selectedMunicipio;
  String? selectedParroquia;

  ZonesController() {
    loadZones();
  }

  Future<void> loadZones() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('geo_zonas')
          .select('*')
          .order('estado', ascending: true)
          .order('municipio', ascending: true)
          .order('parroquia', ascending: true);
      
      allZones = response;
      
      // Extraer estados únicos
      estados = allZones.map((z) => z['estado'].toString()).toSet().toList();
    } catch (e) {
      debugPrint('Error cargando zonas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectEstado(String? estado) {
    selectedEstado = estado;
    selectedMunicipio = null;
    selectedParroquia = null;
    parroquias.clear();

    if (estado != null) {
      municipios = allZones
          .where((z) => z['estado'] == estado)
          .map((z) => z['municipio'].toString())
          .toSet()
          .toList();
    } else {
      municipios.clear();
    }
    notifyListeners();
  }

  void selectMunicipio(String? municipio) {
    selectedMunicipio = municipio;
    selectedParroquia = null;

    if (municipio != null && selectedEstado != null) {
      parroquias = allZones
          .where((z) => z['estado'] == selectedEstado && z['municipio'] == municipio)
          .map((z) => z['parroquia'].toString())
          .toSet()
          .toList();
    } else {
      parroquias.clear();
    }
    notifyListeners();
  }

  void selectParroquia(String? parroquia) {
    selectedParroquia = parroquia;
    notifyListeners();
  }

  // Obtener el ID de la zona seleccionada para guardarlo en la BD
  int? getSelectedParroquiaId() {
    if (selectedEstado == null || selectedMunicipio == null || selectedParroquia == null) return null;
    
    final zone = allZones.firstWhere(
      (z) => z['estado'] == selectedEstado && 
             z['municipio'] == selectedMunicipio && 
             z['parroquia'] == selectedParroquia,
      orElse: () => null,
    );
    return zone != null ? zone['id'] : null;
  }
}```

### 📄 lib/core/theme/app_theme.dart
```dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryPurple = Color(0xFF7C5DFE);
  static const Color darkCardColor = Color(0xFF252152);
  static const Color bgTop = Color(0xFFECE2FC);
  static const Color bgBottom = Color(0xFFFDFBFF);
  static const Color curveColor = Color(0xFFE2D2FC);
  static const Color textMagenta = Color(0xFFD018A4);
  
  static const Color success = Colors.green;
  static const Color error = Colors.red;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;
  
  static const Color textDark = Colors.black87;
  static const Color textLight = Colors.black54;
  static const Color white = Colors.white;
}```

### 📄 lib/main.dart
```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'config.dart';
import 'auth_gate.dart';
import 'screens/update_password_screen.dart';

// Llave global para navegar desde el listener de autenticación
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Vital para que el enlace del correo funcione en Web
    usePathUrlStrategy(); 

    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://9760817470fff8d5e02c3109fcb785af@o4512309844836353.ingest.us.sentry.io/4512309897134080';
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(const OfVeApp()),
    );
  }, (error, stackTrace) {
    Sentry.captureException(error, stackTrace: stackTrace);
  });
}

class OfVeApp extends StatefulWidget {
  const OfVeApp({super.key});

  @override
  State<OfVeApp> createState() => _OfVeAppState();
}

class _OfVeAppState extends State<OfVeApp> {
  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  void _setupAuthListener() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final event = data.event;

      // Si el usuario llega desde el enlace del correo, abrimos la pantalla de cambio
      if (event == AuthChangeEvent.passwordRecovery) {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const UpdatePasswordScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OfVe',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        primaryColor: const Color(0xFF6B4EFF),
        fontFamily: 'Roboto',
      ),
      home: const AuthGate(),
    );
  }
}```

### 📄 lib/screens/account_settings_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/account_settings_controller.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final _accountController = AccountSettingsController();
  
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    
    // Esperamos a que se carguen los datos para setear los controladores
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _accountController.addListener(_syncControllers);
    });
  }

  void _syncControllers() {
    if (_nameController.text.isEmpty && _accountController.nombre.isNotEmpty) {
      _nameController.text = _accountController.nombre;
      _phoneController.text = _accountController.telefono;
    }
  }

  @override
  void dispose() {
    _accountController.removeListener(_syncControllers);
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _guardarPerfil() async {
    final success = await _accountController.updateProfile(
      newName: _nameController.text,
      newPhone: _phoneController.text,
    );
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_accountController.successMessage ?? _accountController.errorMessage ?? ''),
        backgroundColor: success ? AppColors.success : AppColors.error,
      ));
    }
  }

  Future<void> _cambiarPassword() async {
    if (_passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('La contraseña debe tener al menos 6 caracteres'),
        backgroundColor: AppColors.warning,
      ));
      return;
    }

    final success = await _accountController.changePassword(_passwordController.text);
    
    if (mounted) {
      if (success) _passwordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_accountController.successMessage ?? _accountController.errorMessage ?? ''),
        backgroundColor: success ? AppColors.success : AppColors.error,
      ));
    }
  }

  void _confirmarEliminarCuenta() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar Cuenta'),
        content: const Text('¿Estás seguro que deseas eliminar tu cuenta? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () async {
              Navigator.pop(ctx);
              await _accountController.deleteAccount();
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _accountController,
      builder: (context, child) {
        if (_accountController.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Administrar mi Usuario')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // CABECERA CON AVATAR Y DATOS
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [AppColors.primaryPurple, AppColors.primaryPurple.withOpacity(0.7)]),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.white,
                        child: Icon(Icons.person, size: 50, color: AppColors.primaryPurple),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _accountController.nombre,
                        style: const TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _accountController.email,
                        style: TextStyle(color: AppColors.white.withOpacity(0.8), fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              _accountController.rol.toUpperCase(),
                              style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              '${_accountController.puntos} pts',
                              style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                const Text('Información Personal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                
                // FORMULARIO DE PERFIL
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre Completo',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                          prefixIcon: Icon(Icons.phone_outlined),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: TextEditingController(text: _accountController.email),
                        enabled: false,
                        decoration: const InputDecoration(
                          labelText: 'Email (No editable)',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _accountController.isSaving ? null : _guardarPerfil,
                          child: _accountController.isSaving 
                              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Text('Guardar Cambios'),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                const Text('Seguridad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                
                // CAMBIO DE CONTRASEÑA
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Nueva Contraseña',
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkCardColor),
                          onPressed: _accountController.isSaving ? null : _cambiarPassword,
                          child: const Text('Cambiar Contraseña'),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                const Text('Zona Peligrosa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.error)),
                const SizedBox(height: 12),
                
                // ELIMINAR CUENTA
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.error.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Una vez que elimines tu cuenta, no hay vuelta atrás. Por favor, asegúrate de estar seguro.',
                        style: TextStyle(color: AppColors.textLight, fontSize: 13),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(foregroundColor: AppColors.error, side: const BorderSide(color: AppColors.error)),
                          onPressed: _confirmarEliminarCuenta,
                          child: const Text('Eliminar mi Cuenta'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/add_product_screen.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/theme/app_theme.dart';
import '../controllers/offer_controller.dart';
import '../controllers/categories_controller.dart'; // <-- NUEVA IMPORTACIÓN

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _offerController = OfferController();
  final _categoriesController = CategoriesController(); // <-- NUEVO CONTROLADOR
  
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  
  String? _selectedCategory; // <-- Inicializado en null hasta que carguen
  
  Uint8List? _imageBytes;
  String? _imageName;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _categoriesController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageName = pickedFile.name;
      });
    }
  }

  Future<void> _saveProduct() async {
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, espera a que carguen las categorías y selecciona una.'), backgroundColor: Colors.orange),
      );
      return;
    }
    if (_nameController.text.isEmpty || _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El nombre y precio son obligatorios.'), backgroundColor: Colors.red),
      );
      return;
    }

    final success = await _offerController.createInventoryProduct(
      nombre: _nameController.text,
      descripcion: _descController.text,
      categoria: _selectedCategory!,
      precioRegular: double.parse(_priceController.text.trim()),
      stock: int.parse(_stockController.text.trim().isEmpty ? '1' : _stockController.text.trim()),
      imageBytes: _imageBytes,
      imageName: _imageName,
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Producto agregado al inventario!'), backgroundColor: AppColors.success),
      );
      Navigator.pop(context);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_offerController.errorMessage ?? 'Error al guardar'), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_offerController, _categoriesController]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Agregar al Inventario')),
          body: _categoriesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: _imageBytes != null
                              ? ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_photo_alternate, size: 50, color: AppColors.primaryPurple),
                                    const SizedBox(height: 8),
                                    const Text('Subir foto del producto', style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(_nameController, 'Nombre del Producto', Icons.shopping_bag),
                      const SizedBox(height: 12),
                      _buildTextField(_descController, 'Descripción (Opcional)', Icons.description, maxLines: 3),
                      const SizedBox(height: 12),
                      
                      // DROPDOWN DINÁMICO DE CATEGORÍAS
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(labelText: 'Categoría', prefixIcon: Icon(Icons.category)),
                        items: _categoriesController.categories
                            .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (v) => setState(() => _selectedCategory = v),
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(child: _buildTextField(_priceController, 'Precio Regular', Icons.attach_money, isNumber: true)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildTextField(_stockController, 'Stock Disponible', Icons.inventory, isNumber: true)),
                        ],
                      ),
                      
                      const SizedBox(height: 30),
                      
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _offerController.isLoading ? null : _saveProduct,
                          child: _offerController.isLoading
                              ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Text('Guardar en Inventario'),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }
}```

### 📄 lib/screens/add_product_screen2.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _supabase = Supabase.instance.client;
  
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  String _selectedCategory = 'Alimentos y Bebidas';
  
  Uint8List? _imageBytes;
  String? _imageName;
  bool _isSaving = false;

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageName = pickedFile.name;
      });
    }
  }

  Future<void> _saveProduct() async {
    if (_nameController.text.isEmpty || _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('El nombre y precio son obligatorios.'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isSaving = true);
    final userId = _supabase.auth.currentUser!.id;

    try {
      final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercioData['id'];

      String? imageUrl;
      if (_imageBytes != null && _imageName != null) {
        final ext = p.extension(_imageName!);
        final finalName = 'producto_${DateTime.now().millisecondsSinceEpoch}$ext';
        final path = '$userId/$finalName';

        await _supabase.storage.from('productos_imagenes').uploadBinary(
          path, _imageBytes!, fileOptions: const FileOptions(upsert: true),
        );
        imageUrl = _supabase.storage.from('productos_imagenes').getPublicUrl(path);
      }

      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': _nameController.text.trim(),
        'descripcion': _descController.text.trim(),
        'categoria': _selectedCategory,
        'precio_regular': double.parse(_priceController.text.trim()),
        'precio_oferta': null, // Al ser inventario, no tiene precio de oferta
        'es_oferta': false,    // Bandera para indicar que es un producto regular
        'stock': int.parse(_stockController.text.trim().isEmpty ? '1' : _stockController.text.trim()),
        'imagen_url': imageUrl,
        'estado': 'Activo',
        'fecha_inicio': DateTime.now().toIso8601String(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Producto agregado al inventario!'), backgroundColor: Colors.green));
        Navigator.pop(context); 
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al guardar: $e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Agregar al Inventario', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: _imageBytes != null
                    ? ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate, size: 50, color: primaryPurple),
                          const SizedBox(height: 8),
                          const Text('Subir foto del producto', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),

            _buildTextField(_nameController, 'Nombre del Producto', Icons.shopping_bag),
            const SizedBox(height: 12),
            _buildTextField(_descController, 'Descripción (Opcional)', Icons.description, maxLines: 3),
            const SizedBox(height: 12),
            
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Categoría',
                prefixIcon: const Icon(Icons.category),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              items: ['Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza', 'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v!),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _buildTextField(_priceController, 'Precio Regular', Icons.attach_money, isNumber: true)),
                const SizedBox(width: 12),
                Expanded(child: _buildTextField(_stockController, 'Stock Disponible', Icons.inventory, isNumber: true)),
              ],
            ),
            
            const SizedBox(height: 30),
            
            SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: _isSaving ? null : _saveProduct,
                child: _isSaving
                    ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text('Guardar en Inventario', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}```

### 📄 lib/screens/admin_animal_requests_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class AdminAnimalRequestsScreen extends StatefulWidget {
  const AdminAnimalRequestsScreen({super.key});

  @override
  State<AdminAnimalRequestsScreen> createState() => _AdminAnimalRequestsScreenState();
}

class _AdminAnimalRequestsScreenState extends State<AdminAnimalRequestsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _requests = [];

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  Future<void> _loadRequests() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('solicitudes_animales')
          .select('*, usuarios(nombre, email)')
          .eq('estado', 'Pendiente')
          .order('fecha_solicitud', ascending: false);
      setState(() => _requests = response);
    } catch (e) {
      debugPrint('Error cargando solicitudes de animales: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _processRequest(String id, String userId, bool approve) async {
    try {
      await _supabase.from('solicitudes_animales').update({
        'estado': approve ? 'Aprobado' : 'Rechazado',
        'fecha_respuesta': DateTime.now().toIso8601String(),
      }).eq('id', id);
      
      _loadRequests();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(approve ? 'Solicitud aprobada' : 'Solicitud rechazada'), backgroundColor: approve ? AppColors.success : AppColors.error)
        );
      }
    } catch (e) {
      debugPrint('Error procesando solicitud: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Solicitudes de Animales')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _requests.isEmpty
              ? const Center(child: Text('No hay solicitudes pendientes.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _requests.length,
                  itemBuilder: (context, index) {
                    final req = _requests[index];
                    final user = req['usuarios'];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Solicitud de: ${user['nombre']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('Animal: ${req['nombre_animal']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text('Descripción: ${req['descripcion_venta']}'),
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () => _processRequest(req['id'], user['id'], false),
                                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.error),
                                  child: const Text('Rechazar'),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () => _processRequest(req['id'], user['id'], true),
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                                  child: const Text('Aprobar'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}```

### 📄 lib/screens/admin_broadcast_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_broadcast_controller.dart';

class AdminBroadcastScreen extends StatefulWidget {
  const AdminBroadcastScreen({super.key});

  @override
  State<AdminBroadcastScreen> createState() => _AdminBroadcastScreenState();
}

class _AdminBroadcastScreenState extends State<AdminBroadcastScreen> {
  final _broadcastController = AdminBroadcastController();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _enviarAnuncio() async {
    final success = await _broadcastController.sendAnnouncement(
      _titleController.text, 
      _messageController.text
    );

    if (success && mounted) {
      _titleController.clear();
      _messageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Anuncio enviado a todos los usuarios!'), backgroundColor: AppColors.success),
      );
      FocusScope.of(context).unfocus(); // Ocultar teclado
    } else if (mounted && _broadcastController.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_broadcastController.errorMessage!), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _broadcastController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mensajes Masivos')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FORMULARIO DE ENVÍO
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Crear Nuevo Anuncio', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título del Anuncio',
                          prefixIcon: Icon(Icons.title),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _messageController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Mensaje para la comunidad',
                          prefixIcon: Icon(Icons.message),
                          alignLabelWithHint: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: _broadcastController.isSending ? null : _enviarAnuncio,
                          icon: _broadcastController.isSending 
                              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Icon(Icons.send, color: AppColors.white),
                          label: Text(_broadcastController.isSending ? 'Enviando...' : 'Enviar a Todos'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                const Text('Historial de Anuncios', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),

                // HISTORIAL DE ANUNCIOS
                if (_broadcastController.isLoading)
                  const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                else if (_broadcastController.announcements.isEmpty)
                  const Center(child: Text('No has enviado anuncios aún.', style: TextStyle(color: Colors.grey)))
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _broadcastController.announcements.length,
                    itemBuilder: (context, index) {
                      final anuncio = _broadcastController.announcements[index];
                      final fecha = DateTime.parse(anuncio['fecha_creacion']).toLocal();
                      final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                      final isActive = anuncio['activo'] ?? false;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: CircleAvatar(
                            backgroundColor: isActive ? AppColors.success.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                            child: Icon(
                              isActive ? Icons.campaign : Icons.campaign_outlined, 
                              color: isActive ? AppColors.success : Colors.grey
                            ),
                          ),
                          title: Text(anuncio['titulo'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(anuncio['mensaje']),
                              const SizedBox(height: 4),
                              Text(formattedDate, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                            ],
                          ),
                          trailing: Switch(
                            value: isActive,
                            activeColor: AppColors.primaryPurple,
                            onChanged: (val) => _broadcastController.toggleAnnouncementStatus(anuncio['id'], isActive),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/admin_categories_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_categories_controller.dart';

class AdminCategoriesScreen extends StatefulWidget {
  const AdminCategoriesScreen({super.key});

  @override
  State<AdminCategoriesScreen> createState() => _AdminCategoriesScreenState();
}

class _AdminCategoriesScreenState extends State<AdminCategoriesScreen> {
  final _categoriesController = AdminCategoriesController();
  final _nameCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  void _mostrarDialogoAgregar() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nueva Categoría'),
        content: TextField(
          controller: _nameCtrl,
          decoration: const InputDecoration(labelText: 'Nombre de la categoría', prefixIcon: Icon(Icons.category)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final success = await _categoriesController.addCategory(_nameCtrl.text);
              if (ctx.mounted) {
                Navigator.pop(ctx);
                _nameCtrl.clear();
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Categoría agregada'), backgroundColor: AppColors.success));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al agregar (puede que ya exista)'), backgroundColor: AppColors.error));
                }
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _categoriesController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Gestión de Categorías')),
          floatingActionButton: FloatingActionButton(
            onPressed: _mostrarDialogoAgregar,
            backgroundColor: AppColors.primaryPurple,
            child: const Icon(Icons.add, color: AppColors.white),
          ),
          body: _categoriesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _categoriesController.categories.length,
                  itemBuilder: (context, index) {
                    final cat = _categoriesController.categories[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                          child: const Icon(Icons.category, color: AppColors.primaryPurple),
                        ),
                        title: Text(cat['nombre'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: AppColors.error),
                          onPressed: () {
                            // Confirmación antes de borrar
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Eliminar Categoría'),
                                content: Text('¿Estás seguro que deseas eliminar "${cat['nombre']}"?'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                      _categoriesController.deleteCategory(cat['id']);
                                    },
                                    child: const Text('Eliminar'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}```

### 📄 lib/screens/admin_dashboard_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import '../widgets/notification_bell.dart'; // <-- NUEVA IMPORTACIÓN
import '../controllers/admin_controller.dart';
import 'admin_validation_screen.dart';
import 'admin_moderation_screen.dart';
import 'admin_support_screen.dart';
import 'admin_market_intelligence.dart';
import 'admin_users_screen.dart'; 
import 'admin_broadcast_screen.dart'; 
import 'admin_categories_screen.dart'; 
import 'admin_zones_screen.dart';
import 'admin_offers_screen.dart'; 
import 'admin_animal_requests_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final _adminController = AdminController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _adminController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Panel de Administración', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
            actions: [
              // CAMPANITA DE NOTIFICACIONES EN TIEMPO REAL
              const NotificationBell(),
              
              IconButton(icon: const Icon(Icons.logout, color: AppColors.error), tooltip: 'Cerrar Sesión', onPressed: () => Supabase.instance.client.auth.signOut())
            ],
          ),
          body: _adminController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Tareas Pendientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildStatCard('Validaciones', _adminController.comerciosPendientes.toString(), Icons.verified_user, AppColors.warning),
                          const SizedBox(width: 12),
                          _buildStatCard('Reportes', _adminController.reportesPendientes.toString(), Icons.report_problem, AppColors.error),
                          const SizedBox(width: 12),
                          _buildStatCard('Soporte', _adminController.ticketsSoporte.toString(), Icons.support_agent, AppColors.info),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text('Herramientas de Operación', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.85,
                        children: [
                          _buildModuleCard(icon: Icons.verified_user, title: 'Validar', subtitle: 'Comercios', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminValidationScreen())).then((_) => _adminController.loadAdminStats())),
                          _buildModuleCard(icon: Icons.gavel, title: 'Moderación', subtitle: 'Reportes', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminModerationScreen())).then((_) => _adminController.loadAdminStats())),
                          _buildModuleCard(icon: Icons.support_agent, title: 'Soporte', subtitle: 'Tickets', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminSupportScreen()))),
                          _buildModuleCard(icon: Icons.insights, title: 'Mercado', subtitle: 'Demanda Global', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminMarketIntelligence()))),
                          _buildModuleCard(icon: Icons.people, title: 'Usuarios', subtitle: 'Consultar', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminUsersScreen()))),
                          _buildModuleCard(
                            icon: Icons.campaign, 
                            title: 'Mensajes', 
                            subtitle: 'Masivos', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminBroadcastScreen()))
                          ),
                          _buildModuleCard(
                            icon: Icons.local_offer, 
                            title: 'Ofertas', 
                            subtitle: 'Revisar', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminOffersScreen()))
                          ),
                          _buildModuleCard(
                            icon: Icons.pets, 
                            title: 'Animales', 
                            subtitle: 'Solicitudes', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminAnimalRequestsScreen()))
                          ),
                          _buildModuleCard(
                            icon: Icons.category, 
                            title: 'Categorías', 
                            subtitle: 'Gestionar', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminCategoriesScreen()))
                          ),
                          _buildModuleCard(
                            icon: Icons.map, 
                            title: 'Zonas', 
                            subtitle: 'Geografía', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminZonesScreen()))
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: AppColors.darkCardColor, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.white, size: 32),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/admin_dashboard_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_validation_screen.dart';
import 'admin_moderation_screen.dart';
import 'admin_support_screen.dart';
import 'admin_market_intelligence.dart'; // <-- NUEVA IMPORTACIÓN

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;

  int _comerciosPendientes = 0;
  int _reportesPendientes = 0;

  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);
  final Color darkCardColor = const Color(0xFF252152);

  @override
  void initState() {
    super.initState();
    _loadAdminStats();
  }

  Future<void> _loadAdminStats() async {
    setState(() => _isLoading = true);
    try {
      final comercios = await _supabase.from('comercios').select('id').eq('estatus_verificacion', 'En Revision').count();
      final reportes = await _supabase.from('reportes_moderacion').select('id').eq('estado', 'Pendiente').count();
      
      setState(() {
        _comerciosPendientes = comercios.count;
        _reportesPendientes = reportes.count;
      });
    } catch (e) {
      debugPrint('Error cargando métricas: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Panel de Administración', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            tooltip: 'Cerrar Sesión',
            onPressed: () => _supabase.auth.signOut(),
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tareas Pendientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildStatCard('Validaciones', _comerciosPendientes.toString(), Icons.verified_user, Colors.orange),
                      const SizedBox(width: 12),
                      _buildStatCard('Reportes', _reportesPendientes.toString(), Icons.report_problem, Colors.red),
                      const SizedBox(width: 12),
                      _buildStatCard('Soporte', '5', Icons.support_agent, Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text('Herramientas de Operación', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                    children: [
                      _buildModuleCard(
                        icon: Icons.verified_user,
                        title: 'Validar',
                        subtitle: 'Comercios',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminValidationScreen())).then((_) => _loadAdminStats()),
                      ),
                      _buildModuleCard(
                        icon: Icons.gavel,
                        title: 'Moderación',
                        subtitle: 'Reportes',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminModerationScreen())).then((_) => _loadAdminStats()),
                      ),
                      _buildModuleCard(
                        icon: Icons.support_agent,
                        title: 'Soporte',
                        subtitle: 'Tickets',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminSupportScreen())),
                      ),
                      
                      // --- TARJETA DE INTELIGENCIA DE MERCADO CONECTADA ---
                      _buildModuleCard(
                        icon: Icons.insights,
                        title: 'Mercado',
                        subtitle: 'Demanda Global',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminMarketIntelligence())),
                      ),
                      
                      _buildModuleCard(icon: Icons.local_offer, title: 'Ofertas', subtitle: 'Revisar', onTap: () {}),
                      _buildModuleCard(icon: Icons.category, title: 'Categorías', subtitle: 'Gestionar', onTap: () {}),
                      _buildModuleCard(icon: Icons.campaign, title: 'Mensajes', subtitle: 'Masivos', onTap: () {}),
                      _buildModuleCard(icon: Icons.people, title: 'Usuarios', subtitle: 'Consultar', onTap: () {}),
                      _buildModuleCard(icon: Icons.map, title: 'Zonas', subtitle: 'Geografía', onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: darkCardColor, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/admin_market_intelligence.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminMarketIntelligence extends StatefulWidget {
  const AdminMarketIntelligence({super.key});

  @override
  State<AdminMarketIntelligence> createState() => _AdminMarketIntelligenceState();
}

class _AdminMarketIntelligenceState extends State<AdminMarketIntelligence> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _globalSearches = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadGlobalData();
  }

  Future<void> _loadGlobalData() async {
    try {
      final response = await _supabase.from('busquedas_fallidas').select('termino_busqueda, categoria_ia');
      
      final Map<String, int> conteo = {};
      for (var item in response) {
        final term = item['termino_busqueda'].toString().toLowerCase();
        conteo[term] = (conteo[term] ?? 0) + 1;
      }

      final sortedList = conteo.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
      setState(() {
        _globalSearches = sortedList.take(20).map((e) => {'termino': e.key, 'cantidad': e.value}).toList();
      });
    } catch (e) {
      debugPrint('Error cargando inteligencia: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Inteligencia de Mercado', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Top Búsquedas Insatisfechas Globales', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('Estos son los productos que los clientes buscan pero no encuentran en la app.', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 20),
                  
                  if (_globalSearches.isEmpty)
                    const Center(child: Text('No hay datos suficientes aún.'))
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _globalSearches.length,
                      itemBuilder: (context, index) {
                        final item = _globalSearches[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: primaryPurple.withOpacity(0.1),
                              child: Text('#${index + 1}', style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold)),
                            ),
                            title: Text(item['termino'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            trailing: Text('${item['cantidad']} búsquedas', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                    )
                ],
              ),
            ),
    );
  }
}```

### 📄 lib/screens/admin_moderation_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminModerationScreen extends StatefulWidget {
  const AdminModerationScreen({super.key});

  @override
  State<AdminModerationScreen> createState() => _AdminModerationScreenState();
}

class _AdminModerationScreenState extends State<AdminModerationScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _reportes = [];
  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadReportes();
  }

  Future<void> _loadReportes() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('reportes_moderacion')
          .select('*, reportante:reportante_id(nombre), reportado:reportado_id(nombre)')
          .eq('estado', 'Pendiente')
          .order('fecha', ascending: false);
      setState(() => _reportes = response);
    } catch (e) {
      debugPrint('Error cargando reportes: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _resolverReporte(String reporteId, String decision) async {
    try {
      await _supabase.from('reportes_moderacion').update({'estado': 'Resuelto', 'decision_admin': decision}).eq('id', reporteId);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reporte resuelto: $decision'), backgroundColor: Colors.green));
      _loadReportes();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(title: const Text('Moderación de Reportes', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : _reportes.isEmpty
              ? const Center(child: Text('No hay reportes pendientes. ¡Todo limpio!'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _reportes.length,
                  itemBuilder: (context, index) {
                    final reporte = _reportes[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [const Icon(Icons.warning_amber_rounded, color: Colors.red), const SizedBox(width: 8), Text(reporte['motivo'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red))]),
                            const Divider(height: 24),
                            Text('Reportante: ${reporte['reportante']?['nombre'] ?? 'Anónimo'}'),
                            Text('Reportado: ${reporte['reportado']?['nombre'] ?? 'Desconocido'}'),
                            const SizedBox(height: 12),
                            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)), child: Text('"${reporte['descripcion']}"', style: const TextStyle(fontStyle: FontStyle.italic))),
                            const SizedBox(height: 16),
                            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                              OutlinedButton(onPressed: () => _resolverReporte(reporte['id'], 'Descartado'), child: const Text('Descartar')),
                              const SizedBox(width: 12),
                              ElevatedButton(onPressed: () => _resolverReporte(reporte['id'], 'Sancionado'), style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text('Sancionar', style: TextStyle(color: Colors.white))),
                            ])
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}```

### 📄 lib/screens/admin_offers_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_offers_controller.dart';

class AdminOffersScreen extends StatefulWidget {
  const AdminOffersScreen({super.key});

  @override
  State<AdminOffersScreen> createState() => _AdminOffersScreenState();
}

class _AdminOffersScreenState extends State<AdminOffersScreen> {
  final _offersController = AdminOffersController();

  void _confirmarEliminar(String offerId, String nombre) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar Oferta'),
        content: Text('¿Estás seguro que deseas eliminar la oferta "$nombre"? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              Navigator.pop(ctx);
              _offersController.deleteOffer(offerId);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Oferta eliminada'), backgroundColor: AppColors.success));
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offersController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Moderación de Ofertas'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _offersController.loadOffers,
              )
            ],
          ),
          body: _offersController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _offersController.offers.isEmpty
                  ? const Center(child: Text('No hay ofertas registradas.', style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _offersController.offers.length,
                      itemBuilder: (context, index) {
                        final offer = _offersController.offers[index];
                        final comercio = offer['comercios']?['nombre_comercial'] ?? 'Comercio Desconocido';
                        final isActive = offer['estado'] == 'Activa';
                        final fecha = DateTime.parse(offer['fecha_creacion']).toLocal();
                        final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: (offer['imagen_url'] != null && offer['imagen_url'].toString().isNotEmpty)
                                          ? Image.network(offer['imagen_url'], width: 70, height: 70, fit: BoxFit.cover)
                                          : Container(width: 70, height: 70, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: Text(offer['producto_nombre'] ?? 'Producto', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: isActive ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  isActive ? 'ACTIVA' : 'SUSPENDIDA',
                                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isActive ? AppColors.success : AppColors.error),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text('Tienda: $comercio', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.w600, fontSize: 12)),
                                          Text(fechaStr, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                                          Text('\$${offer['precio_oferta'] ?? offer['precio_regular']}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark, fontSize: 16)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () => _offersController.toggleOfferStatus(offer['id'], offer['estado']),
                                      icon: Icon(isActive ? Icons.pause_circle_outline : Icons.play_circle_outline, color: isActive ? AppColors.warning : AppColors.success),
                                      label: Text(isActive ? 'Suspender' : 'Reactivar', style: TextStyle(color: isActive ? AppColors.warning : AppColors.success)),
                                    ),
                                    const SizedBox(width: 8),
                                    TextButton.icon(
                                      onPressed: () => _confirmarEliminar(offer['id'], offer['producto_nombre']),
                                      icon: const Icon(Icons.delete, color: AppColors.error),
                                      label: const Text('Eliminar', style: TextStyle(color: AppColors.error)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}```

### 📄 lib/screens/admin_support_screen.dart
```dart
import 'package:flutter/material.dart';

class AdminSupportScreen extends StatelessWidget {
  const AdminSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryPurple = const Color(0xFF6B4EFF);
    final Color bgTop = const Color(0xFFECE2FC);

    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(title: const Text('Soporte al Usuario', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTicketCard(nombre: 'Eddison (Cliente)', asunto: 'No puedo aplicar un cupón', mensaje: 'Hola, intenté comprar en la Panadería El Trigal pero el cupón me da error...', tiempo: 'Hace 5 min', prioridad: 'Alta', color: Colors.red),
          _buildTicketCard(nombre: 'Tech Home Promos (Comercio)', asunto: 'Problema con la IA', mensaje: 'El asistente de IA no está generando la descripción correcta...', tiempo: 'Hace 2 horas', prioridad: 'Media', color: Colors.orange),
          _buildTicketCard(nombre: 'María Gómez (Cliente)', asunto: 'Cambio de contraseña', mensaje: 'No me llega el correo para cambiar mi clave. Ya revisé spam.', tiempo: 'Hace 1 día', prioridad: 'Baja', color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildTicketCard({required String nombre, required String asunto, required String mensaje, required String tiempo, required String prioridad, required Color color}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(Icons.person, color: color)),
        title: Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(asunto, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
            Text(mensaje, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4)), child: Text('Prioridad: $prioridad', style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold))),
              const SizedBox(width: 8),
              Text(tiempo, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ])
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}```

### 📄 lib/screens/admin_users_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_users_controller.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  final _usersController = AdminUsersController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _usersController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Gestión de Usuarios')),
          body: Column(
            children: [
              // BUSCADOR
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: _usersController.search,
                  decoration: InputDecoration(
                    hintText: 'Buscar por nombre o email...',
                    prefixIcon: const Icon(Icons.search, color: AppColors.primaryPurple),
                    suffixIcon: _searchController.text.isNotEmpty 
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear();
                              _usersController.search('');
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  ),
                ),
              ),

              // LISTA DE USUARIOS
              Expanded(
                child: _usersController.isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                    : _usersController.filteredUsers.isEmpty
                        ? const Center(child: Text('No se encontraron usuarios.', style: TextStyle(color: Colors.grey)))
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: _usersController.filteredUsers.length,
                            itemBuilder: (context, index) {
                              final user = _usersController.filteredUsers[index];
                              final isBanned = user['estado_baneado'] ?? false;
                              final role = user['rol'] ?? 'user';
                              
                              Color roleColor = Colors.grey;
                              if (role == 'admin') roleColor = Colors.redAccent;
                              if (role == 'merchant') roleColor = Colors.blue;
                              if (role == 'owner') roleColor = Colors.purple;

                              return Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  leading: CircleAvatar(
                                    backgroundColor: isBanned ? AppColors.error.withOpacity(0.1) : roleColor.withOpacity(0.1),
                                    child: Icon(
                                      isBanned ? Icons.block : Icons.person, 
                                      color: isBanned ? AppColors.error : roleColor
                                    ),
                                  ),
                                  title: Text(user['nombre'] ?? 'Sin nombre', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(user['email'] ?? ''),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(color: roleColor.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                                            child: Text(role.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: roleColor)),
                                          ),
                                          const SizedBox(width: 8),
                                          if (isBanned)
                                            const Text('SUSPENDIDO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.error)),
                                        ],
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      isBanned ? Icons.lock_open : Icons.block,
                                      color: isBanned ? AppColors.success : AppColors.error,
                                    ),
                                    tooltip: isBanned ? 'Reactivar Cuenta' : 'Suspender Cuenta',
                                    onPressed: () => _mostrarConfirmacion(user['id'], user['nombre'], isBanned),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _mostrarConfirmacion(String userId, String nombre, bool isBanned) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isBanned ? 'Reactivar Usuario' : 'Suspender Usuario'),
        content: Text('¿Estás seguro que deseas ${isBanned ? "reactivar" : "suspender"} a "$nombre"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: isBanned ? AppColors.success : AppColors.error),
            onPressed: () {
              Navigator.pop(ctx);
              _usersController.toggleUserBan(userId, isBanned);
            },
            child: Text(isBanned ? 'Reactivar' : 'Suspender'),
          ),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/admin_validation_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_validation_controller.dart';

class AdminValidationScreen extends StatefulWidget {
  const AdminValidationScreen({super.key});

  @override
  State<AdminValidationScreen> createState() => _AdminValidationScreenState();
}

class _AdminValidationScreenState extends State<AdminValidationScreen> {
  final _validationController = AdminValidationController();
  final _supabase = Supabase.instance.client;

  Future<void> _verDocumento(String? path) async {
    if (path == null || path.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No hay documento subido.')));
      return;
    }

    try {
      final signedUrl = await _supabase.storage.from('documentos_comercios').createSignedUrl(path, 60);
      final uri = Uri.parse(signedUrl);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('No se pudo abrir el documento');
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _validationController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Validación de Comercios')),
          body: _validationController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _validationController.comerciosPendientes.isEmpty
                  ? const Center(child: Text('No hay comercios pendientes por revisar.'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _validationController.comerciosPendientes.length,
                      itemBuilder: (context, index) {
                        final comercio = _validationController.comerciosPendientes[index];
                        final nombre = comercio['nombre_comercial'] ?? 'Sin nombre';
                        final rif = comercio['rif'] ?? 'Sin RIF';
                        final iaData = comercio['validacion_ia'] as Map<String, dynamic>?;
                        final iaFallo = iaData != null && iaData['exitoso'] == false;
                        
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(nombre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('RIF: $rif', style: const TextStyle(color: Colors.grey)),
                                const Divider(height: 24),
                                
                                if (iaFallo) ...[
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.1), border: Border.all(color: AppColors.warning), borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.warning_amber_rounded, color: AppColors.warning),
                                        const SizedBox(width: 8),
                                        Expanded(child: Text('Alerta de IA: ${iaData['motivo'] ?? 'Requiere revisión manual'}', style: const TextStyle(color: AppColors.warning, fontSize: 13, fontWeight: FontWeight.w500))),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ] else if (iaData != null && iaData['exitoso'] == true) ...[
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), border: Border.all(color: AppColors.success), borderRadius: BorderRadius.circular(8)),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.check_circle, color: AppColors.success),
                                        SizedBox(width: 8),
                                        Expanded(child: Text('IA: Documentos válidos. Aprobación automática recomendada.', style: TextStyle(color: AppColors.success, fontSize: 13, fontWeight: FontWeight.w500))),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],

                                const Text('Documentos:', style: TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    _buildDocButton('Ver RIF', comercio['doc_rif_url']),
                                    _buildDocButton('Ver Legal', comercio['doc_constitutivo_url']),
                                    _buildDocButton('Ver Cédulas', comercio['doc_cedulas_url']),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () => _validationController.actualizarEstado(comercio['id'], 'Rechazado'),
                                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.error),
                                      child: const Text('Rechazar'),
                                    ),
                                    const SizedBox(width: 12),
                                    ElevatedButton(
                                      onPressed: () => _validationController.actualizarEstado(comercio['id'], 'Aprobado'),
                                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                                      child: const Text('Aprobar'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }

  Widget _buildDocButton(String label, String? path) {
    return ActionChip(
      avatar: const Icon(Icons.picture_as_pdf, color: AppColors.error, size: 18),
      label: Text(label),
      onPressed: () => _verDocumento(path),
    );
  }
}```

### 📄 lib/screens/admin_validation_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminValidationScreen extends StatefulWidget {
  const AdminValidationScreen({super.key});

  @override
  State<AdminValidationScreen> createState() => _AdminValidationScreenState();
}

class _AdminValidationScreenState extends State<AdminValidationScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _comerciosPendientes = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadComercios();
  }

  Future<void> _loadComercios() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('comercios')
          .select('*')
          .eq('estatus_verificacion', 'En Revision');
      setState(() => _comerciosPendientes = response);
    } catch (e) {
      debugPrint('Error cargando comercios: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _verDocumento(String? path) async {
    if (path == null || path.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay documento subido para esta categoría.')),
      );
      return;
    }

    try {
      final signedUrl = await _supabase.storage
          .from('documentos_comercios')
          .createSignedUrl(path, 60);

      final uri = Uri.parse(signedUrl);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('No se pudo abrir el documento');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al abrir documento: $e')),
        );
      }
    }
  }

  Future<void> _actualizarEstado(String comercioId, String nuevoEstado) async {
    setState(() => _isLoading = true);
    try {
      await _supabase.from('comercios').update({
        'estatus_verificacion': nuevoEstado
      }).eq('id', comercioId);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Comercio marcado como: $nuevoEstado'), backgroundColor: Colors.green),
        );
      }
      _loadComercios();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al actualizar: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Validación de Comercios', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : _comerciosPendientes.isEmpty
              ? const Center(child: Text('No hay comercios pendientes por revisar.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _comerciosPendientes.length,
                  itemBuilder: (context, index) {
                    final comercio = _comerciosPendientes[index];
                    final nombre = comercio['nombre_comercial'] ?? 'Sin nombre';
                    final rif = comercio['rif'] ?? 'Sin RIF';
                    final iaData = comercio['validacion_ia'] as Map<String, dynamic>?;
                    final iaFallo = iaData != null && iaData['exitoso'] == false;
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(nombre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('RIF: $rif', style: const TextStyle(color: Colors.grey)),
                            const Divider(height: 24),
                            
                            // SECCIÓN DE ANÁLISIS DE IA
                            if (iaFallo) ...[
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  border: Border.all(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Alerta de IA: ${iaData['motivo'] ?? 'Requiere revisión manual'}',
                                        style: const TextStyle(color: Colors.orange, fontSize: 13, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                            ] else if (iaData != null && iaData['exitoso'] == true) ...[
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.green),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'IA: Documentos válidos. Aprobación automática recomendada.',
                                        style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],

                            const Text('Documentos:', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildDocButton('Ver RIF', comercio['doc_rif_url']),
                                _buildDocButton('Ver Legal', comercio['doc_constitutivo_url']),
                                _buildDocButton('Ver Cédulas', comercio['doc_cedulas_url']),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () => _actualizarEstado(comercio['id'], 'Rechazado'),
                                  style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                                  child: const Text('Rechazar'),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () => _actualizarEstado(comercio['id'], 'Aprobado'),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                  child: const Text('Aprobar', style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  Widget _buildDocButton(String label, String? path) {
    return ActionChip(
      avatar: const Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
      label: Text(label),
      onPressed: () => _verDocumento(path),
    );
  }
}```

### 📄 lib/screens/admin_zones_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_zones_controller.dart';

class AdminZonesScreen extends StatefulWidget {
  const AdminZonesScreen({super.key});

  @override
  State<AdminZonesScreen> createState() => _AdminZonesScreenState();
}

class _AdminZonesScreenState extends State<AdminZonesScreen> {
  final _zonesController = AdminZonesController();
  final _estadoCtrl = TextEditingController();
  final _municipioCtrl = TextEditingController();
  final _parroquiaCtrl = TextEditingController();

  @override
  void dispose() {
    _estadoCtrl.dispose();
    _municipioCtrl.dispose();
    _parroquiaCtrl.dispose();
    super.dispose();
  }

  void _mostrarDialogoAgregar() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nueva Zona Geográfica'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _estadoCtrl,
                decoration: const InputDecoration(labelText: 'Estado', prefixIcon: Icon(Icons.map)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _municipioCtrl,
                decoration: const InputDecoration(labelText: 'Municipio', prefixIcon: Icon(Icons.location_city)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _parroquiaCtrl,
                decoration: const InputDecoration(labelText: 'Parroquia', prefixIcon: Icon(Icons.location_on)),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (_estadoCtrl.text.isEmpty || _municipioCtrl.text.isEmpty || _parroquiaCtrl.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Todos los campos son obligatorios'), backgroundColor: AppColors.error));
                return;
              }
              final success = await _zonesController.addZone(
                estado: _estadoCtrl.text,
                municipio: _municipioCtrl.text,
                parroquia: _parroquiaCtrl.text,
              );
              if (ctx.mounted) {
                Navigator.pop(ctx);
                _estadoCtrl.clear();
                _municipioCtrl.clear();
                _parroquiaCtrl.clear();
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Zona agregada'), backgroundColor: AppColors.success));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_zonesController.errorMessage ?? 'Error al agregar'), backgroundColor: AppColors.error));
                }
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _zonesController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Gestión de Zonas')),
          floatingActionButton: FloatingActionButton(
            onPressed: _mostrarDialogoAgregar,
            backgroundColor: AppColors.primaryPurple,
            child: const Icon(Icons.add, color: AppColors.white),
          ),
          body: _zonesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _zonesController.zones.isEmpty
                  ? const Center(child: Text('No hay zonas registradas.', style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _zonesController.zones.length,
                      itemBuilder: (context, index) {
                        final zone = _zonesController.zones[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                              child: const Icon(Icons.map, color: AppColors.primaryPurple),
                            ),
                            title: Text('${zone['parroquia']}, ${zone['municipio']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(zone['estado'], style: const TextStyle(color: Colors.grey)),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: AppColors.error),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Eliminar Zona'),
                                    content: Text('¿Estás seguro de eliminar la zona "${zone['parroquia']}"?'),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                          _zonesController.deleteZone(zone['id']);
                                        },
                                        child: const Text('Eliminar'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}```

### 📄 lib/screens/ai_assistant_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/ai_assistant_controller.dart';

class AiAssistantScreen extends StatefulWidget {
  final String? initialProductName;

  const AiAssistantScreen({super.key, this.initialProductName});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final _aiController = AiAssistantController();
  final _productNameCtrl = TextEditingController();
  String _selectedCategory = 'Alimentos y Bebidas';

  final List<String> _categorias = [
    'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza', 
    'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.initialProductName != null) {
      _productNameCtrl.text = widget.initialProductName!;
    }
  }

  @override
  void dispose() {
    _productNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _aiController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Asistente IA')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
                  child: Column(
                    children: [
                      const Icon(Icons.smart_toy, size: 50, color: AppColors.primaryPurple),
                      const SizedBox(height: 12),
                      const Text('Deja que la IA escriba por ti', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      const Text('Escribe el nombre de tu producto y selecciona su categoría. La IA generará una descripción persuasiva.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textLight, fontSize: 13)),
                      const SizedBox(height: 20),
                      
                      TextField(
                        controller: _productNameCtrl,
                        decoration: const InputDecoration(labelText: 'Nombre del Producto', prefixIcon: Icon(Icons.shopping_bag)),
                      ),
                      const SizedBox(height: 12),
                      
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(labelText: 'Categoría', prefixIcon: Icon(Icons.category)),
                        items: _categorias.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (v) => setState(() => _selectedCategory = v!),
                      ),
                      const SizedBox(height: 20),
                      
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: _aiController.isLoading 
                              ? null 
                              : () => _aiController.generateDescription(
                                  productName: _productNameCtrl.text.trim(), 
                                  category: _selectedCategory
                                ),
                          icon: _aiController.isLoading 
                              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Icon(Icons.auto_awesome, color: AppColors.white),
                          label: Text(_aiController.isLoading ? 'Generando...' : 'Generar Descripción'),
                        ),
                      ),
                    ],
                  ),
                ),
                
                if (_aiController.errorMessage != null) ...[
                  const SizedBox(height: 20),
                  Text(_aiController.errorMessage!, style: const TextStyle(color: AppColors.error, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ],

                if (_aiController.generatedDescription != null) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.primaryPurple.withOpacity(0.5)),
                      boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 5))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.format_quote, color: AppColors.primaryPurple),
                            const SizedBox(width: 8),
                            const Text('Descripción Generada:', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(_aiController.generatedDescription!, style: const TextStyle(fontSize: 16, height: 1.5)),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                            onPressed: () {
                              Navigator.pop(context, _aiController.generatedDescription);
                            },
                            icon: const Icon(Icons.check, color: AppColors.white),
                            label: const Text('Usar esta descripción'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/ai_settings_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminValidationScreen extends StatefulWidget {
  const AdminValidationScreen({super.key});

  @override
  State<AdminValidationScreen> createState() => _AdminValidationScreenState();
}

class _AdminValidationScreenState extends State<AdminValidationScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _comerciosPendientes = [];

  // Paleta de colores oficial
  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);
  final Color darkCardColor = const Color(0xFF252152);

  @override
  void initState() {
    super.initState();
    _loadComercios();
  }

  Future<void> _loadComercios() async {
    setState(() => _isLoading = true);
    try {
      // Solo traemos los que están "En Revision"
      final response = await _supabase
          .from('comercios')
          .select('*')
          .eq('estatus_verificacion', 'En Revision');
      setState(() => _comerciosPendientes = response);
    } catch (e) {
      debugPrint('Error cargando comercios: $e');
      _showErrorSnack('Error al cargar lista: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showErrorSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  Future<void> _verDocumento(String? path, String tipoDocumento) async {
    if (path == null || path.isEmpty) {
      _showErrorSnack('El comercio no subió el documento: $tipoDocumento');
      return;
    }

    try {
      // Generamos URL firmada de 60 segundos por seguridad
      final signedUrl = await _supabase.storage
          .from('documentos_comercios')
          .createSignedUrl(path, 60);

      final uri = Uri.parse(signedUrl);
      // Abrimos en navegador externo o visor de PDF del sistema
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('No se pudo abrir el enlace del documento');
      }
    } catch (e) {
      _showErrorSnack('Error al abrir documento: $e');
    }
  }

  Future<void> _confirmarAccion(String comercioId, String nombre, String nuevoEstado) async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(nuevoEstado == 'Aprobado' ? '¿Aprobar Comercio?' : '¿Rechazar Comercio?'),
        content: Text('Estás a punto de marcar a "$nombre" como "$nuevoEstado". Esta acción notificará al comercio.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: nuevoEstado == 'Aprobado' ? Colors.green : Colors.red,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Sí, $nuevoEstado', style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _actualizarEstado(comercioId, nuevoEstado);
    }
  }

  Future<void> _actualizarEstado(String comercioId, String nuevoEstado) async {
    try {
      await _supabase.from('comercios').update({
        'estatus_verificacion': nuevoEstado
      }).eq('id', comercioId);
      
      _showSuccessSnack('Comercio $nuevoEstado exitosamente.');
      _loadComercios(); // Recargar lista
    } catch (e) {
      _showErrorSnack('Error al actualizar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Validación de Comercios', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            tooltip: 'Actualizar Lista',
            onPressed: _loadComercios,
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : _comerciosPendientes.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, size: 80, color: Colors.green[300]),
                      const SizedBox(height: 16),
                      const Text('¡Todo al día!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const Text('No hay comercios pendientes por revisar.', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _comerciosPendientes.length,
                  itemBuilder: (context, index) {
                    final comercio = _comerciosPendientes[index];
                    final nombre = comercio['nombre_comercial'] ?? 'Sin nombre';
                    final rif = comercio['rif'] ?? 'Sin RIF';
                    final categoria = comercio['categoria'] ?? 'Sin categoría';
                    final tipo = comercio['tipo_comercio']?.toString().toUpperCase() ?? 'NO DEFINIDO';
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Cabecera del Comercio
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(nombre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                                  child: Text(tipo, style: TextStyle(color: primaryPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text('RIF: $rif', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                            Text('Categoría: $categoria', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                            
                            const Divider(height: 24),
                            
                            // Botones de Documentos
                            const Text('Documentos Legales:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildDocChip('RIF', comercio['doc_rif_url']),
                                _buildDocChip('Acta/Registro', comercio['doc_constitutivo_url']),
                                _buildDocChip('Cédulas', comercio['doc_cedulas_url']),
                              ],
                            ),
                            
                            const SizedBox(height: 20),
                            
                            // Botones de Acción
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () => _confirmarAccion(comercio['id'], nombre, 'Rechazado'),
                                  icon: const Icon(Icons.close, size: 18),
                                  label: const Text('Rechazar'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    side: const BorderSide(color: Colors.red),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton.icon(
                                  onPressed: () => _confirmarAccion(comercio['id'], nombre, 'Aprobado'),
                                  icon: const Icon(Icons.check, size: 18),
                                  label: const Text('Aprobar'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  // Chip para abrir el documento
  Widget _buildDocChip(String label, String? path) {
    final hasDoc = path != null && path.isNotEmpty;
    return ActionChip(
      avatar: Icon(
        hasDoc ? Icons.picture_as_pdf : Icons.warning_amber_rounded, 
        color: hasDoc ? Colors.red : Colors.orange, 
        size: 18
      ),
      label: Text(
        hasDoc ? label : '$label (Falta)',
        style: TextStyle(color: hasDoc ? Colors.black87 : Colors.orange),
      ),
      backgroundColor: hasDoc ? Colors.red.withOpacity(0.05) : Colors.orange.withOpacity(0.1),
      onPressed: () => _verDocumento(path, label),
    );
  }
}```

### 📄 lib/screens/all_offers_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_favorites_controller.dart';
import 'client_checkout_screen.dart';

// CONTROLADOR INTERNO PARA ORDENAR POR PATROCINIO
class AllOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  bool isLoading = true;
  List<dynamic> offers = [];
  List<dynamic> filteredOffers = [];
  String? selectedCategory;

  final List<String> categories = [
    'Todas', 'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 
    'Salud y Belleza', 'Hogar y Ferretería', 'Supermercado', 
    'Farmacia', 'Servicios', 'Otros'
  ];

  AllOffersController() { loadAllOffers(); }

  Future<void> loadAllOffers() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          // ORDENAMOS PRIMERO POR PATROCINIO Y LUEGO POR FECHA
          .order('es_patrocinada', ascending: false) 
          .order('fecha_inicio', ascending: false);
      offers = response;
      _applyFilter();
    } catch (e) {
      debugPrint('Error cargando ofertas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void filterByCategory(String? category) {
    selectedCategory = category;
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (selectedCategory == null || selectedCategory == 'Todas') {
      filteredOffers = offers;
    } else {
      filteredOffers = offers.where((o) => o['categoria'] == selectedCategory).toList();
    }
  }
}


class AllOffersScreen extends StatefulWidget {
  const AllOffersScreen({super.key});

  @override
  State<AllOffersScreen> createState() => _AllOffersScreenState();
}

class _AllOffersScreenState extends State<AllOffersScreen> {
  final _offersController = AllOffersController();
  final _favoritesController = ClientFavoritesController();

  @override
  void dispose() {
    _favoritesController.dispose();
    super.dispose();
  }

  void _irAlCheckout(Map<String, dynamic> oferta) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_offersController, _favoritesController]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Todas las Ofertas')),
          body: Column(
            children: [
              // FILTRO DE CATEGORÍAS
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _offersController.categories.length,
                  itemBuilder: (context, index) {
                    final category = _offersController.categories[index];
                    final isSelected = (_offersController.selectedCategory == null && category == 'Todas') || _offersController.selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
                      child: FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (val) => _offersController.filterByCategory(category == 'Todas' ? null : category),
                        selectedColor: AppColors.primaryPurple,
                        labelStyle: TextStyle(color: isSelected ? Colors.white : AppColors.textDark, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
                        checkmarkColor: Colors.white,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
                      ),
                    );
                  },
                ),
              ),

              // LISTA DE OFERTAS
              Expanded(
                child: _offersController.isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                    : _offersController.filteredOffers.isEmpty
                        ? const Center(child: Text('No hay ofertas en esta categoría.', style: TextStyle(color: Colors.grey)))
                        : GridView.builder(
                            padding: const EdgeInsets.all(16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: _offersController.filteredOffers.length,
                            itemBuilder: (context, index) {
                              final oferta = _offersController.filteredOffers[index];
                              return _buildOfferCard(oferta);
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOfferCard(Map<String, dynamic> oferta) {
    final isFav = _favoritesController.isFavorite(oferta['id'].toString());
    final isSponsored = oferta['es_patrocinada'] ?? false; 

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: isSponsored ? Border.all(color: Colors.amber, width: 2) : null, 
        boxShadow: [BoxShadow(color: isSponsored ? Colors.amber.withOpacity(0.2) : Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          // CORRECCIÓN AQUÍ: _irAlCheckout en lugar de _irAlClheckout
          onTap: () => _irAlCheckout(oferta), 
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                          ? Image.network(oferta['imagen_url'], width: double.infinity, fit: BoxFit.cover)
                          : Container(color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: AppColors.primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: Text(oferta['categoria'] ?? 'General', style: const TextStyle(color: AppColors.primaryPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          oferta['producto_nombre'] ?? 'Producto',
                          maxLines: 2, overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.2),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (oferta['precio_oferta'] != null) ...[
                              Text('\$${oferta['precio_oferta']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 18)),
                              const SizedBox(width: 6),
                              Text('\$${oferta['precio_regular']}', style: const TextStyle(color: Colors.grey, fontSize: 12, decoration: TextDecoration.lineThrough)),
                            ] else ...[
                              Text('\$${oferta['precio_regular']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 18)),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              // BADGE DE "DESTACADO"
              if (isSponsored)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomRight: Radius.circular(12)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text('DESTACADO', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              
              // BOTÓN DE FAVORITO
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => _favoritesController.toggleFavorite(oferta['id'].toString()),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                    ),
                    child: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? AppColors.error : Colors.grey, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}```

### 📄 lib/screens/chat_screen.dart
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:web/web.dart' as web;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AsistenteIAScreen extends StatefulWidget {
  const AsistenteIAScreen({super.key});

  @override
  State<AsistenteIAScreen> createState() => _AsistenteIAScreenState();
}

class _AsistenteIAScreenState extends State<AsistenteIAScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {'role': 'ai', 'text': '¡Hola! Soy tu asistente OfVe. ¿Qué producto estás buscando hoy?'}
  ];
  bool _isTyping = false;
  
  // Variable para mostrar el nombre de la IA activa
  String _currentProviderName = "IA";
  
  final _storage = const FlutterSecureStorage(); 
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _initTts();
    _loadProviderName(); // Carga el nombre del proveedor al iniciar
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage("es-MX");
    await _flutterTts.setSpeechRate(0.6);
    await _flutterTts.setPitch(1.1);
  }

  Future<void> _loadProviderName() async {
    final provider = await _storage.read(key: 'ai_provider') ?? 'gemini';
    if (mounted) {
      setState(() {
        if (provider == 'openai') _currentProviderName = "ChatGPT";
        else if (provider == 'anthropic') _currentProviderName = "Claude";
        else _currentProviderName = "Gemini";
      });
    }
  }

  Future<void> _speak(String text) async {
    if (kIsWeb) {
      final utterance = web.SpeechSynthesisUtterance(text);
      utterance.lang = 'es-MX';
      utterance.rate = 1.3;
      utterance.pitch = 1.1;
      utterance.volume = 1.0;
      
      web.window.speechSynthesis.cancel();
      web.window.speechSynthesis.speak(utterance);
    } else {
      await _flutterTts.speak(text);
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _controller.text = val.recognizedWords;
          }),
          localeId: 'es_MX',
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    final userText = _controller.text;
    setState(() {
      _messages.add({'role': 'user', 'text': userText});
      _isTyping = true;
    });
    _controller.clear();

    try {
      // LEEMOS LA CONFIGURACIÓN DEL USUARIO
      final provider = await _storage.read(key: 'ai_provider') ?? 'gemini';
      final userApiKey = await _storage.read(key: 'ai_api_key');

      if (userApiKey == null || userApiKey.isEmpty) {
        setState(() {
          _messages.add({'role': 'ai', 'text': 'Por favor, toca el avatar en el inicio y configura tu API Key.'});
          _isTyping = false;
        });
        return;
      }

      final response = await http.post(
        Uri.parse("https://ofve-api.eddisongabrielrodriguez.workers.dev/chat"),
        headers: {
          "Content-Type": "application/json",
          "x-ai-provider": provider,
          "x-user-api-key": userApiKey,
        },
        body: jsonEncode({
          "mensaje": userText,
          "lat": 10.4806,
          "lon": -66.9036
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final respuestaIA = data['respuesta'];
        setState(() {
          _messages.add({'role': 'ai', 'text': respuestaIA});
        });
        await _speak(respuestaIA);
      } else {
        final errorData = jsonDecode(response.body);
        final errorMsg = errorData['error'] ?? 'Error desconocido';
        
        // Manejo de errores amigable para el usuario
        String userFriendlyError = errorMsg;
        if (errorMsg.contains("401") || errorMsg.toLowerCase().contains("api key") || errorMsg.toLowerCase().contains("invalid")) {
           userFriendlyError = "Tu API Key de $_currentProviderName parece ser inválida. Por favor, revísala en los ajustes.";
        }

        setState(() {
          _messages.add({'role': 'ai', 'text': '⚠️ $userFriendlyError'});
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({'role': 'ai', 'text': 'Error de red. Revisa tu conexión.'});
      });
    } finally {
      setState(() => _isTyping = false);
    }
  }

  @override
  void dispose() {
    _speech.stop();
    _flutterTts.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistente OfVe IA'),
        backgroundColor: const Color(0xFF2D3A5A),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFF6B4EFF) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: isUser ? const Radius.circular(16) : const Radius.circular(0),
                        bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(16),
                      ),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(color: isUser ? Colors.white : Colors.black87, fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_currentProviderName está pensando...', 
                style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)
              ),
            ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: _isListening ? Colors.red : Colors.grey.shade200,
                  child: IconButton(
                    icon: Icon(_isListening ? Icons.stop : Icons.mic, color: _isListening ? Colors.white : const Color(0xFF6B4EFF)),
                    onPressed: _listen,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Escribe o dicta tu pregunta...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: const Color(0xFF6B4EFF),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/client_ai_assistant_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_ai_controller.dart';
import 'client_checkout_screen.dart';

class ClientAiAssistantScreen extends StatefulWidget {
  const ClientAiAssistantScreen({super.key});

  @override
  State<ClientAiAssistantScreen> createState() => _ClientAiAssistantScreenState();
}

class _ClientAiAssistantScreenState extends State<ClientAiAssistantScreen> {
  final _aiController = ClientAiController();
  final _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _enviarPregunta() {
    final text = _promptController.text.trim();
    if (text.isNotEmpty) {
      _aiController.askAssistant(text);
      _promptController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _aiController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Asistente de Compras IA'),
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline, color: AppColors.textDark),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('¿Cómo usar el Asistente?'),
                      // CORRECCIÓN: Se escapó el $ con \
                      content: const Text('Pídeme recomendaciones como:\n\n- "Quiero hacer una cena romántica con 20\$"\n- "¿Qué me recomiendas para el desayuno de mañana?"\n- "Busco algo dulce para el postre"'),
                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Entendido'))],
                    ),
                  );
                },
              )
            ],
          ),
          body: Column(
            children: [
              // ÁREA DE CHAT / RESULTADOS
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Burbuja de bienvenida
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)
                          ),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: const Text(
                          '¡Hola! Soy tu asistente personal. ¿Qué estás buscando o qué planes tienes hoy? Dime tu presupuesto y te armaré una recomendación perfecta.',
                          style: TextStyle(fontSize: 15, color: AppColors.textDark),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // LOADING
                      if (_aiController.isLoading)
                        const Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(color: AppColors.primaryPurple),
                              SizedBox(height: 12),
                              Text('Buscando las mejores ofertas para ti...', style: TextStyle(color: AppColors.textLight)),
                            ],
                          ),
                        ),

                      // RESPUESTA DE LA IA
                      if (_aiController.aiMessage != null) ...[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(backgroundColor: AppColors.primaryPurple, child: Icon(Icons.smart_toy, color: AppColors.white)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryPurple.withOpacity(0.1),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16), topRight: Radius.circular(0), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)
                                  ),
                                ),
                                child: Text(_aiController.aiMessage!, style: const TextStyle(fontSize: 15, color: AppColors.textDark)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],

                      // TARJETAS DE OFERTAS RECOMENDADAS
                      if (_aiController.recommendedOffers.isNotEmpty)
                        ..._aiController.recommendedOffers.map((oferta) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                                    ? Image.network(oferta['imagen_url'], width: 60, height: 60, fit: BoxFit.cover)
                                    : Container(width: 60, height: 60, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                              ),
                              title: Text(oferta['producto_nombre'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              subtitle: Text('\$${oferta['precio_oferta'] ?? oferta['precio_regular']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
                              trailing: IconButton(
                                icon: const Icon(Icons.shopping_cart, color: AppColors.primaryPurple),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)));
                                },
                              ),
                            ),
                          );
                        }),

                      if (_aiController.errorMessage != null)
                        Text(_aiController.errorMessage!, style: const TextStyle(color: AppColors.error)),
                    ],
                  ),
                ),
              ),

              // INPUT DE TEXTO INFERIOR
              Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _promptController,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => _enviarPregunta(),
                        decoration: InputDecoration(
                          hintText: 'Ej: Busco algo para cenar con \$10...',
                          filled: true,
                          fillColor: AppColors.bgTop,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryPurple,
                      radius: 24,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: AppColors.white, size: 20),
                        onPressed: _aiController.isLoading ? null : _enviarPregunta,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_announcements_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_announcements_controller.dart';

class ClientAnnouncementsScreen extends StatefulWidget {
  const ClientAnnouncementsScreen({super.key});

  @override
  State<ClientAnnouncementsScreen> createState() => _ClientAnnouncementsScreenState();
}

class _ClientAnnouncementsScreenState extends State<ClientAnnouncementsScreen> {
  final _announcementsController = ClientAnnouncementsController();

  @override
  void initState() {
    super.initState();
    // Marcamos como leídos al abrir la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announcementsController.markAsRead();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _announcementsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Anuncios de OfVe')),
          body: _announcementsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _announcementsController.announcements.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notifications_off, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No hay anuncios nuevos.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: _announcementsController.announcements.length,
                      itemBuilder: (context, index) {
                        final anuncio = _announcementsController.announcements[index];
                        final fecha = DateTime.parse(anuncio['fecha_creacion']).toLocal();
                        final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(fecha);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryPurple.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.campaign, color: AppColors.primaryPurple, size: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        anuncio['titulo'],
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  anuncio['mensaje'],
                                  style: const TextStyle(fontSize: 14, color: AppColors.textDark, height: 1.4),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_checkout_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/purchase_controller.dart';
import 'purchase_qr_screen.dart';

class ClientCheckoutScreen extends StatefulWidget {
  final Map<String, dynamic> oferta;

  const ClientCheckoutScreen({super.key, required this.oferta});

  @override
  State<ClientCheckoutScreen> createState() => _ClientCheckoutScreenState();
}

class _ClientCheckoutScreenState extends State<ClientCheckoutScreen> {
  final _purchaseController = PurchaseController();
  final _couponController = TextEditingController();

  double _precioOriginal = 0.0;
  double _precioFinal = 0.0;
  bool _cuponAplicado = false;
  int _porcentajeDescuento = 0;
  bool _isValidatingCoupon = false;

  @override
  void initState() {
    super.initState();
    // Usamos el precio de oferta si existe, sino el regular
    _precioOriginal = widget.oferta['precio_oferta'] != null 
        ? (widget.oferta['precio_oferta'] as num).toDouble()
        : (widget.oferta['precio_regular'] as num).toDouble();
    _precioFinal = _precioOriginal;
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  Future<void> _aplicarCupon() async {
    final codigo = _couponController.text.trim();
    if (codigo.isEmpty) return;

    setState(() => _isValidatingCoupon = true);

    final descuento = await _purchaseController.validarCupon(codigo, widget.oferta['comercio_id']);

    if (mounted) {
      setState(() => _isValidatingCoupon = false);

      if (descuento != null) {
        setState(() {
          _porcentajeDescuento = descuento;
          _precioFinal = _precioOriginal - (_precioOriginal * (descuento / 100));
          _cuponAplicado = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('¡Cupón aplicado! $descuento% de descuento.'), backgroundColor: AppColors.success),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_purchaseController.errorMessage ?? 'Cupón inválido'), backgroundColor: AppColors.error),
        );
      }
    }
  }

  Future<void> _confirmarCompra() async {
    final success = await _purchaseController.createPurchase(
      comercioId: widget.oferta['comercio_id'],
      ofertaId: widget.oferta['id'],
      montoFinal: _precioFinal,
    );

    if (success && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PurchaseQrScreen(
            qrToken: _purchaseController.purchaseData!['qr_token'],
            total: _precioFinal,
            nombreComercio: 'el Comercio',
          ),
        ),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_purchaseController.errorMessage ?? 'Error al generar compra'), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _purchaseController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Finalizar Compra')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // TARJETA DEL PRODUCTO
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: (widget.oferta['imagen_url'] != null && widget.oferta['imagen_url'].toString().isNotEmpty)
                            ? Image.network(widget.oferta['imagen_url'], width: 80, height: 80, fit: BoxFit.cover)
                            : Container(width: 80, height: 80, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.oferta['producto_nombre'] ?? 'Producto', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 8),
                            Text('\$${_precioOriginal.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.textLight, fontSize: 14)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                const Text('¿Tienes un cupón de descuento?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                
                // INPUT DE CUPÓN
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _couponController,
                        textCapitalization: TextCapitalization.characters,
                        enabled: !_cuponAplicado,
                        decoration: InputDecoration(
                          labelText: 'Código del Cupón',
                          prefixIcon: const Icon(Icons.local_activity),
                          filled: true,
                          fillColor: _cuponAplicado ? Colors.green.withOpacity(0.1) : AppColors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _cuponAplicado ? AppColors.success : AppColors.primaryPurple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: (_cuponAplicado || _isValidatingCoupon) ? null : _aplicarCupon,
                        child: _isValidatingCoupon 
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                          : Icon(_cuponAplicado ? Icons.check : Icons.local_offer, color: AppColors.white),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 40),
                const Divider(),
                const SizedBox(height: 20),

                // RESUMEN DE PAGO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal:', style: TextStyle(fontSize: 16)),
                    Text('\$${_precioOriginal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
                if (_cuponAplicado) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Descuento ($_porcentajeDescuento%):', style: const TextStyle(fontSize: 16, color: AppColors.success)),
                      Text('-\$${(_precioOriginal * (_porcentajeDescuento / 100)).toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: AppColors.success)),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total a Pagar:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('\$${_precioFinal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                  ],
                ),

                const SizedBox(height: 40),

                // BOTÓN FINAL
                SizedBox(
                  height: 55,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _purchaseController.isLoading ? null : _confirmarCompra,
                    icon: _purchaseController.isLoading 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                        : const Icon(Icons.qr_code, color: AppColors.white),
                    label: Text(
                      _purchaseController.isLoading ? 'Generando QR...' : 'Confirmar y Generar QR',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_dashboard_tab.dart
```dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../controllers/client_controller.dart';
import '../controllers/client_announcements_controller.dart';
import '../controllers/client_favorites_controller.dart';
import '../core/theme/app_theme.dart';
import '../widgets/notification_bell.dart'; // <-- NUEVA IMPORTACIÓN
import 'client_validation_screen.dart';
import 'client_checkout_screen.dart'; 
import 'client_plan_purchase_screen.dart'; 
import 'nearby_offers_map_screen.dart'; 
import 'all_offers_screen.dart'; 
import 'client_guided_purchase_screen.dart'; 
import 'client_ai_assistant_screen.dart'; 
import 'client_vip_plans_screen.dart';
import 'client_announcements_screen.dart';
import 'client_points_screen.dart';

class ClientDashboardTab extends StatefulWidget {
  final String userName;
  final int puntos;

  const ClientDashboardTab({
    super.key,
    required this.userName,
    required this.puntos,
  });

  @override
  State<ClientDashboardTab> createState() => _ClientDashboardTabState();
}

class _ClientDashboardTabState extends State<ClientDashboardTab> {
  final _clientController = ClientController();
  final _announcementsController = ClientAnnouncementsController();
  final _favoritesController = ClientFavoritesController(); 
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _announcementsController.dispose();
    _favoritesController.dispose();
    super.dispose();
  }

  void _irAlCheckout(Map<String, dynamic> oferta) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)),
    );
  }

  Future<void> _ejecutarBusquedaSemantica(String query) async {
    if (query.trim().isEmpty) return;

    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
    );

    try {
      final response = await Supabase.instance.client.functions.invoke(
        'search-semantic',
        body: {'query': query},
      );

      if (mounted) Navigator.pop(context);

      if (response.status == 200) {
        final results = response.data['ofertas'];
        if (results.isEmpty) {
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No encontramos ofertas para tu búsqueda.'), backgroundColor: AppColors.warning));
        } else {
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('¡Encontramos ${results.length} ofertas con IA!'), backgroundColor: AppColors.success));
        }
      } else {
        throw Exception('Error en el servidor');
      }
    } catch (e) {
      if (mounted) Navigator.pop(context);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al buscar: $e'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_clientController, _announcementsController, _favoritesController]),
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.bgTop, AppColors.bgBottom],
                  stops: const [0.0, 0.4],
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.curveColor.withOpacity(0.8),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 20),
                    _buildUserInfo(),
                    const SizedBox(height: 20),
                    _buildSearchBar(),
                    const SizedBox(height: 24),
                    _buildClientGrid(),
                    const SizedBox(height: 30),
                    _buildOfferSection(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 28, color: AppColors.textDark),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        Row(
          children: [
            // CAMPANITA DE NOTIFICACIONES EN TIEMPO REAL
            const NotificationBell(),

            // ACCESO DIRECTO A ANUNCIOS GLOBALES
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.campaign, size: 28, color: AppColors.primaryPurple),
                  tooltip: 'Anuncios de OfVe',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientAnnouncementsScreen()));
                    _announcementsController.markAsRead();
                  },
                ),
                if (_announcementsController.unreadCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        '${_announcementsController.unreadCount}',
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.notifications_active, size: 28, color: AppColors.primaryPurple),
              tooltip: 'Validar Compras Pendientes',
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientValidationScreen())),
            ),
            const Icon(Icons.settings, size: 28, color: AppColors.textDark),
          ],
        )
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.white,
          child: Icon(Icons.person, color: Colors.grey, size: 28),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star_half, color: Colors.orange, size: 18),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              '${widget.puntos} Puntos',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textDark),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: TextField(
        controller: _searchController,
        onSubmitted: _ejecutarBusquedaSemantica,
        decoration: InputDecoration(
          hintText: '¿Qué buscas hoy, ${widget.userName}',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
          prefixIcon: const Icon(Icons.mic, color: AppColors.primaryPurple, size: 22),
          suffixIcon: const Icon(Icons.search, color: AppColors.primaryPurple, size: 24),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildClientGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: [
        _buildCard(imagePath: 'assets/icons/robot.webp', title: 'Asistente IA', subtitle: 'Todo a mano', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientAiAssistantScreen()))),
        _buildCard(imagePath: 'assets/icons/bolsa.webp', title: 'Compra Guiada', subtitle: 'Optimiza presupuesto', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientGuidedPurchaseScreen()))),
        _buildCard(imagePath: 'assets/icons/planifica.webp', title: 'Planifica Compra', subtitle: 'Ahorra tiempo', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientPlanPurchaseScreen()))),
        _buildCard(imagePath: 'assets/icons/brujula.webp', title: 'Ofertas Cercanas', subtitle: 'Ver mapa', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NearbyOffersMapScreen()))),
        _buildCard(
          imagePath: 'assets/icons/corona.webp', 
          title: 'Mis Puntos', 
          subtitle: '${widget.puntos} pts', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientPointsScreen()))
        ),
        _buildCard(imagePath: 'assets/icons/regalo.webp', title: 'Todas las Ofertas', subtitle: 'Ilimitado', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AllOffersScreen()))),
      ],
    );
  }

  Widget _buildCard({required String imagePath, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkCardColor.withOpacity(0.85),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.white.withOpacity(0.15), width: 1),
              boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_bag, color: AppColors.white, size: 32)),
                const SizedBox(height: 8),
                Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: AppColors.white.withOpacity(0.6), fontSize: 9)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOfferSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Oferta del Día', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AllOffersScreen())),
              child: Text('Ver todas', style: TextStyle(color: AppColors.textMagenta, fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        
        if (_clientController.isLoadingOffers)
          const Center(child: Padding(padding: EdgeInsets.all(20.0), child: CircularProgressIndicator(color: AppColors.primaryPurple)))
        else if (_clientController.offers.isEmpty)
          const Text('No hay ofertas disponibles hoy.', style: TextStyle(color: AppColors.textLight))
        else
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _clientController.offers.length,
              itemBuilder: (context, index) {
                final oferta = _clientController.offers[index];
                final isFav = _favoritesController.isFavorite(oferta['id'].toString());
                
                return Container(
                  width: 150, 
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => _irAlCheckout(oferta),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                                    ? Image.network(oferta['imagen_url'], height: 90, width: double.infinity, fit: BoxFit.cover)
                                    : Container(height: 90, width: double.infinity, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        oferta['producto_nombre'] ?? 'Producto',
                                        maxLines: 1, overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          if (oferta['precio_oferta'] != null) ...[
                                            Text('\$${oferta['precio_oferta']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                            const SizedBox(width: 4),
                                            Text('\$${oferta['precio_regular']}', style: const TextStyle(color: Colors.grey, fontSize: 10, decoration: TextDecoration.lineThrough)),
                                          ] else ...[
                                            Text('\$${oferta['precio_regular']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                          ],
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryPurple.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Text('Comprar', textAlign: TextAlign.center, style: TextStyle(color: AppColors.primaryPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () => _favoritesController.toggleFavorite(oferta['id'].toString()),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.9),
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                                ),
                                child: Icon(
                                  isFav ? Icons.favorite : Icons.favorite_border,
                                  color: isFav ? AppColors.error : Colors.grey,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}```

### 📄 lib/screens/client_dashboard_tab2.dart
```dart
import 'dart:ui'; // <-- IMPORTANTE: Necesario para el ImageFilter (blur)
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientDashboardTab extends StatefulWidget {
  final String userName;
  final int puntos;
  final Color bgTop;
  final Color bgBottom;
  final Color curveColor;
  final Color darkCardColor;
  final Color primaryPurple;
  final Color textMagenta;

  const ClientDashboardTab({
    super.key,
    required this.userName,
    required this.puntos,
    required this.bgTop,
    required this.bgBottom,
    required this.curveColor,
    required this.darkCardColor,
    required this.primaryPurple,
    required this.textMagenta,
  });

  @override
  State<ClientDashboardTab> createState() => _ClientDashboardTabState();
}

class _ClientDashboardTabState extends State<ClientDashboardTab> {
  final _supabase = Supabase.instance.client;
  List<dynamic> _ofertas = [];
  bool _isLoadingOfertas = true;

  @override
  void initState() {
    super.initState();
    _cargarOfertas();
  }

  Future<void> _cargarOfertas() async {
    try {
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .order('fecha_inicio', ascending: false)
          .limit(5);
      setState(() => _ofertas = response);
    } catch (e) {
      debugPrint('Error cargando ofertas: $e');
    } finally {
      if (mounted) setState(() => _isLoadingOfertas = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. FONDO DEGRADADO
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [widget.bgTop, widget.bgBottom],
              stops: const [0.0, 0.4],
            ),
          ),
        ),
        // 2. CURVA DIFUMINADA
        Positioned(
          top: -150,
          left: -100,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.curveColor.withOpacity(0.8),
            ),
          ),
        ),
        // 3. CONTENIDO PRINCIPAL
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 20),
                _buildUserInfo(),
                const SizedBox(height: 20),
                _buildSearchBar(),
                const SizedBox(height: 24),
                _buildClientGrid(),
                const SizedBox(height: 30),
                _buildOfferSection(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 28, color: Colors.black87),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        const Icon(Icons.settings, size: 28, color: Colors.black87),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, color: Colors.grey, size: 28),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Icon(Icons.star_half, color: Colors.orange, size: 18),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              'US. \$ ${widget.puntos},00',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: '¿Qué buscas hoy, ${widget.userName}',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
          prefixIcon: Icon(Icons.mic, color: widget.primaryPurple, size: 22),
          suffixIcon: Icon(Icons.search, color: widget.primaryPurple, size: 24),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildClientGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: [
        _buildCard(imagePath: 'assets/icons/robot.webp', title: 'Asistente IA', subtitle: 'Todo a mano', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/bolsa.webp', title: 'Compra Guiada', subtitle: 'Optimiza presupuesto', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/planifica.webp', title: 'Planifica Compra', subtitle: 'Ahorra tiempo', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/brujula.webp', title: 'Ofertas Cercanas', subtitle: 'Ver mapa', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/corona.webp', title: 'Planes VIP', subtitle: 'Descuentos', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/regalo.webp', title: 'Todas las Ofertas', subtitle: 'Ilimitado', onTap: () {}),
      ],
    );
  }

  // --- TARJETA CON EFECTO DE CRISTAL DIFUMINADO (GLASSMORPHISM) ---
  Widget _buildCard({required String imagePath, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          // Aplicamos el difuminado de fondo
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              // Color base semi-transparente para el efecto de cristal
              color: widget.darkCardColor.withOpacity(0.85),
              borderRadius: BorderRadius.circular(16),
              // Borde sutil para simular el reflejo del cristal
              border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
              // Sombra suave
              boxShadow: [BoxShadow(color: widget.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_bag, color: Colors.white, size: 32),
                ),
                const SizedBox(height: 8),
                Text(
                  title, 
                  textAlign: TextAlign.center, 
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle, 
                  textAlign: TextAlign.center, 
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 9)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOfferSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Oferta del Día', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            Text('Ver todas', style: TextStyle(color: widget.textMagenta, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 10),
        
        if (_isLoadingOfertas)
          Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(color: widget.primaryPurple),
          ))
        else if (_ofertas.isEmpty)
          const Text('No hay ofertas disponibles hoy.', style: TextStyle(color: Colors.black54))
        else
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _ofertas.length,
              itemBuilder: (context, index) {
                final oferta = _ofertas[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                            ? Image.network(oferta['imagen_url'], height: 90, width: double.infinity, fit: BoxFit.cover)
                            : Container(height: 90, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              oferta['producto_nombre'] ?? 'Producto',
                              maxLines: 1, overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                if (oferta['precio_oferta'] != null) ...[
                                  Text('\$${oferta['precio_oferta']}', style: TextStyle(color: widget.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                  const SizedBox(width: 4),
                                  Text('\$${oferta['precio_regular']}', style: const TextStyle(color: Colors.grey, fontSize: 10, decoration: TextDecoration.lineThrough)),
                                ] else ...[
                                  Text('\$${oferta['precio_regular']}', style: TextStyle(color: widget.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
```

### 📄 lib/screens/client_favorites_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_favorites_controller.dart';
import 'client_checkout_screen.dart';

class ClientFavoritesScreen extends StatefulWidget {
  const ClientFavoritesScreen({super.key});

  @override
  State<ClientFavoritesScreen> createState() => _ClientFavoritesScreenState();
}

class _ClientFavoritesScreenState extends State<ClientFavoritesScreen> {
  final _favoritesController = ClientFavoritesController();

  void _irAlCheckout(Map<String, dynamic> oferta) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _favoritesController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Favoritos')),
          body: _favoritesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _favoritesController.favorites.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No tienes favoritos aún.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Explora las ofertas y guarda las que te gusten!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _favoritesController.favorites.length,
                      itemBuilder: (context, index) {
                        final oferta = _favoritesController.favorites[index];
                        
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                                  ? Image.network(oferta['imagen_url'], width: 70, height: 70, fit: BoxFit.cover)
                                  : Container(width: 70, height: 70, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                            ),
                            title: Text(
                              oferta['producto_nombre'] ?? 'Producto',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  '\$${oferta['precio_oferta'] ?? oferta['precio_regular']}',
                                  style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.favorite, color: AppColors.error),
                                  onPressed: () => _favoritesController.toggleFavorite(oferta['id']),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.shopping_cart, color: AppColors.primaryPurple),
                                  onPressed: () => _irAlCheckout(oferta),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_followed_stores_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import 'client_store_profile_screen.dart';

class ClientFollowedStoresScreen extends StatefulWidget {
  const ClientFollowedStoresScreen({super.key});

  @override
  State<ClientFollowedStoresScreen> createState() => _ClientFollowedStoresScreenState();
}

class _ClientFollowedStoresScreenState extends State<ClientFollowedStoresScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _stores = [];

  @override
  void initState() {
    super.initState();
    _loadStores();
  }

  Future<void> _loadStores() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('seguidores_comercios')
          .select('comercio_id, comercios(*)')
          .eq('usuario_id', userId);
      
      // Extraemos la info de la tienda
      _stores = response.map((f) => f['comercios']).toList();
    } catch (e) {
      debugPrint('Error cargando tiendas seguidas: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Tiendas que sigo')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _stores.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.storefront, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('Aún no sigues ninguna tienda.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                      Text('¡Explora las ofertas y sigue a tus favoritas!', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _stores.length,
                  itemBuilder: (context, index) {
                    final store = _stores[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.bgTop,
                          backgroundImage: (store['logo_url'] != null && store['logo_url'].toString().isNotEmpty) ? NetworkImage(store['logo_url']) : null,
                          child: (store['logo_url'] == null || store['logo_url'].toString().isEmpty) ? const Icon(Icons.store, color: AppColors.primaryPurple) : null,
                        ),
                        title: Text(store['nombre_comercial'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(store['categoria'] ?? ''),
                        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (_) => ClientStoreProfileScreen(comercioId: store['id']))
                          ).then((_) => _loadStores()); // Recargar al volver por si dejó de seguir
                        },
                      ),
                    );
                  },
                ),
    );
  }
}```

### 📄 lib/screens/client_guided_purchase_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/guided_purchase_controller.dart';
import 'client_checkout_screen.dart';

class ClientGuidedPurchaseScreen extends StatefulWidget {
  const ClientGuidedPurchaseScreen({super.key});

  @override
  State<ClientGuidedPurchaseScreen> createState() => _ClientGuidedPurchaseScreenState();
}

class _ClientGuidedPurchaseScreenState extends State<ClientGuidedPurchaseScreen> {
  final _purchaseController = GuidedPurchaseController();
  final _budgetController = TextEditingController();
  
  String _selectedCategory = 'Supermercado';
  final List<String> _categories = [
    'Supermercado', 'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 
    'Salud y Belleza', 'Hogar y Ferretería', 'Farmacia', 'Servicios', 'Otros'
  ];

  // Lista inicial con un producto vacío
  final List<Map<String, dynamic>> _requestedItems = [
    {'nombre': '', 'cantidad': '1'}
  ];

  void _agregarItem() {
    setState(() {
      _requestedItems.add({'nombre': '', 'cantidad': '1'});
    });
  }

  void _eliminarItem(int index) {
    if (_requestedItems.length > 1) {
      setState(() => _requestedItems.removeAt(index));
    }
  }

  Future<void> _generarOptimizacion() async {
    final budget = double.tryParse(_budgetController.text);
    if (budget == null || budget <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ingresa un presupuesto válido.'), backgroundColor: AppColors.error));
      return;
    }

    // Filtrar productos vacíos
    final cleanItems = _requestedItems.where((item) => item['nombre'].toString().trim().isNotEmpty).toList();
    if (cleanItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Agrega al menos un producto a tu lista.'), backgroundColor: AppColors.warning));
      return;
    }

    final success = await _purchaseController.optimizeBasket(
      budget: budget,
      category: _selectedCategory,
      requestedItems: cleanItems,
    );

    if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_purchaseController.errorMessage ?? 'Error al optimizar'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _purchaseController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Compra Guiada')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // FORMULARIO DE CONFIGURACIÓN
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('1. Presupuesto y Categoría', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _budgetController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              decoration: const InputDecoration(labelText: 'Presupuesto (USD)', prefixIcon: Icon(Icons.attach_money)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedCategory,
                              decoration: const InputDecoration(labelText: 'Categoría'),
                              items: _categories.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                              onChanged: (v) => setState(() => _selectedCategory = v!),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text('2. Productos que necesitas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      
                      // LISTA DINÁMICA DE PRODUCTOS
                      ..._requestedItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  initialValue: item['nombre'],
                                  decoration: const InputDecoration(labelText: 'Producto (Ej: Harina)', isDense: true),
                                  onChanged: (v) => item['nombre'] = v,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  initialValue: item['cantidad'],
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(labelText: 'Cant.', isDense: true),
                                  onChanged: (v) => item['cantidad'] = v,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: AppColors.error),
                                onPressed: () => _eliminarItem(index),
                              )
                            ],
                          ),
                        );
                      }),
                      
                      TextButton.icon(
                        onPressed: _agregarItem,
                        icon: const Icon(Icons.add, color: AppColors.primaryPurple),
                        label: const Text('Agregar otro producto', style: TextStyle(color: AppColors.primaryPurple)),
                      ),

                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: _purchaseController.isLoading ? null : _generarOptimizacion,
                          icon: _purchaseController.isLoading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2)) : const Icon(Icons.auto_awesome, color: AppColors.white),
                          label: Text(_purchaseController.isLoading ? 'Optimizando...' : 'Armar mi Cesta'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // RESULTADOS: CESTA OPTIMIZADA
                if (_purchaseController.optimizedBasket.isNotEmpty) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Cesta Inteligente', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                        child: Text('Total: \$${_purchaseController.totalSpent.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _purchaseController.optimizedBasket.length,
                    itemBuilder: (context, index) {
                      final item = _purchaseController.optimizedBasket[index];
                      final offer = item['oferta'];
                      final qty = item['requested_qty'];
                      final cost = item['total_cost'];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: (offer['imagen_url'] != null && offer['imagen_url'].toString().isNotEmpty)
                                ? Image.network(offer['imagen_url'], width: 50, height: 50, fit: BoxFit.cover)
                                : Container(width: 50, height: 50, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                          ),
                          title: Text('${qty}x ${offer['producto_nombre']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Precio unitario: \$${item['unit_price']}'),
                          trailing: Text('\$${cost.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16)),
                          onTap: () {
                            // Navegar al checkout para comprar este item específico
                            Navigator.push(context, MaterialPageRoute(
                              builder: (_) => ClientCheckoutScreen(oferta: offer),
                            ));
                          },
                        ),
                      );
                    },
                  ),

                  // ITEMS FUERA DEL PRESUPUESTO
                  if (_purchaseController.outOfBudgetItems.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text('Productos fuera de tu presupuesto:', style: TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ..._purchaseController.outOfBudgetItems.map((item) {
                      return ListTile(
                        leading: const Icon(Icons.warning_amber_rounded, color: AppColors.warning),
                        title: Text('${item['requested_qty']}x ${item['oferta']['producto_nombre']}', style: const TextStyle(color: Colors.grey)),
                        trailing: Text('\$${item['total_cost']}', style: const TextStyle(color: Colors.grey)),
                      );
                    }),
                  ]
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_orders_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_orders_controller.dart';

class ClientOrdersScreen extends StatefulWidget {
  const ClientOrdersScreen({super.key});

  @override
  State<ClientOrdersScreen> createState() => _ClientOrdersScreenState();
}

class _ClientOrdersScreenState extends State<ClientOrdersScreen> {
  final _ordersController = ClientOrdersController();

  // Modal para volver a mostrar el QR si la compra está pendiente
  void _mostrarQR(String qrToken, String nombreComercio, double total) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Tu Código de Compra', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(nombreComercio, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
              ),
              child: QrImageView(
                data: qrToken,
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
                eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: AppColors.darkCardColor),
                dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: AppColors.darkCardColor),
              ),
            ),
            const SizedBox(height: 16),
            Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cerrar'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ordersController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Compras')),
          body: _ordersController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _ordersController.orders.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('Aún no tienes compras.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Explora las ofertas y empieza a ahorrar!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _ordersController.orders.length,
                      itemBuilder: (context, index) {
                        final order = _ordersController.orders[index];
                        final comercio = order['comercios']?['nombre_comercial'] ?? 'Comercio';
                        final fecha = DateTime.parse(order['fecha_compra']).toLocal();
                        final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                        final total = (order['total_pagado'] as num).toDouble();
                        
                        // Lógica de estados
                        final bool validado = order['validado_por_cliente'] ?? false;
                        final bool completado = order['estado'] == 'Completado';
                        final bool pendiente = order['estado'] == 'Pendiente';

                        Color statusColor = AppColors.warning;
                        String statusText = 'Pendiente';
                        if (validado) {
                          statusColor = AppColors.success;
                          statusText = 'Validado';
                        } else if (completado) {
                          statusColor = AppColors.info;
                          statusText = 'Por Validar';
                        }

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(comercio, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                                      child: Text(statusText, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(formattedDate, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                                    
                                    // BOTÓN DE ACCIÓN SEGÚN ESTADO
                                    if (pendiente)
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkCardColor),
                                        onPressed: () => _mostrarQR(order['qr_token'], comercio, total),
                                        icon: const Icon(Icons.qr_code, size: 16, color: AppColors.white),
                                        label: const Text('Ver QR', style: TextStyle(color: AppColors.white, fontSize: 12)),
                                      )
                                    else if (completado && !validado)
                                      OutlinedButton.icon(
                                        style: OutlinedButton.styleFrom(foregroundColor: AppColors.primaryPurple),
                                        onPressed: () {
                                          // Aquí podrías navegar a la pantalla de validación específica
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ve a "Validar Compras" en el menú principal para calificar.')));
                                        },
                                        icon: const Icon(Icons.rate_review, size: 16),
                                        label: const Text('Por Validar', style: TextStyle(fontSize: 12)),
                                      )
                                    else
                                      const Icon(Icons.check_circle, color: AppColors.success, size: 28),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_plan_purchase_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_plan_controller.dart';
import 'map_picker_screen.dart';
import 'client_plan_results_screen.dart';

class ClientPlanPurchaseScreen extends StatefulWidget {
  const ClientPlanPurchaseScreen({super.key});

  @override
  State<ClientPlanPurchaseScreen> createState() => _ClientPlanPurchaseScreenState();
}

class _ClientPlanPurchaseScreenState extends State<ClientPlanPurchaseScreen> {
  final _planController = ClientPlanController();
  
  final List<Map<String, dynamic>> _items = [
    {'nombre': '', 'cantidad': '1', 'descripcion': ''}
  ];

  double? _lat;
  double? _lng;
  DateTime _fechaCompra = DateTime.now().add(const Duration(days: 1));

  void _agregarItem() {
    setState(() {
      _items.add({'nombre': '', 'cantidad': '1', 'descripcion': ''});
    });
  }

  void _eliminarItem(int index) {
    if (_items.length > 1) setState(() => _items.removeAt(index));
  }

  Future<void> _seleccionarUbicacion() async {
    final result = await Navigator.push<Map<String, double>>(
      context,
      MaterialPageRoute(builder: (_) => const MapPickerScreen()),
    );

    if (result != null) {
      setState(() {
        _lat = result['lat'];
        _lng = result['lng'];
      });
    }
  }

  Future<void> _buscarOfertas() async {
    if (_items.every((item) => item['nombre'].toString().trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Agrega al menos un producto.'), backgroundColor: AppColors.error));
      return;
    }
    if (_lat == null || _lng == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selecciona un sector en el mapa.'), backgroundColor: AppColors.warning));
      return;
    }

    final success = await _planController.generarPlanificacion(
      items: _items,
      lat: _lat!,
      lng: _lng!,
      fechaCompra: _fechaCompra,
    );

    if (success && mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientPlanResultsScreen()));
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_planController.errorMessage ?? 'Error al buscar ofertas'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _planController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Planificar mi Compra')),
          body: _planController.isLoading
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors.primaryPurple),
                      SizedBox(height: 20),
                      Text('Buscando los mejores precios en tu zona...', style: TextStyle(color: AppColors.textLight)),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                        child: const Text(
                          'Dinos qué necesitas y nuestro motor buscará los precios más bajos en un radio de 1000 metros a la redonda.',
                          style: TextStyle(color: AppColors.textLight),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // LISTA DINÁMICA DE PRODUCTOS
                      ..._items.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        initialValue: item['nombre'],
                                        decoration: const InputDecoration(labelText: 'Producto (Ej: Harina)', isDense: true),
                                        onChanged: (v) => item['nombre'] = v,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        initialValue: item['cantidad'],
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(labelText: 'Cant.', isDense: true),
                                        onChanged: (v) => item['cantidad'] = v,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: AppColors.error),
                                      onPressed: () => _eliminarItem(index),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      TextButton.icon(
                        onPressed: _agregarItem,
                        icon: const Icon(Icons.add, color: AppColors.primaryPurple),
                        label: const Text('Agregar otro producto', style: TextStyle(color: AppColors.primaryPurple)),
                      ),

                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),

                      // SELECTOR DE UBICACIÓN
                      ListTile(
                        leading: const Icon(Icons.location_on, color: AppColors.primaryPurple),
                        title: const Text('Sector de Búsqueda', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(_lat == null ? 'Toca para seleccionar en el mapa' : 'Lat: $_lat, Lng: $_lng'),
                        trailing: const Icon(Icons.map, color: AppColors.primaryPurple),
                        onTap: _seleccionarUbicacion,
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // SELECTOR DE FECHA
                      ListTile(
                        leading: const Icon(Icons.calendar_today, color: AppColors.primaryPurple),
                        title: const Text('Fecha de Compra', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${_fechaCompra.day}/${_fechaCompra.month}/${_fechaCompra.year}'),
                        trailing: const Icon(Icons.edit, color: Colors.grey),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: _fechaCompra,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 30)),
                          );
                          if (date != null) setState(() => _fechaCompra = date);
                        },
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryPurple,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: _buscarOfertas,
                          icon: const Icon(Icons.auto_awesome, color: AppColors.white),
                          label: const Text('Buscar Mejores Precios', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_plan_results_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_plan_controller.dart';
import '../controllers/purchase_controller.dart';
import 'purchase_qr_screen.dart';

class ClientPlanResultsScreen extends StatelessWidget {
  const ClientPlanResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Creamos una instancia temporal para leer los resultados (en producción usa un Provider o GetX)
    final planController = ClientPlanController();
    
    // Nota: Esto asume que el controlador anterior mantiene los datos en memoria.
    // En una app real, usarías un gestor de estado global. Por ahora lo simulamos accediendo a las variables.
    // (Para este código, asumiremos que el usuario puede volver atrás y los datos no se pierden en el árbol).

    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Resultados de tu Plan')),
      body: _buildResults(context, planController),
    );
  }

  Widget _buildResults(BuildContext context, ClientPlanController controller) {
    // Simulación de UI de resultados (en el código real usarías AnimatedBuilder o Provider)
    // Aquí mostramos la UI como si tuviéramos los datos.
    
    final resultados = controller.resultados;
    final total = controller.totalEstimado;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppColors.success, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              const Icon(Icons.check_circle, color: AppColors.white, size: 40),
              const SizedBox(height: 8),
              const Text('¡Hemos optimizado tu compra!', textAlign: TextAlign.center, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              Text('Total Estimado: \$${total.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        
        if (resultados.isEmpty)
          const Center(child: Text('No se encontraron ofertas para los productos de tu lista.'))
        else
          ...resultados.map((res) {
            final oferta = res['oferta'];
            final item = res['item_solicitado'];
            
            if (oferta == null) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: const Icon(Icons.warning, color: AppColors.warning),
                  title: Text(item['nombre'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('No encontramos este producto en tu zona.'),
                ),
              );
            }

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                      child: const Icon(Icons.store, color: AppColors.primaryPurple),
                    ),
                    title: Text(oferta['nombre_comercio'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(oferta['direccion']),
                    trailing: Text('\$${oferta['precio']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item['cantidad']}x ${item['nombre']}', style: const TextStyle(fontWeight: FontWeight.w500)),
                        TextButton.icon(
                          onPressed: () async {
                            final url = 'https://www.google.com/maps/search/?api=1&query=${oferta['latitud']},${oferta['longitud']}';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            }
                          },
                          icon: const Icon(Icons.map, size: 16),
                          label: const Text('Ver en Maps'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryPurple),
                        onPressed: () {
                          // Generar compra directa para este producto
                          _comprarItem(context, oferta);
                        },
                        child: const Text('Comprar este producto', style: TextStyle(color: AppColors.white)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
      ],
    );
  }

  Future<void> _comprarItem(BuildContext context, Map<String, dynamic> oferta) async {
    final purchaseController = PurchaseController();
    showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));
    
    final success = await purchaseController.createPurchase(
      comercioId: oferta['comercio_id'],
      ofertaId: oferta['oferta_id'],
      montoFinal: (oferta['precio'] as num).toDouble(), // CORRECCIÓN: monto -> montoFinal
    );
    
    if (context.mounted) Navigator.pop(context);
    
    if (success && context.mounted) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => PurchaseQrScreen(
          qrToken: purchaseController.purchaseData!['qr_token'],
          total: (oferta['precio'] as num).toDouble(),
          nombreComercio: oferta['nombre_comercio'],
        ),
      ));
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(purchaseController.errorMessage ?? 'Error'), backgroundColor: AppColors.error));
    }
  }
}```

### 📄 lib/screens/client_points_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_points_controller.dart';

class ClientPointsScreen extends StatefulWidget {
  const ClientPointsScreen({super.key});

  @override
  State<ClientPointsScreen> createState() => _ClientPointsScreenState();
}

class _ClientPointsScreenState extends State<ClientPointsScreen> {
  final _pointsController = ClientPointsController();

  void _mostrarCanje() {
    final ctrl = TextEditingController(text: '100');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Canjear Puntos'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('100 puntos = \$1 de descuento'),
            const SizedBox(height: 12),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Puntos a canjear', prefixIcon: Icon(Icons.star)),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final points = int.tryParse(ctrl.text) ?? 0;
              Navigator.pop(ctx);
              final success = await _pointsController.redeemPoints(points);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(success ? _pointsController.successMessage! : _pointsController.errorMessage!),
                  backgroundColor: success ? AppColors.success : AppColors.error,
                ));
              }
            },
            child: const Text('Canjear'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pointsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Puntos')),
          body: _pointsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // TARJETA DE PUNTOS
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [AppColors.primaryPurple, AppColors.primaryPurple.withOpacity(0.7)]),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.stars, color: Colors.amber, size: 60),
                            const SizedBox(height: 12),
                            Text(
                              '${_pointsController.currentPoints}',
                              style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                            ),
                            const Text('Puntos Disponibles', style: TextStyle(color: Colors.white70, fontSize: 16)),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.primaryPurple,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: _mostrarCanje,
                                child: const Text('Canjear Puntos', style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      const Text('Historial de Puntos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      if (_pointsController.history.isEmpty)
                        const Center(child: Text('No tienes movimientos aún.', style: TextStyle(color: Colors.grey)))
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _pointsController.history.length,
                          itemBuilder: (context, index) {
                            final item = _pointsController.history[index];
                            final fecha = DateTime.parse(item['fecha']).toLocal();
                            final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                            final isPositive = item['cantidad'] > 0;

                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: isPositive ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                                  child: Icon(isPositive ? Icons.add : Icons.remove, color: isPositive ? AppColors.success : AppColors.error),
                                ),
                                title: Text(item['motivo'], style: const TextStyle(fontWeight: FontWeight.w500)),
                                subtitle: Text(formattedDate, style: const TextStyle(fontSize: 11)),
                                trailing: Text(
                                  '${isPositive ? '+' : ''}${item['cantidad']}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isPositive ? AppColors.success : AppColors.error),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_pools_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_pools_controller.dart';

class ClientPoolsScreen extends StatefulWidget {
  const ClientPoolsScreen({super.key});

  @override
  State<ClientPoolsScreen> createState() => _ClientPoolsScreenState();
}

class _ClientPoolsScreenState extends State<ClientPoolsScreen> {
  final _poolsController = ClientPoolsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _poolsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Pools Comunitarios')),
          body: _poolsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _poolsController.activePools.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.groups, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No hay pools activos hoy.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Vuelve pronto para comprar al por mayor!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: _poolsController.activePools.length,
                      itemBuilder: (context, index) {
                        final pool = _poolsController.activePools[index];
                        final current = pool['usuarios_comprometidos'] ?? 0;
                        final meta = pool['meta_usuarios'] ?? 50;
                        final progress = current / meta;
                        
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        pool['producto_nombre'], 
                                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(color: AppColors.primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                                      child: const Text('En Recaudación', style: TextStyle(color: AppColors.primaryPurple, fontSize: 12, fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Precio al mayor: \$${pool['precio_mayorista_sugerido']}',
                                  style: const TextStyle(fontSize: 18, color: AppColors.success, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                LinearProgressIndicator(
                                  value: progress > 1.0 ? 1.0 : progress,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.primaryPurple,
                                  minHeight: 10,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '$current de $meta personas comprometidas',
                                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () => _mostrarDialogoUnion(pool['id']),
                                    child: const Text('Unirme al Pool'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }

  void _mostrarDialogoUnion(String poolId) {
    final ctrl = TextEditingController(text: '1');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Unirse al Pool'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('¿Cuántas unidades deseas comprometer?'),
            const SizedBox(height: 16),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad', prefixIcon: Icon(Icons.shopping_bag)),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final cantidad = int.tryParse(ctrl.text) ?? 1;
              Navigator.pop(ctx);
              final success = await _poolsController.joinPool(poolId, cantidad);
              if (success && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Te has unido al pool con éxito!'), backgroundColor: AppColors.success));
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/client_store_profile_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_store_controller.dart';
import 'client_checkout_screen.dart';
import 'report_modal_screen.dart'; // <-- NUEVA IMPORTACIÓN

class ClientStoreProfileScreen extends StatefulWidget {
  final String comercioId;
  const ClientStoreProfileScreen({super.key, required this.comercioId});

  @override
  State<ClientStoreProfileScreen> createState() => _ClientStoreProfileScreenState();
}

class _ClientStoreProfileScreenState extends State<ClientStoreProfileScreen> {
  final _storeController = ClientStoreController();

  @override
  void initState() {
    super.initState();
    _storeController.loadStoreProfile(widget.comercioId);
  }

  void _irAlCheckout(Map<String, dynamic> oferta) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)),
    );
  }

  void _abrirModalReporte(String nombreComercio) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => ReportModalScreen(
        comercioId: widget.comercioId,
        nombreComercio: nombreComercio,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _storeController,
      builder: (context, child) {
        if (_storeController.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));
        }
        if (_storeController.storeData == null) {
          return const Scaffold(body: Center(child: Text('Tienda no encontrada.')));
        }

        final store = _storeController.storeData!;
        final nombreComercio = store['nombre_comercial'] ?? 'Tienda';

        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: Text(nombreComercio),
            actions: [
              // BOTÓN DE REPORTAR TIENDA
              IconButton(
                icon: const Icon(Icons.flag, color: AppColors.error),
                tooltip: 'Reportar esta tienda',
                onPressed: () => _abrirModalReporte(nombreComercio),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CABECERA DE LA TIENDA
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.bgTop,
                        backgroundImage: (store['logo_url'] != null && store['logo_url'].toString().isNotEmpty) ? NetworkImage(store['logo_url']) : null,
                        child: (store['logo_url'] == null || store['logo_url'].toString().isEmpty) ? const Icon(Icons.store, size: 40, color: AppColors.primaryPurple) : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(nombreComercio, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text(store['categoria'] ?? 'Categoría', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(store['direccion_texto'] ?? 'Sin dirección', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _storeController.isFollowing ? AppColors.white : AppColors.primaryPurple,
                          foregroundColor: _storeController.isFollowing ? AppColors.primaryPurple : AppColors.white,
                          side: _storeController.isFollowing ? const BorderSide(color: AppColors.primaryPurple) : BorderSide.none,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: _storeController.isActionLoading ? null : () => _storeController.toggleFollow(widget.comercioId),
                        child: _storeController.isActionLoading 
                            ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                            : Text(_storeController.isFollowing ? 'Siguiendo' : 'Seguir'),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                const Text('Catálogo de Ofertas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                // LISTA DE OFERTAS DE LA TIENDA
                if (_storeController.storeOffers.isEmpty)
                  const Center(child: Text('Esta tienda no tiene ofertas activas.', style: TextStyle(color: Colors.grey)))
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: _storeController.storeOffers.length,
                    itemBuilder: (context, index) {
                      final oferta = _storeController.storeOffers[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => _irAlCheckout(oferta),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                    child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                                        ? Image.network(oferta['imagen_url'], width: double.infinity, fit: BoxFit.cover)
                                        : Container(color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(oferta['producto_nombre'] ?? 'Producto', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 4),
                                      Text('\$${oferta['precio_oferta'] ?? oferta['precio_regular']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/client_validation_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_validation_controller.dart';

class ClientValidationScreen extends StatefulWidget {
  const ClientValidationScreen({super.key});

  @override
  State<ClientValidationScreen> createState() => _ClientValidationScreenState();
}

class _ClientValidationScreenState extends State<ClientValidationScreen> {
  final _validationController = ClientValidationController();

  void _abrirFormularioValidacion(Map<String, dynamic> compra) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _ValidationFormSheet(
        compra: compra,
        controller: _validationController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _validationController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Validar mis Compras')),
          body: _validationController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _validationController.pendingValidations.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline, size: 80, color: AppColors.success),
                          SizedBox(height: 16),
                          Text('¡Todo al día!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Text('No tienes compras pendientes por validar.', style: TextStyle(color: AppColors.textLight)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _validationController.pendingValidations.length,
                      itemBuilder: (context, index) {
                        final compra = _validationController.pendingValidations[index];
                        final fecha = DateTime.parse(compra['fecha_compra']).toLocal();
                        final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                        final nombreComercio = compra['comercios']?['nombre_comercial'] ?? 'Comercio';

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(nombreComercio, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                                      child: const Text('Pendiente', style: TextStyle(color: AppColors.warning, fontSize: 10, fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text('Compra: $fechaStr', style: const TextStyle(color: AppColors.textLight, fontSize: 12)),
                                Text('Total: \$${compra['total_pagado']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryPurple),
                                    onPressed: () => _abrirFormularioValidacion(compra),
                                    icon: const Icon(Icons.rate_review, color: AppColors.white),
                                    label: const Text('Validar Compra'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}

class _ValidationFormSheet extends StatefulWidget {
  final Map<String, dynamic> compra;
  final ClientValidationController controller;

  const _ValidationFormSheet({required this.compra, required this.controller});

  @override
  State<_ValidationFormSheet> createState() => _ValidationFormSheetState();
}

class _ValidationFormSheetState extends State<_ValidationFormSheet> {
  bool _recibido = true;
  bool _buenEstado = true;
  DateTime? _fechaCaducidad;
  bool _isSaving = false;

  Future<void> _seleccionarFecha() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 10)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: 'Selecciona la fecha de caducidad',
    );
    if (date != null) setState(() => _fechaCaducidad = date);
  }

  Future<void> _submit() async {
    setState(() => _isSaving = true);
    final success = await widget.controller.submitValidation(
      compraId: widget.compra['id'],
      recibido: _recibido,
      buenEstado: _buenEstado,
      fechaCaducidad: _fechaCaducidad,
    );

    if (mounted) {
      Navigator.pop(context); // Cerrar el modal
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Gracias por tu validación!'), backgroundColor: AppColors.success));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al validar.'), backgroundColor: AppColors.error));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Validación de Compra', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            SwitchListTile(
              title: const Text('¿Recibiste el producto?'),
              value: _recibido,
              activeColor: AppColors.primaryPurple,
              onChanged: (v) => setState(() => _recibido = v),
            ),
            
            SwitchListTile(
              title: const Text('¿El producto estaba en buen estado?'),
              value: _buenEstado,
              activeColor: AppColors.primaryPurple,
              onChanged: (v) => setState(() => _buenEstado = v),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.calendar_today, color: AppColors.primaryPurple),
              title: const Text('Fecha de Caducidad (Opcional)', style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(_fechaCaducidad != null ? DateFormat('dd/MM/yyyy').format(_fechaCaducidad!) : 'No seleccionada (Solo si es perecedero)'),
              trailing: const Icon(Icons.edit, size: 20, color: Colors.grey),
              onTap: _seleccionarFecha,
            ),

            const SizedBox(height: 24),
            
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryPurple),
                onPressed: _isSaving ? null : _submit,
                child: _isSaving 
                  ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                  : const Text('Guardar Validación'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/client_vip_plans_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_plans_controller.dart';

class ClientVipPlansScreen extends StatefulWidget {
  const ClientVipPlansScreen({super.key});

  @override
  State<ClientVipPlansScreen> createState() => _ClientVipPlansScreenState();
}

class _ClientVipPlansScreenState extends State<ClientVipPlansScreen> {
  final _plansController = ClientPlansController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _plansController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Planes VIP')),
          body: _plansController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CABECERA PREMIUM
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.darkCardColor, const Color(0xFF3D3785)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.workspace_premium, color: Colors.amber, size: 60),
                            const SizedBox(height: 16),
                            const Text(
                              'Desbloquea el máximo potencial de OfVe',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tu plan actual: ${_plansController.currentPlanName}',
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text('Elige tu Nivel', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      
                      // LISTA DE PLANES VIP
                      ..._plansController.plans.map((plan) {
                        final isCurrent = plan['nombre'] == _plansController.currentPlanName;
                        final isBasic = plan['nombre'].toString().toLowerCase() == 'básico' || plan['nombre'].toString().toLowerCase() == 'basico';
                        
                        // Si es el plan básico, no lo mostramos como opción de compra
                        if (isBasic && !isCurrent) return const SizedBox.shrink();

                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: isCurrent ? AppColors.primaryPurple : Colors.transparent, width: 2),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(plan['nombre'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                                  if (isCurrent)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(color: AppColors.primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                                      child: const Text('ACTIVO', style: TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 12)),
                                    )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(plan['descripcion'] ?? 'Beneficios exclusivos para ti', style: const TextStyle(color: AppColors.textLight)),
                              const SizedBox(height: 16),
                              Text('\$${plan['precio']} / mes', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                              const SizedBox(height: 20),
                              
                              // BENEFICIOS SIMULADOS (Puedes hacerlos dinámicos luego)
                              _buildBenefit('Envíos gratis en compras mayores a \$10'),
                              _buildBenefit('Puntos dobles por cada compra'),
                              _buildBenefit('Acceso anticipado a Ofertas Relámpago'),
                              _buildBenefit('Soporte prioritario 24/7'),
                              
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isCurrent ? Colors.grey : AppColors.primaryPurple,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  onPressed: isCurrent ? null : () async {
                                    await _plansController.requestPlanUpgrade(plan['nombre']);
                                    if (mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('¡Felicidades! Ahora eres miembro ${plan['nombre']}'), backgroundColor: AppColors.success),
                                      );
                                    }
                                  },
                                  child: Text(
                                    isCurrent ? 'Plan Actual' : 'Actualizar a ${plan['nombre']}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildBenefit(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.success, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: AppColors.textDark))),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/create_offer_screen.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/theme/app_theme.dart';
import '../controllers/offer_controller.dart';
import '../controllers/categories_controller.dart'; 
import 'ai_assistant_screen.dart';

class CreateOfferScreen extends StatefulWidget {
  const CreateOfferScreen({super.key});

  @override
  State<CreateOfferScreen> createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  final _offerController = OfferController();
  final _categoriesController = CategoriesController();
  
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceRegController = TextEditingController();
  final _priceOfferController = TextEditingController();
  final _stockController = TextEditingController();
  
  String? _selectedCategory;
  Uint8List? _imageBytes;
  String? _imageName;
  
  String? _aiErrorMessage; // <-- NUEVO ESTADO

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceRegController.dispose();
    _priceOfferController.dispose();
    _stockController.dispose();
    _categoriesController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageName = pickedFile.name;
      });
    }
  }

  Future<void> _generarDescripcionIA() async {
    final resultado = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => AiAssistantScreen(initialProductName: _nameController.text),
      ),
    );

    if (resultado != null && resultado.isNotEmpty) {
      setState(() {
        _descController.text = resultado;
      });
    }
  }

  Future<void> _saveOffer() async {
    setState(() => _aiErrorMessage = null); // Limpiar error previo

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, espera a que carguen las categorías y selecciona una.'), backgroundColor: Colors.orange),
      );
      return;
    }
    if (_nameController.text.isEmpty || _priceRegController.text.isEmpty || _priceOfferController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, llena los campos obligatorios.'), backgroundColor: Colors.red),
      );
      return;
    }

    final success = await _offerController.createOffer(
      nombre: _nameController.text,
      descripcion: _descController.text,
      categoria: _selectedCategory!,
      precioRegular: double.parse(_priceRegController.text.trim()),
      precioOferta: double.parse(_priceOfferController.text.trim()),
      stock: int.parse(_stockController.text.trim().isEmpty ? '1' : _stockController.text.trim()),
      imageBytes: _imageBytes,
      imageName: _imageName,
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Oferta publicada con éxito!'), backgroundColor: AppColors.success),
      );
      Navigator.pop(context);
    } else if (mounted) {
      // SI FALLA, MOSTRAMOS EL ERROR DE LA IA EN PANTALLA
      setState(() => _aiErrorMessage = _offerController.errorMessage);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_offerController.errorMessage ?? 'Error al publicar'), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_offerController, _categoriesController]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Nueva Oferta')),
          body: _categoriesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: _imageBytes != null
                              ? ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_photo_alternate, size: 50, color: AppColors.primaryPurple),
                                    const SizedBox(height: 8),
                                    const Text('Subir foto del producto', style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(_nameController, 'Nombre del Producto', Icons.shopping_bag),
                      const SizedBox(height: 12),
                      
                      TextField(
                        controller: _descController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Descripción (Opcional)',
                          prefixIcon: const Icon(Icons.description),
                          suffixIcon: IconButton(
                            tooltip: 'Generar con IA',
                            icon: const Icon(Icons.auto_awesome, color: AppColors.primaryPurple),
                            onPressed: _generarDescripcionIA,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(labelText: 'Categoría', prefixIcon: Icon(Icons.category)),
                        items: _categoriesController.categories
                            .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (v) => setState(() => _selectedCategory = v),
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(child: _buildTextField(_priceRegController, 'Precio Regular', Icons.attach_money, isNumber: true)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildTextField(_priceOfferController, 'Precio Oferta', Icons.local_offer, isNumber: true)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildTextField(_stockController, 'Stock Disponible', Icons.inventory, isNumber: true),
                      
                      // MENSAJE DE ERROR DE MODERACIÓN (Si existe)
                      if (_aiErrorMessage != null) ...[
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.error.withOpacity(0.1),
                            border: Border.all(color: AppColors.error),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 30),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _aiErrorMessage!,
                                  style: const TextStyle(color: AppColors.error, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 30),
                      
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _offerController.isLoading ? null : _saveOffer,
                          child: _offerController.isLoading
                              ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Text('Publicar Oferta'),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }
}```

### 📄 lib/screens/create_offer_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'merchant_profile_screen.dart';
import 'offer_form_screen.dart'; // <-- NUEVA IMPORTACIÓN

class CreateOfferScreen extends StatefulWidget {
  const CreateOfferScreen({super.key});

  @override
  State<CreateOfferScreen> createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  String _status = 'Pendiente';

  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _verificarEstadoComercio();
  }

  Future<void> _verificarEstadoComercio() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    try {
      final comercio = await _supabase
          .from('comercios')
          .select('estatus_verificacion')
          .eq('usuario_id', user.id)
          .maybeSingle();

      if (comercio != null) {
        setState(() => _status = comercio['estatus_verificacion'] ?? 'Pendiente');
      }
    } catch (e) {
      debugPrint('Error al verificar estado: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Crear Oferta', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : _status == 'Aprobado'
              ? _buildFormularioUI()
              : _status == 'En Revision'
                  ? _buildEnRevisionUI()
                  : _buildCompletarPerfilUI(),
    );
  }

  Widget _buildCompletarPerfilUI() {
    bool isRechazado = _status == 'Rechazado';
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isRechazado ? Icons.error_outline : Icons.storefront, size: 100, color: isRechazado ? Colors.red : Colors.orange),
            const SizedBox(height: 24),
            Text(
              isRechazado ? 'Documentación Rechazada' : '¡Estás a un paso de vender!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              isRechazado 
                ? 'Tus documentos anteriores no fueron válidos. Por favor, vuelve a subirlos para poder publicar ofertas.'
                : 'Para publicar ofertas y llegar a miles de clientes, primero necesitamos verificar tu negocio. Completa tu perfil ahora.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPurple,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              icon: const Icon(Icons.upload_file, color: Colors.white),
              label: Text(isRechazado ? 'Volver a subir documentos' : 'Completar mi Perfil', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MerchantProfileScreen(
                      onDocsUploaded: () {
                        setState(() => _isLoading = true);
                        _verificarEstadoComercio();
                      },
                    ),
                  ),
                );
                _verificarEstadoComercio();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnRevisionUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.hourglass_top, size: 100, color: Colors.blue),
            const SizedBox(height: 24),
            const Text('Documentos en Revisión', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
              'Nuestro equipo está verificando tu negocio. Este proceso tarda menos de 48 horas. Te notificaremos pronto.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                setState(() => _isLoading = true);
                _verificarEstadoComercio();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Actualizar Estado'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFormularioUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 24),
            const Text('¡Todo listo para vender!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Tu cuenta está verificada. Procede a llenar los datos de tu oferta.', textAlign: TextAlign.center),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryPurple),
                onPressed: () async {
                  // NAVEGAMOS AL FORMULARIO REAL
                  await Navigator.push(context, MaterialPageRoute(builder: (_) => const OfferFormScreen()));
                  // Al volver del formulario, recargamos para limpiar el estado si es necesario
                  _verificarEstadoComercio();
                },
                child: const Text('Llenar Formulario de Oferta', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/home_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../controllers/user_controller.dart';
import '../core/theme/app_theme.dart';
import 'admin_dashboard_screen.dart';
import 'owner_dashboard_screen.dart';
import 'client_dashboard_tab.dart';
import 'merchant_dashboard_tab.dart';
import 'account_settings_screen.dart';
import 'client_orders_screen.dart';
import 'client_favorites_screen.dart';
import 'client_followed_stores_screen.dart'; // <-- NUEVA IMPORTACIÓN

// IMPORTACIONES PARA EL MENÚ DEL COMERCIO
import 'merchant_edit_store_screen.dart';
import 'merchant_metrics_screen.dart';
import 'merchant_earnings_screen.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _userController,
      builder: (context, child) {
        if (_userController.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));
        }

        // REDIRECCIÓN POR ROL
        if (_userController.role == 'admin') return const AdminDashboardScreen();
        if (_userController.role == 'owner') return const OwnerDashboardScreen();

        // CLIENTES Y COMERCIOS
        return Scaffold(
          drawer: _buildDrawer(),
          body: _userController.role == 'merchant'
              ? MerchantDashboardTab(
                  storeName: _userController.storeName,
                  planName: _userController.planName,
                  category: _userController.category,
                )
              : ClientDashboardTab(
                  userName: _userController.userName,
                  puntos: _userController.puntos,
                ),
          
          floatingActionButton: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 5))],
            ),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.primaryPurple,
              elevation: 0,
              child: const Icon(Icons.directions_car, color: AppColors.white, size: 28),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            color: AppColors.white,
            elevation: 10,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const IconButton(icon: Icon(Icons.home, color: AppColors.primaryPurple, size: 28), onPressed: null),
                  const IconButton(icon: Icon(Icons.search, color: Colors.grey, size: 28), onPressed: null),
                  const SizedBox(width: 40),
                  const IconButton(icon: Icon(Icons.local_offer, color: Colors.grey, size: 28), onPressed: null),
                  const IconButton(icon: Icon(Icons.person, color: Colors.grey, size: 28), onPressed: null),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppColors.primaryPurple, AppColors.primaryPurple.withOpacity(0.8)]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: 30, backgroundColor: AppColors.white, child: Icon(Icons.person, size: 35, color: Colors.grey)),
                const SizedBox(height: 10),
                Text(
                  _userController.role == 'merchant' ? _userController.storeName : _userController.userName, 
                  style: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold)
                ),
                Text(_userController.userEmail, style: TextStyle(color: AppColors.white.withOpacity(0.8), fontSize: 13)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                if (_userController.role == 'merchant') ...[
                  _buildDrawerItem(
                    Icons.storefront, 
                    'Mi Tienda',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantEditStoreScreen()));
                    },
                  ),
                  _buildDrawerItem(
                    Icons.bar_chart, 
                    'Mis Métricas',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantMetricsScreen()));
                    },
                  ),
                  _buildDrawerItem(
                    Icons.account_balance_wallet, 
                    'Mis Ganancias',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantEarningsScreen()));
                    },
                  ),
                  _buildDrawerItem(
                    Icons.inventory_2, 
                    'Inventario',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const AddProductScreen()));
                    },
                  ),
                  const Divider(),
                ],
                if (_userController.role == 'user') ...[
                  _buildDrawerItem(
                    Icons.shopping_bag_outlined, 
                    'Mis compras',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientOrdersScreen()));
                    },
                  ),
                  _buildDrawerItem(
                    Icons.favorite_border, 
                    'Favoritos',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientFavoritesScreen()));
                    },
                  ),
                  
                  // CONECTADO A TIENDAS QUE SIGO
                  _buildDrawerItem(
                    Icons.storefront_outlined, 
                    'Tiendas que sigo',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientFollowedStoresScreen()));
                    },
                  ),
                  
                  _buildDrawerItem(
                    Icons.history, 
                    'Historial',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientOrdersScreen()));
                    },
                  ),
                  const Divider(),
                ],
                
                _buildDrawerItem(
                  Icons.person_outline, 
                  'Administrar mi Usuario',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountSettingsScreen()));
                  },
                ),
                
                _buildDrawerItem(Icons.notifications_none, 'Notificaciones'),
                const Divider(),
                _buildDrawerItem(
                  Icons.logout, 
                  'Cerrar sesión', 
                  color: AppColors.warning, 
                  onTap: () async {
                    Navigator.pop(context);
                    await Supabase.instance.client.auth.signOut();
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {Color color = AppColors.textDark, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24),
      title: Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}```

### 📄 lib/screens/home_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_dashboard_screen.dart';
import 'owner_dashboard_screen.dart';
import 'client_dashboard_tab.dart';
import 'merchant_dashboard_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  String _role = 'user';
  String _userName = 'Usuario';
  String _userEmail = '';
  String _storeName = 'Mi Comercio';
  String _planName = 'Básico';
  String _category = 'Sin categoría';

  int _puntos = 5000;

  final Color bgTop = const Color(0xFFECE2FC); 
  final Color bgBottom = const Color(0xFFFDFBFF);
  final Color curveColor = const Color(0xFFE2D2FC); 
  final Color darkCardColor = const Color(0xFF252152);
  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color textMagenta = const Color(0xFFD018A4);
  final Color orangeColor = const Color(0xFFFF9800);

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      String detectedRole = 'user';

      try {
        await _supabase.auth.refreshSession();
        final dbUser = await _supabase.from('usuarios').select('rol').eq('id', user.id).single();
        detectedRole = dbUser['rol'] ?? 'user';
      } catch (e) {
        debugPrint('Error consultando tabla usuarios: $e');
        detectedRole = user.appMetadata['rol'] ?? user.userMetadata?['rol'] ?? 'user';
      }

      // NOTA SENIOR: Hemos eliminado la verificación automática que convertía
      // a un 'user' en 'merchant' si encontraba un registro en la tabla comercios.
      // Ahora la app obedece estrictamente el rol de la base de datos.

      setState(() {
        _role = detectedRole;
        _userName = user.userMetadata?['nombre']?.toString().toUpperCase() ?? 'USUARIO';
        _userEmail = user.email ?? '';
      });

      if (_role == 'merchant') {
        try {
          var comercio = await _supabase
              .from('comercios')
              .select('nombre_comercial, categoria, planes_suscripcion(nombre)')
              .eq('usuario_id', user.id)
              .maybeSingle();

          if (comercio != null) {
            _storeName = comercio['nombre_comercial'] ?? 'Mi Comercio';
            _planName = comercio['planes_suscripcion']?['nombre'] ?? 'Básico';
            _category = comercio['categoria'] ?? 'Sin categoría';
          }
        } catch (e) {
          debugPrint('Error al cargar comercio: $e');
        }
      }
      
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator(color: primaryPurple)));
    }

    // REDIRECCIÓN SEGÚN EL ROL
    if (_role == 'admin') return const AdminDashboardScreen();
    if (_role == 'owner') return const OwnerDashboardScreen();

    return Scaffold(
      drawer: _buildDrawer(),
      body: _buildBody(),
      
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: primaryPurple.withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryPurple,
          elevation: 0,
          child: const Icon(Icons.directions_car, color: Colors.white, size: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.home, color: primaryPurple, size: 28), onPressed: () {}),
              IconButton(icon: const Icon(Icons.search, color: Colors.grey, size: 28), onPressed: () {}),
              const SizedBox(width: 40),
              IconButton(icon: const Icon(Icons.local_offer, color: Colors.grey, size: 28), onPressed: () {}),
              IconButton(icon: const Icon(Icons.person, color: Colors.grey, size: 28), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_role == 'merchant') {
      return MerchantDashboardTab(
        storeName: _storeName,
        planName: _planName,
        category: _category,
        bgTop: bgTop,
        bgBottom: bgBottom,
        curveColor: curveColor,
        darkCardColor: darkCardColor,
        primaryPurple: primaryPurple,
      );
    }
    return ClientDashboardTab(
      userName: _userName,
      puntos: _puntos,
      bgTop: bgTop,
      bgBottom: bgBottom,
      curveColor: curveColor,
      darkCardColor: darkCardColor,
      primaryPurple: primaryPurple,
      textMagenta: textMagenta,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [primaryPurple, primaryPurple.withOpacity(0.8)]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, size: 35, color: Colors.grey)),
                const SizedBox(height: 10),
                Text(_role == 'merchant' ? _storeName : _userName, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_userEmail, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                if (_role == 'merchant') ...[
                  _buildDrawerItem(Icons.storefront, 'Mi Tienda'),
                  _buildDrawerItem(Icons.bar_chart, 'Mis Métricas'),
                  _buildDrawerItem(Icons.account_balance_wallet, 'Mis Ganancias'),
                  _buildDrawerItem(Icons.inventory_2, 'Inventario'),
                  const Divider(),
                ],
                if (_role == 'user') ...[
                  _buildDrawerItem(Icons.shopping_bag_outlined, 'Mis compras'),
                  _buildDrawerItem(Icons.favorite_border, 'Favoritos'),
                  _buildDrawerItem(Icons.storefront_outlined, 'Tiendas que sigo'),
                  _buildDrawerItem(Icons.history, 'Historial'),
                  const Divider(),
                ],
                _buildDrawerItem(Icons.person_outline, 'Administrar mi Usuario'),
                _buildDrawerItem(Icons.notifications_none, 'Notificaciones'),
                const Divider(),
                _buildDrawerItem(Icons.logout, 'Cerrar sesión', color: orangeColor, onTap: () async {
                  Navigator.pop(context);
                  await _supabase.auth.signOut();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {Color color = Colors.black87, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24),
      title: Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}```

### 📄 lib/screens/login_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = AuthController();
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _storeNameController = TextEditingController();
  final _rifController = TextEditingController();

  bool _isRegistering = false;
  String _selectedRole = 'user';
  bool _isAdult = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _storeNameController.dispose();
    _rifController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isRegistering && !_isAdult) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes declarar que eres mayor de edad.'), backgroundColor: AppColors.error),
      );
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (_isRegistering) {
      final success = await _authController.register(
        email: email,
        password: password,
        role: _selectedRole,
        name: _nameController.text.trim(),
        isAdult: _isAdult,
        storeName: _storeNameController.text.trim(),
        rif: _rifController.text.trim(),
      );
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Registro exitoso! Por favor, inicia sesión.'), backgroundColor: AppColors.success),
        );
        setState(() => _isRegistering = false);
        _passwordController.clear();
      }
    } else {
      final success = await _authController.login(email, password);
      if (!success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_authController.errorMessage ?? 'Error de login'), backgroundColor: AppColors.error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Usamos AnimatedBuilder para escuchar los cambios del controlador
    return AnimatedBuilder(
      animation: _authController,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: Text(_isRegistering ? 'Registro' : 'Iniciar sesión')),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  const Icon(Icons.storefront, size: 80, color: AppColors.primaryPurple),
                  const SizedBox(height: 24),
                  
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Contraseña', prefixIcon: Icon(Icons.lock)),
                  ),
                  const SizedBox(height: 12),
                  
                  if (_isRegistering) ...[
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      decoration: const InputDecoration(labelText: 'Tipo de cuenta'),
                      items: const [
                        DropdownMenuItem(value: 'user', child: Text('Usuario')),
                        DropdownMenuItem(value: 'merchant', child: Text('Comercio')),
                      ],
                      onChanged: (v) => setState(() => _selectedRole = v ?? 'user'),
                    ),
                    const SizedBox(height: 12),
                    
                    if (_selectedRole == 'user')
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Nombre completo', prefixIcon: Icon(Icons.person)),
                      )
                    else ...[
                      TextField(
                        controller: _storeNameController,
                        decoration: const InputDecoration(labelText: 'Nombre comercial', prefixIcon: Icon(Icons.store)),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _rifController,
                        decoration: const InputDecoration(labelText: 'RIF del Comercio', prefixIcon: Icon(Icons.badge)),
                      ),
                    ],
                    const SizedBox(height: 12),
                    CheckboxListTile(
                      value: _isAdult,
                      activeColor: AppColors.primaryPurple,
                      onChanged: (v) => setState(() => _isAdult = v ?? false),
                      title: const Text('Declaro ser mayor de edad'),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                  
                  const SizedBox(height: 24),
                  _authController.isLoading
                      ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                      : ElevatedButton(
                          onPressed: _submit,
                          child: Text(_isRegistering ? 'Registrarse' : 'Entrar'),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/login_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _storeNameController = TextEditingController();
  final _rifController = TextEditingController();

  bool _isLoading = false;
  bool _isRegistering = false;
  String _selectedRole = 'user';
  bool _isAdult = false;

  final String redirectUrl = 'https://fluffy-journey-qvrq7pgv5gxcxxq7-8080.app.github.dev/';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _storeNameController.dispose();
    _rifController.dispose();
    super.dispose();
  }

  Future<void> _ensureMerchantRecord(User user) async {
    if (user.userMetadata?['rol'] != 'merchant') return;

    final existe = await Supabase.instance.client
        .from('comercios')
        .select('id')
        .eq('usuario_id', user.id)
        .maybeSingle();

    if (existe == null) {
      await Supabase.instance.client.from('comercios').insert({
        'usuario_id': user.id,
        'nombre_comercial': _storeNameController.text.trim().isEmpty 
            ? (user.userMetadata?['nombre'] ?? 'Mi Comercio') 
            : _storeNameController.text.trim(),
        'rif': _rifController.text.trim().isEmpty 
            ? 'RIF-PENDIENTE-${DateTime.now().millisecondsSinceEpoch}' 
            : _rifController.text.trim(),
        'estatus_verificacion': 'Pendiente',
      });
    }
  }

  Future<void> _submit() async {
    if (_isRegistering && !_isAdult) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes declarar que eres mayor de edad.'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => _isLoading = true);
    final supabase = Supabase.instance.client;
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      if (_isRegistering) {
        // 1. Crear la cuenta
        final authResponse = await supabase.auth.signUp(
          email: email,
          password: password,
          emailRedirectTo: redirectUrl,
          data: {
            'nombre': _selectedRole == 'merchant' ? _storeNameController.text.trim() : _nameController.text.trim(),
            'rol': _selectedRole,
            'mayor_de_edad': _isAdult,
          },
        );

        // 2. Crear registro en la tabla comercios si es merchant
        if (_selectedRole == 'merchant' && authResponse.user != null) {
          await supabase.from('comercios').insert({
            'usuario_id': authResponse.user!.id,
            'nombre_comercial': _storeNameController.text.trim(),
            'rif': _rifController.text.trim().isEmpty 
                ? 'RIF-PENDIENTE-${DateTime.now().millisecondsSinceEpoch}' 
                : _rifController.text.trim(),
            'estatus_verificacion': 'Pendiente',
          });
        }

        if (mounted) {
          // 3. CERRAR SESIÓN AUTOMÁTICA
          await supabase.auth.signOut();
          
          // 4. Limpiar contraseña y cambiar a vista Login
          _passwordController.clear();
          setState(() => _isRegistering = false);

          // 5. Mostrar mensaje de éxito
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('¡Registro exitoso! Por favor, inicia sesión.'), backgroundColor: Colors.green),
          );
        }
      } else {
        // Lógica normal de inicio de sesión
        await supabase.auth.signInWithPassword(email: email, password: password);
        final user = supabase.auth.currentUser;
        if (user != null) {
          await _ensureMerchantRecord(user);
        }
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.message}'), backgroundColor: Colors.red));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _showForgotPasswordDialog() async {
    final resetEmailController = TextEditingController(text: _emailController.text.trim());

    final sent = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Recuperar contraseña'),
        content: TextField(
          controller: resetEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await Supabase.instance.client.auth.resetPasswordForEmail(
                  resetEmailController.text.trim(),
                  redirectTo: redirectUrl,
                );
                if (ctx.mounted) Navigator.pop(ctx, true);
              } catch (e) {
                if (ctx.mounted) {
                  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
                }
              }
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );

    resetEmailController.dispose();

    if (sent == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Revisa tu correo para restablecer.'), backgroundColor: Colors.green));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isRegistering ? 'Registro' : 'Iniciar sesión')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Icon(Icons.storefront, size: 80),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Contraseña', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              
              if (_isRegistering) ...[
                DropdownButtonFormField<String>(
                  value: _selectedRole,
                  decoration: const InputDecoration(labelText: 'Tipo de cuenta', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'user', child: Text('Usuario')),
                    DropdownMenuItem(value: 'merchant', child: Text('Comercio')),
                  ],
                  onChanged: (v) => setState(() => _selectedRole = v ?? 'user'),
                ),
                const SizedBox(height: 12),
                
                if (_selectedRole == 'user')
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nombre completo', prefixIcon: Icon(Icons.person), border: OutlineInputBorder()),
                  )
                else ...[
                  TextField(
                    controller: _storeNameController,
                    decoration: const InputDecoration(labelText: 'Nombre comercial', prefixIcon: Icon(Icons.store), border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _rifController,
                    decoration: const InputDecoration(labelText: 'RIF del Comercio (Ej: J-12345678-9)', prefixIcon: Icon(Icons.badge), border: OutlineInputBorder()),
                  ),
                ],
                const SizedBox(height: 12),
                CheckboxListTile(
                  value: _isAdult,
                  onChanged: (v) => setState(() => _isAdult = v ?? false),
                  title: const Text('Declaro ser mayor de edad'),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
              
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))
                      : Text(_isRegistering ? 'Registrarse' : 'Entrar'),
                ),
              ),
              if (!_isRegistering)
                TextButton(
                  onPressed: _showForgotPasswordDialog,
                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              TextButton(
                onPressed: () => setState(() => _isRegistering = !_isRegistering),
                child: Text(_isRegistering ? '¿Ya tienes cuenta? Inicia sesión' : '¿No tienes cuenta? Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}```

### 📄 lib/screens/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'config.dart';
import 'auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://9760817470fff8d5e02c3109fcb785af@o4512309844836353.ingest.us.sentry.io/4512309897134080'; 
      options.tracesSampleRate = 1.0; 
    },
    appRunner: () => runApp(const OfVeApp()),
  );
}

class OfVeApp extends StatelessWidget {
  const OfVeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OfVe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        primaryColor: const Color(0xFF6B4EFF),
        fontFamily: 'Roboto',
      ),
      home: const AuthGate(),
    );
  }
}import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'config.dart';
import 'auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://9760817470fff8d5e02c3109fcb785af@o4512309844836353.ingest.us.sentry.io/4512309897134080'; 
      options.tracesSampleRate = 1.0; 
    },
    appRunner: () => runApp(const OfVeApp()),
  );
}

class OfVeApp extends StatelessWidget {
  const OfVeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OfVe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        primaryColor: const Color(0xFF6B4EFF),
        fontFamily: 'Roboto',
      ),
      home: const AuthGate(),
    );
  }
}```

### 📄 lib/screens/map_picker_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapPickerScreen extends StatefulWidget {
  final double? initialLat;
  final double? initialLng;

  const MapPickerScreen({super.key, this.initialLat, this.initialLng});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  final MapController _mapController = MapController();
  LatLng _currentCenter = const LatLng(10.4806, -66.9036); // Caracas por defecto
  bool _isLoadingLocation = false;

  final Color primaryPurple = const Color(0xFF6B4EFF);

  @override
  void initState() {
    super.initState();
    if (widget.initialLat != null && widget.initialLng != null) {
      _currentCenter = LatLng(widget.initialLat!, widget.initialLng!);
    } else {
      _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception('GPS desactivado');

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) throw Exception('Permiso denegado');
      }

      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentCenter = LatLng(position.latitude, position.longitude);
        _mapController.move(_currentCenter, 16.0);
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error GPS: $e'), backgroundColor: Colors.red));
      }
    } finally {
      if (mounted) setState(() => _isLoadingLocation = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubica tu Comercio', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFECE2FC),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location, color: Color(0xFF6B4EFF)),
            onPressed: _getCurrentLocation,
            tooltip: 'Usar mi GPS actual',
          )
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentCenter,
              initialZoom: 15.0,
              // CORRECCIÓN: MapPosition -> MapCamera
              onPositionChanged: (MapCamera camera, bool hasGesture) {
                if (hasGesture) {
                  setState(() => _currentCenter = camera.center);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.ofve.app',
              ),
            ],
          ),
          
          // Pin fijo en el centro de la pantalla
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40), // Ajuste visual
              child: Icon(Icons.location_on, size: 50, color: Colors.red),
            ),
          ),

          // Botón de confirmar
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 5,
              ),
              onPressed: () {
                // Devuelve las coordenadas al formulario
                Navigator.pop(context, {
                  'lat': _currentCenter.latitude,
                  'lng': _currentCenter.longitude,
                });
              },
              child: const Text('Confirmar Ubicación', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}```

### 📄 lib/screens/map_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum MapLayerType { osm, relieve, satelite }

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  
  LatLng _currentCenter = const LatLng(10.4806, -66.9036); 
  LatLng? _userLocation; // Guardamos la ubicación real del usuario aquí
  
  List<Marker> _markers = [];
  List<LatLng> _routePoints = []; // Aquí guardaremos la línea de la ruta
  
  bool _isLoading = true;
  bool _isFetchingRoute = false; // Para saber si estamos trazando la ruta
  String? _errorMessage;
  
  double _radioMetros = 500.0; 
  MapLayerType _currentLayer = MapLayerType.osm;

  String _selectedCategory = "Todos";
  String _searchQuery = "";
  final List<String> _categories = ["Todos", "Alimentos", "Bebidas", "Limpieza", "Cuidado Personal", "Hogar", "Salud"];

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedCategory = prefs.getString('map_category_pref');
    
    if (savedCategory == null) {
      final user = Supabase.instance.client.auth.currentUser;
      final prefsFromUser = user?.userMetadata?['preferencias'];
      if (prefsFromUser != null && prefsFromUser is List && prefsFromUser.isNotEmpty) {
        savedCategory = prefsFromUser.first; 
      }
    }

    setState(() {
      _selectedCategory = savedCategory ?? "Todos";
    });
    _initLocation();
  }

  Future<void> _savePreference(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('map_category_pref', category);
  }

  Future<void> _initLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _loadOfertas(_currentCenter);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _loadOfertas(_currentCenter); 
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _loadOfertas(_currentCenter);
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      ).timeout(const Duration(seconds: 8));

      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
        _currentCenter = _userLocation!;
      });
      
      _mapController.move(_currentCenter, 15.0);
      _loadOfertas(_currentCenter);
    } catch (e) {
      debugPrint("Error obteniendo GPS: $e");
      _loadOfertas(_currentCenter); 
    }
  }

  Future<void> _loadOfertas(LatLng center) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _routePoints.clear(); // Limpiamos la ruta anterior si se buscan nuevas ofertas
    });

    try {
      final url = Uri.parse(
        "https://ofve-api.eddisongabrielrodriguez.workers.dev/?lat=${center.latitude}&lon=${center.longitude}&radio=${_radioMetros.toInt()}&categoria=$_selectedCategory&search=$_searchQuery"
      );
      
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> ofertas = json.decode(response.body);
        
        setState(() {
          _markers = ofertas.map((oferta) {
            final lat = oferta['latitud'] ?? center.latitude; 
            final lon = oferta['longitud'] ?? center.longitude;

            return Marker(
              point: LatLng(lat.toDouble(), lon.toDouble()),
              width: 80,
              height: 80,
              child: GestureDetector(
                onTap: () => _showOfertaDetails(oferta),
                child: const Icon(Icons.location_on, color: Color(0xFF6B4EFF), size: 40),
              ),
            );
          }).toList();
        });
      } else {
        setState(() => _errorMessage = "Error del servidor: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error cargando mapa: $e");
      setState(() => _errorMessage = "No se pudieron cargar las ofertas. Revisa tu conexión.");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // --- TRAZAR LA RUTA USANDO OSRM ---
  Future<void> _drawRoute(LatLng start, LatLng end) async {
    setState(() => _isFetchingRoute = true);
    
    try {
      // Llamada a la API pública de OSRM (Gratuita y sin API Key)
      final url = Uri.parse(
          'https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson');
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final coordinates = data['routes'][0]['geometry']['coordinates'] as List;
        
        // OSRM devuelve las coordenadas en [Longitud, Latitud]. Debemos invertirlas.
        final List<LatLng> newRoute = coordinates.map((coord) {
          return LatLng(coord[1].toDouble(), coord[0].toDouble());
        }).toList();

        setState(() {
          _routePoints = newRoute;
          _isFetchingRoute = false;
        });

        // Hacer zoom para que la ruta quepa en la pantalla
        final bounds = LatLngBounds.fromPoints(_routePoints);
        _mapController.fitCamera(CameraFit.bounds(
          bounds: bounds,
          padding: const EdgeInsets.all(50.0), // Margen de 50px alrededor de la ruta
        ));

      } else {
        throw Exception("No se pudo trazar la ruta");
      }
    } catch (e) {
      debugPrint("Error dibujando ruta: $e");
      setState(() => _isFetchingRoute = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo calcular la ruta. Intenta de nuevo.')),
        );
      }
    }
  }

  // --- VENTANA DE DETALLES DE LA OFERTA ---
  void _showOfertaDetails(dynamic oferta) {
    final LatLng comercioLocation = LatLng(
      (oferta['latitud'] ?? 10.4806).toDouble(), 
      (oferta['longitud'] ?? -66.9036).toDouble()
    );
    
    // Asumiendo que tu base de datos envía 'direccion'. Si no, pon un texto por defecto.
    final String direccion = oferta['direccion'] ?? 'Dirección no registrada';

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 280, // Ventana un poco más alta para acomodar la dirección
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(oferta['producto_nombre'] ?? 'Oferta Especial', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2D3A5A))),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.store, color: Colors.grey, size: 18),
                  const SizedBox(width: 5),
                  Text(oferta['comercio_nombre'] ?? 'Comercio', style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.map, color: Colors.grey, size: 18),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(direccion, style: const TextStyle(fontSize: 14, color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${oferta['precio_oferta'] ?? '0.00'}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.green)),
                  
                  // BOTÓN DE CÓMO LLEGAR
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B4EFF),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Cerrar la ventana de detalles
                      
                      if (_userLocation != null) {
                        _drawRoute(_userLocation!, comercioLocation);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Necesitamos tu ubicación GPS para trazar la ruta.')),
                        );
                      }
                    },
                    icon: const Icon(Icons.directions, color: Colors.white),
                    label: const Text('Cómo llegar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ofertas Cercanas'),
        backgroundColor: const Color(0xFF2D3A5A),
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<MapLayerType>(
            icon: const Icon(Icons.layers),
            onSelected: (layer) => setState(() => _currentLayer = layer),
            itemBuilder: (context) => [
              const PopupMenuItem(value: MapLayerType.osm, child: Text('Estándar')),
              const PopupMenuItem(value: MapLayerType.relieve, child: Text('Relieve')),
              const PopupMenuItem(value: MapLayerType.satelite, child: Text('Satélite')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // --- BUSCADOR ---
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF6B4EFF)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = "");
                    _loadOfertas(_currentCenter);
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                filled: true,
                fillColor: const Color(0xFFF5F3FF),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onSubmitted: (value) {
                setState(() => _searchQuery = value);
                _loadOfertas(_currentCenter);
              },
            ),
          ),

          // --- BARRA DE CATEGORÍAS ---
          Container(
            color: Colors.white,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final cat = _categories[index];
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: const Color(0xFF6B4EFF),
                    labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedCategory = cat);
                        _savePreference(cat);
                        _loadOfertas(_currentCenter);
                      }
                    },
                  ),
                );
              },
            ),
          ),

          // --- SLIDER DE RADIO ---
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.radar, color: Color(0xFF6B4EFF)),
                const SizedBox(width: 8),
                Expanded(
                  child: Slider(
                    value: _radioMetros,
                    min: 500,
                    max: 5000,
                    divisions: 9,
                    label: '${_radioMetros.toInt()} m',
                    onChanged: (value) => setState(() => _radioMetros = value),
                    onChangeEnd: (value) => _loadOfertas(_currentCenter),
                  ),
                ),
                Text('${_radioMetros.toInt()}m', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3A5A))),
              ],
            ),
          ),
          
          // --- MAPA ---
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _currentCenter,
                    initialZoom: 14.0,
                    onPositionChanged: (position, hasGesture) {
                      if (hasGesture) setState(() => _currentCenter = position.center);
                    },
                  ),
                  children: [
                    // Capas del mapa
                    if (_currentLayer == MapLayerType.osm)
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.ofve.app')
                    else if (_currentLayer == MapLayerType.relieve)
                      TileLayer(urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', subdomains: const ['a', 'b', 'c'], userAgentPackageName: 'com.ofve.app')
                    else if (_currentLayer == MapLayerType.satelite)
                      TileLayer(urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', userAgentPackageName: 'com.ofve.app'),
                    
                    // Línea de la ruta
                    if (_routePoints.isNotEmpty)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: _routePoints,
                            strokeWidth: 5.0,
                            color: const Color(0xFF6B4EFF), // Morado de OfVe
                          ),
                        ],
                      ),

                    // Pines de las ofertas
                    MarkerLayer(markers: _markers),

                    // Pin de la ubicación del usuario (Opcional)
                    if (_userLocation != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _userLocation!,
                            width: 40,
                            height: 40,
                            child: const Icon(Icons.my_location, color: Colors.blue, size: 30),
                          ),
                        ],
                      ),
                  ],
                ),
                
                // Cargando ofertas
                if (_isLoading)
                  const Positioned(
                    top: 20, left: 0, right: 0,
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
                              SizedBox(width: 10),
                              Text('Buscando ofertas...'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                
                // Cargando ruta
                if (_isFetchingRoute)
                  Positioned(
                    bottom: 20, left: 0, right: 0,
                    child: Center(
                      child: Card(
                        color: const Color(0xFF2D3A5A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
                              SizedBox(width: 10),
                              Text('Trazando ruta...', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                // Mensajes de error
                if (_errorMessage != null)
                  Positioned(
                    top: 10, left: 10, right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
                      child: Text(_errorMessage!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6B4EFF),
        onPressed: () => _loadOfertas(_currentCenter),
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_ads_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_ads_controller.dart';

class MerchantAdsScreen extends StatefulWidget {
  const MerchantAdsScreen({super.key});

  @override
  State<MerchantAdsScreen> createState() => _MerchantAdsScreenState();
}

class _MerchantAdsScreenState extends State<MerchantAdsScreen> {
  final _adsController = MerchantAdsController();

  void _mostrarDialogoCompra(String offerId, String offerName) {
    int selectedDays = 7;
    
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          double total = _adsController.precioPorDia * selectedDays;
          
          return AlertDialog(
            title: const Text('Destacar Oferta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Oferta: $offerName', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const Text('¿Cuántos días deseas destacarla?'),
                const SizedBox(height: 8),
                Slider(
                  value: selectedDays.toDouble(),
                  min: 3,
                  max: 30,
                  divisions: 9,
                  label: '$selectedDays días',
                  activeColor: AppColors.primaryPurple,
                  onChanged: (v) => setState(() => selectedDays = v.round()),
                ),
                Text('Total a pagar: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
              ElevatedButton(
                onPressed: () async {
                  final success = await _adsController.buyAd(offerId: offerId, days: selectedDays);
                  if (ctx.mounted) Navigator.pop(ctx);
                  if (success && mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_adsController.successMessage!), backgroundColor: AppColors.success));
                  } else if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_adsController.errorMessage!), backgroundColor: AppColors.error));
                  }
                },
                child: const Text('Pagar y Destacar'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _adsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Publicidad (Ads)')),
          body: _adsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CAMPAÑAS ACTIVAS
                      if (_adsController.myCampaigns.isNotEmpty) ...[
                        const Text('Tus Campañas Activas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _adsController.myCampaigns.length,
                          itemBuilder: (context, index) {
                            final camp = _adsController.myCampaigns[index];
                            final fechaFin = DateTime.parse(camp['fecha_fin']).toLocal();
                            final fechaStr = DateFormat('dd/MM/yyyy').format(fechaFin);

                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              color: Colors.amber.withOpacity(0.1),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Colors.amber)),
                              child: ListTile(
                                leading: const Icon(Icons.star, color: Colors.amber),
                                title: Text(camp['ofertas']?['producto_nombre'] ?? 'Oferta', style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text('Finaliza el: $fechaStr'),
                                trailing: Text('${camp['dias_duracion']} días', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                      ],

                      // OFERTAS DISPONIBLES PARA DESTACAR
                      const Text('Selecciona una oferta para promocionar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      
                      if (_adsController.myOffers.isEmpty)
                        const Center(child: Text('No tienes ofertas activas para promocionar.', style: TextStyle(color: Colors.grey)))
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _adsController.myOffers.length,
                          itemBuilder: (context, index) {
                            final offer = _adsController.myOffers[index];
                            final isAlreadySponsored = offer['es_patrocinada'] ?? false;

                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                                  child: const Icon(Icons.local_offer, color: AppColors.primaryPurple),
                                ),
                                title: Text(offer['producto_nombre'], style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text('\$${offer['precio_oferta'] ?? offer['precio_regular']}'),
                                trailing: isAlreadySponsored 
                                    ? const Text('Ya destacada', style: TextStyle(color: AppColors.success, fontWeight: FontWeight.bold))
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.white),
                                        onPressed: () => _mostrarDialogoCompra(offer['id'], offer['producto_nombre']),
                                        child: const Text('Destacar'),
                                      ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}```

### 📄 lib/screens/merchant_coupons_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/coupon_controller.dart';

class MerchantCouponsScreen extends StatefulWidget {
  const MerchantCouponsScreen({super.key});

  @override
  State<MerchantCouponsScreen> createState() => _MerchantCouponsScreenState();
}

class _MerchantCouponsScreenState extends State<MerchantCouponsScreen> {
  final _couponController = CouponController();

  void _mostrarFormularioCreacion() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _CreateCouponSheet(controller: _couponController),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _couponController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Cupones')),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _mostrarFormularioCreacion,
            backgroundColor: AppColors.primaryPurple,
            icon: const Icon(Icons.add, color: AppColors.white),
            label: const Text('Crear Cupón', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
          ),
          body: _couponController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _couponController.coupons.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_activity, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No tienes cupones activos.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Crea uno para atraer más clientes!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _couponController.coupons.length,
                      itemBuilder: (context, index) {
                        final coupon = _couponController.coupons[index];
                        final expiration = DateTime.parse(coupon['fecha_expiracion']).toLocal();
                        final isExpired = expiration.isBefore(DateTime.now());
                        final isMaxedOut = (coupon['usos_actuales'] ?? 0) >= (coupon['usos_maximos'] ?? 0);
                        final isActive = !isExpired && !isMaxedOut;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: isActive ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: isActive ? AppColors.success : AppColors.error),
                                      ),
                                      child: Text(
                                        coupon['codigo'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                          color: isActive ? AppColors.success : AppColors.error,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: AppColors.error),
                                      onPressed: () => _couponController.deleteCoupon(coupon['id']),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '${coupon['descuento_porcentaje']}% de Descuento',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryPurple),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Vence: ${DateFormat('dd/MM/yyyy').format(expiration)}',
                                      style: TextStyle(color: isExpired ? AppColors.error : AppColors.textLight, fontWeight: isExpired ? FontWeight.bold : FontWeight.normal),
                                    ),
                                    Text('Usos: ${coupon['usos_actuales']} / ${coupon['usos_maximos']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: (coupon['usos_actuales'] ?? 0) / (coupon['usos_maximos'] ?? 1),
                                  backgroundColor: Colors.grey[200],
                                  color: isActive ? AppColors.primaryPurple : Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                  minHeight: 8,
                                ),
                                if (isExpired)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text('⚠️ Este cupón ha expirado', style: TextStyle(color: AppColors.error, fontSize: 12, fontWeight: FontWeight.bold)),
                                  )
                                else if (isMaxedOut)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text('⚠️ Límite de usos alcanzado', style: TextStyle(color: AppColors.warning, fontSize: 12, fontWeight: FontWeight.bold)),
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}

class _CreateCouponSheet extends StatefulWidget {
  final CouponController controller;

  const _CreateCouponSheet({required this.controller});

  @override
  State<_CreateCouponSheet> createState() => _CreateCouponSheetState();
}

class _CreateCouponSheetState extends State<_CreateCouponSheet> {
  final _codeCtrl = TextEditingController();
  final _discountCtrl = TextEditingController();
  final _maxUsesCtrl = TextEditingController();
  DateTime _expirationDate = DateTime.now().add(const Duration(days: 30));
  bool _isSaving = false;

  Future<void> _seleccionarFecha() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _expirationDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) setState(() => _expirationDate = date);
  }

  Future<void> _submit() async {
    if (_codeCtrl.text.isEmpty || _discountCtrl.text.isEmpty || _maxUsesCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Llena todos los campos.'), backgroundColor: AppColors.error));
      return;
    }

    setState(() => _isSaving = true);
    final success = await widget.controller.createCoupon(
      code: _codeCtrl.text,
      discount: int.parse(_discountCtrl.text),
      maxUses: int.parse(_maxUsesCtrl.text),
      expirationDate: _expirationDate,
    );

    if (mounted) {
      Navigator.pop(context);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Cupón creado con éxito!'), backgroundColor: AppColors.success));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.controller.errorMessage ?? 'Error al crear'), backgroundColor: AppColors.error));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Nuevo Cupón', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: _codeCtrl,
              textCapitalization: TextCapitalization.characters,
              decoration: const InputDecoration(labelText: 'Código (Ej: VERANO20)', prefixIcon: Icon(Icons.local_activity)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: TextField(controller: _discountCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: '% Descuento', prefixIcon: Icon(Icons.percent)))),
                const SizedBox(width: 12),
                Expanded(child: TextField(controller: _maxUsesCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Usos Máximos', prefixIcon: Icon(Icons.numbers)))),
              ],
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: AppColors.primaryPurple),
              title: const Text('Fecha de Expiración'),
              subtitle: Text(DateFormat('dd/MM/yyyy').format(_expirationDate)),
              trailing: const Icon(Icons.edit, size: 20, color: Colors.grey),
              onTap: _seleccionarFecha,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _submit,
                child: _isSaving 
                    ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                    : const Text('Guardar Cupón'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_dashboard_tab.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../widgets/notification_bell.dart'; 
import 'create_offer_screen.dart';
import 'merchant_plans_screen.dart';
import 'merchant_metrics_screen.dart';
import 'add_product_screen.dart';
import 'merchant_demand_radar.dart';
import 'merchant_scanner_screen.dart'; 
import 'ai_assistant_screen.dart'; 
import 'voice_offer_screen.dart'; 
import 'merchant_coupons_screen.dart'; 
import 'merchant_earnings_screen.dart'; 
import 'merchant_reviews_screen.dart'; 
import 'merchant_pools_screen.dart';
import 'merchant_ads_screen.dart'; // <-- NUEVA IMPORTACIÓN

class MerchantDashboardTab extends StatefulWidget {
  final String storeName;
  final String planName;
  final String category;

  const MerchantDashboardTab({
    super.key,
    required this.storeName,
    required this.planName,
    required this.category,
  });

  @override
  State<MerchantDashboardTab> createState() => _MerchantDashboardTabState();
}

class _MerchantDashboardTabState extends State<MerchantDashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter, 
              colors: [AppColors.bgTop, AppColors.bgBottom], 
              stops: [0.0, 0.4]
            ),
          ),
        ),
        Positioned(
          top: -150, left: -100,
          child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.curveColor.withOpacity(0.8))),
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 16),
                _buildStoreInfo(),
                const SizedBox(height: 24),
                _buildMerchantGrid(context),
                const SizedBox(height: 30),
                _buildSubscriptionBanner(context),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 28, color: AppColors.textDark),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        Row(
          children: [
            const NotificationBell(),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber, 
                borderRadius: BorderRadius.circular(20), 
                boxShadow: [BoxShadow(color: Colors.amber.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))]
              ),
              child: Row(
                children: [
                  const Icon(Icons.workspace_premium, size: 16, color: AppColors.white),
                  const SizedBox(width: 4),
                  Text(widget.planName.toUpperCase(), style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.storeName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.textDark)),
        Row(
          children: [
            const Icon(Icons.category, size: 14, color: AppColors.primaryPurple),
            const SizedBox(width: 4),
            Text(widget.category, style: const TextStyle(fontSize: 14, color: AppColors.primaryPurple, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildMiniStat('Visitas', '1,240', Icons.remove_red_eye, AppColors.info),
            const SizedBox(width: 12),
            _buildMiniStat('Ofertas', '8', Icons.local_offer, AppColors.success),
            const SizedBox(width: 12),
            _buildMiniStat('Ganancias', '\$ 320', Icons.attach_money, AppColors.warning),
          ],
        ),
      ],
    );
  }

  Widget _buildMiniStat(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white, 
          borderRadius: BorderRadius.circular(12), 
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildMerchantGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: [
        _buildCard(
          imagePath: 'assets/icons/oferta.webp', 
          title: 'Escanear', 
          subtitle: 'Validar Compra', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantScannerScreen()))
        ),
        _buildCard(
          imagePath: 'assets/icons/oferta.webp',
          title: 'Crear Oferta', 
          subtitle: 'Manual', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateOfferScreen()))
        ),
        _buildCard(
          imagePath: 'assets/icons/robot-ia.webp', 
          title: 'Asistente IA', 
          subtitle: 'Generar Textos', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AiAssistantScreen()))
        ),
        _buildCard(
          imagePath: 'assets/icons/microfono.webp', 
          title: 'Por Voz', 
          subtitle: 'Dictar Oferta', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VoiceOfferScreen()))
        ),
        _buildCard(
          imagePath: 'assets/icons/metricas.webp', 
          title: 'Métricas', 
          subtitle: 'Ver Impacto', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantMetricsScreen()))
        ),
        _buildCard(
          imagePath: 'assets/icons/cupones.webp', 
          title: 'Cupones', 
          subtitle: 'Promociones', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantCouponsScreen()))
        ),
        _buildCard(
          imagePath: 'assets/icons/ganancias.webp', 
          title: 'Ganancias', 
          subtitle: 'Flujo de Caja', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantEarningsScreen()))
        ),
        _buildCard(
          imagePath: 'assets/icons/inventario.webp', 
          title: 'Inventario', 
          subtitle: 'Subir Productos', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddProductScreen()))
        ),
        _buildCard(
          imagePath: 'assets/icons/pools.webp', 
          title: 'Pools', 
          subtitle: 'Compras Grupales', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantPoolsScreen()))
        ),
        
        // NUEVA TARJETA DE PUBLICIDAD
        _buildCard(
          imagePath: 'assets/icons/corona.webp', 
          title: 'Publicidad', 
          subtitle: 'Destacar Ofertas', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantAdsScreen()))
        ),
        
        _buildCard(
          imagePath: 'assets/icons/reseña.webp', 
          title: 'Radar', 
          subtitle: 'Demanda de mercado', 
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (_) => MerchantDemandRadar(categoriaComercio: widget.category)
          ))
        ),
        _buildCard(
          imagePath: 'assets/icons/reseña.webp', 
          title: 'Reseñas', 
          subtitle: 'Reputación', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantReviewsScreen()))
        ),
      ],
    );
  }

  Widget _buildCard({required String imagePath, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkCardColor, 
          borderRadius: BorderRadius.circular(16), 
          boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const Icon(Icons.store, color: AppColors.white, size: 32)),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionBanner(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantPlansScreen())),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.primaryPurple, AppColors.primaryPurple.withOpacity(0.7)]),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            const Icon(Icons.workspace_premium, color: AppColors.white, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Plan ${widget.planName} Activo', style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text('Gestiona tu suscripción y beneficios', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 20),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_dashboard_tab2.dart
```dart
import 'package:flutter/material.dart';
import 'create_offer_screen.dart';
import 'merchant_plans_screen.dart';
import 'merchant_metrics_screen.dart';
import 'add_product_screen.dart';
import 'merchant_demand_radar.dart'; // <-- NUEVA IMPORTACIÓN

class MerchantDashboardTab extends StatefulWidget {
  final String storeName;
  final String planName;
  final String category;
  final Color bgTop;
  final Color bgBottom;
  final Color curveColor;
  final Color darkCardColor;
  final Color primaryPurple;

  const MerchantDashboardTab({
    super.key,
    required this.storeName,
    required this.planName,
    required this.category,
    required this.bgTop,
    required this.bgBottom,
    required this.curveColor,
    required this.darkCardColor,
    required this.primaryPurple,
  });

  @override
  State<MerchantDashboardTab> createState() => _MerchantDashboardTabState();
}

class _MerchantDashboardTabState extends State<MerchantDashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [widget.bgTop, widget.bgBottom], stops: const [0.0, 0.4]),
          ),
        ),
        Positioned(
          top: -150, left: -100,
          child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, color: widget.curveColor.withOpacity(0.8))),
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 16),
                _buildStoreInfo(),
                const SizedBox(height: 24),
                _buildMerchantGrid(context),
                const SizedBox(height: 30),
                _buildSubscriptionBanner(context),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 28, color: Colors.black87),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.amber.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))]),
          child: Row(
            children: [
              const Icon(Icons.workspace_premium, size: 16, color: Colors.white),
              const SizedBox(width: 4),
              Text(widget.planName.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.storeName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87)),
        Row(
          children: [
            Icon(Icons.category, size: 14, color: widget.primaryPurple),
            const SizedBox(width: 4),
            Text(widget.category, style: TextStyle(fontSize: 14, color: widget.primaryPurple, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildMiniStat('Visitas', '1,240', Icons.remove_red_eye, Colors.blue),
            const SizedBox(width: 12),
            _buildMiniStat('Ofertas', '8', Icons.local_offer, Colors.green),
            const SizedBox(width: 12),
            _buildMiniStat('Ganancias', '\$ 320', Icons.attach_money, Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildMiniStat(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildMerchantGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: [
        _buildCard(
          imagePath: 'assets/icons/oferta.webp',
          title: 'Crear Oferta', 
          subtitle: 'Manual', 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateOfferScreen()));
          }
        ),
        _buildCard(imagePath: 'assets/icons/robot-ia.webp', title: 'Asistente IA', subtitle: 'Generar Textos', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/microfono.webp', title: 'Por Voz', subtitle: 'Dictar Oferta', onTap: () {}),
        
        _buildCard(
          imagePath: 'assets/icons/metricas.webp', 
          title: 'Métricas', 
          subtitle: 'Ver Impacto', 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => MerchantMetricsScreen(
              primaryPurple: widget.primaryPurple,
              bgTop: widget.bgTop,
              darkCardColor: widget.darkCardColor,
            )));
          }
        ),
        
        _buildCard(imagePath: 'assets/icons/cupones.webp', title: 'Cupones', subtitle: 'Promociones', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/ganancias.webp', title: 'Ganancias', subtitle: 'Flujo de Caja', onTap: () {}),
        
        _buildCard(
          imagePath: 'assets/icons/inventario.webp', 
          title: 'Inventario', 
          subtitle: 'Subir Productos', 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AddProductScreen()));
          }
        ),

        _buildCard(imagePath: 'assets/icons/pools.webp', title: 'Pools', subtitle: 'Compras Grupales', onTap: () {}),
        
        // --- TARJETA DE RADAR DE DEMANDA CONECTADA ---
        _buildCard(
          imagePath: 'assets/icons/reseña.webp', // Puedes cambiar la imagen luego
          title: 'Radar', 
          subtitle: 'Demanda de mercado', 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => MerchantDemandRadar(
                categoriaComercio: widget.category,
                primaryPurple: widget.primaryPurple,
                bgTop: widget.bgTop,
              )
            ));
          }
        ),
      ],
    );
  }

  Widget _buildCard({required String imagePath, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: widget.darkCardColor, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: widget.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const Icon(Icons.store, color: Colors.white, size: 32)),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionBanner(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantPlansScreen())),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [widget.primaryPurple, widget.primaryPurple.withOpacity(0.7)]),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: widget.primaryPurple.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            const Icon(Icons.workspace_premium, color: Colors.white, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Plan ${widget.planName} Activo', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text('Gestiona tu suscripción y beneficios', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_demand_radar.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class MerchantDemandRadar extends StatefulWidget {
  final String categoriaComercio;

  const MerchantDemandRadar({super.key, required this.categoriaComercio});

  @override
  State<MerchantDemandRadar> createState() => _MerchantDemandRadarState();
}

class _MerchantDemandRadarState extends State<MerchantDemandRadar> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _busquedas = [];

  @override
  void initState() {
    super.initState();
    _cargarRadar();
  }

  Future<void> _cargarRadar() async {
    try {
      final response = await _supabase.from('busquedas_fallidas').select('termino_busqueda').eq('categoria_ia', widget.categoriaComercio);
      
      final Map<String, int> conteo = {};
      for (var item in response) {
        final term = item['termino_busqueda'].toString().toLowerCase();
        conteo[term] = (conteo[term] ?? 0) + 1;
      }

      final sortedList = conteo.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

      setState(() {
        _busquedas = sortedList.take(10).map((e) => {'termino': e.key, 'cantidad': e.value}).toList();
      });
    } catch (e) {
      debugPrint('Error cargando radar: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Radar de Demanda')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
                  child: Column(
                    children: [
                      const Icon(Icons.radar, color: AppColors.primaryPurple, size: 40),
                      const SizedBox(height: 12),
                      Text('Esto es lo que buscan tus clientes en ${widget.categoriaComercio}:', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      const Text('Si agregas estos productos a tu inventario, ¡podrías captar ventas inmediatas!', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: AppColors.textLight)),
                    ],
                  ),
                ),
                Expanded(
                  child: _busquedas.isEmpty
                      ? const Center(child: Text('Aún no hay búsquedas insatisfechas en tu ramo.'))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _busquedas.length,
                          itemBuilder: (context, index) {
                            final item = _busquedas[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(backgroundColor: AppColors.primaryPurple.withOpacity(0.1), child: Text('${index + 1}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold))),
                                title: Text(item['termino'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(color: AppColors.error.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                                  child: Text('${item['cantidad']} búsquedas', style: const TextStyle(color: AppColors.error, fontWeight: FontWeight.bold, fontSize: 12)),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}```

### 📄 lib/screens/merchant_demand_radar2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantDemandRadar extends StatefulWidget {
  final String categoriaComercio;
  final Color primaryPurple;
  final Color bgTop;

  const MerchantDemandRadar({
    super.key,
    required this.categoriaComercio,
    required this.primaryPurple,
    required this.bgTop,
  });

  @override
  State<MerchantDemandRadar> createState() => _MerchantDemandRadarState();
}

class _MerchantDemandRadarState extends State<MerchantDemandRadar> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _busquedas = [];

  @override
  void initState() {
    super.initState();
    _cargarRadar();
  }

  Future<void> _cargarRadar() async {
    try {
      // Agrupamos las búsquedas por término para ver cuáles son las más repetidas
      final response = await _supabase
          .from('busquedas_fallidas')
          .select('termino_busqueda')
          .eq('categoria_ia', widget.categoriaComercio); // Filtro por su ramo
          
      // En un entorno real, usarías una función RPC en Postgres para agrupar y contar.
      // Aquí lo hacemos en cliente para la demostración:
      final Map<String, int> conteo = {};
      for (var item in response) {
        final term = item['termino_busqueda'].toString().toLowerCase();
        conteo[term] = (conteo[term] ?? 0) + 1;
      }

      final sortedList = conteo.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

      setState(() {
        _busquedas = sortedList.take(10).map((e) => {'termino': e.key, 'cantidad': e.value}).toList();
      });
    } catch (e) {
      debugPrint('Error cargando radar: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgTop,
      appBar: AppBar(
        title: const Text('Radar de Demanda', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: widget.primaryPurple))
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.radar, color: widget.primaryPurple, size: 40),
                      const SizedBox(height: 12),
                      Text(
                        'Esto es lo que buscan tus clientes en ${widget.categoriaComercio}:',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Si agregas estos productos a tu inventario, ¡podrías captar ventas inmediatas!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _busquedas.isEmpty
                      ? const Center(child: Text('Aún no hay búsquedas insatisfechas en tu ramo.'))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _busquedas.length,
                          itemBuilder: (context, index) {
                            final item = _busquedas[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: widget.primaryPurple.withOpacity(0.1),
                                  child: Text('${index + 1}', style: TextStyle(color: widget.primaryPurple, fontWeight: FontWeight.bold)),
                                ),
                                title: Text(item['termino'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                                  child: Text('${item['cantidad']} búsquedas', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}```

### 📄 lib/screens/merchant_earnings_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_earnings_controller.dart';

class MerchantEarningsScreen extends StatefulWidget {
  const MerchantEarningsScreen({super.key});

  @override
  State<MerchantEarningsScreen> createState() => _MerchantEarningsScreenState();
}

class _MerchantEarningsScreenState extends State<MerchantEarningsScreen> {
  final _earningsController = MerchantEarningsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _earningsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Mis Ganancias'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _earningsController.loadEarnings,
              )
            ],
          ),
          body: _earningsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TARJETA DE BALANCE HISTÓRICO
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.darkCardColor, const Color(0xFF3D3785)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Balance Total Histórico', style: TextStyle(color: Colors.white70, fontSize: 14)),
                            const SizedBox(height: 8),
                            Text(
                              '\$${_earningsController.totalHistorico.toStringAsFixed(2)}',
                              style: const TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // TARJETAS DE RESUMEN
                      Row(
                        children: [
                          _buildSummaryCard('Hoy', _earningsController.totalHoy, AppColors.info),
                          const SizedBox(width: 12),
                          _buildSummaryCard('Esta Semana', _earningsController.totalSemana, AppColors.success),
                          const SizedBox(width: 12),
                          _buildSummaryCard('Este Mes', _earningsController.totalMes, AppColors.warning),
                        ],
                      ),

                      const SizedBox(height: 30),
                      
                      const Text('Historial de Transacciones', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),

                      if (_earningsController.transactions.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text('Aún no tienes ventas completadas.', style: TextStyle(color: Colors.grey)),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _earningsController.transactions.length,
                          itemBuilder: (context, index) {
                            final t = _earningsController.transactions[index];
                            final date = DateTime.parse(t['fecha_compra']).toLocal();
                            final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(date);
                            final clientName = t['usuarios']?['nombre'] ?? 'Cliente';

                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.success.withOpacity(0.1),
                                  child: const Icon(Icons.attach_money, color: AppColors.success),
                                ),
                                title: Text('Venta a $clientName', style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text(formattedDate, style: const TextStyle(fontSize: 12)),
                                trailing: Text(
                                  '+\$${(t['total_pagado'] as num).toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.success),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildSummaryCard(String title, double amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              '\$${amount.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_edit_store_screen.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_store_controller.dart';

class MerchantEditStoreScreen extends StatefulWidget {
  const MerchantEditStoreScreen({super.key});

  @override
  State<MerchantEditStoreScreen> createState() => _MerchantEditStoreScreenState();
}

class _MerchantEditStoreScreenState extends State<MerchantEditStoreScreen> {
  final _storeController = MerchantStoreController();
  
  final _nameCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _igCtrl = TextEditingController();
  final _tiktokCtrl = TextEditingController();
  final _fbCtrl = TextEditingController();
  final _waCtrl = TextEditingController();
  final _xCtrl = TextEditingController();

  String _selectedCategory = 'Otros';
  bool _aceptaDelivery = false;
  final List<String> _categoriasList = [
    'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza', 
    'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros'
  ];

  @override
  void initState() {
    super.initState();
    // Sincronizamos los controladores cuando los datos terminen de cargar
    _storeController.addListener(_syncData);
  }

  void _syncData() {
    if (_storeController.isLoading) return;
    
    if (_nameCtrl.text.isEmpty && _storeController.nombre.isNotEmpty) {
      _nameCtrl.text = _storeController.nombre;
      _addressCtrl.text = _storeController.direccion;
      _phoneCtrl.text = _storeController.telefono;
      _emailCtrl.text = _storeController.email;
      _igCtrl.text = _storeController.instagram;
      _tiktokCtrl.text = _storeController.tiktok;
      _fbCtrl.text = _storeController.facebook;
      _waCtrl.text = _storeController.whatsapp;
      _xCtrl.text = _storeController.x;
      setState(() {
        _selectedCategory = _storeController.categoria;
        _aceptaDelivery = _storeController.aceptaDelivery;
      });
    }
  }

  @override
  void dispose() {
    _storeController.removeListener(_syncData);
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _igCtrl.dispose();
    _tiktokCtrl.dispose();
    _fbCtrl.dispose();
    _waCtrl.dispose();
    _xCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickLogo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      _storeController.setNewLogo(bytes, pickedFile.name);
    }
  }

  Future<void> _guardar() async {
    final success = await _storeController.saveChanges(
      newName: _nameCtrl.text,
      newCategory: _selectedCategory,
      newAddress: _addressCtrl.text,
      newPhone: _phoneCtrl.text,
      newEmail: _emailCtrl.text,
      newDelivery: _aceptaDelivery,
      newIg: _igCtrl.text,
      newTiktok: _tiktokCtrl.text,
      newFb: _fbCtrl.text,
      newWa: _waCtrl.text,
      newX: _xCtrl.text,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_storeController.successMessage ?? _storeController.errorMessage ?? ''),
        backgroundColor: success ? AppColors.success : AppColors.error,
      ));
      if (success) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _storeController,
      builder: (context, child) {
        if (_storeController.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));
        }

        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mi Tienda')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // LOGO
                Center(
                  child: GestureDetector(
                    onTap: _pickLogo,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.white,
                          backgroundImage: _storeController.logoUrl.isNotEmpty 
                              ? NetworkImage(_storeController.logoUrl) 
                              : null,
                          child: _storeController.logoUrl.isEmpty 
                              ? const Icon(Icons.store, size: 50, color: AppColors.primaryPurple) 
                              : null,
                        ),
                        Positioned(
                          bottom: 0, right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(color: AppColors.primaryPurple, shape: BoxShape.circle),
                            child: const Icon(Icons.camera_alt, color: AppColors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Nombre Comercial', prefixIcon: Icon(Icons.store))),
                const SizedBox(height: 12),
                
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(labelText: 'Categoría', prefixIcon: Icon(Icons.category)),
                  items: _categoriasList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => setState(() => _selectedCategory = v!),
                ),
                const SizedBox(height: 12),

                TextField(controller: _addressCtrl, decoration: const InputDecoration(labelText: 'Dirección Física', prefixIcon: Icon(Icons.location_on))),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(child: TextField(controller: _phoneCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Teléfono', prefixIcon: Icon(Icons.phone)))),
                    const SizedBox(width: 12),
                    Expanded(child: TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email Público', prefixIcon: Icon(Icons.email)))),
                  ],
                ),
                const SizedBox(height: 12),

                SwitchListTile(
                  title: const Text('¿Ofreces Delivery?', style: TextStyle(fontWeight: FontWeight.w600)),
                  value: _aceptaDelivery, activeColor: AppColors.primaryPurple,
                  onChanged: (v) => setState(() => _aceptaDelivery = v),
                  contentPadding: EdgeInsets.zero,
                ),
                
                const Divider(height: 30),
                const Text('Redes Sociales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                const SizedBox(height: 12),

                TextField(controller: _igCtrl, decoration: const InputDecoration(labelText: 'Instagram', prefixIcon: Icon(Icons.camera_alt))),
                const SizedBox(height: 12),
                TextField(controller: _tiktokCtrl, decoration: const InputDecoration(labelText: 'TikTok', prefixIcon: Icon(Icons.music_note))),
                const SizedBox(height: 12),
                TextField(controller: _fbCtrl, decoration: const InputDecoration(labelText: 'Facebook', prefixIcon: Icon(Icons.facebook))),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: TextField(controller: _waCtrl, decoration: const InputDecoration(labelText: 'WhatsApp', prefixIcon: Icon(Icons.chat)))),
                    const SizedBox(width: 12),
                    Expanded(child: TextField(controller: _xCtrl, decoration: const InputDecoration(labelText: 'X (Twitter)', prefixIcon: Icon(Icons.alternate_email)))),
                  ],
                ),
                
                const SizedBox(height: 30),

                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _storeController.isSaving ? null : _guardar,
                    child: _storeController.isSaving
                        ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                        : const Text('Guardar Cambios'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/merchant_metrics_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import 'merchant_plans_screen.dart';

class MerchantMetricsScreen extends StatefulWidget {
  const MerchantMetricsScreen({super.key});

  @override
  State<MerchantMetricsScreen> createState() => _MerchantMetricsScreenState();
}

class _MerchantMetricsScreenState extends State<MerchantMetricsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;

  double _totalIngresos = 0.0;
  int _totalVentas = 0;
  int _ofertasActivas = 0;
  List<dynamic> _ventasRecientes = [];
  
  List<double> _weeklySales = List.filled(7, 0.0);
  final List<String> _weekDays = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

  @override
  void initState() {
    super.initState();
    _loadMetrics();
  }

  Future<void> _loadMetrics() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      final compras = await _supabase.from('compras').select('*').eq('comercio_id', comercioId).eq('estado', 'Completado').order('fecha_compra', ascending: false);
      final countOfertas = await _supabase.from('ofertas').select('id').eq('comercio_id', comercioId).eq('estado', 'Activa').count();

      double ingresos = 0;
      List<double> tempWeekly = List.filled(7, 0.0);
      final now = DateTime.now();
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

      for (var compra in compras) {
        ingresos += (compra['total_pagado'] as num).toDouble();
        final fechaCompra = DateTime.parse(compra['fecha_compra']).toLocal();
        if (fechaCompra.isAfter(startOfWeek)) {
          int dayIndex = fechaCompra.weekday - 1;
          tempWeekly[dayIndex] += (compra['total_pagado'] as num).toDouble();
        }
      }

      setState(() {
        _totalIngresos = ingresos;
        _totalVentas = compras.length;
        _ofertasActivas = countOfertas.count;
        _ventasRecientes = compras.take(5).toList();
        _weeklySales = tempWeekly;
      });
    } catch (e) {
      debugPrint('Error cargando métricas: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxSale = _weeklySales.reduce((a, b) => a > b ? a : b);
    if (maxSale == 0) maxSale = 100;

    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Tus Métricas', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.refresh, color: AppColors.textDark), onPressed: _loadMetrics)
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Resumen de Impacto', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Así está rindiendo tu negocio en OfVe hoy.', style: TextStyle(fontSize: 14, color: AppColors.textLight)),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [AppColors.darkCardColor, Color(0xFF3D3785)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ganancias Totales', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                                  Icon(Icons.account_balance_wallet, color: Colors.white54, size: 20),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text('\$${_totalIngresos.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: AppColors.success.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.trending_up, color: Colors.greenAccent, size: 14),
                                    SizedBox(width: 4),
                                    Text('+12% este mes', style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))]),
                              child: Column(
                                children: [
                                  const Icon(Icons.shopping_bag, color: AppColors.info, size: 24),
                                  const SizedBox(height: 8),
                                  Text('$_totalVentas', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  const Text('Ventas', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))]),
                              child: Column(
                                children: [
                                  const Icon(Icons.local_offer, color: AppColors.warning, size: 24),
                                  const SizedBox(height: 8),
                                  Text('$_ofertasActivas', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  const Text('Ofertas', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5))]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ventas de la Semana', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(7, (index) {
                            double heightFactor = _weeklySales[index] / maxSale;
                            if (heightFactor < 0.05) heightFactor = 0.05;
                            return Column(
                              children: [
                                Text(_weeklySales[index] > 0 ? '\$${_weeklySales[index].toStringAsFixed(0)}' : '', style: const TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Container(width: 24, height: 80 * heightFactor, decoration: BoxDecoration(color: _weeklySales[index] > 0 ? AppColors.primaryPurple : Colors.grey.shade200, borderRadius: BorderRadius.circular(8))),
                                const SizedBox(height: 8),
                                Text(_weekDays[index], style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text('Últimas Ventas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  if (_ventasRecientes.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                      child: const Text('Aún no tienes ventas completadas.\n¡Comparte tus ofertas!', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _ventasRecientes.length,
                      itemBuilder: (context, index) {
                        final venta = _ventasRecientes[index];
                        final fecha = DateTime.parse(venta['fecha_compra']).toLocal();
                        final fechaFormateada = DateFormat('dd/MM HH:mm').format(fecha);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2))]),
                          child: ListTile(
                            leading: CircleAvatar(backgroundColor: AppColors.success.withOpacity(0.1), child: const Icon(Icons.check, color: AppColors.success)),
                            title: Text('Orden #${venta['id'].toString().substring(0, 6).toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            subtitle: Text('$fechaFormateada • Pago Móvil/Cash', style: const TextStyle(fontSize: 11)),
                            trailing: Text('\$${(venta['total_pagado'] as num).toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.success)),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: const Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
                    child: Row(
                      children: [
                        const Icon(Icons.rocket_launch, color: Colors.deepOrange, size: 40),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('¿Quieres multiplicar estas ventas?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.deepOrange)),
                              const SizedBox(height: 4),
                              const Text('Con el Plan Élite aparecerás primero en las búsquedas cercanas. ¡Haz que te encuentren primero!', style: TextStyle(fontSize: 12, color: AppColors.textDark)),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantPlansScreen())),
                                child: const Text('Ver Planes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}```

### 📄 lib/screens/merchant_metrics_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'merchant_plans_screen.dart';

class MerchantMetricsScreen extends StatefulWidget {
  final Color primaryPurple;
  final Color bgTop;
  final Color darkCardColor;

  const MerchantMetricsScreen({
    super.key,
    required this.primaryPurple,
    required this.bgTop,
    required this.darkCardColor,
  });

  @override
  State<MerchantMetricsScreen> createState() => _MerchantMetricsScreenState();
}

class _MerchantMetricsScreenState extends State<MerchantMetricsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;

  double _totalIngresos = 0.0;
  int _totalVentas = 0;
  int _ofertasActivas = 0;
  List<dynamic> _ventasRecientes = [];
  
  List<double> _weeklySales = List.filled(7, 0.0);
  final List<String> _weekDays = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

  @override
  void initState() {
    super.initState();
    _loadMetrics();
  }

  Future<void> _loadMetrics() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      
      final comercio = await _supabase
          .from('comercios')
          .select('id')
          .eq('usuario_id', userId)
          .single();
      
      final comercioId = comercio['id'];

      // CORRECCIÓN: Consultas secuenciales para evitar el error de Future.wait
      final compras = await _supabase
          .from('compras')
          .select('*')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Completado')
          .order('fecha_compra', ascending: false);

      final countOfertas = await _supabase
          .from('ofertas')
          .select('id')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Activa')
          .count();

      double ingresos = 0;
      List<double> tempWeekly = List.filled(7, 0.0);
      final now = DateTime.now();
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

      for (var compra in compras) {
        ingresos += (compra['total_pagado'] as num).toDouble();
        
        final fechaCompra = DateTime.parse(compra['fecha_compra']).toLocal();
        if (fechaCompra.isAfter(startOfWeek)) {
          int dayIndex = fechaCompra.weekday - 1;
          tempWeekly[dayIndex] += (compra['total_pagado'] as num).toDouble();
        }
      }

      setState(() {
        _totalIngresos = ingresos;
        _totalVentas = compras.length;
        _ofertasActivas = countOfertas.count;
        _ventasRecientes = compras.take(5).toList();
        _weeklySales = tempWeekly;
      });

    } catch (e) {
      debugPrint('Error cargando métricas: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar métricas: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxSale = _weeklySales.reduce((a, b) => a > b ? a : b);
    if (maxSale == 0) maxSale = 100;

    return Scaffold(
      backgroundColor: widget.bgTop,
      appBar: AppBar(
        title: const Text('Tus Métricas', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: _loadMetrics,
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: widget.primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Resumen de Impacto', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Así está rindiendo tu negocio en OfVe hoy.', style: TextStyle(fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [widget.darkCardColor, const Color(0xFF3D3785)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [BoxShadow(color: widget.darkCardColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ganancias Totales', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                                  Icon(Icons.account_balance_wallet, color: Colors.white54, size: 20),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '\$${_totalIngresos.toStringAsFixed(2)}',
                                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.trending_up, color: Colors.greenAccent, size: 14),
                                    SizedBox(width: 4),
                                    Text('+12% este mes', style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
                              ),
                              child: Column(
                                children: [
                                  const Icon(Icons.shopping_bag, color: Colors.blue, size: 24),
                                  const SizedBox(height: 8),
                                  Text('$_totalVentas', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  const Text('Ventas', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
                              ),
                              child: Column(
                                children: [
                                  const Icon(Icons.local_offer, color: Colors.orange, size: 24),
                                  const SizedBox(height: 8),
                                  Text('$_ofertasActivas', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  const Text('Ofertas', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 30),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ventas de la Semana', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(7, (index) {
                            double heightFactor = _weeklySales[index] / maxSale;
                            if (heightFactor < 0.05) heightFactor = 0.05;
                            
                            return Column(
                              children: [
                                Text(
                                  _weeklySales[index] > 0 ? '\$${_weeklySales[index].toStringAsFixed(0)}' : '',
                                  style: const TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  width: 24,
                                  height: 80 * heightFactor,
                                  decoration: BoxDecoration(
                                    color: _weeklySales[index] > 0 ? widget.primaryPurple : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(_weekDays[index], style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text('Últimas Ventas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  if (_ventasRecientes.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      child: const Text('Aún no tienes ventas completadas.\n¡Comparte tus ofertas!', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _ventasRecientes.length,
                      itemBuilder: (context, index) {
                        final venta = _ventasRecientes[index];
                        final fecha = DateTime.parse(venta['fecha_compra']).toLocal();
                        final fechaFormateada = DateFormat('dd/MM HH:mm').format(fecha);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white, 
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2))],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.green.withOpacity(0.1),
                              child: const Icon(Icons.check, color: Colors.green),
                            ),
                            title: Text('Orden #${venta['id'].toString().substring(0, 6).toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            subtitle: Text('$fechaFormateada • Pago Móvil/Cash', style: const TextStyle(fontSize: 11)),
                            trailing: Text(
                              '\$${(venta['total_pagado'] as num).toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                            ),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 30),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E0), 
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.orange.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.rocket_launch, color: Colors.deepOrange, size: 40),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '¿Quieres multiplicar estas ventas?',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.deepOrange),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Con el Plan Élite aparecerás primero en las búsquedas cercanas. ¡Haz que te encuentren primero!',
                                style: TextStyle(fontSize: 12, color: Colors.black87),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantPlansScreen()));
                                },
                                child: const Text('Ver Planes', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}```

### 📄 lib/screens/merchant_offers_tab.dart
```dart
import 'package:flutter/material.dart';
import 'create_offer_screen.dart';

class MerchantOffersTab extends StatelessWidget {
  const MerchantOffersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Comercio'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tarjeta de resumen
            Card(
              color: const Color(0xFF6B4EFF).withOpacity(0.1),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Tus Ventas Hoy',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$ 0.00',
                      style: TextStyle(
                        fontSize: 32, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFF6B4EFF)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Botón principal para crear oferta
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B4EFF),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.add_circle_outline, color: Colors.white),
              label: const Text(
                'Crear Nueva Oferta',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () {
                // Navegamos a la pantalla que valida los documentos
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateOfferScreen()),
                );
              },
            ),
            
            const SizedBox(height: 24),
            const Text(
              'Tus Ofertas Activas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Expanded(
              child: Center(
                child: Text('No tienes ofertas activas aún.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_plans_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/bcv_service.dart';
import 'payment_request_modal.dart'; // <-- NUEVA IMPORTACIÓN

class MerchantPlansScreen extends StatefulWidget {
  const MerchantPlansScreen({super.key});

  @override
  State<MerchantPlansScreen> createState() => _MerchantPlansScreenState();
}

class _MerchantPlansScreenState extends State<MerchantPlansScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  double _bcvRate = 0.0;
  
  List<dynamic> _planes = [];
  String? _currentPlanId;
  String _currentPlanName = '';

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // 1. Obtener la tasa del dólar (con manejo de error por si la API falla)
      try {
        _bcvRate = await BcvService.getDollarRate();
      } catch (e) {
        debugPrint('Error obteniendo tasa BCV: $e');
        _bcvRate = 0.0; // Fallback
      }

      final userId = _supabase.auth.currentUser!.id;

      // 2. Obtener el plan actual del comercio
      var comercioData = await _supabase
          .from('comercios')
          .select('plan_id')
          .eq('usuario_id', userId)
          .maybeSingle();
      
      _currentPlanId = comercioData?['plan_id'];

      // 3. Obtener todos los planes
      final planesRes = await _supabase
          .from('planes_suscripcion')
          .select('*, plan_caracteristicas(*)')
          .order('precio', ascending: true);

      // 4. AUTO-ASIGNACIÓN DEL PLAN BÁSICO
      if (_currentPlanId == null && planesRes.isNotEmpty) {
        final basico = planesRes.firstWhere(
          (p) => p['nombre'].toString().toLowerCase() == 'básico' || p['nombre'].toString().toLowerCase() == 'basico',
          orElse: () => planesRes.first,
        );
        
        if (basico != null) {
          await _supabase.from('comercios').update({'plan_id': basico['id']}).eq('usuario_id', userId);
          _currentPlanId = basico['id'];
        }
      }

      if (_currentPlanId != null) {
        final matches = planesRes.where((p) => p['id'] == _currentPlanId);
        _currentPlanName = matches.isNotEmpty ? (matches.first['nombre'] ?? 'Básico') : 'Básico';
      } else {
        _currentPlanName = 'Básico';
      }

      setState(() => _planes = planesRes);
    } catch (e) {
      debugPrint('Error cargando planes: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los planes: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Generador de mensajes persuasivos según el plan
  String _getMarketingHook(String planName) {
    final name = planName.toLowerCase();
    if (name.contains('pro')) {
      return '🚀 Deja que la IA escriba tus ofertas. ¡Ahorra tiempo y vende más!';
    } else if (name.contains('élite') || name.contains('elite')) {
      return '🔥 Aparece primero en el mapa y usa Pools para vender al mayor. ¡Domina tu zona!';
    } else if (name.contains('corp')) {
      return '💎 Control total de tu franquicia con métricas geoespaciales.';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Planes y Suscripciones', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // --- SECCIÓN: PLAN ACTUAL ---
                  const Text('Tu Plan Actual', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  if (_currentPlanId != null)
                    ..._planes.where((p) => p['id'] == _currentPlanId).map((plan) => _buildCurrentPlanCard(plan))
                  else
                    const Text('No tienes un plan asignado.', style: TextStyle(color: Colors.grey)),

                  const SizedBox(height: 30),

                  // --- SECCIÓN: OTROS PLANES DISPONIBLES ---
                  const Text('Mejora tu Plan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ..._planes.where((p) => p['id'] != _currentPlanId).map((plan) => _buildOtherPlanCard(plan)),
                ],
              ),
            ),
    );
  }

  Widget _buildCurrentPlanCard(dynamic plan) {
    final features = plan['plan_caracteristicas'] as List<dynamic>;
    final precioUsd = (plan['precio'] as num).toDouble();
    final precioBs = precioUsd * _bcvRate;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryPurple, width: 2),
        boxShadow: [BoxShadow(color: primaryPurple.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(plan['nombre'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryPurple)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text('ACTIVO', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(plan['descripcion'] ?? '', style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(precioUsd == 0 ? 'GRATIS' : '\$${precioUsd.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              if (precioUsd > 0) ...[
                const SizedBox(width: 8),
                Text('Bs. ${precioBs.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ]
            ],
          ),
          const SizedBox(height: 16),
          const Text('Incluye:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...features.map((f) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                const Icon(Icons.check, color: Colors.green, size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(f['nombre_caracteristica'] ?? '')),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildOtherPlanCard(dynamic plan) {
    final features = plan['plan_caracteristicas'] as List<dynamic>;
    final precioUsd = (plan['precio'] as num).toDouble();
    final precioBs = precioUsd * _bcvRate;
    final hookText = _getMarketingHook(plan['nombre']);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Persuasivo (Si existe)
          if (hookText.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: primaryPurple.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Text(
                hookText,
                style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plan['nombre'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(plan['descripcion'] ?? '', style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text('\$${precioUsd.toStringAsFixed(2)}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryPurple)),
                    const SizedBox(width: 8),
                    Text('Bs. ${precioBs.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                ...features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check, color: Colors.grey, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(f['nombre_caracteristica'] ?? '')),
                    ],
                  ),
                )),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      // ABRE EL MODAL DE PAGO
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (ctx) => PaymentRequestModal(
                          planName: plan['nombre'], 
                          amount: precioUsd
                        ),
                      );
                    },
                    child: Text('Solicitar ${plan['nombre']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/merchant_pools_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_pools_controller.dart';

class MerchantPoolsScreen extends StatefulWidget {
  const MerchantPoolsScreen({super.key});

  @override
  State<MerchantPoolsScreen> createState() => _MerchantPoolsScreenState();
}

class _MerchantPoolsScreenState extends State<MerchantPoolsScreen> {
  final _poolsController = MerchantPoolsController();
  final _productNameCtrl = TextEditingController();
  final _targetUsersCtrl = TextEditingController();
  final _wholesalePriceCtrl = TextEditingController();

  @override
  void dispose() {
    _productNameCtrl.dispose();
    _targetUsersCtrl.dispose();
    _wholesalePriceCtrl.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 20, left: 20, right: 20),
        decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Crear Nuevo Pool', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(controller: _productNameCtrl, decoration: const InputDecoration(labelText: 'Nombre del Producto (Ej: Caja de 12 Refrescos)', prefixIcon: Icon(Icons.shopping_bag))),
              const SizedBox(height: 12),
              TextField(controller: _targetUsersCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Meta de Personas', prefixIcon: Icon(Icons.group))),
              const SizedBox(height: 12),
              TextField(controller: _wholesalePriceCtrl, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Precio al Mayor Sugerido (\$)', prefixIcon: Icon(Icons.attach_money))),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final success = await _poolsController.createPool(
                      productName: _productNameCtrl.text,
                      targetUsers: int.tryParse(_targetUsersCtrl.text) ?? 50,
                      wholesalePrice: double.tryParse(_wholesalePriceCtrl.text) ?? 0.0,
                    );
                    if (success && mounted) {
                      Navigator.pop(ctx);
                      _productNameCtrl.clear();
                      _targetUsersCtrl.clear();
                      _wholesalePriceCtrl.clear();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Pool creado con éxito!'), backgroundColor: AppColors.success));
                    }
                  },
                  child: const Text('Lanzar Pool'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _poolsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Pools Comunitarios'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add_circle, color: AppColors.primaryPurple, size: 30),
                tooltip: 'Crear Nuevo Pool',
                onPressed: _mostrarFormulario,
              )
            ],
          ),
          body: _poolsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _poolsController.myPools.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.groups, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No tienes pools activos.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Crea uno con el botón +!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: _poolsController.myPools.length,
                      itemBuilder: (context, index) {
                        final pool = _poolsController.myPools[index];
                        final current = pool['usuarios_comprometidos'] ?? 0;
                        final meta = pool['meta_usuarios'] ?? 1;
                        final progress = current / meta;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(pool['producto_nombre'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                                    Text(pool['estado'], style: const TextStyle(color: AppColors.primaryPurple, fontSize: 12, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Precio Mayorista: \$${pool['precio_mayorista_sugerido']}', style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 16),
                                LinearProgressIndicator(value: progress > 1.0 ? 1.0 : progress, backgroundColor: Colors.grey[200], color: AppColors.primaryPurple, minHeight: 10, borderRadius: BorderRadius.circular(10)),
                                const SizedBox(height: 8),
                                Text('$current de $meta personas comprometidas', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}```

### 📄 lib/screens/merchant_profile_screen.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_profile_controller.dart';
import '../controllers/categories_controller.dart'; 
import '../controllers/zones_controller.dart'; // <-- NUEVA IMPORTACIÓN
import 'map_picker_screen.dart';

class MerchantProfileScreen extends StatefulWidget {
  final VoidCallback onDocsUploaded;

  const MerchantProfileScreen({super.key, required this.onDocsUploaded});

  @override
  State<MerchantProfileScreen> createState() => _MerchantProfileScreenState();
}

class _MerchantProfileScreenState extends State<MerchantProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _profileController = MerchantProfileController();
  final _categoriesController = CategoriesController();
  final _zonesController = ZonesController(); // <-- NUEVO CONTROLADOR

  // Controladores de Texto
  final _nameCtrl = TextEditingController();
  final _rifCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _branchCtrl = TextEditingController();
  final _repNameCtrl = TextEditingController();
  final _repCedulaCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _igCtrl = TextEditingController();
  final _tiktokCtrl = TextEditingController();
  final _fbCtrl = TextEditingController();
  final _xCtrl = TextEditingController();
  final _waCtrl = TextEditingController();

  String? _tipoComercio;
  String? _categoria;
  bool _aceptaDelivery = false;

  @override
  void dispose() {
    _nameCtrl.dispose(); _rifCtrl.dispose(); _addressCtrl.dispose(); _branchCtrl.dispose();
    _repNameCtrl.dispose(); _repCedulaCtrl.dispose(); _phoneCtrl.dispose(); _emailCtrl.dispose();
    _igCtrl.dispose(); _tiktokCtrl.dispose(); _fbCtrl.dispose(); _xCtrl.dispose(); _waCtrl.dispose();
    _categoriesController.dispose();
    _zonesController.dispose();
    super.dispose();
  }

  Future<void> _abrirMapa() async {
    final result = await Navigator.push<Map<String, double>>(
      context,
      MaterialPageRoute(builder: (_) => MapPickerScreen(
        initialLat: _profileController.latitud,
        initialLng: _profileController.longitud,
      )),
    );

    if (result != null) {
      _profileController.setLocation(result['lat']!, result['lng']!);
    }
  }

  Future<void> _pickImage(String type) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
    if (result != null && result.files.single.bytes != null) {
      _profileController.setImage(type, result.files.single.bytes!, result.files.single.name);
    }
  }

  Future<void> _pickPdf(String type) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf'], withData: true);
    if (result != null && result.files.single.bytes != null) {
      _profileController.setPdf(type, result.files.single.bytes!, result.files.single.name);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    // Validar que se haya seleccionado una zona
    final parroquiaId = _zonesController.getSelectedParroquiaId();
    if (parroquiaId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes seleccionar tu Estado, Municipio y Parroquia.'), backgroundColor: Colors.orange),
      );
      return;
    }

    if (_tipoComercio == null || _categoria == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona tipo y categoría.'), backgroundColor: Colors.orange),
      );
      return;
    }
    if (_profileController.latitud == null || _profileController.longitud == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes ubicar tu comercio en el mapa.'), backgroundColor: Colors.red),
      );
      return;
    }
    if (_profileController.logoBytes == null || _profileController.fachadaBytes == null || _profileController.rifBytes == null || _profileController.legalBytes == null || _profileController.cedulasBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Faltan imágenes o documentos.'), backgroundColor: Colors.red),
      );
      return;
    }

    final success = await _profileController.submitProfile(
      name: _nameCtrl.text, rif: _rifCtrl.text, address: _addressCtrl.text,
      branch: _branchCtrl.text, repName: _repNameCtrl.text, repCedula: _repCedulaCtrl.text,
      phone: _phoneCtrl.text, email: _emailCtrl.text, ig: _igCtrl.text, tiktok: _tiktokCtrl.text,
      fb: _fbCtrl.text, x: _xCtrl.text, wa: _waCtrl.text, tipoComercio: _tipoComercio!,
      categoria: _categoria!, aceptaDelivery: _aceptaDelivery,
      parroquiaId: parroquiaId,
    );

    if (success && mounted) {
      _showSuccessDialog();
    } else if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_profileController.errorMessage ?? 'Error desconocido'), backgroundColor: Colors.red),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16), 
              decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), shape: BoxShape.circle), 
              child: const Icon(Icons.verified, color: Colors.green, size: 60)
            ),
            const SizedBox(height: 24),
            const Text('¡Información Recibida!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text(
              'Tu información ha llegado de forma segura. Nuestro equipo (y nuestra IA) está revisando tus documentos. Este proceso tomará entre 24 y 48 horas hábiles.\n\n¡Prepárate para vender más!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity, height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  widget.onDocsUploaded();
                  Navigator.pop(context);
                },
                child: const Text('Ir a mi Dashboard'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_profileController, _categoriesController, _zonesController]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Completar Perfil')),
          body: _profileController.isLoading || _categoriesController.isLoading || _zonesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSectionTitle('1. Información del Negocio'),
                        _buildTextField(_nameCtrl, 'Nombre Comercial', Icons.store, required: true),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildDropdown('Tipo', ['empresa', 'emprendimiento', 'firma_personal'], _tipoComercio, (v) => setState(() => _tipoComercio = v))),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _categoria,
                                decoration: const InputDecoration(labelText: 'Categoría *'),
                                items: _categoriesController.categories.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: (v) => setState(() => _categoria = v),
                                validator: (v) => v == null ? 'Requerido' : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(_rifCtrl, 'RIF', Icons.badge, required: true)),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(_branchCtrl, 'Rama / Sector', Icons.category, required: true)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(_repNameCtrl, 'Representante', Icons.person, required: true)),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(_repCedulaCtrl, 'Cédula Rep.', Icons.badge, required: true)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildSectionTitle('2. Contacto y Ubicación'),
                        _buildTextField(_addressCtrl, 'Dirección Física', Icons.location_on, required: true),
                        const SizedBox(height: 12),
                        
                        // SELECTORES DE ZONA GEOGRÁFICA
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _zonesController.selectedEstado,
                                decoration: const InputDecoration(labelText: 'Estado *'),
                                items: _zonesController.estados.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: (v) => _zonesController.selectEstado(v),
                                validator: (v) => v == null ? 'Requerido' : null,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _zonesController.selectedMunicipio,
                                decoration: const InputDecoration(labelText: 'Municipio *'),
                                items: _zonesController.municipios.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: _zonesController.selectedEstado == null ? null : (v) => _zonesController.selectMunicipio(v),
                                validator: (v) => v == null ? 'Requerido' : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: _zonesController.selectedParroquia,
                          decoration: const InputDecoration(labelText: 'Parroquia *'),
                          items: _zonesController.parroquias.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: _zonesController.selectedMunicipio == null ? null : (v) => _zonesController.selectParroquia(v),
                          validator: (v) => v == null ? 'Requerido' : null,
                        ),
                        const SizedBox(height: 12),

                        InkWell(
                          onTap: _abrirMapa,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _profileController.latitud != null ? AppColors.success.withOpacity(0.1) : AppColors.white,
                              border: Border.all(color: _profileController.latitud != null ? AppColors.success : Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(_profileController.latitud != null ? Icons.check_circle : Icons.map, color: _profileController.latitud != null ? AppColors.success : AppColors.primaryPurple, size: 28),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(_profileController.latitud != null ? 'Ubicación GPS Asignada' : 'Asignar Ubicación GPS en el Mapa', style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text(
                                        _profileController.latitud != null ? 'Lat: ${_profileController.latitud!.toStringAsFixed(4)}, Lng: ${_profileController.longitud!.toStringAsFixed(4)}' : 'Requerido para aparecer en búsquedas cercanas', 
                                        style: TextStyle(fontSize: 12, color: _profileController.latitud != null ? AppColors.success : Colors.grey)
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(_phoneCtrl, 'Teléfono', Icons.phone, isNumber: true, required: true)),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(_emailCtrl, 'Email Público', Icons.email, required: true)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SwitchListTile(
                          title: const Text('¿Ofreces Delivery?', style: TextStyle(fontWeight: FontWeight.w600)),
                          value: _aceptaDelivery, activeColor: AppColors.primaryPurple,
                          onChanged: (v) => setState(() => _aceptaDelivery = v),
                          contentPadding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: 24),
                        _buildSectionTitle('3. Redes Sociales'),
                        _buildTextField(_igCtrl, 'Instagram (Usuario o URL)', Icons.camera_alt),
                        const SizedBox(height: 12),
                        _buildTextField(_tiktokCtrl, 'TikTok (Usuario o URL)', Icons.music_note),
                        const SizedBox(height: 12),
                        _buildTextField(_fbCtrl, 'Facebook (Usuario o URL)', Icons.facebook),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(_waCtrl, 'WhatsApp', Icons.chat)),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(_xCtrl, 'X (Twitter)', Icons.alternate_email)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildSectionTitle('4. Imágenes del Comercio'),
                        Row(
                          children: [
                            Expanded(child: _buildImagePicker('Logo', _profileController.logoName, () => _pickImage('logo'))),
                            const SizedBox(width: 12),
                            Expanded(child: _buildImagePicker('Foto Fachada', _profileController.fachadaName, () => _pickImage('fachada'))),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildSectionTitle('5. Documentos Legales (PDF)'),
                        _buildFilePicker('1. Certificado de RIF', _profileController.rifName, () => _pickPdf('rif')),
                        const SizedBox(height: 12),
                        _buildFilePicker('2. Documento Legal (Acta/RNE)', _profileController.legalName, () => _pickPdf('legal')),
                        const SizedBox(height: 12),
                        _buildFilePicker('3. Cédula de los firmantes', _profileController.cedulasName, () => _pickPdf('cedulas')),
                        const SizedBox(height: 40),
                        SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            onPressed: _profileController.isLoading ? null : _submit,
                            child: _profileController.isLoading
                                ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                                : const Text('Guardar y Enviar a Revisión'),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12), 
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryPurple))
    );
  }

  Widget _buildTextField(TextEditingController ctrl, String label, IconData icon, {bool isNumber = false, bool required = false}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(labelText: required ? '$label *' : label, prefixIcon: Icon(icon)),
      validator: required ? (v) => v!.isEmpty ? 'Requerido' : null : null,
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? val, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: val,
      decoration: InputDecoration(labelText: '$label *'),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
      onChanged: onChanged,
      validator: (v) => v == null ? 'Requerido' : null,
    );
  }

  Widget _buildImagePicker(String label, String? fileName, VoidCallback onTap) {
    final hasFile = fileName != null;
    return InkWell(
      onTap: _profileController.isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: hasFile ? AppColors.success.withOpacity(0.1) : AppColors.white, 
          border: Border.all(color: hasFile ? AppColors.success : Colors.grey.shade300), 
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(hasFile ? Icons.check_circle : Icons.add_photo_alternate, color: hasFile ? AppColors.success : Colors.grey, size: 30),
            const SizedBox(height: 8),
            Text(hasFile ? 'Subido' : label, style: TextStyle(fontWeight: FontWeight.bold, color: hasFile ? AppColors.success : AppColors.textDark)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePicker(String label, String? fileName, VoidCallback onTap) {
    final hasFile = fileName != null;
    return InkWell(
      onTap: _profileController.isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white, 
          border: Border.all(color: hasFile ? AppColors.success : Colors.grey.shade300), 
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Icon(hasFile ? Icons.check_circle : Icons.upload_file, color: hasFile ? AppColors.success : Colors.grey, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(hasFile ? fileName! : 'Seleccionar archivo', style: TextStyle(fontSize: 12, color: hasFile ? AppColors.success : Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_profile_screen2.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;
import 'map_picker_screen.dart';

class MerchantProfileScreen extends StatefulWidget {
  final VoidCallback onDocsUploaded;

  const MerchantProfileScreen({super.key, required this.onDocsUploaded});

  @override
  State<MerchantProfileScreen> createState() => _MerchantProfileScreenState();
}

class _MerchantProfileScreenState extends State<MerchantProfileScreen> {
  final _supabase = Supabase.instance.client;
  final _formKey = GlobalKey<FormState>();

  // --- CONTROLADORES DE TEXTO ---
  final _nameCtrl = TextEditingController();
  final _rifCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _branchCtrl = TextEditingController();
  final _repNameCtrl = TextEditingController();
  final _repCedulaCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _igCtrl = TextEditingController();
  final _tiktokCtrl = TextEditingController();
  final _fbCtrl = TextEditingController();
  final _xCtrl = TextEditingController();
  final _waCtrl = TextEditingController();

  // --- VARIABLES DE SELECCIÓN ---
  String? _tipoComercio;
  String? _categoria;
  bool _aceptaDelivery = false;
  final List<String> _categoriasList = [
    'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza', 
    'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros'
  ];

  // --- GEOLOCALIZACIÓN ---
  double? _latitud;
  double? _longitud;

  // --- ARCHIVOS E IMÁGENES ---
  Uint8List? _logoBytes; String? _logoName;
  Uint8List? _fachadaBytes; String? _fachadaName;
  Uint8List? _rifBytes; String? _rifName;
  Uint8List? _legalBytes; String? _legalName;
  Uint8List? _cedulasBytes; String? _cedulasName;

  bool _isLoading = false;
  
  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void dispose() {
    _nameCtrl.dispose(); _rifCtrl.dispose(); _addressCtrl.dispose(); _branchCtrl.dispose();
    _repNameCtrl.dispose(); _repCedulaCtrl.dispose(); _phoneCtrl.dispose(); _emailCtrl.dispose();
    _igCtrl.dispose(); _tiktokCtrl.dispose(); _fbCtrl.dispose(); _xCtrl.dispose(); _waCtrl.dispose();
    super.dispose();
  }

  Future<void> _abrirMapa() async {
    final result = await Navigator.push<Map<String, double>>(
      context,
      MaterialPageRoute(
        builder: (_) => MapPickerScreen(
          initialLat: _latitud,
          initialLng: _longitud,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _latitud = result['lat'];
        _longitud = result['lng'];
      });
    }
  }

  Future<void> _pickImage(String type) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        if (type == 'logo') { _logoBytes = result.files.single.bytes; _logoName = result.files.single.name; }
        if (type == 'fachada') { _fachadaBytes = result.files.single.bytes; _fachadaName = result.files.single.name; }
      });
    }
  }

  Future<void> _pickPdf(String type) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf'], withData: true);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        if (type == 'rif') { _rifBytes = result.files.single.bytes; _rifName = result.files.single.name; }
        if (type == 'legal') { _legalBytes = result.files.single.bytes; _legalName = result.files.single.name; }
        if (type == 'cedulas') { _cedulasBytes = result.files.single.bytes; _cedulasName = result.files.single.name; }
      });
    }
  }

  Future<String?> _uploadToBucket(Uint8List bytes, String fileName, String bucket, String prefix) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final ext = p.extension(fileName);
      final finalName = '${prefix}_$userId$ext';
      final path = '$userId/$finalName';

      await _supabase.storage.from(bucket).uploadBinary(path, bytes, fileOptions: const FileOptions(upsert: true));

      if (bucket == 'comercios_assets') return _supabase.storage.from(bucket).getPublicUrl(path);
      return path;
    } catch (e) {
      debugPrint('❌ Error subiendo a $bucket: $e');
      return null;
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_tipoComercio == null || _categoria == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selecciona tipo y categoría.'), backgroundColor: Colors.orange));
      return;
    }
    if (_latitud == null || _longitud == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Debes ubicar tu comercio en el mapa.'), backgroundColor: Colors.red));
      return;
    }
    if (_logoBytes == null || _fachadaBytes == null || _rifBytes == null || _legalBytes == null || _cedulasBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Faltan imágenes o documentos.'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isLoading = true);
    final userId = _supabase.auth.currentUser!.id;

    try {
      final logoUrl = await _uploadToBucket(_logoBytes!, _logoName!, 'comercios_assets', 'logo');
      final fachadaUrl = await _uploadToBucket(_fachadaBytes!, _fachadaName!, 'comercios_assets', 'fachada');
      final docRifUrl = await _uploadToBucket(_rifBytes!, _rifName!, 'documentos_comercios', 'rif');
      final docLegalUrl = await _uploadToBucket(_legalBytes!, _legalName!, 'documentos_comercios', 'legal');
      final docCedulasUrl = await _uploadToBucket(_cedulasBytes!, _cedulasName!, 'documentos_comercios', 'cedulas');

      if (logoUrl == null || fachadaUrl == null || docRifUrl == null || docLegalUrl == null || docCedulasUrl == null) {
        throw Exception('No se pudieron subir todos los archivos.');
      }

      final redes = {
        'instagram': _igCtrl.text.trim(), 'tiktok': _tiktokCtrl.text.trim(),
        'facebook': _fbCtrl.text.trim(), 'x': _xCtrl.text.trim(), 'whatsapp': _waCtrl.text.trim(),
      };

      final pointWkt = 'POINT($_longitud $_latitud)'; 

      await _supabase.from('comercios').update({
        'nombre_comercial': _nameCtrl.text.trim(),
        'tipo_comercio': _tipoComercio,
        'categoria': _categoria,
        'rif': _rifCtrl.text.trim(),
        'direccion_texto': _addressCtrl.text.trim(),
        'rama': _branchCtrl.text.trim(),
        'representante': _repNameCtrl.text.trim(),
        'cedula': _repCedulaCtrl.text.trim(),
        'telefono_empresa': _phoneCtrl.text.trim(),
        'email_empresa': _emailCtrl.text.trim(),
        'acepta_delivery': _aceptaDelivery,
        'redes_sociales': redes,
        'logo_url': logoUrl,
        'foto_fachada_url': fachadaUrl,
        'doc_rif_url': docRifUrl,
        'doc_constitutivo_url': docLegalUrl,
        'doc_cedulas_url': docCedulasUrl,
        'estatus_verificacion': 'En Revision', 
        'latitud': _latitud,
        'longitud': _longitud,
        'ubicacion_fisica': pointWkt,
      }).eq('usuario_id', userId);

      // --- LLAMADA A LA EDGE FUNCTION DE VALIDACIÓN CON IA ---
      try {
        // Obtenemos el comercio_id para enviarlo a la función
        final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
        
        await _supabase.functions.invoke(
          'validate-merchant-docs',
          body: {
            'merchant_id': comercioData['id'],
            'doc_rif_path': docRifUrl,
            'doc_legal_path': docLegalUrl,
            'doc_cedulas_path': docCedulasUrl,
            'form_data': {
              'rif': _rifCtrl.text.trim(),
              'nombre': _nameCtrl.text.trim(),
            }
          },
        );
        debugPrint('✅ Validación con IA iniciada.');
      } catch (e) {
        debugPrint('⚠️ Error al invocar la validación con IA: $e');
        // No lanzamos excepción para no bloquear al usuario si la IA falla
      }

      if (mounted) _showSuccessDialog();
      
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), shape: BoxShape.circle), child: const Icon(Icons.verified, color: Colors.green, size: 60)),
            const SizedBox(height: 24),
            const Text('¡Información Recibida!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text(
              'Tu información ha llegado de forma segura. Nuestro equipo (y nuestra IA) está revisando tus documentos. Este proceso tomará entre 24 y 48 horas hábiles.\n\n¡Prepárate para vender más!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity, height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Navigator.pop(ctx);
                  widget.onDocsUploaded();
                  Navigator.pop(context);
                },
                child: const Text('Ir a mi Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Completar Perfil', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle('1. Información del Negocio'),
              _buildTextField(_nameCtrl, 'Nombre Comercial', Icons.store, required: true),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildDropdown('Tipo', ['empresa', 'emprendimiento', 'firma_personal'], _tipoComercio, (v) => setState(() => _tipoComercio = v))),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDropdown('Categoría', _categoriasList, _categoria, (v) => setState(() => _categoria = v))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildTextField(_rifCtrl, 'RIF', Icons.badge, required: true)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildTextField(_branchCtrl, 'Rama / Sector', Icons.category, required: true)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildTextField(_repNameCtrl, 'Representante', Icons.person, required: true)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildTextField(_repCedulaCtrl, 'Cédula Rep.', Icons.badge, required: true)),
                ],
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('2. Contacto y Ubicación'),
              _buildTextField(_addressCtrl, 'Dirección Física', Icons.location_on, required: true),
              const SizedBox(height: 12),
              
              InkWell(
                onTap: _abrirMapa,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _latitud != null ? Colors.green.withOpacity(0.1) : Colors.white,
                    border: Border.all(color: _latitud != null ? Colors.green : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(_latitud != null ? Icons.check_circle : Icons.map, color: _latitud != null ? Colors.green : primaryPurple, size: 28),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_latitud != null ? 'Ubicación Asignada' : 'Asignar Ubicación en el Mapa', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(_latitud != null ? 'Lat: ${_latitud!.toStringAsFixed(4)}, Lng: ${_longitud!.toStringAsFixed(4)}' : 'Requerido para aparecer en búsquedas cercanas', style: TextStyle(fontSize: 12, color: _latitud != null ? Colors.green : Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildTextField(_phoneCtrl, 'Teléfono', Icons.phone, isNumber: true, required: true)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildTextField(_emailCtrl, 'Email Público', Icons.email, required: true)),
                ],
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('¿Ofreces Delivery?', style: TextStyle(fontWeight: FontWeight.w600)),
                value: _aceptaDelivery, activeColor: primaryPurple,
                onChanged: (v) => setState(() => _aceptaDelivery = v),
                contentPadding: EdgeInsets.zero,
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('3. Redes Sociales'),
              _buildTextField(_igCtrl, 'Instagram (Usuario o URL)', Icons.camera_alt),
              const SizedBox(height: 12),
              _buildTextField(_tiktokCtrl, 'TikTok (Usuario o URL)', Icons.music_note),
              const SizedBox(height: 12),
              _buildTextField(_fbCtrl, 'Facebook (Usuario o URL)', Icons.facebook),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildTextField(_waCtrl, 'WhatsApp', Icons.chat)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildTextField(_xCtrl, 'X (Twitter)', Icons.alternate_email)),
                ],
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('4. Imágenes del Comercio'),
              Row(
                children: [
                  Expanded(child: _buildImagePicker('Logo', _logoName, () => _pickImage('logo'))),
                  const SizedBox(width: 12),
                  Expanded(child: _buildImagePicker('Foto Fachada', _fachadaName, () => _pickImage('fachada'))),
                ],
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('5. Documentos Legales (PDF)'),
              _buildFilePicker('1. Certificado de RIF', _rifName, () => _pickPdf('rif')),
              const SizedBox(height: 12),
              _buildFilePicker('2. Documento Legal (Acta/RNE)', _legalName, () => _pickPdf('legal')),
              const SizedBox(height: 12),
              _buildFilePicker('3. Cédula de los firmantes', _cedulasName, () => _pickPdf('cedulas')),

              const SizedBox(height: 40),
              SizedBox(
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: primaryPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text('Guardar y Enviar a Revisión', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(padding: const EdgeInsets.only(bottom: 12), child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryPurple)));
  }

  Widget _buildTextField(TextEditingController ctrl, String label, IconData icon, {bool isNumber = false, bool required = false}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(labelText: required ? '$label *' : label, prefixIcon: Icon(icon), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
      validator: required ? (v) => v!.isEmpty ? 'Requerido' : null : null,
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? val, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: val,
      decoration: InputDecoration(labelText: '$label *', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
      onChanged: onChanged,
      validator: (v) => v == null ? 'Requerido' : null,
    );
  }

  Widget _buildImagePicker(String label, String? fileName, VoidCallback onTap) {
    final hasFile = fileName != null;
    return InkWell(
      onTap: _isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(color: hasFile ? Colors.green.withOpacity(0.1) : Colors.white, border: Border.all(color: hasFile ? Colors.green : Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(hasFile ? Icons.check_circle : Icons.add_photo_alternate, color: hasFile ? Colors.green : Colors.grey, size: 30),
            const SizedBox(height: 8),
            Text(hasFile ? 'Subido' : label, style: TextStyle(fontWeight: FontWeight.bold, color: hasFile ? Colors.green : Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePicker(String label, String? fileName, VoidCallback onTap) {
    final hasFile = fileName != null;
    return InkWell(
      onTap: _isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: hasFile ? Colors.green : Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Icon(hasFile ? Icons.check_circle : Icons.upload_file, color: hasFile ? Colors.green : Colors.grey, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(hasFile ? fileName! : 'Seleccionar archivo', style: TextStyle(fontSize: 12, color: hasFile ? Colors.green : Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_reviews_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_reviews_controller.dart';

class MerchantReviewsScreen extends StatefulWidget {
  const MerchantReviewsScreen({super.key});

  @override
  State<MerchantReviewsScreen> createState() => _MerchantReviewsScreenState();
}

class _MerchantReviewsScreenState extends State<MerchantReviewsScreen> {
  final _reviewsController = MerchantReviewsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _reviewsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Mis Reseñas'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _reviewsController.loadReviews,
              )
            ],
          ),
          body: _reviewsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _reviewsController.reviews.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star_border, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('Aún no tienes reseñas.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('Pide a tus clientes que validen sus compras.', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // RESUMEN DE REPUTACIÓN
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))],
                            ),
                            child: Row(
                              children: [
                                // Promedio General
                                Column(
                                  children: [
                                    Text(
                                      _reviewsController.averageRating.toStringAsFixed(1),
                                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.textDark),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(5, (index) {
                                        return Icon(
                                          index < _reviewsController.averageRating.floor() ? Icons.star : Icons.star_border,
                                          color: Colors.amber,
                                          size: 20,
                                        );
                                      }),
                                    ),
                                    const SizedBox(height: 4),
                                    Text('${_reviewsController.reviews.length} reseñas', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                                const SizedBox(width: 24),
                                const VerticalDivider(thickness: 1, color: Colors.black12),
                                const SizedBox(width: 24),
                                // Desglose
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildRatingBar('Calidad', _reviewsController.averageProductQuality, AppColors.success),
                                      const SizedBox(height: 12),
                                      _buildRatingBar('Atención', _reviewsController.averageService, AppColors.primaryPurple),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          const Text('Comentarios Recientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),

                          // LISTA DE RESEÑAS
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _reviewsController.reviews.length,
                            itemBuilder: (context, index) {
                              final review = _reviewsController.reviews[index];
                              final clientName = review['usuarios']?['nombre'] ?? 'Cliente';
                              final date = review['fecha_validacion'] != null 
                                  ? DateTime.parse(review['fecha_validacion']).toLocal() 
                                  : DateTime.now();
                              final formattedDate = DateFormat('dd/MM/yyyy').format(date);
                              final quality = (review['calificacion_estado'] as num).toInt();
                              final service = (review['calificacion_atencion'] as num).toInt();

                              return Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(clientName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                          Text(formattedDate, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          _buildStarRating(quality, 'Calidad'),
                                          const SizedBox(width: 12),
                                          _buildStarRating(service, 'Atención'),
                                        ],
                                      ),
                                      if (review['comentario_cliente'] != null && review['comentario_cliente'].toString().isNotEmpty) ...[
                                        const SizedBox(height: 12),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(8)),
                                          child: Text(
                                            '"${review['comentario_cliente']}"',
                                            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
                                          ),
                                        )
                                      ]
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
        );
      },
    );
  }

  Widget _buildRatingBar(String label, double rating, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text(rating.toStringAsFixed(1), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: rating / 5,
          backgroundColor: Colors.grey[200],
          color: color,
          borderRadius: BorderRadius.circular(10),
          minHeight: 8,
        ),
      ],
    );
  }

  Widget _buildStarRating(int stars, String label) {
    return Row(
      children: [
        Text('$label:', style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(width: 4),
        ...List.generate(5, (index) => Icon(
          index < stars ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 14,
        )),
      ],
    );
  }
}```

### 📄 lib/screens/merchant_scanner_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_scan_controller.dart';

class MerchantScannerScreen extends StatefulWidget {
  const MerchantScannerScreen({super.key});

  @override
  State<MerchantScannerScreen> createState() => _MerchantScannerScreenState();
}

class _MerchantScannerScreenState extends State<MerchantScannerScreen> {
  final _scanController = MerchantScanController();
  final MobileScannerController _cameraController = MobileScannerController();
  
  bool _isProcessing = false;

  void _onDetect(BarcodeCapture capture) async {
    if (_isProcessing) return; // Evitar escaneos múltiples

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final String? code = barcodes.first.rawValue;
    if (code == null) return;

    setState(() => _isProcessing = true);
    _cameraController.stop(); // Detener la cámara mientras procesa

    await _scanController.processScan(code);

    if (!mounted) return;

    if (_scanController.isSuccess) {
      _showSuccessDialog();
    } else {
      _showErrorDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: AppColors.success, size: 80),
            const SizedBox(height: 16),
            const Text('¡Venta Completada!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              'Cliente: ${_scanController.purchaseData?['usuarios']?['nombre'] ?? 'Anónimo'}\n'
              'Total: \$${(_scanController.purchaseData?['total_pagado'] as num).toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Se ha notificado al cliente para que valide su compra en la app.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.textLight),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); // Cerrar diálogo
              Navigator.pop(context); // Volver al dashboard
            },
            child: const Text('Cerrar', style: TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error de Escaneo'),
        content: Text(_scanController.errorMessage ?? 'QR no válido.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() => _isProcessing = false);
              _cameraController.start(); // Reanudar cámara para intentar de nuevo
            },
            child: const Text('Intentar de nuevo'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Escanear QR de Compra'),
      ),
      body: Stack(
        children: [
          // Cámara
          MobileScanner(
            controller: _cameraController,
            onDetect: _onDetect,
          ),
          
          // Marco de escaneo (Overlay)
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryPurple, width: 4),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),

          // Texto instructivo
          const Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Text(
              'Apunta la cámara al código QR del cliente',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black, blurRadius: 4)]),
            ),
          ),

          // Indicador de carga
          if (_isProcessing)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primaryPurple),
              ),
            ),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/merchant_screen.dart
```dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class MerchantProfileScreen extends StatefulWidget {
  final VoidCallback onDocsUploaded;

  const MerchantProfileScreen({super.key, required this.onDocsUploaded});

  @override
  State<MerchantProfileScreen> createState() => _MerchantProfileScreenState();
}

class _MerchantProfileScreenState extends State<MerchantProfileScreen> {
  final _supabase = Supabase.instance.client;
  String? _tipoComercio;
  
  File? _docRif;
  File? _docConstitutivo;
  File? _docCedulas;
  
  bool _isLoading = false;

  Future<File?> _pickFile({required bool isPdfOnly}) async {
    final result = await FilePicker.platform.pickFiles(
      type: isPdfOnly ? FileType.custom : FileType.image,
      allowedExtensions: isPdfOnly ? ['pdf'] : ['jpg', 'jpeg', 'png', 'webp'],
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  // Función Senior: Comprime imágenes a WebP. Los PDFs pasan intactos.
  Future<File> _processFile(File file) async {
    final extension = p.extension(file.path).toLowerCase();
    
    if (extension == '.pdf') return file;

    final targetPath = '${p.dirname(file.path)}/${p.basenameWithoutExtension(file.path)}.webp';
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      format: CompressFormat.webp,
      quality: 80, // Calidad óptima
    );

    if (result != null) return File(result.path);
    return file;
  }

  Future<String?> _uploadDocument(File file, String fileName) async {
    try {
      final processedFile = await _processFile(file);
      final ext = p.extension(processedFile.path);
      final finalName = '$fileName$ext';
      
      final userId = _supabase.auth.currentUser!.id;
      final path = '$userId/$finalName';

      await _supabase.storage.from('documentos_comercios').upload(
        path, 
        processedFile,
        fileOptions: const FileOptions(upsert: true),
      );

      return path;
    } catch (e) {
      debugPrint('Error subiendo archivo: $e');
      return null;
    }
  }

  Future<void> _submitDocs() async {
    if (_tipoComercio == null || _docRif == null || _docConstitutivo == null || _docCedulas == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes seleccionar el tipo y subir los 3 documentos.')),
      );
      return;
    }

    setState(() => _isLoading = true);
    final userId = _supabase.auth.currentUser!.id;

    try {
      final urlRif = await _uploadDocument(_docRif!, 'rif_$userId');
      final urlConst = await _uploadDocument(_docConstitutivo!, 'constitutivo_$userId');
      final urlCedulas = await _uploadDocument(_docCedulas!, 'cedulas_$userId');

      if (urlRif == null || urlConst == null || urlCedulas == null) {
        throw Exception('Error al subir los documentos al Storage.');
      }

      // Actualizamos la BD: cambia a 'En Revision' y guarda las rutas
      await _supabase.from('comercios').update({
        'tipo_comercio': _tipoComercio,
        'doc_rif_url': urlRif,
        'doc_constitutivo_url': urlConst,
        'doc_cedulas_url': urlCedulas,
        'estatus_verificacion': 'En Revision', 
      }).eq('usuario_id', userId);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Documentos enviados. Tu cuenta está en revisión.')),
        );
        // Avisamos al AuthGate que ya terminamos para que nos deje pasar
        widget.onDocsUploaded();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completa tu perfil'),
        automaticallyImplyLeading: false, // Bloquea el botón de regresar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar Sesión',
            onPressed: () => _supabase.auth.signOut(),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Para proteger a los usuarios, necesitamos validar tu negocio. Sube los documentos requeridos para activar tu cuenta.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              
              DropdownButtonFormField<String>(
                value: _tipoComercio,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Comercio',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'empresa', child: Text('Empresa')),
                  DropdownMenuItem(value: 'emprendimiento', child: Text('Emprendimiento')),
                  DropdownMenuItem(value: 'firma_personal', child: Text('Firma Personal')),
                ],
                onChanged: (v) => setState(() => _tipoComercio = v),
              ),
              const SizedBox(height: 20),

              // 1. Certificado de RIF
              _buildFilePicker(
                title: '1. Certificado de RIF',
                subtitle: 'Documento PDF emitido por el SENIAT',
                file: _docRif,
                onPick: () async {
                  final f = await _pickFile(isPdfOnly: true);
                  if (f != null) setState(() => _docRif = f);
                },
              ),
              const SizedBox(height: 12),

              // 2. Documento Constitutivo / Acta
              if (_tipoComercio == 'empresa')
                _buildFilePicker(
                  title: '2. Acta Constitutiva',
                  subtitle: 'Documento legal de creación (PDF)',
                  file: _docConstitutivo,
                  onPick: () async {
                    final f = await _pickFile(isPdfOnly: true);
                    if (f != null) setState(() => _docConstitutivo = f);
                  },
                )
              else if (_tipoComercio == 'emprendimiento')
                _buildFilePicker(
                  title: '2. Certificado RNE',
                  subtitle: 'Registro Nacional de Emprendimiento (PDF)',
                  file: _docConstitutivo,
                  onPick: () async {
                    final f = await _pickFile(isPdfOnly: true);
                    if (f != null) setState(() => _docConstitutivo = f);
                  },
                )
              else if (_tipoComercio == 'firma_personal')
                _buildFilePicker(
                  title: '2. Documento Constitutivo',
                  subtitle: 'Documento que formalice la firma (PDF)',
                  file: _docConstitutivo,
                  onPick: () async {
                    final f = await _pickFile(isPdfOnly: true);
                    if (f != null) setState(() => _docConstitutivo = f);
                  },
                )
              else
                _buildFilePicker(
                  title: '2. Documento Legal',
                  subtitle: 'Selecciona primero el tipo de comercio (PDF)',
                  file: _docConstitutivo,
                  onPick: () {},
                ),
              const SizedBox(height: 12),

              // 3. Cédulas de firmantes
              _buildFilePicker(
                title: '3. Cédula de los firmantes',
                subtitle: 'Foto clara (se comprimirá a WebP)',
                file: _docCedulas,
                onPick: () async {
                  final f = await _pickFile(isPdfOnly: false);
                  if (f != null) setState(() => _docCedulas = f);
                },
              ),

              const SizedBox(height: 30),
              
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitDocs,
                  child: _isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Enviar a Revisión'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilePicker({
    required String title,
    required String subtitle,
    required File? file,
    required VoidCallback onPick,
  }) {
    return InkWell(
      onTap: _isLoading ? null : onPick,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: file != null ? Colors.green : Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: file != null ? Colors.green.withOpacity(0.1) : null,
        ),
        child: Row(
          children: [
            Icon(
              file != null ? Icons.check_circle : Icons.upload_file,
              color: file != null ? Colors.green : Colors.grey,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  if (file != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      p.basename(file.path),
                      style: const TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/merchant_status_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'merchant_profile_screen.dart';

class MerchantStatusScreen extends StatefulWidget {
  final String status;
  const MerchantStatusScreen({super.key, required this.status});

  @override
  State<MerchantStatusScreen> createState() => _MerchantStatusScreenState();
}

class _MerchantStatusScreenState extends State<MerchantStatusScreen> {
  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  Widget build(BuildContext context) {
    final isRejected = widget.status == 'Rechazado';

    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Estado de Verificación'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Supabase.instance.client.auth.signOut(),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isRejected ? Icons.cancel : Icons.hourglass_top,
                size: 100,
                color: isRejected ? Colors.red : Colors.orange,
              ),
              const SizedBox(height: 24),
              Text(
                isRejected ? 'Documentación Rechazada' : 'Documentación en Revisión',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                isRejected 
                  ? 'Lamentablemente tus documentos no pudieron ser validados. Por favor, vuelve a subirlos asegurándote de que sean legibles y correctos.'
                  : 'Nuestro equipo está revisando tus documentos. Este proceso puede tardar hasta 24 horas hábiles. Te notificaremos cuando tu cuenta esté activa.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              if (isRejected)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  icon: const Icon(Icons.upload_file, color: Colors.white),
                  label: const Text('Volver a subir documentos', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MerchantProfileScreen(
                          onDocsUploaded: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SizedBox())); 
                },
                child: const Text('Actualizar estado'),
              )
            ],
          ),
        ),
      ),
    );
  }
}```

### 📄 lib/screens/nearby_offers_map_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../core/theme/app_theme.dart';
import '../controllers/nearby_offers_controller.dart';
import 'client_checkout_screen.dart';

class NearbyOffersMapScreen extends StatefulWidget {
  const NearbyOffersMapScreen({super.key});

  @override
  State<NearbyOffersMapScreen> createState() => _NearbyOffersMapScreenState();
}

class _NearbyOffersMapScreenState extends State<NearbyOffersMapScreen> {
  final _mapController = MapController();
  final _nearbyController = NearbyOffersController();
  dynamic _selectedOffer;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _nearbyController,
      builder: (context, child) {
        if (_nearbyController.isLoading) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.primaryPurple),
                  SizedBox(height: 16),
                  Text('Buscando ofertas cerca de ti...', style: TextStyle(color: AppColors.textLight)),
                ],
              ),
            ),
          );
        }

        if (_nearbyController.errorMessage != null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Ofertas Cercanas')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_off, size: 80, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(_nearbyController.errorMessage!, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textDark)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _nearbyController.loadNearbyOffers,
                    child: const Text('Reintentar'),
                  )
                ],
              ),
            ),
          );
        }

        final userLat = _nearbyController.currentPosition!.latitude;
        final userLng = _nearbyController.currentPosition!.longitude;

        return Scaffold(
          appBar: AppBar(title: const Text('Ofertas Cercanas')),
          body: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(userLat, userLng),
                  initialZoom: 14.0,
                  onTap: (_, __) => setState(() => _selectedOffer = null),
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.ofve.app',
                  ),
                  MarkerLayer(
                    markers: _nearbyController.nearbyOffers.map((oferta) {
                      return Marker(
                        point: LatLng(oferta['latitud'], oferta['longitud']),
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedOffer = oferta);
                            _mapController.move(LatLng(oferta['latitud'], oferta['longitud']), 15.0);
                          },
                          child: const Icon(Icons.location_on, color: AppColors.primaryPurple, size: 45),
                        ),
                      );
                    }).toList(),
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(userLat, userLng),
                        width: 40,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.info.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.my_location, color: AppColors.info, size: 24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 16,
                right: 16,
                child: FloatingActionButton.small(
                  backgroundColor: AppColors.white,
                  onPressed: _nearbyController.loadNearbyOffers,
                  child: const Icon(Icons.refresh, color: AppColors.primaryPurple),
                ),
              ),
              if (_selectedOffer != null)
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10))],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_selectedOffer['nombre_comercio'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textDark)),
                        const SizedBox(height: 4),
                        Text(_selectedOffer['direccion'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                        const Divider(height: 24),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: (_selectedOffer['fachada_url'] != null && _selectedOffer['fachada_url'].toString().isNotEmpty)
                                  ? Image.network(_selectedOffer['fachada_url'], width: 60, height: 60, fit: BoxFit.cover)
                                  : Container(width: 60, height: 60, color: Colors.grey[200], child: const Icon(Icons.store, color: Colors.grey)),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_selectedOffer['nombre_oferta'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Text('A ${(_selectedOffer['distancia_metros'] as num).toStringAsFixed(0)} metros de ti', style: const TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Text('\$${_selectedOffer['precio']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPurple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (_) => ClientCheckoutScreen(
                                  oferta: {
                                    'id': _selectedOffer['oferta_id'],
                                    'comercio_id': _selectedOffer['comercio_id'],
                                    'producto_nombre': _selectedOffer['nombre_oferta'],
                                    'precio_oferta': _selectedOffer['precio'],
                                    'precio_regular': _selectedOffer['precio'],
                                    'imagen_url': _selectedOffer['fachada_url'],
                                  },
                                ),
                              ));
                            },
                            child: const Text('Ver y Comprar', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/notifications_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/notifications_controller.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _notificationsController = NotificationsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _notificationsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Notificaciones'),
            actions: [
              if (_notificationsController.unreadCount > 0)
                TextButton.icon(
                  onPressed: () => _notificationsController.markAllAsRead(),
                  icon: const Icon(Icons.done_all, color: AppColors.primaryPurple),
                  label: const Text('Marcar leídas', style: TextStyle(color: AppColors.primaryPurple)),
                ),
            ],
          ),
          body: _notificationsController.notifications.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_off_outlined, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No tienes notificaciones.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _notificationsController.notifications.length,
                  itemBuilder: (context, index) {
                    final notif = _notificationsController.notifications[index];
                    final isRead = notif['leida'] ?? false;
                    final fecha = DateTime.parse(notif['created_at']).toLocal();
                    final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);

                    // Color e icono según el tipo
                    Color iconColor = AppColors.info;
                    IconData iconData = Icons.info_outline;
                    if (notif['tipo'] == 'success') { iconColor = AppColors.success; iconData = Icons.check_circle_outline; }
                    if (notif['tipo'] == 'warning') { iconColor = AppColors.warning; iconData = Icons.warning_amber; }
                    if (notif['tipo'] == 'error') { iconColor = AppColors.error; iconData = Icons.error_outline; }

                    return GestureDetector(
                      onTap: () {
                        if (!isRead) _notificationsController.markAsRead(notif['id']);
                      },
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        color: isRead ? Colors.white : AppColors.primaryPurple.withOpacity(0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: isRead ? BorderSide.none : const BorderSide(color: AppColors.primaryPurple, width: 1),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            backgroundColor: iconColor.withOpacity(0.1),
                            child: Icon(iconData, color: iconColor),
                          ),
                          title: Text(notif['titulo'], style: TextStyle(fontWeight: isRead ? FontWeight.w500 : FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(notif['mensaje']),
                              const SizedBox(height: 8),
                              Text(fechaStr, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}```

### 📄 lib/screens/offer_form_screen.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'offer_review_screen.dart'; // <-- NUEVA IMPORTACIÓN

class OfferFormScreen extends StatefulWidget {
  const OfferFormScreen({super.key});

  @override
  State<OfferFormScreen> createState() => _OfferFormScreenState();
}

class _OfferFormScreenState extends State<OfferFormScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceRegController = TextEditingController();
  final _priceOfferController = TextEditingController();
  final _stockController = TextEditingController();
  String _selectedCategory = 'Alimentos y Bebidas';
  
  Uint8List? _imageBytes;
  String? _imageName;

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceRegController.dispose();
    _priceOfferController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageName = pickedFile.name;
      });
    }
  }

  void _revisarOferta() {
    if (_nameController.text.isEmpty || _priceRegController.text.isEmpty || _priceOfferController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, llena los campos obligatorios.'), backgroundColor: Colors.red));
      return;
    }

    // Navegamos al resumen pasando todos los datos
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OfferReviewScreen(
          nombre: _nameController.text.trim(),
          descripcion: _descController.text.trim(),
          categoria: _selectedCategory,
          precioRegular: double.tryParse(_priceRegController.text.trim()) ?? 0.0,
          precioOferta: double.tryParse(_priceOfferController.text.trim()) ?? 0.0,
          stock: int.tryParse(_stockController.text.trim()) ?? 1,
          imageBytes: _imageBytes,
          imageName: _imageName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Paso 1: Datos de la Oferta', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: _imageBytes != null
                    ? ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate, size: 50, color: primaryPurple),
                          const SizedBox(height: 8),
                          const Text('Subir foto del producto', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),

            _buildTextField(_nameController, 'Nombre del Producto', Icons.shopping_bag),
            const SizedBox(height: 12),
            _buildTextField(_descController, 'Descripción (Opcional)', Icons.description, maxLines: 3),
            const SizedBox(height: 12),
            
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Categoría',
                prefixIcon: const Icon(Icons.category),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              items: ['Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza', 'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v!),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _buildTextField(_priceRegController, 'Precio Regular', Icons.attach_money, isNumber: true)),
                const SizedBox(width: 12),
                Expanded(child: _buildTextField(_priceOfferController, 'Precio Oferta', Icons.local_offer, isNumber: true)),
              ],
            ),
            const SizedBox(height: 12),
            _buildTextField(_stockController, 'Stock Disponible', Icons.inventory, isNumber: true),
            
            const SizedBox(height: 30),
            
            SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: _revisarOferta,
                child: const Text('Revisar Oferta', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}```

### 📄 lib/screens/offer_review_screen.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class OfferReviewScreen extends StatefulWidget {
  final String nombre;
  final String descripcion;
  final String categoria;
  final double precioRegular;
  final double precioOferta;
  final int stock;
  final Uint8List? imageBytes;
  final String? imageName;

  const OfferReviewScreen({
    super.key,
    required this.nombre,
    required this.descripcion,
    required this.categoria,
    required this.precioRegular,
    required this.precioOferta,
    required this.stock,
    this.imageBytes,
    this.imageName,
  });

  @override
  State<OfferReviewScreen> createState() => _OfferReviewScreenState();
}

class _OfferReviewScreenState extends State<OfferReviewScreen> {
  final _supabase = Supabase.instance.client;
  bool _isSaving = false;

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  Future<void> _publicarOferta() async {
    setState(() => _isSaving = true);
    final userId = _supabase.auth.currentUser!.id;

    try {
      // 1. Obtener el comercio
      final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercioData['id'];

      // 2. Subir Imagen (si existe)
      String? imageUrl;
      if (widget.imageBytes != null && widget.imageName != null) {
        final ext = p.extension(widget.imageName!);
        final finalName = 'oferta_${DateTime.now().millisecondsSinceEpoch}$ext';
        final path = '$userId/$finalName';

        await _supabase.storage.from('productos_imagenes').uploadBinary(
          path, widget.imageBytes!, fileOptions: const FileOptions(upsert: true),
        );
        imageUrl = _supabase.storage.from('productos_imagenes').getPublicUrl(path);
      }

      // 3. Guardar en BD
      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': widget.nombre,
        'descripcion': widget.descripcion,
        'categoria': widget.categoria,
        'precio_regular': widget.precioRegular,
        'precio_oferta': widget.precioOferta,
        'stock': widget.stock,
        'imagen_url': imageUrl,
        'estado': 'Activa',
        'fecha_inicio': DateTime.now().toIso8601String(),
        'fecha_fin': DateTime.now().add(const Duration(days: 7)).toIso8601String(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Oferta publicada con éxito!'), backgroundColor: Colors.green),
        );
        
        // 4. VOLVER AL DASHBOARD PRINCIPAL (Borrando el historial de estas pantallas)
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al publicar: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Paso 2: Resumen de Oferta', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Revisa cómo se verá tu oferta en la app antes de publicarla:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // TARJETA DE PREVISUALIZACIÓN (Estilo Dashboard del Cliente)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 5))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: widget.imageBytes != null
                        ? Image.memory(widget.imageBytes!, height: 200, width: double.infinity, fit: BoxFit.cover)
                        : Container(height: 200, color: Colors.grey[200], child: const Icon(Icons.image, size: 80, color: Colors.grey)),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(color: primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                              child: Text(widget.categoria, style: TextStyle(color: primaryPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                            Text('Stock: ${widget.stock}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(widget.nombre, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(
                          widget.descripcion.isEmpty ? 'Sin descripción' : widget.descripcion,
                          style: const TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text('\$${widget.precioOferta.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryPurple)),
                            const SizedBox(width: 12),
                            Text('\$${widget.precioRegular.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // BOTONES DE ACCIÓN
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: primaryPurple),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _isSaving ? null : () => Navigator.pop(context), // Vuelve al formulario
                    icon: Icon(Icons.edit, color: primaryPurple),
                    label: Text('Editar', style: TextStyle(color: primaryPurple, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _isSaving ? null : _publicarOferta,
                    icon: _isSaving 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Icon(Icons.check_circle, color: Colors.white),
                    label: Text(_isSaving ? 'Publicando...' : 'Publicar', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} ```

### 📄 lib/screens/owner_assign_plan_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class OwnerAssignPlanScreen extends StatefulWidget {
  const OwnerAssignPlanScreen({super.key});

  @override
  State<OwnerAssignPlanScreen> createState() => _OwnerAssignPlanScreenState();
}

class _OwnerAssignPlanScreenState extends State<OwnerAssignPlanScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _comercios = [];
  List<dynamic> _planes = [];

  String? _comercioSeleccionado;
  String? _planSeleccionado;
  bool _esLibre = false;
  int _mesesGracia = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final comerciosRes = await _supabase.from('comercios').select('id, nombre_comercial');
      final planesRes = await _supabase.from('planes_suscripcion').select('*');
      setState(() {
        _comercios = comerciosRes;
        _planes = planesRes;
      });
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _asignarPlan() async {
    if (_comercioSeleccionado == null || _planSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selecciona un comercio y un plan.'), backgroundColor: AppColors.error));
      return;
    }

    setState(() => _isLoading = true);
    try {
      final ahora = DateTime.now();
      final fechaExpiracion = DateTime(ahora.year, ahora.month + 1 + _mesesGracia, ahora.day);

      await _supabase.from('comercios').update({
        'plan_id': _planSeleccionado!,
        'es_plan_libre': _esLibre,
        'meses_gracia': _mesesGracia,
        'fecha_expiracion': fechaExpiracion.toIso8601String(),
      }).eq('id', _comercioSeleccionado!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Plan asignado con éxito!'), backgroundColor: AppColors.success));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Asignar Plan')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Seleccionar Comercio'),
                    items: _comercios.map((c) => DropdownMenuItem<String>(value: c['id'].toString(), child: Text(c['nombre_comercial'] ?? 'Sin Nombre'))).toList(),
                    onChanged: (v) => setState(() => _comercioSeleccionado = v),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Seleccionar Plan'),
                    items: _planes.map((p) => DropdownMenuItem<String>(value: p['id'].toString(), child: Text('${p['nombre']} - \$${p['precio']}'))).toList(),
                    onChanged: (v) => setState(() => _planSeleccionado = v),
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    title: const Text('Plan Libre (Gratis)', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Activar para comercios de labor social'),
                    value: _esLibre,
                    activeColor: AppColors.primaryPurple,
                    onChanged: (v) => setState(() => _esLibre = v),
                  ),
                  ListTile(
                    title: const Text('Meses de Gracia (Promoción)', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('$_mesesGracia meses gratis adicionales'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: AppColors.error),
                          onPressed: _mesesGracia > 0 ? () => setState(() => _mesesGracia--) : null,
                        ),
                        Text('$_mesesGracia', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: AppColors.success),
                          onPressed: () => setState(() => _mesesGracia++),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _asignarPlan,
                      child: const Text('Guardar Asignación'),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}```

### 📄 lib/screens/owner_assign_plan_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerAssignPlanScreen extends StatefulWidget {
  const OwnerAssignPlanScreen({super.key});

  @override
  State<OwnerAssignPlanScreen> createState() => _OwnerAssignPlanScreenState();
}

class _OwnerAssignPlanScreenState extends State<OwnerAssignPlanScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _comercios = [];
  List<dynamic> _planes = [];

  // Selecciones
  String? _comercioSeleccionado;
  String? _planSeleccionado;
  bool _esLibre = false;
  int _mesesGracia = 0;

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final comerciosRes = await _supabase.from('comercios').select('id, nombre_comercial');
      final planesRes = await _supabase.from('planes_suscripcion').select('*');
      setState(() {
        _comercios = comerciosRes;
        _planes = planesRes;
      });
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _asignarPlan() async {
    if (_comercioSeleccionado == null || _planSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selecciona un comercio y un plan.'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Calculamos la fecha de expiración (hoy + 1 mes + meses de gracia)
      final ahora = DateTime.now();
      final fechaExpiracion = DateTime(ahora.year, ahora.month + 1 + _mesesGracia, ahora.day);

      // CORRECCIÓN: Se agregó el operador '!' para asegurar que no es nulo.
      await _supabase.from('comercios').update({
        'plan_id': _planSeleccionado!,
        'es_plan_libre': _esLibre,
        'meses_gracia': _mesesGracia,
        'fecha_expiracion': fechaExpiracion.toIso8601String(),
      }).eq('id', _comercioSeleccionado!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Plan asignado con éxito!'), backgroundColor: Colors.green));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Asignar Plan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Seleccionar Comercio
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Seleccionar Comercio', filled: true, fillColor: Colors.white, border: OutlineInputBorder()),
                    items: _comercios.map((c) => DropdownMenuItem<String>(value: c['id'].toString(), child: Text(c['nombre_comercial'] ?? 'Sin Nombre'))).toList(),
                    onChanged: (v) => setState(() => _comercioSeleccionado = v),
                  ),
                  const SizedBox(height: 20),

                  // 2. Seleccionar Plan
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Seleccionar Plan', filled: true, fillColor: Colors.white, border: OutlineInputBorder()),
                    items: _planes.map((p) => DropdownMenuItem<String>(value: p['id'].toString(), child: Text('${p['nombre']} - \$${p['precio']}'))).toList(),
                    onChanged: (v) => setState(() => _planSeleccionado = v),
                  ),
                  const SizedBox(height: 20),

                  // 3. Plan Libre (Labor Social)
                  SwitchListTile(
                    title: const Text('Plan Libre (Gratis)', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Activar para comercios de labor social'),
                    value: _esLibre,
                    activeColor: primaryPurple,
                    onChanged: (v) => setState(() => _esLibre = v),
                  ),

                  // 4. Meses de Gracia
                  ListTile(
                    title: const Text('Meses de Gracia (Promoción)', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('$_mesesGracia meses gratis adicionales'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: _mesesGracia > 0 ? () => setState(() => _mesesGracia--) : null,
                        ),
                        Text('$_mesesGracia', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                          onPressed: () => setState(() => _mesesGracia++),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: primaryPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      onPressed: _asignarPlan,
                      child: const Text('Guardar Asignación', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}```

### 📄 lib/screens/owner_audit_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_audit_controller.dart';

class OwnerAuditScreen extends StatefulWidget {
  const OwnerAuditScreen({super.key});

  @override
  State<OwnerAuditScreen> createState() => _OwnerAuditScreenState();
}

class _OwnerAuditScreenState extends State<OwnerAuditScreen> {
  final _auditController = OwnerAuditController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _auditController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Registro de Auditoría'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _auditController.loadLogs,
              )
            ],
          ),
          body: Column(
            children: [
              // FILTROS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _auditController.filters.length,
                    itemBuilder: (context, index) {
                      final filter = _auditController.filters[index];
                      final isSelected = _auditController.selectedFilter == filter;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(filter),
                          selected: isSelected,
                          onSelected: (_) => _auditController.setFilter(filter),
                          selectedColor: AppColors.primaryPurple,
                          labelStyle: TextStyle(color: isSelected ? Colors.white : AppColors.textDark, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // TIMELINE
              Expanded(
                child: _auditController.isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                    : _auditController.logs.isEmpty
                        ? const Center(child: Text('No hay registros de auditoría aún.', style: TextStyle(color: Colors.grey)))
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: _auditController.logs.length,
                            itemBuilder: (context, index) {
                              final log = _auditController.logs[index];
                              return _buildTimelineItem(log);
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimelineItem(dynamic log) {
    final fecha = DateTime.parse(log['created_at']).toLocal();
    final fechaStr = DateFormat('dd/MM/yyyy HH:mm:ss').format(fecha);
    final usuario = log['usuarios']?['nombre'] ?? 'Sistema / Desconocido';
    final rol = log['rol'] ?? 'Sistema';
    final tabla = log['tabla_afectada'] ?? 'Desconocida';
    final accion = log['accion'] ?? 'Acción Desconocida';

    // Definir icono y color según la tabla
    IconData icon = Icons.info_outline;
    Color color = AppColors.info;

    if (tabla == 'comercios') {
      icon = Icons.store;
      color = AppColors.warning;
    } else if (tabla == 'ofertas') {
      icon = Icons.local_offer;
      color = AppColors.success;
    } else if (tabla == 'solicitudes_suscripcion') {
      icon = Icons.attach_money;
      color = AppColors.primaryPurple;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // LÍNEA VERTICAL DEL TIMELINE
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          
          // TARJETA DE DATOS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(accion, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textDark)),
                          Text(fechaStr, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(usuario, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: AppColors.primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                            child: Text(rol.toUpperCase(), style: const TextStyle(color: AppColors.primaryPurple, fontSize: 9, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      const Divider(height: 20),
                      Text('Tabla: $tabla', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      // Puedes expandir los detalles JSON aquí si lo deseas en el futuro
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/owner_dashboard_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_controller.dart';
import 'admin_validation_screen.dart';
import 'admin_moderation_screen.dart'; // <-- NUEVA IMPORTACIÓN
import 'admin_support_screen.dart'; // <-- NUEVA IMPORTACIÓN
import 'owner_user_management_screen.dart';
import 'owner_settings_screen.dart';
import 'owner_plans_management_screen.dart';
import 'owner_audit_screen.dart'; 
import 'owner_financial_screen.dart'; // <-- NUEVA IMPORTACIÓN

class OwnerDashboardScreen extends StatefulWidget {
  const OwnerDashboardScreen({super.key});

  @override
  State<OwnerDashboardScreen> createState() => _OwnerDashboardScreenState();
}

class _OwnerDashboardScreenState extends State<OwnerDashboardScreen> {
  final _ownerController = OwnerController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ownerController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Super Admin Panel', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(icon: const Icon(Icons.logout, color: AppColors.error), tooltip: 'Cerrar Sesión', onPressed: () => Supabase.instance.client.auth.signOut())
            ],
          ),
          body: _ownerController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Resumen Global', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildStatCard('Usuarios', _ownerController.totalUsuarios.toString(), Icons.people, AppColors.info),
                          const SizedBox(width: 12),
                          _buildStatCard('Comercios', _ownerController.totalComercios.toString(), Icons.store, AppColors.success),
                          const SizedBox(width: 12),
                          _buildStatCard('Ofertas', _ownerController.totalOfertas.toString(), Icons.local_offer, AppColors.warning),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text('Módulos del Sistema', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.85,
                        children: [
                          _buildModuleCard(icon: Icons.manage_accounts, title: 'Roles', subtitle: 'Gestionar', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerUserManagementScreen())).then((_) => _ownerController.loadGlobalStats())),
                          _buildModuleCard(icon: Icons.verified_user, title: 'Validar', subtitle: 'Comercios', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminValidationScreen())).then((_) => _ownerController.loadGlobalStats())),
                          _buildModuleCard(icon: Icons.workspace_premium, title: 'Planes', subtitle: 'Suscripciones', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerPlansManagementScreen()))),
                          _buildModuleCard(icon: Icons.settings, title: 'Config', subtitle: 'App & Features', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerSettingsScreen()))),
                          
                          // TARJETA DE AUDITORÍA CONECTADA
                          _buildModuleCard(
                            icon: Icons.security, 
                            title: 'Auditoría', 
                            subtitle: 'Logs Globales', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerAuditScreen()))
                          ),
                          
                          // TARJETA DE INGRESOS CONECTADA
                          _buildModuleCard(
                            icon: Icons.attach_money, 
                            title: 'Ingresos', 
                            subtitle: 'Finanzas', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerFinancialScreen()))
                          ),
                          
                          _buildModuleCard(icon: Icons.bar_chart, title: 'Métricas', subtitle: 'Analytics', onTap: () {}),
                          _buildModuleCard(icon: Icons.campaign, title: 'Push', subtitle: 'Notificaciones', onTap: () {}),
                          
                          // TARJETA DE MODERACIÓN CONECTADA
                          _buildModuleCard(
                            icon: Icons.gavel, 
                            title: 'Moderación', 
                            subtitle: 'Reportes', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminModerationScreen()))
                          ),
                          
                          // TARJETA DE SOPORTE CONECTADA
                          _buildModuleCard(
                            icon: Icons.support_agent, 
                            title: 'Soporte', 
                            subtitle: 'Tickets', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminSupportScreen()))
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: AppColors.darkCardColor, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.white, size: 32),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/owner_dashboard_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_validation_screen.dart';
import 'owner_user_management_screen.dart';
import 'owner_settings_screen.dart';
import 'owner_plans_management_screen.dart'; // <-- IMPORTACIÓN AGREGADA

class OwnerDashboardScreen extends StatefulWidget {
  const OwnerDashboardScreen({super.key});

  @override
  State<OwnerDashboardScreen> createState() => _OwnerDashboardScreenState();
}

class _OwnerDashboardScreenState extends State<OwnerDashboardScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;

  int _totalUsuarios = 0;
  int _totalComercios = 0;
  int _totalOfertas = 0;

  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);
  final Color darkCardColor = const Color(0xFF252152);

  @override
  void initState() {
    super.initState();
    _loadGlobalStats();
  }

  Future<void> _loadGlobalStats() async {
    setState(() => _isLoading = true);
    try {
      final users = await _supabase.from('usuarios').select('id').count();
      final merchants = await _supabase.from('comercios').select('id').count();
      final offers = await _supabase.from('ofertas').select('id').count();

      setState(() {
        _totalUsuarios = users.count;
        _totalComercios = merchants.count;
        _totalOfertas = offers.count;
      });
    } catch (e) {
      debugPrint('Error cargando métricas: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Super Admin Panel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            tooltip: 'Cerrar Sesión',
            onPressed: () => _supabase.auth.signOut(),
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Resumen Global', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildStatCard('Usuarios', _totalUsuarios.toString(), Icons.people, Colors.blue),
                      const SizedBox(width: 12),
                      _buildStatCard('Comercios', _totalComercios.toString(), Icons.store, Colors.green),
                      const SizedBox(width: 12),
                      _buildStatCard('Ofertas', _totalOfertas.toString(), Icons.local_offer, Colors.orange),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text('Módulos del Sistema', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                    children: [
                      _buildModuleCard(
                        icon: Icons.manage_accounts,
                        title: 'Roles',
                        subtitle: 'Gestionar Usuarios',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerUserManagementScreen())).then((_) => _loadGlobalStats()),
                      ),
                      _buildModuleCard(
                        icon: Icons.verified_user,
                        title: 'Validar',
                        subtitle: 'Comercios',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminValidationScreen())).then((_) => _loadGlobalStats()),
                      ),
                      _buildModuleCard(
                        icon: Icons.settings,
                        title: 'Config',
                        subtitle: 'App & Features',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerSettingsScreen())),
                      ),
                      // --- TARJETA DE PLANES AGREGADA AQUÍ ---
                      _buildModuleCard(
                        icon: Icons.workspace_premium,
                        title: 'Planes',
                        subtitle: 'Suscripciones',
                        onTap: () {
                          // CORRECCIÓN: Se quitó el 'const' de OwnerPlansManagementScreen
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerPlansManagementScreen()));
                        },
                      ),
                      _buildModuleCard(
                        icon: Icons.attach_money,
                        title: 'Ingresos',
                        subtitle: 'Finanzas',
                        onTap: () {}, 
                      ),
                      _buildModuleCard(
                        icon: Icons.bar_chart,
                        title: 'Métricas',
                        subtitle: 'Analytics',
                        onTap: () {}, 
                      ),
                      _buildModuleCard(
                        icon: Icons.campaign,
                        title: 'Push',
                        subtitle: 'Notificaciones',
                        onTap: () {}, 
                      ),
                      _buildModuleCard(
                        icon: Icons.gavel,
                        title: 'Moderación',
                        subtitle: 'Reportes',
                        onTap: () {}, 
                      ),
                      _buildModuleCard(
                        icon: Icons.support_agent,
                        title: 'Soporte',
                        subtitle: 'Tickets',
                        onTap: () {}, 
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: darkCardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }
}```

### 📄 lib/screens/owner_financial_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_financial_controller.dart';

class OwnerFinancialScreen extends StatefulWidget {
  const OwnerFinancialScreen({super.key});

  @override
  State<OwnerFinancialScreen> createState() => _OwnerFinancialScreenState();
}

class _OwnerFinancialScreenState extends State<OwnerFinancialScreen> {
  final _financialController = OwnerFinancialController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _financialController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Reportes Financieros'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _financialController.loadStats,
              )
            ],
          ),
          body: _financialController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TARJETA DE INGRESOS TOTALES
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.darkCardColor, const Color(0xFF3D3785)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Ingresos Totales de la Plataforma', style: TextStyle(color: Colors.white70, fontSize: 14)),
                            const SizedBox(height: 8),
                            Text(
                              '\$${(_financialController.totalSuscripciones + _financialController.totalPublicidad + _financialController.totalComisiones).toStringAsFixed(2)}',
                              style: const TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text('Suscripciones + Publicidad + Comisiones', style: TextStyle(color: Colors.white54, fontSize: 11)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      const Text('Desglose de Ingresos de la App', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),

                      // DESGLOSE
                      _buildIncomeItem(
                        title: 'Suscripciones (Planes)',
                        amount: _financialController.totalSuscripciones,
                        icon: Icons.workspace_premium,
                        color: AppColors.primaryPurple,
                      ),
                      const SizedBox(height: 12),
                      _buildIncomeItem(
                        title: 'Publicidad (Ads)',
                        amount: _financialController.totalPublicidad,
                        icon: Icons.campaign,
                        color: Colors.amber,
                      ),
                      const SizedBox(height: 12),
                      _buildIncomeItem(
                        title: 'Comisiones por Ventas',
                        amount: _financialController.totalComisiones,
                        icon: Icons.percent,
                        color: AppColors.info,
                      ),
                      
                      const Divider(height: 40),

                      const Text('Métricas del Ecosistema', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      
                      // MÉTRICA DE VOLUMEN DE VENTAS
                      _buildIncomeItem(
                        title: 'Volumen de Ventas (Comercios)',
                        amount: _financialController.totalVentasApp,
                        icon: Icons.shopping_cart_checkout,
                        color: AppColors.success,
                        isVolume: true, 
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildIncomeItem({
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
    bool isVolume = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            radius: 24,
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                if (isVolume)
                  const Text('Transacciones completadas en la app', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isVolume ? AppColors.textDark : color),
          ),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/owner_manual_payments_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class OwnerManualPaymentsScreen extends StatefulWidget {
  const OwnerManualPaymentsScreen({super.key});

  @override
  State<OwnerManualPaymentsScreen> createState() => _OwnerManualPaymentsScreenState();
}

class _OwnerManualPaymentsScreenState extends State<OwnerManualPaymentsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _pendingRequests = [];

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  Future<void> _loadRequests() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('solicitudes_suscripcion')
          .select('*, usuarios(nombre, email)')
          .eq('estado_verificacion', 'Manual')
          .order('fecha_solicitud', ascending: false);
      setState(() => _pendingRequests = response);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _processRequest(String requestId, String userId, String planName, bool approve) async {
    try {
      if (approve) {
        await _supabase.from('usuarios').update({'tipo_plan': planName}).eq('id', userId);
      }
      await _supabase.from('solicitudes_suscripcion').update({
        'estado_verificacion': approve ? 'Aprobado' : 'Rechazado',
        'fecha_respuesta': DateTime.now().toIso8601String(),
      }).eq('id', requestId);
      
      _loadRequests();
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(approve ? 'Pago aprobado' : 'Pago rechazado'), backgroundColor: approve ? AppColors.success : AppColors.error));
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Revisión de Pagos Manuales')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _pendingRequests.isEmpty
              ? const Center(child: Text('No hay pagos pendientes de revisión manual.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _pendingRequests.length,
                  itemBuilder: (context, index) {
                    final req = _pendingRequests[index];
                    final user = req['usuarios'];
                    final isCash = req['metodo_pago'] == 'Efectivo';

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user['nombre'] ?? 'Usuario', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(user['email'] ?? '', style: const TextStyle(color: Colors.grey)),
                            const Divider(),
                            Text('Plan: ${req['plan_solicitado']} | Monto: \$${req['monto']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('Método: ${req['metodo_pago']} | Ref: ${req['referencia'] ?? 'N/A'}'),
                            if (req['comprobante_url'] != null) ...[
                              const SizedBox(height: 8),
                              TextButton.icon(
                                onPressed: () {
                                  // Abrir la imagen del comprobante en el navegador
                                  // launchUrl(Uri.parse(req['comprobante_url']));
                                },
                                icon: const Icon(Icons.receipt_long, color: AppColors.primaryPurple),
                                label: const Text('Ver Comprobante'),
                              ),
                            ],
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () => _processRequest(req['id'], req['usuario_id'], req['plan_solicitado'], false),
                                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.error),
                                  child: const Text('Rechazar'),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () => _processRequest(req['id'], req['usuario_id'], req['plan_solicitado'], true),
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                                  child: const Text('Aprobar Pago'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}```

### 📄 lib/screens/owner_plans_management_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_plans_controller.dart';
import 'owner_assign_plan_screen.dart';

class OwnerPlansManagementScreen extends StatefulWidget {
  const OwnerPlansManagementScreen({super.key});

  @override
  State<OwnerPlansManagementScreen> createState() => _OwnerPlansManagementScreenState();
}

class _OwnerPlansManagementScreenState extends State<OwnerPlansManagementScreen> {
  final _plansController = OwnerPlansController();

  // Diálogo para editar Precio
  Future<void> _editarPrecio(String planId, String nombre, double precioActual) async {
    final ctrl = TextEditingController(text: precioActual.toString());
    final nuevoPrecio = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Editar Precio: $nombre'),
        content: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(labelText: 'Precio en USD', prefixIcon: Icon(Icons.attach_money)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, double.tryParse(ctrl.text)),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (nuevoPrecio != null) {
      await _plansController.editarPrecio(planId, nuevoPrecio);
    }
  }

  // Diálogo para editar Cuota de IA
  Future<void> _editarCuotaIA(String planId, String nombre, int cuotaActual) async {
    final ctrl = TextEditingController(text: cuotaActual.toString());
    final nuevaCuota = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Cuota IA: $nombre'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Generaciones por mes', prefixIcon: Icon(Icons.auto_awesome)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, int.tryParse(ctrl.text)),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (nuevaCuota != null) {
      final plan = _plansController.planes.firstWhere((p) => p['id'] == planId);
      await _plansController.updatePlanAI(planId, plan['ia_habilitada'], nuevaCuota);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _plansController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Gestión de Planes', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add, color: AppColors.textDark),
                tooltip: 'Asignar Plan a Comercio',
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerAssignPlanScreen())),
              )
            ],
          ),
          body: _plansController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // TARJETA DE CONTROL GLOBAL
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: AppColors.darkCardColor,
                      child: SwitchListTile(
                        title: const Text('IA Global Activada', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                        subtitle: const Text('Interruptor maestro para toda la app', style: TextStyle(color: Colors.white70)),
                        value: _plansController.iaGlobalActiva,
                        activeColor: AppColors.success,
                        onChanged: (val) => _plansController.toggleGlobalIA(val),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // LISTA DE PLANES
                    ..._plansController.planes.map((plan) {
                      final features = plan['plan_caracteristicas'] as List<dynamic>? ?? [];
                      final iaActiva = plan['ia_habilitada'] ?? false;
                      final cuotaIa = plan['ia_cuota_mensual'] ?? 0;
                      final isBasic = plan['nombre'].toString().toLowerCase() == 'básico' || plan['nombre'].toString().toLowerCase() == 'basico';

                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: ExpansionTile(
                          title: Text(plan['nombre'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          subtitle: Text('\$${plan['precio']} USD / mes', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                            child: const Icon(Icons.workspace_premium, color: AppColors.primaryPurple),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit, color: AppColors.info),
                            tooltip: 'Editar Precio',
                            onPressed: () => _editarPrecio(plan['id'], plan['nombre'], (plan['precio'] as num).toDouble()),
                          ),
                          children: [
                            const Divider(),
                            
                            // SECCIÓN DE IA DEL PLAN
                            SwitchListTile(
                              title: const Text('Habilitar IA para este plan', style: TextStyle(fontWeight: FontWeight.w600)),
                              value: iaActiva,
                              activeColor: AppColors.primaryPurple,
                              onChanged: (val) => _plansController.updatePlanAI(plan['id'], val, cuotaIa),
                            ),
                            if (iaActiva && !isBasic)
                              ListTile(
                                leading: const Icon(Icons.auto_awesome, color: Colors.amber),
                                title: const Text('Cuota Mensual de IA'),
                                subtitle: Text('$cuotaIa generaciones / mes'),
                                trailing: const Icon(Icons.edit, size: 20),
                                onTap: () => _editarCuotaIA(plan['id'], plan['nombre'], cuotaIa),
                              ),
                            const Divider(),
                            
                            // CARACTERÍSTICAS DEL PLAN
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Características Incluidas:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 8),
                                  ...features.map((f) => ListTile(
                                    dense: true,
                                    leading: const Icon(Icons.check_circle, color: AppColors.success, size: 20),
                                    title: Text(f['nombre_caracteristica']),
                                  )),
                                  if (features.isEmpty)
                                    const Text('No hay características registradas.', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                ),
        );
      },
    );
  }
}```

### 📄 lib/screens/owner_plans_management_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'owner_assign_plan_screen.dart';

class OwnerPlansManagementScreen extends StatefulWidget {
  const OwnerPlansManagementScreen({super.key});

  @override
  State<OwnerPlansManagementScreen> createState() => _OwnerPlansManagementScreenState();
}

class _OwnerPlansManagementScreenState extends State<OwnerPlansManagementScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _planes = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadPlanes();
  }

  Future<void> _loadPlanes() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('planes_suscripcion')
          .select('*, plan_caracteristicas(*)')
          .order('precio', ascending: true);
      setState(() => _planes = response);
    } catch (e) {
      debugPrint('Error cargando planes: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _editarPrecio(String planId, String nombre, double precioActual) async {
    final ctrl = TextEditingController(text: precioActual.toString());
    final nuevoPrecio = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Editar Precio: $nombre'),
        content: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(labelText: 'Precio en USD', prefixIcon: Icon(Icons.attach_money)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, double.tryParse(ctrl.text)),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (nuevoPrecio != null) {
      await _supabase.from('planes_suscripcion').update({'precio': nuevoPrecio}).eq('id', planId);
      _loadPlanes();
    }
  }

  Future<void> _agregarCaracteristica(String planId) async {
    final ctrl = TextEditingController();
    final nueva = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Agregar Característica'),
        content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Ej: Ofertas Ilimitadas')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
            child: const Text('Agregar'),
          ),
        ],
      ),
    );

    if (nueva != null && nueva.isNotEmpty) {
      await _supabase.from('plan_caracteristicas').insert({'plan_id': planId, 'nombre_caracteristica': nueva});
      _loadPlanes();
    }
  }

  Future<void> _eliminarCaracteristica(String featureId) async {
    await _supabase.from('plan_caracteristicas').delete().eq('id', featureId);
    _loadPlanes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Gestión de Planes', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add, color: Colors.black),
            tooltip: 'Asignar Plan a Comercio',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerAssignPlanScreen())),
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _planes.length,
              itemBuilder: (context, index) {
                final plan = _planes[index];
                final features = plan['plan_caracteristicas'] as List<dynamic>;

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ExpansionTile(
                    title: Text(plan['nombre'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('\$${plan['precio']} USD / mes', style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold)),
                    leading: CircleAvatar(
                      backgroundColor: primaryPurple.withOpacity(0.1),
                      child: Icon(Icons.workspace_premium, color: primaryPurple),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _editarPrecio(plan['id'], plan['nombre'], (plan['precio'] as num).toDouble()),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Características Incluidas:', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            ...features.map((f) => ListTile(
                              dense: true,
                              leading: const Icon(Icons.check_circle, color: Colors.green, size: 20),
                              title: Text(f['nombre_caracteristica']),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                                onPressed: () => _eliminarCaracteristica(f['id']),
                              ),
                            )),
                            TextButton.icon(
                              onPressed: () => _agregarCaracteristica(plan['id']),
                              icon: const Icon(Icons.add),
                              label: const Text('Agregar Característica'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}```

### 📄 lib/screens/owner_settings_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class OwnerSettingsScreen extends StatefulWidget {
  const OwnerSettingsScreen({super.key});

  @override
  State<OwnerSettingsScreen> createState() => _OwnerSettingsScreenState();
}

class _OwnerSettingsScreenState extends State<OwnerSettingsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _features = [];

  @override
  void initState() {
    super.initState();
    _loadFeatures();
  }

  Future<void> _loadFeatures() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase.from('configuracion_features').select('*').order('id');
      
      if (response.isEmpty) {
        await _supabase.from('configuracion_features').insert([
          {'nombre_feature': 'Asistente IA', 'estado_global': true},
          {'nombre_feature': 'Publicación por Voz', 'estado_global': true},
          {'nombre_feature': 'Pools Comunitarios', 'estado_global': true},
          {'nombre_feature': 'Módulo de Cupones', 'estado_global': true},
          {'nombre_feature': 'Delivery y Chasqui', 'estado_global': true},
        ]);
        _loadFeatures();
        return;
      }
      
      setState(() => _features = response);
    } catch (e) {
      debugPrint('Error cargando features: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleFeature(int id, bool currentState) async {
    try {
      await _supabase.from('configuracion_features').update({
        'estado_global': !currentState
      }).eq('id', id);
      
      _loadFeatures();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cambiar estado: $e'), backgroundColor: AppColors.error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Configuración Global', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Activa o desactiva módulos enteros de la aplicación para todos los usuarios. Útil para mantenimiento o lanzamientos por fases.',
                    style: TextStyle(fontSize: 13, color: AppColors.textDark),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _features.length,
                    itemBuilder: (context, index) {
                      final feature = _features[index];
                      final isActive = feature['estado_global'] ?? true;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: SwitchListTile(
                          title: Text(feature['nombre_feature'] ?? 'Módulo', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(isActive ? 'Activo en la App' : 'Desactivado'),
                          value: isActive,
                          activeColor: AppColors.primaryPurple,
                          onChanged: (val) => _toggleFeature(feature['id'], isActive),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}```

### 📄 lib/screens/owner_settings_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerSettingsScreen extends StatefulWidget {
  const OwnerSettingsScreen({super.key});

  @override
  State<OwnerSettingsScreen> createState() => _OwnerSettingsScreenState();
}

class _OwnerSettingsScreenState extends State<OwnerSettingsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _features = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadFeatures();
  }

  Future<void> _loadFeatures() async {
    setState(() => _isLoading = true);
    try {
      // Leemos la tabla que ya tenías en tu esquema
      final response = await _supabase.from('configuracion_features').select('*').order('id');
      
      // Si la tabla está vacía, insertamos las features por defecto para que el Owner las vea
      if (response.isEmpty) {
        await _supabase.from('configuracion_features').insert([
          {'nombre_feature': 'Asistente IA', 'estado_global': true},
          {'nombre_feature': 'Publicación por Voz', 'estado_global': true},
          {'nombre_feature': 'Pools Comunitarios', 'estado_global': true},
          {'nombre_feature': 'Módulo de Cupones', 'estado_global': true},
          {'nombre_feature': 'Delivery y Chasqui', 'estado_global': true},
        ]);
        _loadFeatures(); // Recargar
        return;
      }
      
      setState(() => _features = response);
    } catch (e) {
      debugPrint('Error cargando features: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleFeature(int id, bool currentState) async {
    try {
      await _supabase.from('configuracion_features').update({
        'estado_global': !currentState
      }).eq('id', id);
      
      _loadFeatures();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cambiar estado: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Configuración Global', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Activa o desactiva módulos enteros de la aplicación para todos los usuarios. Útil para mantenimiento o lanzamientos por fases.',
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _features.length,
                    itemBuilder: (context, index) {
                      final feature = _features[index];
                      final isActive = feature['estado_global'] ?? true;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: SwitchListTile(
                          title: Text(feature['nombre_feature'] ?? 'Módulo', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(isActive ? 'Activo en la App' : 'Desactivado'),
                          value: isActive,
                          activeColor: primaryPurple,
                          onChanged: (val) => _toggleFeature(feature['id'], isActive),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}```

### 📄 lib/screens/owner_user_management_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class OwnerUserManagementScreen extends StatefulWidget {
  const OwnerUserManagementScreen({super.key});

  @override
  State<OwnerUserManagementScreen> createState() => _OwnerUserManagementScreenState();
}

class _OwnerUserManagementScreenState extends State<OwnerUserManagementScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _usuarios = [];

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  Future<void> _loadUsuarios() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase.from('usuarios').select('id, nombre, email, rol').order('nombre', ascending: true);
      setState(() => _usuarios = response);
    } catch (e) {
      debugPrint('Error cargando usuarios: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _cambiarRol(String email, String nuevoRol) async {
    setState(() => _isLoading = true);
    try {
      await _supabase.rpc('assign_role', params: {
        'target_email': email,
        'new_role': nuevoRol,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rol actualizado a $nuevoRol.'), backgroundColor: AppColors.success),
        );
      }
      _loadUsuarios();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Gestión de Roles', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.refresh, color: AppColors.textDark), onPressed: _loadUsuarios)
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _usuarios.length,
              itemBuilder: (context, index) {
                final user = _usuarios[index];
                final rol = user['rol'] ?? 'user';
                
                Color roleColor = Colors.grey;
                if (rol == 'admin') roleColor = Colors.redAccent;
                if (rol == 'merchant') roleColor = Colors.blue;
                if (rol == 'owner') roleColor = Colors.purple;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: roleColor.withOpacity(0.1),
                      child: Icon(Icons.person, color: roleColor),
                    ),
                    title: Text(user['nombre'] ?? 'Sin nombre', style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(user['email'] ?? ''),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) => _cambiarRol(user['email'], value),
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'admin', child: Text('Hacer Administrador')),
                        const PopupMenuItem(value: 'merchant', child: Text('Hacer Comercio')),
                        const PopupMenuItem(value: 'user', child: Text('Hacer Cliente')),
                      ],
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: roleColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(rol.toUpperCase(), style: TextStyle(color: roleColor, fontWeight: FontWeight.bold, fontSize: 10)),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down, color: roleColor, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}```

### 📄 lib/screens/owner_user_management_screen2.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerUserManagementScreen extends StatefulWidget {
  const OwnerUserManagementScreen({super.key});

  @override
  State<OwnerUserManagementScreen> createState() => _OwnerUserManagementScreenState();
}

class _OwnerUserManagementScreenState extends State<OwnerUserManagementScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _usuarios = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  Future<void> _loadUsuarios() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase.from('usuarios').select('id, nombre, email, rol').order('nombre', ascending: true);
      setState(() => _usuarios = response);
    } catch (e) {
      debugPrint('Error cargando usuarios: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _cambiarRol(String email, String nuevoRol) async {
    setState(() => _isLoading = true);
    try {
      // Función RPC segura creada anteriormente
      await _supabase.rpc('assign_role', params: {
        'target_email': email,
        'new_role': nuevoRol,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rol actualizado a $nuevoRol.'), backgroundColor: Colors.green),
        );
      }
      _loadUsuarios();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Gestión de Roles', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadUsuarios)
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _usuarios.length,
              itemBuilder: (context, index) {
                final user = _usuarios[index];
                final rol = user['rol'] ?? 'user';
                
                Color roleColor = Colors.grey;
                if (rol == 'admin') roleColor = Colors.redAccent;
                if (rol == 'merchant') roleColor = Colors.blue;
                if (rol == 'owner') roleColor = Colors.purple;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: roleColor.withOpacity(0.1),
                      child: Icon(Icons.person, color: roleColor),
                    ),
                    title: Text(user['nombre'] ?? 'Sin nombre', style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(user['email'] ?? ''),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) => _cambiarRol(user['email'], value),
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'admin', child: Text('Hacer Administrador')),
                        const PopupMenuItem(value: 'merchant', child: Text('Hacer Comercio')),
                        const PopupMenuItem(value: 'user', child: Text('Hacer Cliente')),
                      ],
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: roleColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(rol.toUpperCase(), style: TextStyle(color: roleColor, fontWeight: FontWeight.bold, fontSize: 10)),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down, color: roleColor, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}```

### 📄 lib/screens/payment_request_modal.dart
```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart'; // <-- NUEVO
import 'package:supabase_flutter/supabase_flutter.dart'; // <-- NUEVO
import '../core/theme/app_theme.dart';
import '../controllers/subscription_request_controller.dart';

class PaymentRequestModal extends StatefulWidget {
  final String planName;
  final double amount;
  const PaymentRequestModal({super.key, required this.planName, required this.amount});

  @override
  State<PaymentRequestModal> createState() => _PaymentRequestModalState();
}

class _PaymentRequestModalState extends State<PaymentRequestModal> {
  final _requestController = SubscriptionRequestController();
  String _selectedMethod = 'Stripe'; // Stripe por defecto
  final _referenceCtrl = TextEditingController();
  Uint8List? _imageBytes;
  String? _imageName;
  bool _isStripeLoading = false; // <-- NUEVO

  @override
  void dispose() {
    _referenceCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() { _imageBytes = bytes; _imageName = picked.name; });
    }
  }

  // FUNCIÓN PARA PAGAR CON STRIPE
  Future<void> _pagarConStripe() async {
    setState(() => _isStripeLoading = true);
    try {
      final user = Supabase.instance.client.auth.currentUser!;
      final response = await Supabase.instance.client.functions.invoke(
        'create-stripe-session',
        body: {
          'planName': widget.planName,
          'amount': widget.amount,
          'userId': user.id,
          'userEmail': user.email,
        },
      );

      if (response.status == 200 && response.data['url'] != null) {
        final url = Uri.parse(response.data['url']);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
          if (mounted) Navigator.pop(context); // Cerrar modal al ir a Stripe
        }
      } else {
        throw Exception('Error al crear la sesión de pago.');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error)
        );
      }
    } finally {
      if (mounted) setState(() => _isStripeLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _requestController,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 24, left: 20, right: 20),
          decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Pagar Plan ${widget.planName}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Monto: \$${widget.amount}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                
                DropdownButtonFormField<String>(
                  value: _selectedMethod,
                  decoration: const InputDecoration(labelText: 'Método de Pago', prefixIcon: Icon(Icons.payment)),
                  items: ['Stripe', 'Pago Movil', 'Transferencia', 'Efectivo'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => setState(() => _selectedMethod = v!),
                ),
                const SizedBox(height: 12),

                // FLUJO DE STRIPE
                if (_selectedMethod == 'Stripe') ...[
                  const Text(
                    'Serás redirigido a la pasarela segura de Stripe para completar tu pago con tarjeta de crédito o débito.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6772E5)), // Color oficial de Stripe
                      onPressed: _isStripeLoading ? null : _pagarConStripe,
                      icon: _isStripeLoading 
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                          : const Icon(Icons.credit_card, color: Colors.white),
                      label: Text(
                        _isStripeLoading ? 'Conectando...' : 'Pagar con Tarjeta', 
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                ] else ...[
                  // FLUJO MANUAL (Pago Movil, Transferencia, Efectivo)
                  TextField(controller: _referenceCtrl, decoration: const InputDecoration(labelText: 'Número de Referencia / Ticket', prefixIcon: Icon(Icons.numbers))),
                  const SizedBox(height: 12),
                  
                  if (_selectedMethod == 'Efectivo' || _selectedMethod == 'Transferencia')
                    InkWell(
                      onTap: _pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: AppColors.bgTop, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)),
                        child: Row(
                          children: [
                            Icon(_imageBytes != null ? Icons.check_circle : Icons.upload_file, color: _imageBytes != null ? AppColors.success : Colors.grey),
                            const SizedBox(width: 12),
                            Expanded(child: Text(_imageBytes != null ? 'Comprobante subido' : 'Subir foto del comprobante', style: TextStyle(color: _imageBytes != null ? AppColors.success : Colors.grey))),
                          ],
                        ),
                      ),
                    ),
                  
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _requestController.isLoading ? null : () async {
                        final success = await _requestController.submitRequest(
                          planName: widget.planName,
                          method: _selectedMethod,
                          amount: widget.amount,
                          reference: _referenceCtrl.text.trim(),
                          imageBytes: _imageBytes,
                          imageName: _imageName,
                        );
                        if (success && mounted) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_requestController.successMessage!), backgroundColor: AppColors.success));
                        } else if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_requestController.errorMessage!), backgroundColor: AppColors.error));
                        }
                      },
                      child: _requestController.isLoading 
                          ? const CircularProgressIndicator(color: AppColors.white) 
                          : const Text('Enviar Solicitud'),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/planificar_compra_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlanificarCompraScreen extends StatefulWidget {
  const PlanificarCompraScreen({super.key});

  @override
  State<PlanificarCompraScreen> createState() => _PlanificarCompraScreenState();
}

class _PlanificarCompraScreenState extends State<PlanificarCompraScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = false;
  
  // Lista dinámica de productos
  final List<Map<String, dynamic>> _items = [
    {'nombre': '', 'cantidad': '1', 'descripcion': ''}
  ];

  String _sector = 'Mi ubicación actual (1000m a la redonda)';
  DateTime _fechaCompra = DateTime.now().add(const Duration(days: 1));
  
  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  void _agregarItem() {
    setState(() {
      _items.add({'nombre': '', 'cantidad': '1', 'descripcion': ''});
    });
  }

  void _eliminarItem(int index) {
    if (_items.length > 1) {
      setState(() => _items.removeAt(index));
    }
  }

  Future<void> _generarPlanificacion() async {
    // Validar que al menos un producto tenga nombre
    if (_items.every((item) => item['nombre'].toString().trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agrega al menos un producto a tu lista.'), backgroundColor: Colors.orange),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // Simulamos que ya tenemos la lat/lng del cliente (en producción se usa Geolocator)
      final latCliente = 10.4806; 
      final lngCliente = -66.9036;

      // 1. Guardar la Planificación en la Base de Datos
      final response = await _supabase.from('planes_compra').insert({
        'usuario_id': userId,
        'tipo_plan': 'Optimizado',
        'items_solicitados': _items,
        'estado': 'Buscando ofertas',
        'fecha_planificada': _fechaCompra.toIso8601String(),
        'sector_busqueda': _sector,
        'latitud_centro': latCliente,
        'longitud_centro': lngCliente,
        'radio_metros': 1000,
      }).select('id').single();

      final planId = response['id'];

      // 2. Motor de Búsqueda Inteligente (Llamamos a la función RPC de PostGIS)
      final ofertasCercanas = await _supabase.rpc('obtener_ofertas_cercanas', params: {
        'lat': latCliente,
        'lng': lngCliente,
        'radio_metros': 1000
      });

      // 3. Cruzamos la lista de deseos con las ofertas encontradas (Lógica de Negocio)
      // En un caso real, esto se procesa en el Backend (Edge Function) para mayor eficiencia.
      List<Map<String, dynamic>> resultados = [];
      
      for (var item in _items) {
        final nombreBuscado = item['nombre'].toString().toLowerCase();
        // Buscamos la oferta más barata que coincida
        final mejorOferta = ofertasCercanas.firstWhere(
          (o) => o['nombre_oferta'].toString().toLowerCase().contains(nombreBuscado), 
          orElse: () => null
        );

        if (mejorOferta != null) {
          resultados.add({
            'item': item,
            'oferta': mejorOferta
          });
        }
      }

      // 4. Si encontramos todas las ofertas, notificamos al cliente inmediatamente
      if (resultados.length == _items.length) {
        await _supabase.from('planes_compra').update({'estado': 'Ofertas Encontradas'}).eq('id', planId);
        
        // Guardamos temporalmente el resultado en el SharedPreferences o pasamos a la pantalla de resultados
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PlanResultsScreen(planId: planId, resultados: resultados))
          );
        }
      } else {
        // Si faltan productos, queda en "Buscando ofertas" y se notifica después
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Búsqueda en proceso. Te notificaremos cuando encontremos todos los productos al mejor precio.'), backgroundColor: Colors.blue),
          );
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Planificar mi Compra', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading 
        ? Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: primaryPurple),
              const SizedBox(height: 20),
              const Text('La IA está buscando los precios más bajos en tu zona...', style: TextStyle(color: Colors.black54)),
            ],
          ))
        : SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  child: const Text(
                    'Dinos qué necesitas y nuestro motor buscará los precios más bajos en un radio de 1000 metros a la redonda.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 20),

                // Lista de productos dinámica
                ..._items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  initialValue: item['nombre'],
                                  decoration: const InputDecoration(labelText: 'Producto (Ej: Harina PAN)', isDense: true),
                                  onChanged: (v) => item['nombre'] = v,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  initialValue: item['cantidad'],
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(labelText: 'Cant.', isDense: true),
                                  onChanged: (v) => item['cantidad'] = v,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _eliminarItem(index),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            initialValue: item['descripcion'],
                            decoration: const InputDecoration(labelText: 'Descripción / Marca (Opcional)', isDense: true),
                            onChanged: (v) => item['descripcion'] = v,
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                TextButton.icon(
                  onPressed: _agregarItem,
                  icon: Icon(Icons.add, color: primaryPurple),
                  label: Text('Agregar otro producto', style: TextStyle(color: primaryPurple)),
                ),

                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 24),

                // Ubicación
                ListTile(
                  leading: Icon(Icons.location_on, color: primaryPurple),
                  title: const Text('Sector de Búsqueda', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(_sector),
                  trailing: const Icon(Icons.map, color: Colors.grey),
                  onTap: () {
                    // Aquí abrirías el MapPickerScreen para definir el centro
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Fecha
                ListTile(
                  leading: Icon(Icons.calendar_today, color: primaryPurple),
                  title: const Text('Fecha de Compra', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${_fechaCompra.day}/${_fechaCompra.month}/${_fechaCompra.year}'),
                  trailing: const Icon(Icons.edit, color: Colors.grey),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _fechaCompra,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    );
                    if (date != null) setState(() => _fechaCompra = date);
                  },
                ),

                const SizedBox(height: 40),

                SizedBox(
                  height: 55,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _generarPlanificacion,
                    icon: const Icon(Icons.auto_awesome, color: Colors.white),
                    label: const Text('Buscar Ofertas', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

// --- PANTALLA DE RESULTADOS (Notificación en App) ---
class PlanResultsScreen extends StatelessWidget {
  final String planId;
  final List<Map<String, dynamic>> resultados;

  const PlanResultsScreen({super.key, required this.planId, required this.resultados});

  @override
  Widget build(BuildContext context) {
    final Color primaryPurple = const Color(0xFF6B4EFF);
    
    double totalUsd = 0;
    for (var r in resultados) {
      totalUsd += (r['oferta']['precio'] as num).toDouble();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFECE2FC),
      appBar: AppBar(
        title: const Text('¡Ofertas Encontradas!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const Icon(Icons.check_circle, color: Colors.white, size: 40),
                const SizedBox(height: 8),
                const Text('¡Hemos encontrado todos tus productos al mejor precio!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text('Total: \$${totalUsd.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          ...resultados.map((r) {
            final oferta = r['oferta'];
            final item = r['item'];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: primaryPurple.withOpacity(0.1),
                      child: Icon(Icons.store, color: primaryPurple),
                    ),
                    title: Text(oferta['nombre_comercio'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(oferta['direccion']),
                    trailing: Text('\$${oferta['precio']}', style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item['cantidad']}x ${item['nombre']}', style: const TextStyle(fontWeight: FontWeight.w500)),
                        TextButton.icon(
                          onPressed: () {
                            // Aquí abrirías la URL de Google Maps
                            // launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=${oferta['latitud']},${oferta['longitud']}'));
                          },
                          icon: const Icon(Icons.map, size: 16),
                          label: const Text('Ver en Maps'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: primaryPurple),
                        onPressed: () {
                          // Lógica para generar el QR de ESTE producto específico
                        },
                        child: const Text('Comprar este producto', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}```

### 📄 lib/screens/purchase_qr_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // <-- Necesitamos esta dependencia
import '../core/theme/app_theme.dart';

class PurchaseQrScreen extends StatelessWidget {
  final String qrToken;
  final double total;
  final String nombreComercio;

  const PurchaseQrScreen({
    super.key,
    required this.qrToken,
    required this.total,
    required this.nombreComercio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Tu Código de Compra')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: AppColors.success, size: 80),
              const SizedBox(height: 16),
              const Text(
                '¡Compra Registrada!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
              const SizedBox(height: 8),
              Text(
                'Muestra este código en $nombreComercio para retirar tu producto.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: AppColors.textLight),
              ),
              const SizedBox(height: 32),
              
              // CONTENEDOR DEL QR
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Column(
                  children: [
                    QrImageView(
                      data: qrToken,
                      version: QrVersions.auto,
                      size: 200.0,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: AppColors.darkCardColor,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: AppColors.darkCardColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Total: \$${total.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryPurple),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              const Text(
                'Este código es único y personal. No lo compartas con nadie más.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst); // Volver al dashboard
                },
                child: const Text('Volver al Inicio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}```

### 📄 lib/screens/report_modal_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/report_controller.dart';

class ReportModalScreen extends StatefulWidget {
  final String comercioId;
  final String nombreComercio;
  
  const ReportModalScreen({
    super.key, 
    required this.comercioId, 
    required this.nombreComercio
  });

  @override
  State<ReportModalScreen> createState() => _ReportModalScreenState();
}

class _ReportModalScreenState extends State<ReportModalScreen> {
  final _reportController = ReportController();
  final _descCtrl = TextEditingController();
  
  String _selectedMotive = 'Producto Falso o Engañoso';
  final List<String> _motives = [
    'Producto Falso o Engañoso',
    'Mal Estado del Producto',
    'Mala Atención al Cliente',
    'Incumplimiento de Entrega',
    'Lenguaje Ofensivo',
    'Otro'
  ];

  @override
  void dispose() {
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _enviarReporte() async {
    if (_descCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, describe el problema.'), backgroundColor: AppColors.warning),
      );
      return;
    }

    final success = await _reportController.submitReport(
      comercioId: widget.comercioId,
      motivo: _selectedMotive,
      descripcion: _descCtrl.text,
    );

    if (success && mounted) {
      Navigator.pop(context); // Cierra el modal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_reportController.successMessage!), backgroundColor: AppColors.success),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_reportController.errorMessage!), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _reportController,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 24, left: 20, right: 20),
          decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.report_problem, color: AppColors.error, size: 50),
                const SizedBox(height: 12),
                Text(
                  'Reportar a ${widget.nombreComercio}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ayúdanos a mantener OfVe seguro. Si experimentaste un problema, cuéntanos qué pasó.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: _selectedMotive,
                  decoration: const InputDecoration(labelText: 'Motivo del Reporte', prefixIcon: Icon(Icons.gavel)),
                  items: _motives.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                  onChanged: (v) => setState(() => _selectedMotive = v!),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: _descCtrl,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Describe el problema en detalle',
                    prefixIcon: Icon(Icons.description),
                    alignLabelWithHint: true,
                  ),
                ),
                
                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                    onPressed: _reportController.isLoading ? null : _enviarReporte,
                    child: _reportController.isLoading
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('Enviar Reporte', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/screens/reset_password_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _updatePassword() async {
    final password = _passwordController.text.trim();
    final confirm = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, llena todos los campos.')));
      return;
    }
    if (password != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Las contraseñas no coinciden.')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      await Supabase.instance.client.auth.updateUser(
        UserAttributes(password: password),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Contraseña actualizada con éxito!')));
        // Como ya está logueado, el AuthGate lo mandará al Home automáticamente
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.message}')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      appBar: AppBar(
        title: const Text('Nueva Contraseña'),
        backgroundColor: const Color(0xFF2D3A5A),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Evita que regresen al login por error
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Icon(Icons.lock_reset, size: 80, color: Color(0xFF6B4EFF)),
              const SizedBox(height: 20),
              const Text('Crea tu nueva contraseña', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2D3A5A))),
              const SizedBox(height: 30),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Nueva Contraseña', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Confirmar Contraseña', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B4EFF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isLoading ? null : _updatePassword,
                  child: _isLoading 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Guardar Contraseña', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}```

### 📄 lib/screens/update_password_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart'; // <-- Importamos el Login para forzar la redirección

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;

  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _updatePassword() async {
    final password = _passwordController.text.trim();
    final confirm = _confirmController.text.trim();

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La contraseña debe tener al menos 6 caracteres.'), backgroundColor: Colors.red),
      );
      return;
    }

    if (password != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Las contraseñas no coinciden.'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // 1. Actualizamos la contraseña en Supabase
      await Supabase.instance.client.auth.updateUser(
        UserAttributes(password: password),
      );

      if (mounted) {
        // 2. Mostramos mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Contraseña actualizada con éxito!'), 
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        
        // 3. Esperamos 2 segundos para que el usuario lea el mensaje
        await Future.delayed(const Duration(seconds: 2));

        // 4. Cerramos la sesión actual (por seguridad)
        await Supabase.instance.client.auth.signOut();

        // 5. REDIRECCIÓN FORZADA AL LOGIN
        // Usamos pushAndRemoveUntil para borrar todo el historial de navegación
        if (mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false, // Elimina todas las rutas anteriores
          );
        }
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.message}'), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error inesperado: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.lock_reset, size: 80, color: primaryPurple),
                const SizedBox(height: 20),
                const Text(
                  'Restablecer Contraseña',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ingresa tu nueva contraseña para acceder a tu cuenta.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 30),
                
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Nueva Contraseña',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscureText = !_obscureText),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),
                
                TextField(
                  controller: _confirmController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Confirmar Contraseña',
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 30),
                
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _isLoading ? null : _updatePassword,
                    child: _isLoading
                        ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('Guardar Contraseña', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}```

### 📄 lib/screens/voice_offer_screen.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/voice_offer_controller.dart';

class VoiceOfferScreen extends StatefulWidget {
  const VoiceOfferScreen({super.key});

  @override
  State<VoiceOfferScreen> createState() => _VoiceOfferScreenState();
}

class _VoiceOfferScreenState extends State<VoiceOfferScreen> {
  final _voiceController = VoiceOfferController();

  @override
  void dispose() {
    _voiceController.dispose();
    super.dispose();
  }

  Future<void> _publicar() async {
    final success = await _voiceController.publishFastOffer();
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Oferta creada por voz! Revísala y edítala en tu Inventario.'), backgroundColor: AppColors.success),
      );
      Navigator.pop(context);
    } else if (mounted && _voiceController.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_voiceController.errorMessage!), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _voiceController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Publicar por Voz')),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text(
                  'Presiona el micrófono y dicta tu oferta.\nEjemplo: "Vendo harina PAN a 2 dólares, tengo 50 unidades".',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: AppColors.textLight, height: 1.5),
                ),
                const SizedBox(height: 30),

                // CONTENEDOR DE TRANSCRIPCIÓN
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))],
                      border: Border.all(color: _voiceController.isListening ? AppColors.primaryPurple : Colors.transparent, width: 2),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _voiceController.transcript.isEmpty 
                          ? 'El texto aparecerá aquí...' 
                          : _voiceController.transcript,
                        style: TextStyle(
                          fontSize: 20,
                          color: _voiceController.transcript.isEmpty ? Colors.grey[400] : AppColors.textDark,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),

                // BOTÓN DEL MICRÓFONO GIGANTE
                GestureDetector(
                  onTap: () {
                    if (_voiceController.isListening) {
                      _voiceController.stopListening();
                    } else {
                      _voiceController.startListening();
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _voiceController.isListening ? AppColors.error : AppColors.primaryPurple,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: (_voiceController.isListening ? AppColors.error : AppColors.primaryPurple).withOpacity(0.4),
                          blurRadius: _voiceController.isListening ? 30 : 15,
                          spreadRadius: _voiceController.isListening ? 10 : 0,
                        )
                      ],
                    ),
                    child: Icon(
                      _voiceController.isListening ? Icons.stop : Icons.mic,
                      color: AppColors.white,
                      size: 50,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                Text(
                  _voiceController.isListening ? 'Escuchando...' : 'Toca para dictar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: _voiceController.isListening ? AppColors.error : AppColors.primaryPurple,
                  ),
                ),

                const SizedBox(height: 30),

                // BOTÓN DE PUBLICAR
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: (_voiceController.isListening || _voiceController.isLoading || _voiceController.transcript.isEmpty)
                        ? null
                        : _publicar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    icon: _voiceController.isLoading 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                        : const Icon(Icons.check_circle, color: AppColors.white),
                    label: Text(
                      _voiceController.isLoading ? 'Guardando...' : 'Publicar Oferta Rápida',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}```

### 📄 lib/services/auth_service.dart
```dart
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _redirectUrl = 'https://fluffy-journey-qvrq7pgv5gxcxxq7-8080.app.github.dev/';

  Future<AuthResponse> login(String email, String password) async {
    return await _supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> register({
    required String email,
    required String password,
    required String role,
    required String name,
    required bool isAdult,
    String? storeName,
    String? rif,
  }) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: _redirectUrl,
      data: {
        'nombre': role == 'merchant' ? storeName : name,
        'rol': role,
        'mayor_de_edad': isAdult,
      },
    );
  }

  Future<void> resetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email, redirectTo: _redirectUrl);
  }

  Future<void> logout() async {
    await _supabase.auth.signOut();
  }
}```

### 📄 lib/services/bcv_service.dart
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class BcvService {
  // Endpoint público y gratuito de Crom Studio (sin API Key)
  static const String _baseUrl = 'https://datos.cromstudio.com.ve/tasa';

  /// Obtiene la tasa oficial del dólar (USD) según el BCV.
  /// Devuelve el valor numérico o lanza una excepción si falla.
  static Future<double> getDollarRate() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // La estructura es: { "tasas": { "USD": 857.8876, "EUR": ... } }
        final double rate = (data['tasas']['USD'] as num).toDouble();
        return rate;
      } else {
        throw Exception('Error al obtener la tasa BCV. Código: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('No se pudo conectar con el servicio de tasa BCV: $e');
    }
  }
}```

### 📄 lib/widgets/notification_bell.dart
```dart
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../screens/notifications_screen.dart';
import '../controllers/notifications_controller.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  State<NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  final _notificationsController = NotificationsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _notificationsController,
      builder: (context, child) {
        return Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, size: 28, color: AppColors.textDark),
              tooltip: 'Notificaciones',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationsScreen()),
                );
              },
            ),
            if (_notificationsController.unreadCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '${_notificationsController.unreadCount}',
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}```

## 🗄️ ESQUEMA SQL
*No se encontró carpeta sql/ o supabase/ con archivos .sql*
