import java.io.File
import java.util.Properties
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") apply false
}

// Apply only when google-services.json is present (Firebase / FCM).
val hasGoogleServices =
    listOf(
        "google-services.json",
        "src/dev/google-services.json",
        "src/prod/google-services.json",
        "src/debug/google-services.json",
    ).any { file(it).exists() }
if (hasGoogleServices) {
    apply(plugin = "com.google.gms.google-services")
}

fun convertToValidVersionCode(versionCodeStr: String): Int {
    return try {
        val versionCode = versionCodeStr.toLong()
        // Date-based codes (YYYYMMDDHHMM) can exceed Int.MAX_VALUE — use last 9 digits.
        if (versionCode > Int.MAX_VALUE) {
            versionCodeStr.takeLast(9).toInt()
        } else {
            versionCode.toInt()
        }
    } catch (_: Exception) {
        1
    }
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystorePropertiesFile.inputStream().use { keystoreProperties.load(it) }
}

/**
 * Shared release keystore for both flavors.
 * Prefer CI file `android/androidkeystore.jks`, else `storeFile` from key.properties.
 */
fun resolveReleaseStoreFile(): File? {
    val ciStore = rootProject.file("androidkeystore.jks")
    if (ciStore.exists()) return ciStore
    val fromProp = keystoreProperties.getProperty("storeFile") ?: return null
    val file = rootProject.file(fromProp)
    return file.takeIf { it.exists() }
}

fun hasReleaseSigning(): Boolean {
    if (!keystorePropertiesFile.exists()) return false
    return !keystoreProperties.getProperty("keyAlias").isNullOrBlank() &&
        !keystoreProperties.getProperty("keyPassword").isNullOrBlank() &&
        !keystoreProperties.getProperty("storePassword").isNullOrBlank() &&
        resolveReleaseStoreFile() != null
}

android {
    namespace = "com.vent.ventingMobileApp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
    }

    defaultConfig {
        applicationId = "com.vent.ventingMobileApp"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = convertToValidVersionCode(
            (project.findProperty("versionCode") ?: flutter.versionCode).toString(),
        )
        versionName = (project.findProperty("versionName") ?: flutter.versionName).toString()
        multiDexEnabled = true
    }

    signingConfigs {
        if (hasReleaseSigning()) {
            create("release") {
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
                storePassword = keystoreProperties.getProperty("storePassword")
                storeFile = resolveReleaseStoreFile()
            }
        }
    }

    flavorDimensions += "default"
    productFlavors {
        create("dev") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "Venting Dev")
            manifestPlaceholders["appIcon"] = "@mipmap/ic_launcher_dev"
            manifestPlaceholders["appIconRound"] = "@mipmap/ic_launcher_dev_round"
            if (hasReleaseSigning()) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
        create("prod") {
            dimension = "default"
            resValue("string", "app_name", "Venting")
            manifestPlaceholders["appIcon"] = "@mipmap/ic_launcher"
            manifestPlaceholders["appIconRound"] = "@mipmap/ic_launcher_round"
            if (hasReleaseSigning()) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            isDebuggable = false
            signingConfig =
                if (hasReleaseSigning()) {
                    signingConfigs.getByName("release")
                } else {
                    // Local `flutter run --release` without a keystore still works.
                    signingConfigs.getByName("debug")
                }
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                "proguard-rules.pro",
            )
            ndk {
                debugSymbolLevel = "SYMBOL_TABLE"
            }
        }

        debug {
            isDebuggable = true
            isMinifyEnabled = false
            isShrinkResources = false
            // Keep debug installs easy — always use the Android debug keystore.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    lint {
        checkReleaseBuilds = false
        disable += "InvalidPackage"
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_17)
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
