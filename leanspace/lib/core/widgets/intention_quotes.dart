import 'dart:math';

import '../l10n/app_localizations.dart';

class IntentionQuote {
  const IntentionQuote(this.title, this.body);
  final String title;
  final String body;
}

/// Rotating motivational lines for the add-task sheet.
class IntentionQuotes {
  const IntentionQuotes._();

  static IntentionQuote pickFrom(AppLocalizations l10n) {
    final all = _all(l10n);
    return all[Random().nextInt(all.length)];
  }

  static List<IntentionQuote> _all(AppLocalizations l10n) => [
        IntentionQuote(l10n.intentionTitle1, l10n.intentionBody1),
        IntentionQuote(l10n.intentionTitle2, l10n.intentionBody2),
        IntentionQuote(l10n.intentionTitle3, l10n.intentionBody3),
        IntentionQuote(l10n.intentionTitle4, l10n.intentionBody4),
        IntentionQuote(l10n.intentionTitle5, l10n.intentionBody5),
        IntentionQuote(l10n.intentionTitle6, l10n.intentionBody6),
        IntentionQuote(l10n.intentionTitle7, l10n.intentionBody7),
        IntentionQuote(l10n.intentionTitle8, l10n.intentionBody8),
      ];
}
