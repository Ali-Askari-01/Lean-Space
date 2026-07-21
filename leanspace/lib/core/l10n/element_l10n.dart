import '../widgets/growth_widgets.dart';
import 'app_localizations.dart';

extension HabitElementL10n on AppLocalizations {
  String elementLabel(HabitElement e) => switch (e) {
        HabitElement.water => elementLabelWater,
        HabitElement.light => elementLabelLight,
        HabitElement.soil => elementLabelSoil,
        HabitElement.breeze => elementLabelBreeze,
      };

  String elementTagline(HabitElement e) => switch (e) {
        HabitElement.water => elementTaglineWater,
        HabitElement.light => elementTaglineLight,
        HabitElement.soil => elementTaglineSoil,
        HabitElement.breeze => elementTaglineBreeze,
      };

  String elementWhen(HabitElement e) => switch (e) {
        HabitElement.water => elementWhenWater,
        HabitElement.light => elementWhenLight,
        HabitElement.soil => elementWhenSoil,
        HabitElement.breeze => elementWhenBreeze,
      };
}

extension BloomTierL10n on AppLocalizations {
  String bloomTierLabel(int streak) {
    if (streak >= 30) return bloomTierMastery;
    if (streak >= 14) return bloomTierStrong;
    if (streak >= 7) return bloomTierGrowing;
    if (streak >= 1) return bloomTierSprouting;
    return bloomTierLocked;
  }
}
