# Flutter ProGuard rules
-keep class io.flutter.** { *; }
-dontwarn io.flutter.embedding.**

# Keep GetX related classes (since you are using GetX)
-keep class com.github.** { *; }
-keep class org.kodein.** { *; }

# Keep Animated Text Kit classes
-keep class com.aagarwal.animated_text_kit.** { *; }

# Keep Lucide Icons classes if needed
-keep class **.lucide_icons.** { *; }

# Keep url_launcher classes
-keep class io.flutter.plugins.urllauncher.** { *; }

# Prevent removal of all Flutter plugins
-keep class io.flutter.plugins.** { *; }

# General rules to avoid stripping essential methods/classes
-keep class com.yourpackage.** { *; }  # Replace with your app's actual package name

# Suppress warnings for missing references
-dontwarn com.google.**
-dontwarn androidx.**
-dontwarn io.flutter.**
