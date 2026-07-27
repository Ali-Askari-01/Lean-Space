# Daily Stitch — R8 / ProGuard rules for release builds.
#
# We rely on R8 with full mode to strip and rename. The keep rules below
# cover the plugins that use reflection, JNI, or Parcelable.

# ---------------------------------------------------------------------
# Flutter / Play Core
# ---------------------------------------------------------------------
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Supabase / AppAuth uses reflection
-keep class io.supabase.** { *; }
-keep class net.openid.appauth.** { *; }

# ---------------------------------------------------------------------
# in_app_purchase / Google Play Billing
# ---------------------------------------------------------------------
-keep class com.android.billingclient.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.** { *; }

# ---------------------------------------------------------------------
# home_widget (uses reflection on AppWidgetProvider subclasses)
# ---------------------------------------------------------------------
-keep class * extends android.appwidget.AppWidgetProvider
-keep class es.antonborri.home_widget.** { *; }

# ---------------------------------------------------------------------
# flutter_local_notifications
# ---------------------------------------------------------------------
-keep class com.dexterous.** { *; }
-dontwarn com.dexterous.**

# ---------------------------------------------------------------------
# AndroidX core library desugaring helpers
# ---------------------------------------------------------------------
-keep class j$.** { *; }
-dontwarn j$.**

# ---------------------------------------------------------------------
# Parcelable creators (Android requirement)
# ---------------------------------------------------------------------
-keepclassmembers class * implements android.os.Parcelable {
    public static final ** CREATOR;
}

# ---------------------------------------------------------------------
# Kotlin metadata / serialization (we use kotlin.android)
# ---------------------------------------------------------------------
-keep class kotlin.Metadata { *; }
-keepattributes *Annotation*

# ---------------------------------------------------------------------
# Don't warn on missing classes from optional Play Services modules
# ---------------------------------------------------------------------
-dontwarn com.google.android.play.core.**
-dontwarn com.google.errorprone.annotations.**
