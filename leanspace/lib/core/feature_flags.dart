/// Temporary switches while building and dogfooding the app.
abstract final class FeatureFlags {
  /// When true, every Pro feature is unlocked and billing is disabled.
  /// Use only for local dogfooding / screenshot capture. Flip to false
  /// before any external build.
  static const unlockAllFeatures = false;

  /// When true, the subscription controller wires up and the paywall
  /// surface is reachable. Always true in release builds.
  static const enableSubscriptions = true;
}
