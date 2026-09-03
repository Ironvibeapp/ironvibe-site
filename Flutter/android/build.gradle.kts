allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Play Console flags file_picker 10.3.10 for BitmapFactory.decodeStream without Options.
// Apply the inSampleSize patch before that module compiles (does not vendor the plugin).
subprojects {
    if (name == "file_picker") {
        val patch = rootProject.file("patches/file_picker/FileUtils.kt")
        val dest = file("src/main/kotlin/com/mr/flutter/plugin/filepicker/FileUtils.kt")
        if (patch.exists()) {
            patch.copyTo(dest, overwrite = true)
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
