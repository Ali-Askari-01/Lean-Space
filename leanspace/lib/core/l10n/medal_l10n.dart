import 'app_localizations.dart';
import '../../features/insights/domain/medals.dart';

extension MedalL10n on AppLocalizations {
  String medalTitleFor(Medal medal) => medalTitleForId(medal.id);

  String medalSubtitleFor(Medal medal) => medalSubtitleForId(medal.id);

  String medalDescriptionFor(Medal medal) => medalDescriptionForId(medal.id);

  String medalTitleForId(String id) {
    return _titleMap[id] ?? id;
  }

  String medalSubtitleForId(String id) {
    return _subtitleMap[id] ?? '';
  }

  String medalDescriptionForId(String id) {
    return _descriptionMap[id] ?? '';
  }

  Map<String, String> get _titleMap => {
        'first_spark': medal_id_first_spark,
        'triple_seed': medal_id_triple_seed,
        'dozen_sower': medal_id_dozen_sower,
        'quarter_century': medal_id_quarter_century,
        'productivity_titan': medal_id_productivity_titan,
        'century_planter': medal_id_century_planter,
        'clean_day': medal_id_clean_day,
        'triple_perfect': medal_id_triple_perfect,
        'perfect_week': medal_id_perfect_week,
        'two_week_chain': medal_id_two_week_chain,
        'iron_chain': medal_id_iron_chain,
        'quarterly_chain': medal_id_quarterly_chain,
        'vital_priority': medal_id_vital_priority,
        'spark_priority': medal_id_spark_priority,
        'note_taker': medal_id_note_taker,
        'left_behind_rescuer': medal_id_left_behind_rescuer,
        'first_sprout': medal_id_first_sprout,
        'trio_sprout': medal_id_trio_sprout,
        'week_of_growth': medal_id_week_of_growth,
        'fortnight_floret': medal_id_fortnight_floret,
        'rooted_master': medal_id_rooted_master,
        'half_year_bloom': medal_id_half_year_bloom,
        'garden_keeper': medal_id_garden_keeper,
        'hydration_hero': medal_id_hydration_hero,
        'mindful_mover': medal_id_mindful_mover,
        'devoted_keeper': medal_id_devoted_keeper,
        'tending_notes': medal_id_tending_notes,
      };

  Map<String, String> get _subtitleMap => {
        'first_spark': medal_sub_first_spark,
        'triple_seed': medal_sub_triple_seed,
        'dozen_sower': medal_sub_dozen_sower,
        'quarter_century': medal_sub_quarter_century,
        'productivity_titan': medal_sub_productivity_titan,
        'century_planter': medal_sub_century_planter,
        'clean_day': medal_sub_clean_day,
        'triple_perfect': medal_sub_triple_perfect,
        'perfect_week': medal_sub_perfect_week,
        'two_week_chain': medal_sub_two_week_chain,
        'iron_chain': medal_sub_iron_chain,
        'quarterly_chain': medal_sub_quarterly_chain,
        'vital_priority': medal_sub_vital_priority,
        'spark_priority': medal_sub_spark_priority,
        'note_taker': medal_sub_note_taker,
        'left_behind_rescuer': medal_sub_left_behind_rescuer,
        'first_sprout': medal_sub_first_sprout,
        'trio_sprout': medal_sub_trio_sprout,
        'week_of_growth': medal_sub_week_of_growth,
        'fortnight_floret': medal_sub_fortnight_floret,
        'rooted_master': medal_sub_rooted_master,
        'half_year_bloom': medal_sub_half_year_bloom,
        'garden_keeper': medal_sub_garden_keeper,
        'hydration_hero': medal_sub_hydration_hero,
        'mindful_mover': medal_sub_mindful_mover,
        'devoted_keeper': medal_sub_devoted_keeper,
        'tending_notes': medal_sub_tending_notes,
      };

  Map<String, String> get _descriptionMap => {
        'first_spark': medal_desc_first_spark,
        'triple_seed': medal_desc_triple_seed,
        'dozen_sower': medal_desc_dozen_sower,
        'quarter_century': medal_desc_quarter_century,
        'productivity_titan': medal_desc_productivity_titan,
        'century_planter': medal_desc_century_planter,
        'clean_day': medal_desc_clean_day,
        'triple_perfect': medal_desc_triple_perfect,
        'perfect_week': medal_desc_perfect_week,
        'two_week_chain': medal_desc_two_week_chain,
        'iron_chain': medal_desc_iron_chain,
        'quarterly_chain': medal_desc_quarterly_chain,
        'vital_priority': medal_desc_vital_priority,
        'spark_priority': medal_desc_spark_priority,
        'note_taker': medal_desc_note_taker,
        'left_behind_rescuer': medal_desc_left_behind_rescuer,
        'first_sprout': medal_desc_first_sprout,
        'trio_sprout': medal_desc_trio_sprout,
        'week_of_growth': medal_desc_week_of_growth,
        'fortnight_floret': medal_desc_fortnight_floret,
        'rooted_master': medal_desc_rooted_master,
        'half_year_bloom': medal_desc_half_year_bloom,
        'garden_keeper': medal_desc_garden_keeper,
        'hydration_hero': medal_desc_hydration_hero,
        'mindful_mover': medal_desc_mindful_mover,
        'devoted_keeper': medal_desc_devoted_keeper,
        'tending_notes': medal_desc_tending_notes,
      };

  String medalTierTagline(MedalTier tier) => switch (tier) {
        MedalTier.sprout => medalTierTaglineSprout,
        MedalTier.common => medalTierTaglineCommon,
        MedalTier.rare => medalTierTaglineRare,
        MedalTier.epic => medalTierTaglineEpic,
        MedalTier.legendary => medalTierTaglineLegendary,
      };

  String medalTierLabel(MedalTier tier) => switch (tier) {
        MedalTier.sprout => medalTierSprout,
        MedalTier.common => medalTierCommon,
        MedalTier.rare => medalTierRare,
        MedalTier.epic => medalTierEpic,
        MedalTier.legendary => medalTierLegendary,
      };

  String medalCategoryLabel(MedalCategory category) => switch (category) {
        MedalCategory.task => medalCategoryTasks,
        MedalCategory.habit => medalCategoryHabits,
        MedalCategory.streak => medalCategoryStreaks,
        MedalCategory.mastery => medalCategoryMastery,
      };
}

/// Localized display helpers for medals (titles still from catalogue until
/// per-medal ARB keys are generated).
extension MedalDisplayX on Medal {
  String localizedTitle(AppLocalizations l10n) => l10n.medalTitleFor(this);
  String localizedSubtitle(AppLocalizations l10n) => l10n.medalSubtitleFor(this);
  String localizedDescription(AppLocalizations l10n) =>
      l10n.medalDescriptionFor(this);
}

extension MedalTierL10n on MedalTier {
  String localizedLabel(AppLocalizations l10n) => l10n.medalTierLabel(this);
  String localizedTagline(AppLocalizations l10n) => l10n.medalTierTagline(this);
}

extension MedalCategoryL10n on MedalCategory {
  String localizedLabel(AppLocalizations l10n) => l10n.medalCategoryLabel(this);
}
