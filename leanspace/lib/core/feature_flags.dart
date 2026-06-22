/// Temporary switches while building and dogfooding the app.
abstract final class FeatureFlags {
  /// When true, every Pro feature is unlocked and billing is disabled.
  /// Flip to false before shipping subscriptions.
  static const unlockAllFeatures = true;

  static const enableSubscriptions = false;
}
