allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// use this to force all dependencies to use a java and kotlin version
subprojects {
    afterEvaluate {
        if (plugins.hasPlugin("com.android.application") || plugins.hasPlugin("com.android.library")) {
            extensions.configure<com.android.build.gradle.BaseExtension> {
                ndkVersion = "29.0.13113456"
                compileOptions {
                    //sourceCompatibility = JavaVersion.VERSION_11
                    //targetCompatibility = JavaVersion.VERSION_11
                }
            }
        }
    }

    tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
        kotlinOptions {
            //jvmTarget = "11"
        }
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
