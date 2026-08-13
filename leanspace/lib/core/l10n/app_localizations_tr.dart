// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

  @override
  String get tabToday => 'BugÃ¼n';

  @override
  String get tabProgress => 'Ä°lerleme';

  @override
  String get tabYou => 'Sen';

  @override
  String get navMyDay => 'GÃ¼nÃ¼m';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get navHelp => 'YardÄ±m & Destek';

  @override
  String get navHistory => 'Son 7 GÃ¼n';

  @override
  String get navLeftBehind => 'Geri Kalanlar';

  @override
  String get navInsights => 'Ä°lerlemen';

  @override
  String get navMedals => 'MadalyalarÄ±m';

  @override
  String get navManagePro => 'Pro aboneliÄŸini yÃ¶net';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Gece yarÄ±sÄ±nda Ã§alÄ±ÅŸÄ±yor musun';

  @override
  String get greetingMorning => 'GÃ¼naydÄ±n, GÃ¼nÄ±ÅŸÄ±ÄŸÄ±!';

  @override
  String get greetingAfternoon => 'Ä°yi gÃ¼nler, ArkadaÅŸ';

  @override
  String get greetingEvening => 'Ä°yi akÅŸamlar, Åžampiyon';

  @override
  String get greetingNight => 'Ä°yi dinleniyorsun, Koruyucu?';

  @override
  String todayTasksCount(String done, String total) {
    return 'BugÃ¼n Â· $done/$total gÃ¶rev';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done/$total alÄ±ÅŸkanlÄ±k';
  }

  @override
  String get todayChainGrows => 'ZÄ°NCÄ°R SEN BÄ°TÄ°RÄ°NCE BÃœYÃœR';

  @override
  String get todayChainComplete =>
      'ZÄ°NCÄ°R TAMAMLANDI Â· BAHÃ‡EYÄ° YARIN SÃœSLE';

  @override
  String get taskCapInfo => 'Neden 5 gÃ¶rev sÄ±nÄ±rlamasÄ± var?';

  @override
  String get taskCapDiscipline => 'Ã–NCE DÄ°SÄ°PLÄ°N TASARIMI';

  @override
  String get taskCapTitle =>
      'GÃ¼nÃ¼nÃ¼ kasÄ±tlÄ± olarak 5 gÃ¶revle sÄ±nÄ±rlÄ±yoruz.';

  @override
  String get taskCapBody =>
      'KÄ±sa zincirler uzun olanlardan daha iyidir. 5\'ten 3\'Ã¼nÃ¼ bitirip kazanma hissini yaÅŸamak, 10\'dan 8\'ini bÄ±rakÄ±p kaybetme hissini yaÅŸamaktan daha olasÄ±dÄ±r.';

  @override
  String get taskCapBulletDone => 'Tamamlanan gÃ¶revler zincirine eklenir';

  @override
  String get taskCapBulletDoneBody =>
      '5\'ini de tamamladÄ±ÄŸÄ±n bir gÃ¼n, serini bir gÃ¼n uzatÄ±r.';

  @override
  String get taskCapBulletMissed =>
      'KaÃ§Ä±rÄ±lan gÃ¶revler Geri Kalanlar\'a gider';

  @override
  String get taskCapBulletMissedBody =>
      'Gece yarÄ±sÄ±nda tamamlanmamÄ±ÅŸ gÃ¶revler Geri Kalanlar\'da belirir. Sadece hÃ¢lÃ¢ Ã¶nemli olanlarÄ± tekrar ekle.';

  @override
  String get taskCapBulletFreeze => 'Seri dondurmasÄ± bir kaÃ§Ä±rmayÄ± affeder';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro sana ayda 2 seri dondurmasÄ± verir â€” kaÃ§Ä±rÄ±lan bir gÃ¼nÃ¼ kapsar, bÃ¶ylece zincirin hayatta kalÄ±r.';

  @override
  String get tasksHeader => 'GÃ¶revler';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done/$total';
  }

  @override
  String get tasksAddSeed => 'Bir gÃ¶rev tohumu ekle';

  @override
  String get tasksCapReached =>
      '5/5 yer kullanÄ±ldÄ± â€” yeni bir tohum ekmek iÃ§in birini tamamla.';

  @override
  String get tasksEmptyCta => 'Ä°lk tohumunu ek â€” bugÃ¼n ne Ã¶nemli?';

  @override
  String get habitsHeader => 'AlÄ±ÅŸkanlÄ±klar';

  @override
  String habitsGrowing(String count) {
    return '$count bÃ¼yÃ¼yor';
  }

  @override
  String habitsBestStreak(String days) {
    return 'En iyi $days gÃ¼n';
  }

  @override
  String get habitsPlantNew => 'Yeni bir alÄ±ÅŸkanlÄ±k filizi ek';

  @override
  String get habitsPlantFirst => 'Bir alÄ±ÅŸkanlÄ±k eke';

  @override
  String get habitsLocked =>
      'Pro alÄ±ÅŸkanlÄ±k slotu â€” daha fazla filiz ekmek iÃ§in aÃ§';

  @override
  String get habitsSlotsFull => 'TÃ¼m alÄ±ÅŸkanlÄ±k slotlarÄ± ÅŸu anda dolu.';

  @override
  String habitsStreakDays(String days) {
    return '${days}g';
  }

  @override
  String get habitsCadence => 'GÃœNLÃœK';

  @override
  String leftBehindBanner(String count) {
    return '$count kaÃ§Ä±rÄ±ldÄ± â€” hÃ¢lÃ¢ Geri Kalanlar\'da';
  }

  @override
  String get leftBehindTap => 'Tekrar eklemek iÃ§in dokun veya bÄ±rak';

  @override
  String get leftBehindDismiss => 'Kapat';

  @override
  String get leftBehindTitle => 'Geri Kalanlar';

  @override
  String get leftBehindEmpty => 'HiÃ§bir ÅŸey geride kalmadÄ±';

  @override
  String get leftBehindEmptyBody =>
      'KaÃ§Ä±rÄ±lmÄ±ÅŸ gÃ¶rev yok. EktiÄŸin her tohum bakÄ±lÄ±yor. BahÃ§e temiz.';

  @override
  String get leftBehindClearAll => 'TÃ¼mÃ¼nÃ¼ temizle';

  @override
  String get leftBehindClearAllConfirm => 'TÃ¼m geri kalanlar temizlensin mi?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Bu, $count kaÃ§Ä±rÄ±lmÄ±ÅŸ gÃ¶revi kalÄ±cÄ± olarak silecek. Bunu geri alamazsÄ±n.';
  }

  @override
  String get leftBehindReAdd => 'BugÃ¼ne tekrar ekle';

  @override
  String get leftBehindReAddButton => 'Tekrar ekle';

  @override
  String get leftBehindAddedToToday => 'BugÃ¼ne eklendi';

  @override
  String get leftBehindLetGo => 'BÄ±rak gitsin';

  @override
  String get leftBehindHeader => 'GERÄ° KALANLAR';

  @override
  String get leftBehindMissedTasks => 'KAÃ‡IRILAN GÃ–REVLER';

  @override
  String get leftBehindWaitingOne => '1 gÃ¶rev seni bekliyor.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count gÃ¶rev seni bekliyor.';
  }

  @override
  String get leftBehindBody =>
      'Bir gÃ¶revi bugÃ¼ne geri eklemek iÃ§in dokun veya bÄ±rak. Tekrar eklemek serini canlÄ± tutar.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" gÃ¼nÃ¼mÃ¼ze geri dÃ¶ndÃ¼.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return '\"$task\" kaldÄ±rÄ±ldÄ±';
  }

  @override
  String get leftBehindClearedSnack => 'Geri kalanlar temizlendi';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'DÃ¼n Â· $date';
  }

  @override
  String streakAtRisk(String count) {
    return 'BugÃ¼n iÃ§in $count gÃ¶rev kaldÄ±';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Son Ã§aÄŸrÄ± â€” $count gÃ¶rev hÃ¢lÃ¢ aÃ§Ä±k';
  }

  @override
  String get streakAtRiskBody =>
      'Gece yarÄ±sÄ±na yakÄ±n. Zincir bunlara baÄŸlÄ±.';

  @override
  String get streakAtRiskBodyLow =>
      'HÃ¢lÃ¢ zamanÄ±n var. Temiz bir gÃ¼n serini uzatÄ±r.';

  @override
  String get streakAtRiskFreeze =>
      'DÃ¼n kaÃ§Ä±rÄ±ldÄ± â€” seri dondurmasÄ± kullanÄ±lsÄ±n mÄ±?';

  @override
  String get streakFreezeUse => 'DondurmayÄ± kullan';

  @override
  String get streakFreezeUseForYesterday =>
      'DÃ¼nkÃ¼ iÃ§in aylÄ±k seri dondurmasÄ±nÄ± kullan';

  @override
  String get streakFreezeAppliedYesterday =>
      'DÃ¼n iÃ§in seri dondurmasÄ± uygulandÄ±.';

  @override
  String get chainBrokenTitle => 'Zincir kÄ±rÄ±ldÄ±. Sorun deÄŸil.';

  @override
  String get chainBrokenBody =>
      'Her uzun zincir bir gÃ¼n biter. Ã–nemli olan bugÃ¼nkÃ¼ ektiklerin. MÃ¼kemmel bir gÃ¼n bir sonrakini baÅŸlatÄ±r.';

  @override
  String get chainBrokenCta => 'BugÃ¼ne dÃ¶n';

  @override
  String get chainBrokenPlantFirst => 'BugÃ¼nÃ¼n ilk tohumunu ek';

  @override
  String get chainBrokenCheck => 'Ã–nce Geri Kalanlar\'a bak';

  @override
  String get chainBrokenBestChain => 'en iyi zincir';

  @override
  String get chainBrokenTasksDone => 'tamamlanan gÃ¶rev';

  @override
  String get chainBrokenSprouts => 'filiz';

  @override
  String get chainRecoveryFreshStart => 'Yeni bir baÅŸlangÄ±Ã§';

  @override
  String get medalsTitle => 'MadalyalarÄ±m';

  @override
  String get medalsTrophyRoom => 'Kupa OdasÄ±';

  @override
  String get medalsAllMedals => 'TÃ¼m Madalyalar';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$total madalyadan $earned tanesi kazanÄ±ldÄ±';
  }

  @override
  String get medalsTrophyEmpty => 'Ä°lk rozetin bir gÃ¶rev uzaÄŸÄ±nda';

  @override
  String get medalsTrophyFirst => 'Ä°lk madalyanÄ± kazandÄ±n â€” devam et';

  @override
  String medalsTrophyMany(String earned) {
    return 'Kupa odanda $earned madalya var';
  }

  @override
  String medalsProgressLabel(String total) {
    return '$total madalyanÄ±n ilerlemesi';
  }

  @override
  String get medalsShareCta => 'PaylaÅŸÄ±labilir bir kart oluÅŸtur';

  @override
  String get medalsEmptyTitle => 'Bu kategoride henÃ¼z bir ÅŸey yok';

  @override
  String get medalsEmptyBody =>
      'Kupa odanÄ± baÅŸlatmak iÃ§in bir gÃ¶revi tamamla veya bir filizi sula.';

  @override
  String get medalSheetLocked => 'PRO MADALYASI';

  @override
  String medalSheetEarned(String tier) {
    return 'KAZANILDI Â· $tier';
  }

  @override
  String get medalSheetUnlock => 'Pro ile aÃ§';

  @override
  String get medalSheetProgress => 'Ä°lerleme';

  @override
  String medalSheetHint(String n, String unit) {
    return 'AÃ§mak iÃ§in sadece $n $unit daha.';
  }

  @override
  String get medalSheetAlmost => 'AÃ§mak iÃ§in bir adÄ±m daha.';

  @override
  String get medalCategory => 'Kategori';

  @override
  String get medalShareOnSocials => 'Sosyal medyanda paylaÅŸ';

  @override
  String get medalShareLater => 'Belki sonra';

  @override
  String get medalUnlocked => 'MADALYA AÃ‡ILDI';

  @override
  String get medalProgressTitle => 'Ä°lerleme';

  @override
  String get historyTitle => 'Son 7 GÃ¼n';

  @override
  String get historyFullTitle => 'Tam geÃ§miÅŸ';

  @override
  String get historyLoadError => 'GeÃ§miÅŸ yÃ¼klenemedi.';

  @override
  String get historyFullCalendar => 'Takvim';

  @override
  String historyCompletedPercent(String percent) {
    return '%$percent tamamlandÄ±';
  }

  @override
  String historyThisWeek(String days) {
    return 'SON $days GÃœN';
  }

  @override
  String get historyDayByDay => 'GÃœN GÃœN';

  @override
  String get historyEmpty =>
      'HaftanÄ±n nasÄ±l geÃ§tiÄŸini gÃ¶rmek iÃ§in biraz tohum ek.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return '$total gÃ¶revden $done tanesini tamamladÄ±n. $perfect mÃ¼kemmel gÃ¼n.';
  }

  @override
  String get historyUpsellTitle => 'Tam geÃ§miÅŸini gÃ¶r';

  @override
  String get historyUpsellBody =>
      'Pro 30 gÃ¼nlÃ¼k geÃ§miÅŸi aÃ§ar. Ãœcretsiz olan 7 gÃ¼n gÃ¶sterir.';

  @override
  String get historyPerfect => 'MÃœKEMMEL';

  @override
  String get historyFrozen => 'DONMUÅž';

  @override
  String get historyToday => 'BugÃ¼n';

  @override
  String get historyEmptyDay => 'O gÃ¼n hiÃ§bir tohum ekilmedi';

  @override
  String historyLeftBehindCount(String count) {
    return '$count geride kaldÄ±';
  }

  @override
  String get progressVitality => 'BUGÃœNÃœN CANLILIÄžI';

  @override
  String get progressVitalityEmpty =>
      'BahÃ§enÃ¼ baÅŸlatmak iÃ§in bir tohum ek.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return 'BugÃ¼n $total tohumdan $done tanesi ekildi.';
  }

  @override
  String progressChainPill(String days) {
    return '$days gÃ¼nlÃ¼k zincir';
  }

  @override
  String get progressMetricCurrent => 'Åžu an';

  @override
  String get progressMetricBest => 'En iyi';

  @override
  String get progressMetricDone => 'TamamlandÄ±';

  @override
  String get progressMetricPerfect => 'MÃ¼kemmel';

  @override
  String get progressMetricHabits => 'AlÄ±ÅŸkanlÄ±klar';

  @override
  String get progressHabitBlooms => 'AlÄ±ÅŸkanlÄ±k Ã§iÃ§ekleri';

  @override
  String get progressHabitBloomsSub =>
      'Her gÃ¼n suladÄ±ÄŸÄ±n filizler iÃ§in seri kilometre taÅŸlarÄ±.';

  @override
  String get progressNextBadge => 'Sonraki rozet';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned/$total';
  }

  @override
  String get progressPersonalActivity => 'KiÅŸisel Aktivite';

  @override
  String progressBrowseMonth(String month) {
    return '$month ayÄ±nÄ± gÃ¶rÃ¼ntÃ¼lÃ¼yorsun. CanlÄ± etkinliÄŸine dÃ¶nmek iÃ§in \"BugÃ¼n\"e dokun.';
  }

  @override
  String get progressJumpToToday => 'BugÃ¼n';

  @override
  String get progressCalendarLegend => 'daha koyu = daha Ã§ok tamamlandÄ±';

  @override
  String get progressCalendarBody =>
      'Koyu yeÅŸil mÃ¼kemmel bir gÃ¼n demektir. AtladÄ±kÃ§a renk solar.';

  @override
  String get paywallTitle => 'Zinciri kÄ±rÄ±lmamÄ±ÅŸ tut.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro sana tam disiplin sistemini verir.';

  @override
  String get paywallFeatures =>
      'Tam 5 alÄ±ÅŸkanlÄ±k slotu, sadece 3 deÄŸil|Tam geÃ§miÅŸin, sonsuza kadar|TÃ¼m madalya seti|Her ay seri dondurmasÄ±|HaftalÄ±k Makbuz + paylaÅŸÄ±m kartlarÄ±|Temalar + daha fazlasÄ±';

  @override
  String get paywallFeaturesBodies =>
      'Ãœcretsiz olan 3 verir. Pro hepsini aÃ§ar, bÃ¶ylece gÃ¼nlÃ¼k ritÃ¼elin burada yaÅŸayabilir.|TamamladÄ±ÄŸÄ±n her gÃ¼nÃ¼ gÃ¶rÃ¼ntÃ¼le â€” sadece son 7 deÄŸil. Haftalarca deÄŸil, yÄ±llarca geriye bak. |Efsanevi seviye madalyalarÄ±nÄ± aÃ§. En nadir rozetler, her ÅŸeyini verenler iÃ§indir.|Ayda 2 seri dondurmasÄ±, bÃ¶ylece tek bir kÃ¶tÃ¼ gÃ¼n zincirini bitirmez.|HaftanÄ±n gÃ¼zel paylaÅŸÄ±m kartlarÄ±. Zincirini paylaÅŸ, baÅŸkasÄ±nÄ± baÅŸlatmaya ilham ver.|Yeni vurgu renkleri ve temalarÄ± ekledikÃ§e aÃ§. Her zaman Ã¼cretsiz gÃ¼ncellemeler.';

  @override
  String get paywallYearly => 'YÄ±llÄ±k';

  @override
  String get paywallYearlyCaption =>
      'En iyi deÄŸer Â· ayda ~2.50 USD civarÄ±nda';

  @override
  String get paywallYearlyBadge => '%35 TASARRUF';

  @override
  String get paywallMonthly => 'AylÄ±k';

  @override
  String get paywallMonthlyCaption =>
      'Her ay faturalanÄ±r Â· istediÄŸin zaman iptal et';

  @override
  String paywallStartCta(String price) {
    return 'Pro\'yu BaÅŸlat Â· $price/yÄ±l';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Pro\'yu BaÅŸlat Â· $price/ay';
  }

  @override
  String get paywallLifetime => 'Lifetime';

  @override
  String get paywallLifetimeCaption => 'One-time payment · yours forever';

  @override
  String get paywallLifetimeBadge => 'BEST DEAL';

  @override
  String paywallStartCtaLifetime(String price) {
    return 'Start Pro · $price forever';
  }

  @override
  String get paywallRestore => 'SatÄ±n almayÄ± geri yÃ¼kle';

  @override
  String get paywallTerms => 'KoÅŸullar';

  @override
  String get paywallPrivacy => 'Gizlilik';

  @override
  String get paywallNoRestore =>
      'Bu hesapta Ã¶nceki bir satÄ±n alÄ±m bulunamadÄ±.';

  @override
  String get paywallRestoreLater =>
      'SatÄ±n almanÄ± sonraki senkronizasyonda geri yÃ¼kleyeceÄŸiz.';

  @override
  String get paywallAlreadyPro =>
      'Pro Ã¼yesisin. DesteÄŸin iÃ§in teÅŸekkÃ¼rler.';

  @override
  String get paywallHabitSlotHead =>
      'TÃ¼m Ã¼cretsiz alÄ±ÅŸkanlÄ±k slotlarÄ±nÄ± kullandÄ±n. Ã–nemsediÄŸin her ritÃ¼eli eklemek iÃ§in tam seti aÃ§.';

  @override
  String get paywallHistoryHead =>
      'Tam geÃ§miÅŸini gÃ¶r â€” her mÃ¼kemmel gÃ¼nÃ¼, her madalyayÄ±, her geri dÃ¶nÃ¼ÅŸÃ¼.';

  @override
  String get paywallMedalHead =>
      'En nadir madalyalar sadece Pro\'ya Ã¶zel. Devam et â€” dÃ¼ÅŸÃ¼ndÃ¼ÄŸÃ¼nden daha yakÄ±nlar.';

  @override
  String get settingsYourActivity => 'AKTÄ°VÄ°TEN';

  @override
  String get settingsHelpInfo => 'YARDIM & BÄ°LGÄ°';

  @override
  String get settingsAccount => 'HESAP';

  @override
  String get settingsNurturingTools => 'BÃœYÃœTME ALETLERÄ°';

  @override
  String get settingsReminders => 'HATIRLATMALAR';

  @override
  String get settingsWidgetSanctuary => 'WÄ°DGET KORUNAÄžI';

  @override
  String get settingsEcosystemSupport => 'EKOSÄ°STEM DESTEÄžÄ°';

  @override
  String get settingsHowItWorks => 'Bu nasÄ±l Ã§alÄ±ÅŸÄ±r';

  @override
  String get settingsSignOut => 'Ã‡Ä±kÄ±ÅŸ yap';

  @override
  String get settingsSignOutConfirm =>
      'Ã‡Ä±kÄ±ÅŸ yapmak istediÄŸinizden emin misiniz?';

  @override
  String get settingsProActive => 'Aktif';

  @override
  String get settingsProFree => 'Ãœcretsiz katman';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsLanguageValue => 'Sistem varsayÄ±lanÄ±';

  @override
  String get firstRunGreeting =>
      '5 gÃ¶rev. Daha fazla deÄŸil. OnlarÄ± sayÄ±lÄ± kÄ±l.';

  @override
  String get firstRunBody => 'Ä°lk tohumunu ek â€” bugÃ¼n en Ã§ok ne Ã¶nemli?';

  @override
  String get firstRunCta => 'Ä°lk tohumunu ek';

  @override
  String get emptyStateClearAll => 'TÃ¼mÃ¼nÃ¼ temizle';

  @override
  String get cancel => 'Ä°ptal';

  @override
  String get intentionTitle1 => 'Yeni bir niyet ekelim!';

  @override
  String get intentionBody1 =>
      'Her muhteÅŸem orman tek bir kÃ¼Ã§Ã¼k choix ile baÅŸlar. BugÃ¼n neyi bÃ¼yÃ¼tÃ¼yoruz?';

  @override
  String get intentionTitle2 => 'BugÃ¼n ne ekelim?';

  @override
  String get intentionBody2 =>
      'KÃ¼Ã§Ã¼k tohumlar, Ã¶zenle bakÄ±lÄ±rsa yÃ¼ksek aÄŸaÃ§lara dÃ¶nÃ¼ÅŸÃ¼r. Åžu anda en Ã§ok Ã¶nemli olanÄ± seÃ§.';

  @override
  String get intentionTitle3 => 'Bir tohum. Bir nefes. BaÅŸla.';

  @override
  String get intentionBody3 =>
      'TÃ¼m ormanÄ± bir anda ekmen gerekmez â€” sadece bir sonraki doÄŸru ÅŸey.';

  @override
  String get intentionTitle4 => 'Bir sonraki kÃ¼Ã§Ã¼k adÄ±mÄ± besle.';

  @override
  String get intentionBody4 =>
      'Gelecekteki sen, Ã¶nÃ¼mÃ¼zdeki beÅŸ dakikada yaptÄ±ÄŸÄ±n seÃ§imlerden oluÅŸur. Nazik bir tane hangisi?';

  @override
  String get intentionTitle5 => 'Neye dÃ¶nÃ¼ÅŸmek istediÄŸine karar ver.';

  @override
  String get intentionBody5 =>
      'GÃ¶revler tohumlardÄ±r, alÄ±ÅŸkanlÄ±klar filizlerdir. Birlikte gurur duyduÄŸun bir orman oluÅŸtururlar.';

  @override
  String get intentionTitle6 => 'HatÄ±ralÄ±k bir ÅŸey ek.';

  @override
  String get intentionBody6 =>
      'Her gÃ¼n muhteÅŸem hissettirmeyebilir. SulanmÄ±ÅŸ bir tohum bile sayÄ±lÄ±r. Bir tane seÃ§elim.';

  @override
  String get intentionTitle7 => 'BugÃ¼nÃ¼ biraz daha cesur yap.';

  @override
  String get intentionBody7 =>
      'Cesaret birikir. ErtelediÄŸin tohumu seÃ§ â€” adÄ±nÄ± koymak bile ileriye doÄŸru bir adÄ±mdÄ±r.';

  @override
  String get intentionTitle8 => 'Tohumdan Ã¶nce topraÄŸÄ± hazÄ±rla.';

  @override
  String get intentionBody8 =>
      'Bu gÃ¶revi kolaylaÅŸtÄ±racak bir zihin, araÃ§ veya kÃ¼Ã§Ã¼k ritÃ¼el ne olur? Notlara ekle.';

  @override
  String get shareCardSnapshot => 'KorunaÄŸÄ±nÄ±n bir anlÄ±k gÃ¶rÃ¼ntÃ¼sÃ¼';

  @override
  String get shareCardBody =>
      'YukarÄ±daki kart PNG olarak dÄ±ÅŸa aktarÄ±lÄ±r ve paylaÅŸÄ±m sayfasÄ±na gÃ¶nderilir. Hikayende paylaÅŸ, bir arkadaÅŸÄ±na gÃ¶nder veya sticker olarak yazdÄ±r.';

  @override
  String get shareCardShareMyBloom => 'Ã‡iÃ§eÄŸimi paylaÅŸ';

  @override
  String get shareCardCouldNotShare => 'Åžu anda paylaÅŸÄ±lamadÄ±';

  @override
  String shareCardProgressText(String year) {
    return 'Daily Stitch ilerlemem â€” $year Daily Stitch\'te.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Daily Stitch\'te \"$title\" madalyasÄ±nÄ± aÃ§tÄ±m. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Bu nasÄ±l Ã§alÄ±ÅŸÄ±r';

  @override
  String get howItWorksBody =>
      'Daily Stitch, kÃ¼Ã§Ã¼k ve kÄ±rÄ±lmaz bir disiplin zinciri tutmana yardÄ±mcÄ± olur. Hepsi bu.';

  @override
  String get howItWorksToday => 'BugÃ¼n sekmesi';

  @override
  String get howItWorksTodayBody =>
      'Bu senin evin. BugÃ¼nkÃ¼ 5 gÃ¶rev ve ayarladÄ±ÄŸÄ±n alÄ±ÅŸkanlÄ±klarÄ± gÃ¶sterir. Gece yarÄ±sÄ±na kadar tamamlarsan, zincir uzar.';

  @override
  String get howItWorksCap => '5 gÃ¶rev sÄ±nÄ±rÄ± Ã¶zelliÄŸi';

  @override
  String get howItWorksCapBody =>
      '6. gÃ¶revi eklemene izin vermiyoruz. TÃ¼m mesele bu. KÄ±sa zincirler uzun olanlardan iyidir. Tam aÃ§Ä±klama iÃ§in ana ekrandaki \"?\" butonuna dokun.';

  @override
  String get howItWorksHabits =>
      'AlÄ±ÅŸkanlÄ±klar gÃ¼nlÃ¼k, zincir Ã¶mÃ¼r boyu';

  @override
  String get howItWorksHabitsBody =>
      'AlÄ±ÅŸkanlÄ±klar (Sabah yogasÄ±, Su iÃ§me) sonsuza kadar yaÅŸar. GÃ¶revler tek seferlik. Ä°kisi de aynÄ± seriyi besler.';

  @override
  String get howItWorksLeftBehind => 'KaÃ§Ä±rÄ±lan gÃ¶revler â†’ Geri Kalanlar';

  @override
  String get howItWorksLeftBehindBody =>
      'Gece yarÄ±sÄ±nda, tamamlanmamÄ±ÅŸ gÃ¶revler Geri Kalanlar\'a taÅŸÄ±nÄ±r. Sadece hÃ¢lÃ¢ Ã¶nemli olanlarÄ± tekrar ekle. Geri kalanÄ± sessizce bÄ±rakÄ±lÄ±r.';

  @override
  String get howItWorksProgress => 'Ä°lerleme sekmesi';

  @override
  String get howItWorksProgressBody =>
      'Seri, takvim, madalyalar, geÃ§miÅŸ â€” zaman iÃ§inde nasÄ±l gittiÄŸin hakkÄ±nda her ÅŸey. Burada acil bir ÅŸey yok.';

  @override
  String get howItWorksYou => 'Sen sekmesi';

  @override
  String get howItWorksYouBody => 'HesabÄ±n, ayarlarÄ±n, Ã§Ä±kÄ±ÅŸ. Hepsi bu.';

  @override
  String get howItWorksRule => 'Kural: Her gÃ¼n 5 kÃ¼Ã§Ã¼k ÅŸey, bahane yok.';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonDismiss => 'Kapat';

  @override
  String get commonCancel => 'Ä°ptal';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonSend => 'GÃ¶nder';

  @override
  String get commonCopy => 'Kopyala';

  @override
  String get commonShowLess => 'Daha az gÃ¶ster';

  @override
  String get commonViewFull => 'Tam notlarÄ± gÃ¶r';

  @override
  String get commonEdit => 'DÃ¼zenle';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonDone => 'TamamlandÄ±';

  @override
  String get commonError => 'Bir ÅŸey yanlÄ±ÅŸ gitti';

  @override
  String get commonPageNotFound => 'Sayfa BulunamadÄ±';

  @override
  String get commonHome => 'Ana Sayfa';

  @override
  String get commonUnknownError => 'Bilinmeyen yÃ¶nlendirme hatasÄ±';

  @override
  String get commonSettingsTooltip => 'Ayarlar';

  @override
  String get commonHowThisWorks => 'Bu nasÄ±l Ã§alÄ±ÅŸÄ±r';

  @override
  String get myDayReminderSet => 'HatÄ±rlatÄ±cÄ± ayarlandÄ±';

  @override
  String get myDayPreparationNotes => 'HAZIRLIK NOTLARI';

  @override
  String get onboardingSkip => 'ATLA';

  @override
  String get onboardingNext => 'Ä°leri';

  @override
  String get onboardingEnterSanctuary => 'KorunaÄŸa Gir';

  @override
  String get onboardingIntroduction => 'GÄ°RÄ°Åž';

  @override
  String get onboardingGrowYourForest => 'ORMANINI BÃœYÃœT';

  @override
  String get onboardingPage1Title => 'Koruyucunla tanÄ±ÅŸ.';

  @override
  String get onboardingPage1Body =>
      'KiÅŸisel KorunaÄŸÄ±na hoÅŸ geldin. Burada, bÃ¼yÃ¼men ormanÄ±nÄ±n yansÄ±r.';

  @override
  String get onboardingPage2Title => 'Tohumlar ek. BÃ¼yÃ¼rken izle.';

  @override
  String get onboardingPage2Body =>
      'Her gÃ¶rev kÃ¼Ã§Ã¼k bir tohumdur. Her alÄ±ÅŸkanlÄ±k gÃ¼nlÃ¼k baktÄ±ÄŸÄ±n bir filizdir. Birlikte disiplin dolu bir orman oluÅŸtururlar.';

  @override
  String get onboardingPage3Title => 'BeÅŸ gÃ¶rev. Bir zincir.';

  @override
  String get onboardingPage3Body =>
      'GÃ¼nde sadece 5 tohum ekabilirsin. Bu sÄ±nÄ±r, gerÃ§ekten Ã¶nemli olan ÅŸeylere odaklanmanÄ± ve zincirini korumanÄ± saÄŸlar.';

  @override
  String get onboardingPage4Title => 'Filizlerini her gÃ¼n sula.';

  @override
  String get onboardingPage4Body =>
      'AlÄ±ÅŸkanlÄ±klara dokunarak bÃ¼yÃ¼t. Bir gÃ¼n atla, zincir uzamaz. Koruyucu seninle birlikte bÃ¼yÃ¼r.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Ä°lk tohumunu ek.';

  @override
  String get authWelcomeBack => 'HoÅŸ geldin, Koruyucu.';

  @override
  String get authFiveTasksDaily =>
      'BeÅŸ gÃ¶rev. GÃ¼nlÃ¼k alÄ±ÅŸkanlÄ±klar. Bahane yok.';

  @override
  String get authSanctuaryWaiting => 'KorunaÄŸÄ±n seni bekliyor.';

  @override
  String get authSignIn => 'GiriÅŸ Yap';

  @override
  String get authSignUp => 'KayÄ±t Ol';

  @override
  String get authEmail => 'E-POSTA';

  @override
  String get authPassword => 'ÅžÄ°FRE';

  @override
  String get authEmailHint => 'ornek@email.com';

  @override
  String get authCreateAccount => 'Hesap oluÅŸtur';

  @override
  String get authSignInCta => 'GiriÅŸ yap';

  @override
  String get authOrContinueWith => 'veya ÅŸununla devam et';

  @override
  String get authContinueWithGoogle => 'Google ile devam et';

  @override
  String get authEnterEmail => 'E-posta adresini gir';

  @override
  String get authEnterValidEmail => 'GeÃ§erli bir e-posta adresi gir';

  @override
  String get authPasswordTooShort => 'Åžifre en az 8 karakter olmalÄ±dÄ±r';

  @override
  String get authAccountCreated =>
      'Hesap oluÅŸturuldu. GiriÅŸ Yap\'a geÃ§ ve ÅŸifreni kullan.';

  @override
  String get authSomethingWentWrong => 'Bir ÅŸey yanlÄ±ÅŸ gitti. Tekrar dene.';

  @override
  String get authCouldNotStartGoogle => 'Google oturumu baÅŸlatÄ±lamadÄ±.';

  @override
  String get authMidnightReset =>
      'GiriÅŸ yaparak gÃ¼nÃ¼nÃ¼n gece yarÄ±sÄ±nda sÄ±fÄ±rlandÄ±ÄŸÄ±nÄ± kabul edersin.';

  @override
  String get authSetupRequired => 'Kurulum gerekli';

  @override
  String get settingsPersonalSanctuary => 'KÄ°ÅžÄ°SEL KORUNAK';

  @override
  String get settingsHowThisWorks => 'Bu nasÄ±l Ã§alÄ±ÅŸÄ±r';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Uygulama nedir, sÄ±nÄ±r ve seri nasÄ±l Ã§alÄ±ÅŸÄ±r';

  @override
  String get settingsStreakProtection => 'Seri KorumasÄ±';

  @override
  String get settingsStreakProtectionAvailable => 'Bu ay 1 dondurma mevcut';

  @override
  String get settingsStreakProtectionUsed => 'Bu ay iÃ§in kullanÄ±ldÄ±';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Pro aboneliÄŸini yÃ¶net';

  @override
  String get settingsProCancelPlay =>
      'Google Play\'de planÄ± iptal et veya deÄŸiÅŸtir';

  @override
  String get settingsProUnlock =>
      'TÃ¼m 5 alÄ±ÅŸkanlÄ±ÄŸÄ±, tam geÃ§miÅŸi ve daha fazlasÄ±nÄ± aÃ§';

  @override
  String get settingsTaskAlarms => 'GÃ¶rev alarmÄ± ve Son Ã‡aÄŸrÄ±';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'AkÅŸam hatÄ±rlatmasÄ± ve gece yarÄ±sÄ± uyarÄ±sÄ±';

  @override
  String get settingsHomeScreenWidget => 'Ana ekran widget\'Ä±';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Zincir serini ana ekrana ekle';

  @override
  String get settingsShareBloomTracker => 'Daily Stitch\'i paylaÅŸ';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Bir arkadaÅŸÄ±na zincirden bahset';

  @override
  String get settingsHelpSupport => 'YardÄ±m & Destek';

  @override
  String get settingsHelpSupportSubtitle => 'SSS veya sorun bildir';

  @override
  String get settingsSignOutTile => 'Ã‡Ä±kÄ±ÅŸ Yap';

  @override
  String get settingsAllFeaturesUnlocked => 'TÃ¼m Ã¶zellikler aÃ§Ä±ldÄ±';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Beta sÃ¼rÃ¼mÃ¼ â€” her ÅŸeyi test ederken abonelikler duraklatÄ±ldÄ±.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'SÃ¼rÃ¼m $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'SÃ¼rÃ¼m 1.0.0';

  @override
  String get settingsHabitMaster => 'AlÄ±ÅŸkanlÄ±k UstasÄ±';

  @override
  String settingsLevel(Object level) {
    return 'Seviye $level Â· AlÄ±ÅŸkanlÄ±k UstasÄ±';
  }

  @override
  String get languagePickerTitle => 'Dil';

  @override
  String get youLast7Days => 'Son 7 gÃ¼n';

  @override
  String get youLast7DaysSubtitle => 'GÃ¼nlÃ¼k gÃ¶rev geÃ§miÅŸi';

  @override
  String get youLeftBehindSubtitle =>
      'Tekrar ekilmeyi bekleyen kaÃ§Ä±rÄ±lan gÃ¶revler';

  @override
  String get youProTier => 'Pro katmanÄ±';

  @override
  String get youFreeTier => 'Ãœcretsiz katman';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Ãœcretsiz';

  @override
  String youLevelLabel(Object level) {
    return 'Seviye $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'En iyi $days gÃ¼n';
  }

  @override
  String get youPlantHabit =>
      'Bir zincir baÅŸlatmak iÃ§in bir alÄ±ÅŸkanlÄ±k ek.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline => 'Tam disiplin sistemini aÃ§.';

  @override
  String get youProFeatures =>
      '5 alÄ±ÅŸkanlÄ±k slotu, tam geÃ§miÅŸ, efsanevi madalyalar, aylÄ±k seri dondurmalarÄ±, haftalÄ±k paylaÅŸÄ±m kartlarÄ±.';

  @override
  String get youSeePlans => 'PlanlarÄ± gÃ¶r';

  @override
  String youFromPrice(Object price) {
    return '$price/ay\'dan baÅŸlayan fiyatlarla';
  }

  @override
  String get youBloomTrackerFooter =>
      'Daily Stitch Â· AlÄ±ÅŸkanlÄ±k & YapÄ±lacak';

  @override
  String get progressMedals => 'Madalyalar';

  @override
  String get progressLast7Days => 'Son 7 gÃ¼n';

  @override
  String get progressSeeAll => 'TÃ¼mÃ¼nÃ¼ gÃ¶r';

  @override
  String get progressSeeDayByDayActivity => 'GÃ¼nlÃ¼k aktiviteni gÃ¶r';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$total gÃ¶revden $done tanesi tamamlandÄ± Â· %$pct';
  }

  @override
  String get progressNoMedalsYet =>
      'HenÃ¼z madalya yok â€” baÅŸlamak iÃ§in bir gÃ¶revi tamamla veya bir filizi sula.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'TÃ¼m madalyalarÄ± gÃ¶r Â· $earned/$total kazanÄ±ldÄ±';
  }

  @override
  String get progressGuardianInsight => 'Koruyucu iÃ§gÃ¶rÃ¼sÃ¼';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'SONRAKÄ° ROZET Â· $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return '$days gÃ¼nlÃ¼k hedef';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'YardÄ±m & Destek';

  @override
  String get helpBody =>
      'CevaplarÄ±n Ã§oÄŸu aÅŸaÄŸÄ±da. Yoksa bize bir not gÃ¶nder, genellikle 2-3 gÃ¼n iÃ§inde yanÄ±t veririz.';

  @override
  String get helpSectionFAQ => 'SIK SORULAN SORULAR';

  @override
  String get helpSectionContact => 'HALEN TAKILDI MI?';

  @override
  String get helpAddMessage => 'Ã–nce kÄ±sa bir mesaj ekle.';

  @override
  String get helpOpening => 'E-posta uygulaman aÃ§Ä±lÄ±yorâ€¦';

  @override
  String get helpEmailUs => 'Bize e-posta gÃ¶nder';

  @override
  String get helpOpeningAction => 'AÃ§Ä±lÄ±yorâ€¦';

  @override
  String get helpCopyEmail => 'Destek e-postasÄ±nÄ± kopyala';

  @override
  String get helpCopiedEmail => 'support@dailystitch.app kopyalandÄ±';

  @override
  String get helpNoMailApp =>
      'E-posta uygulamasÄ± bulunamadÄ±. Bize support@dailystitch.app adresinden yazÄ±n.';

  @override
  String get helpTopicLabel => 'Konu';

  @override
  String get helpWhatHappened => 'Ne oldu?';

  @override
  String get helpHint => 'KÄ±sa bir aÃ§Ä±klama Ã§ok yol alÄ±râ€¦';

  @override
  String get helpDisclaimer =>
      '\"Bize e-posta gÃ¶nder\"e dokunmak, Ã¶nceden doldurulmuÅŸ bir mesajla e-posta uygulamanÄ± aÃ§ar (gÃ¶nderene kadar hiÃ§bir veri cihazÄ±ndan ayrÄ±lmaz).';

  @override
  String get helpFaqQ1 => '5 gÃ¶rev sÄ±nÄ±rÄ± nedir?';

  @override
  String get helpFaqA1 =>
      'Yerel gÃ¼n baÅŸÄ±na en fazla 5 gÃ¶rev ekleyebilirsin. 6. gÃ¶rev kasÄ±tlÄ± olarak engellenir â€” disiplin aÅŸÄ±rÄ± yÃ¼klemeyi yener. SÄ±nÄ±r bir Ã¶zelliktir, bir kÄ±sÄ±tlama deÄŸil.';

  @override
  String get helpFaqQ2 => 'Gece yarÄ±sÄ±nda ne olur?';

  @override
  String get helpFaqA2 =>
      'Yerel gece yarÄ±sÄ±nda, hÃ¢lÃ¢ aÃ§Ä±k olarak iÅŸaretli her gÃ¶rev \"kaÃ§Ä±rÄ±ldÄ±\" damgasÄ± alÄ±r ve Geri Kalanlar\'a gider. AlÄ±ÅŸkanlÄ±k, bir Ã¶nceki gÃ¼n tamamlanmamÄ±ÅŸsa seri sÄ±fÄ±rlanÄ±r.';

  @override
  String get helpFaqQ3 => 'Geri Kalanlar nedir?';

  @override
  String get helpFaqA3 =>
      'BitiremediÄŸin gÃ¶revlerin nazik bir listesi. AÃ§, sadece hÃ¢lÃ¢ Ã¶nemli olanlarÄ± tekrar ekle, gerisini bÄ±rak. Ãœcretsiz katman son 7 gÃ¼nÃ¼ gÃ¶sterir; Pro tam geÃ§miÅŸi gÃ¶sterir.';

  @override
  String get helpFaqQ4 => 'Seriler nasÄ±l Ã§alÄ±ÅŸÄ±r?';

  @override
  String get helpFaqA4 =>
      'En az 1 gÃ¶revin olduÄŸu ve 0 kaÃ§Ä±rdÄ±ÄŸÄ±n bir gÃ¼n zinciri uzatÄ±r. SÄ±fÄ±r gÃ¶revli gÃ¼nler ne uzatÄ±r ne de kÄ±rar. Bir seri dondurmasÄ± ayda bir kaÃ§Ä±rÄ±lan gÃ¼nÃ¼ affeder.';

  @override
  String get helpFaqQ5 => 'Seri dondurmasÄ± nedir?';

  @override
  String get helpFaqA5 =>
      'Takvim ayÄ±na bir \"dondurma\", sadece Pro. KaÃ§Ä±rÄ±ldÄ±ÄŸÄ±n bir gÃ¼nde kullan, zincirini canlÄ± tut. Ä°lerleme sekmesinde bul.';

  @override
  String get helpFaqQ6 => 'Verilerim nerede saklanÄ±yor?';

  @override
  String get helpFaqA6 =>
      'TÃ¼m veriler, giriÅŸ yaptÄ±ÄŸÄ±n hesap altÄ±nda gÃ¼venli bulut altyapÄ±mÄ±zda saklanÄ±r. Verilerini asla satmÄ±yoruz veya paylaÅŸmÄ±yoruz. TÃ¼m ayrÄ±ntÄ±lar iÃ§in Play Store listesindeki gizlilik politikasÄ±na bak.';

  @override
  String get helpFaqQ7 => 'HesabÄ±mÄ± nasÄ±l silerim?';

  @override
  String get helpFaqA7 =>
      'Ayarlar â†’ Hesap â†’ HesabÄ± sil yolunu izle. Bu, profilini, gÃ¶revlerini, alÄ±ÅŸkanlÄ±klarÄ±nÄ± ve abonelik verilerini kalÄ±cÄ± olarak siler. Aktif Play abonelikleri Google Play\'de ayrÄ±ca iptal edilmelidir.';

  @override
  String get helpTopicsGeneral => 'Genel soru';

  @override
  String get helpTopicsBug => 'Hata raporu';

  @override
  String get helpTopicsStreak => 'Seri / devretme sorunu';

  @override
  String get helpTopicsBilling => 'Faturalama veya Pro katmanÄ±';

  @override
  String get helpTopicsAccount => 'Hesap & veri';

  @override
  String get helpTopicsFeature => 'Ã–zellik isteÄŸi';

  @override
  String get helpAccountAnon => '(giriÅŸ yapÄ±lmadÄ±)';

  @override
  String get splashTagline => 'KÃ¼Ã§Ã¼k tohumlarÄ± besle. Bir orman yetiÅŸtir.';

  @override
  String get priorityStandard => 'STANDART';

  @override
  String get priorityVital => 'VÄ°TAL';

  @override
  String get prioritySpark => 'KIVILCIM';

  @override
  String get settingsDeleteAccount => 'HesabÄ± sil';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Verilerini kalÄ±cÄ± olarak kaldÄ±r';

  @override
  String get settingsDeleteAccountConfirmTitle =>
      'HesabÄ±nÄ± silmek istiyor musun?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Bu, profilini, gÃ¶revlerini, alÄ±ÅŸkanlÄ±klarÄ±nÄ± ve ilerlemeni kalÄ±cÄ± olarak siler. Aktif abonelikler Google Play\'de ayrÄ±ca iptal edilmelidir. Bu iÅŸlem geri alÄ±namaz.';

  @override
  String get settingsDeleteAccountConfirmButton => 'KalÄ±cÄ± olarak sil';

  @override
  String get settingsDeleteAccountSuccess => 'HesabÄ±n silindi.';

  @override
  String get settingsDeleteAccountFailed =>
      'Hesap silinemedi. Tekrar dene veya support@dailystitch.app adresine yaz.';

  @override
  String get referralYouTitle =>
      'ArkadaÅŸlarÄ±nÄ± davet et Â· Ãœcretsiz Pro kazan';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$milestone arkadaÅŸtan $progress tanesi katÄ±ldÄ±';
  }

  @override
  String get referralYouShare => 'Daveti paylaÅŸ';

  @override
  String get referralYouDetails => 'DetaylarÄ± gÃ¶r';

  @override
  String get referralPaywallTitle => 'Ãœcretsiz Pro ayÄ±';

  @override
  String get referralPaywallBody =>
      '5 arkadaÅŸ davet et ve katÄ±lsÄ±n â†’ 1 ay Ã¼cretsiz Pro';

  @override
  String get referralPaywallProBody =>
      'Davet etmeye devam et â€” Ã¼cretsiz Pro aylarÄ±nÄ± biriktir';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count/$milestone';
  }

  @override
  String get insightsLoadError =>
      'Ä°lerlemen yÃ¼klenemedi. Daha sonra tekrar dene.';

  @override
  String get insightsMetricCurrentChain => 'MEVCUT ZÄ°NCÄ°R';

  @override
  String get insightsMetricBestEver => 'EN Ä°YÄ°';

  @override
  String get insightsMetricTasksDone => 'TAMAMLANAN GÃ–REVLER';

  @override
  String get insightsMetricPerfectDays => 'MÃœKEMMEL GÃœNLER';

  @override
  String get insightsMetricHabits => 'ALIÅžKANLIKLAR';

  @override
  String get insightsDay => 'gÃ¼n';

  @override
  String get insightsDays => 'gÃ¼n';

  @override
  String get insightsSectionThisWeek => 'Bu hafta';

  @override
  String get insightsShareMyWeek => 'HaftamÄ± paylaÅŸ';

  @override
  String get insightsShareMyWeekPro => 'HaftamÄ± paylaÅŸ Â· Pro';

  @override
  String get insightsShareReceiptText =>
      'Daily Stitch\'te geÃ§en haftam. Zinciri kÄ±rma.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Son $days gÃ¼n gÃ¶steriliyor';
  }

  @override
  String get insightsHistoryUpsell => 'Pro ile tam geÃ§miÅŸini aÃ§';

  @override
  String get referralScreenTitle => 'ArkadaÅŸlarÄ±nÄ± davet et';

  @override
  String get referralLaunchGift => 'Lansman ayÄ± hediyesi';

  @override
  String get referralRewardTitle => '1 ay Ã¼cretsiz Pro kazan';

  @override
  String get referralRewardBody =>
      'Kodunu arkadaÅŸlarÄ±nla paylaÅŸ. 5 kiÅŸi kodunu kullanarak kayÄ±t olduÄŸunda, Daily Stitch Pro\'yu tam bir ay aÃ§arsÄ±n.';

  @override
  String get referralYourCode => 'Davet kodun';

  @override
  String get referralCopyCodeTooltip => 'Kodu kopyala';

  @override
  String get referralCodeCopied => 'Davet kodu kopyalandÄ±';

  @override
  String get referralShareWithFriends => 'ArkadaÅŸlarÄ±nla paylaÅŸ';

  @override
  String get referralFooterHint =>
      'ArkadaÅŸlar hesap oluÅŸtururken kodunu girer. Her arkadaÅŸ Ã¶dÃ¼le bir kez sayÄ±lÄ±r.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count arkadaÅŸ katÄ±ldÄ±';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count arkadaÅŸ katÄ±ldÄ±';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return '$count Ã¼cretsiz Pro ayÄ± kazandÄ±n.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return '$count Ã¼cretsiz Pro ayÄ± kazandÄ±n.';
  }

  @override
  String get referralRewardUnlocked =>
      'Ã–dÃ¼l aÃ§Ä±ldÄ± â€” Ã¼cretsiz Pro ayÄ±nÄ±n tadÄ±nÄ± Ã§Ä±kar!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return 'Ãœcretsiz ayÄ±nÄ± aÃ§mak iÃ§in $remaining tane daha';
  }

  @override
  String youProMemberSince(String month) {
    return '$month ayÄ±ndan beri Bloom Pro Ã¼yesisin';
  }

  @override
  String get youProPerksTitle => 'Pro avantajlarÄ±n';

  @override
  String get manageProThankYou =>
      'Bloom\'a destek olduÄŸun iÃ§in teÅŸekkÃ¼rler';

  @override
  String get manageProReferralHint =>
      'Pro sÃ¼reni uzatmak iÃ§in daha fazla arkadaÅŸ davet et';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nleanspace/.env dosyasÄ±na API_BASE_URL ve GOOGLE_CLIENT_ID (veya eski GOOGLE_CLIENT_ID) ekle, sonra yeniden derle:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Sistem varsayÄ±lanÄ±';

  @override
  String get languageNameEn => 'English';

  @override
  String get languageNameUr => 'Ø§Ø±Ø¯Ùˆ (Urdu)';

  @override
  String get languageNameEs => 'EspaÃ±ol';

  @override
  String get languageNamePt => 'PortuguÃªs';

  @override
  String get languageNameFr => 'FranÃ§ais';

  @override
  String get languageNameDe => 'Deutsch';

  @override
  String get languageNameIt => 'Italiano';

  @override
  String get languageNameAr => 'Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©';

  @override
  String get languageNameTr => 'TÃ¼rkÃ§e';

  @override
  String get languageNameId => 'Bahasa Indonesia';

  @override
  String get onboardingLanguageTitle => 'Dilini seÃ§';

  @override
  String get onboardingLanguageBody =>
      'Daily Stitch boyunca kullanmak istediÄŸin dili seÃ§. Ä°stediÄŸin zaman Ayarlar\'dan deÄŸiÅŸtirebilirsin.';

  @override
  String get onboardingLanguageContinue => 'Devam';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'ArkadaÅŸ';

  @override
  String get settingsAppTheme => 'Uygulama TemasÄ±';

  @override
  String get settingsAppThemeSubtitle => 'KiÅŸisel korunak renklerini seÃ§';

  @override
  String get settingsInviteFriendsTitle =>
      'ArkadaÅŸlarÄ±nÄ± davet et Â· Ãœcretsiz Pro';

  @override
  String get settingsInviteFriendsSubtitle =>
      '5 arkadaÅŸ katÄ±ldÄ±ÄŸÄ±nda 1 ay Ã¼cretsiz kazan';

  @override
  String get themePickerTitle => 'KiÅŸisel Korunak';

  @override
  String get themePickerSubtitle => 'Sana huzur veren bir renk paleti seÃ§.';

  @override
  String get themeNameClassicBloom => 'Klasik Ã‡iÃ§ek';

  @override
  String get themeNameSolarTerracotta => 'GÃ¼neÅŸ Terrakota';

  @override
  String get themeNameMidnightOasis => 'Gece YarÄ±sÄ± VahasÄ±';

  @override
  String get themeNameLavenderDream => 'Lavanta RÃ¼yasÄ±';

  @override
  String get themeNameNordicFrost => 'Kuzey Buzulu';

  @override
  String get themeNameCyberpunkNeon => 'Cyberpunk Neon';

  @override
  String get reminderTitle => 'HatÄ±rlatmalar';

  @override
  String get reminderBody =>
      'Son Ã‡aÄŸrÄ±, gÃ¶revler hÃ¢lÃ¢ aÃ§Ä±ksa gece yarÄ±sÄ±ndan Ã¶nce sana haber verir.';

  @override
  String get reminderFinalCall => 'Son Ã‡aÄŸrÄ±';

  @override
  String get reminderEveningNudge => 'AkÅŸam hatÄ±rlatmasÄ±';

  @override
  String get reminderChangeTime => 'Saati deÄŸiÅŸtir';

  @override
  String get reminderSave => 'HatÄ±rlatmalarÄ± kaydet';

  @override
  String get notificationChannelReminders => 'Daily Stitch hatÄ±rlatmalarÄ±';

  @override
  String get notificationChannelRemindersDesc =>
      'AkÅŸam hatÄ±rlatmasÄ± ve Son Ã‡aÄŸrÄ± hatÄ±rlatmalarÄ±';

  @override
  String get notificationChannelAlarms => 'Daily Stitch gÃ¶rev alarmlarÄ±';

  @override
  String get notificationChannelAlarmsDesc =>
      'GÃ¶rev hatÄ±rlatmalarÄ± iÃ§in sesli alarmlar';

  @override
  String get notificationTaskReminderTitle => 'GÃ¶rev hatÄ±rlatmasÄ±';

  @override
  String get notificationFinalCallTitle => 'Son Ã‡aÄŸrÄ±';

  @override
  String notificationFinalCallBody(int count) {
    return 'BugÃ¼n hÃ¢lÃ¢ $count aÃ§Ä±k gÃ¶revin var.';
  }

  @override
  String get notificationEveningTitle => 'AkÅŸam kontrolÃ¼';

  @override
  String get notificationEveningBody => 'BahÃ§en bugÃ¼n nasÄ±l bÃ¼yÃ¼dÃ¼?';

  @override
  String get widgetSetupTitle => 'Zincir widget\'Ä± ekle';

  @override
  String get widgetSetupBody =>
      'Serini ana ekranda tut â€” uygulamayÄ± aÃ§mana gerek yok.';

  @override
  String get widgetSetupAdd => 'Ana ekrana ekle';

  @override
  String get widgetSetupStep1 => 'Ana ekranÄ±nda uzun bas';

  @override
  String get widgetSetupStep2 => 'Widget\'lara dokun';

  @override
  String get widgetSetupStep3 => 'Daily Stitch\'i bul ve sÃ¼rÃ¼kle';

  @override
  String get widgetSetupPinSuccess =>
      'Widget\'Ä± yerleÅŸtirmek iÃ§in ana ekranÄ±na bak.';

  @override
  String get widgetSetupPinFallback =>
      'BaÅŸlatÄ±cÄ±n tek dokunuÅŸla eklemeyi desteklemiyor olabilir. AÅŸaÄŸÄ±daki manuel adÄ±mlarÄ± kullan.';

  @override
  String get paywallWelcomePro => 'Daily Stitch Pro\'ya hoÅŸ geldin';

  @override
  String get paywallSavePercent => '~%16 TASARRUF';

  @override
  String get paywallTermsTitle => 'Abonelik koÅŸullarÄ±';

  @override
  String get paywallTermsBody =>
      'Faturalama Google Play tarafÄ±ndan yapÄ±lÄ±r. Abonelikler, mevcut dÃ¶nemin sonundan en az 24 saat Ã¶nce Play Store â†’ Abonelikler\'den iptal etmediÄŸin sÃ¼rece otomatik olarak yenilenir. AboneliÄŸini Google Play hesabÄ±ndan istediÄŸin zaman yÃ¶netebilir veya iptal edebilirsin.\n\nUygulamayÄ± kaldÄ±rman aboneliÄŸini iptal etmez.\n\nGÃ¶sterilen fiyatlar yerel para birimindedir ve bÃ¶lgeye gÃ¶re deÄŸiÅŸebilir. Vergiler uygulanabilir.';

  @override
  String get paywallPrivacyTitle => 'Gizlilik';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch, gÃ¶revlerini, alÄ±ÅŸkanlÄ±klarÄ±nÄ± ve seri verilerini gÃ¼venli arka ucumuzda hesabÄ±na baÄŸlÄ± olarak saklar. Verilerini asla satmÄ±yoruz.\n\nAbonelik satÄ±n alÄ±mlarÄ± Google Play tarafÄ±ndan iÅŸlenir. Pro durumunu onaylamak iÃ§in Google\'dan doÄŸrulanmÄ±ÅŸ bir satÄ±n alÄ±m belirteci alÄ±rÄ±z. Ã–deme bilgilerini gÃ¶rmeyiz veya saklamayÄ±z.\n\nAyarlar â†’ Hesap silme yolundan tam veri dÄ±ÅŸa aktarma veya hesap silme talebinde bulunabilirsin.';

  @override
  String get paywallCloseTooltip => 'Kapat';

  @override
  String get paywallFooterLinks => 'Geri YÃ¼kle Â· KoÅŸullar Â· Gizlilik';

  @override
  String get manageProTitle => 'Pro aboneliÄŸi';

  @override
  String get manageProActive => 'Aktif';

  @override
  String get manageProNotSubscribed => 'Abone deÄŸil';

  @override
  String get manageProFreeTier => 'Ãœcretsiz katman';

  @override
  String manageProRenewsOn(String date) {
    return '$date tarihinde yenilenir veya sona erer.';
  }

  @override
  String get manageProFreeBody =>
      'Daily Stitch Ãœcretsiz\'i kullanÄ±yorsun. Tam sistemi aÃ§mak iÃ§in yÃ¼kselt.';

  @override
  String get manageProSectionManage => 'YÃ–NET';

  @override
  String get manageProOpenPlay => 'Google Play aboneliklerini aÃ§';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Ä°ptal et, planÄ± deÄŸiÅŸtir veya Ã¶deme yÃ¶ntemini gÃ¼ncelle';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Mevcut aboneliÄŸini (varsa) burada bul';

  @override
  String get manageProShareApp => 'Daily Stitch\'i paylaÅŸ';

  @override
  String get manageProShareSubtitle => 'Bir arkadaÅŸÄ±na zincirden bahset';

  @override
  String get manageProSectionHelp => 'YARDIM MI LAZIM?';

  @override
  String get manageProHelpTitle => 'YardÄ±m & Destek';

  @override
  String get manageProHelpSubtitle =>
      'Abonelik SSS, iletiÅŸim, hata raporlarÄ±';

  @override
  String manageProBillingFooter(String version) {
    return 'Faturalama Google Play tarafÄ±ndan yapÄ±lÄ±r Â· $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Google Play Store uygulamasÄ±nÄ± aÃ§ â†’ profil resmine dokun â†’ Ã–demeler ve abonelikler â†’ Abonelikler.';

  @override
  String get addTaskGrowSomething => 'Bir Åžey BÃ¼yÃ¼t';

  @override
  String get addTaskPlantSprout => 'Bir Filiz Ek';

  @override
  String get addTaskIntentionName => 'NÄ°YET ADI';

  @override
  String get addTaskSproutName => 'FÄ°LÄ°Z ADI';

  @override
  String get addTaskHintTask => 'Ã¶r. Sabah GÃ¼neÅŸ SelamÄ±';

  @override
  String get addTaskHintHabit => 'Ã¶r. Sabah YogasÄ±';

  @override
  String get addTaskWhen => 'NE ZAMAN?';

  @override
  String get addTaskPriority => 'Ã–NCELÄ°K';

  @override
  String get addTaskNotes => 'NOTLAR';

  @override
  String get addTaskCadenceDaily => 'GÃ¼nlÃ¼k';

  @override
  String get addTaskCadenceWeekdays => 'Ä°ÅŸ gÃ¼nleri';

  @override
  String get addTaskCadence3x => 'Haftada 3x';

  @override
  String get addTaskCadenceWeekly => 'HaftalÄ±k';

  @override
  String get addTaskPlantIntention => 'Niyet Ek';

  @override
  String get addTaskPlantSproutCta => 'Filiz Ek';

  @override
  String get addTaskPlanting => 'Ekiliyorâ€¦';

  @override
  String get addTaskNameIntentionError => 'Niyetini adlandÄ±r';

  @override
  String get addTaskNameSproutError => 'Filizini adlandÄ±r';

  @override
  String get addTaskNotesMigrationWarning =>
      'GÃ¶rev kaydedildi. Notlar ve Ã¶ncelik iÃ§in en son arka uÃ§ migrasyonu gerekiyor.';

  @override
  String get addTaskNoSproutSlots =>
      'BoÅŸ filiz slotu yok â€” Ã¶nce birini sula.';

  @override
  String get addTaskSaveSproutError => 'Filiz kaydedilemedi â€” tekrar dene.';

  @override
  String get addTaskElementWater => 'SU';

  @override
  String get addTaskElementLight => 'IÅžIK';

  @override
  String get addTaskElementSoil => 'TOPRAK';

  @override
  String get addTaskElementBreeze => 'RÃœZGAR';

  @override
  String get addTaskCadenceLabel => 'SIKLIK';

  @override
  String get addTaskPreparationNotes => 'HAZIRLIK NOTLARI';

  @override
  String get addTaskTendingNotes => 'BAKIM NOTLARI';

  @override
  String get addTaskNotesHintTask =>
      'Bu gÃ¶rev iÃ§in araÃ§lar veya zihin ipuÃ§larÄ± var mÄ±?';

  @override
  String get addTaskNotesHintHabit => 'Bu filize bakmak nasÄ±l gÃ¶rÃ¼nÃ¼yor?';

  @override
  String get addTaskChooseElement => 'Ã–ÄžE SEÃ‡';

  @override
  String get addTaskElementsTooltip => 'Ã–ÄŸeler ne anlama gelir?';

  @override
  String get addTaskTaskSeed => 'GÃ¶rev Tohumu';

  @override
  String get addTaskHabitSprout => 'AlÄ±ÅŸkanlÄ±k Filizi';

  @override
  String get addTaskPickElement => 'DoÄŸru Ã¶ÄŸeyi seÃ§';

  @override
  String get addTaskPickElementBody =>
      'Her Ã¶ÄŸe farklÄ± bir Ã§aba tÃ¼rÃ¼ne karÅŸÄ±lÄ±k gelir. DoÄŸru olanÄ± suladÄ±ÄŸÄ±nda Koruyucu daha gÃ¼Ã§lÃ¼ hale gelir.';

  @override
  String get addTaskClearForm => 'Formu temizle';

  @override
  String get shareCouldNotShare => 'Åžu anda paylaÅŸÄ±lamadÄ±';

  @override
  String get authReferralCodeLabel => 'Davet kodu (isteÄŸe baÄŸlÄ±)';

  @override
  String get authReferralCodeHint => 'ArkadaÅŸ kodu';

  @override
  String get youPerkHabitSlots => '5 alÄ±ÅŸkanlÄ±k slotu';

  @override
  String get youPerkFullHistory => 'Tam geÃ§miÅŸ';

  @override
  String get youPerkAllThemes => 'TÃ¼m temalar';

  @override
  String get youPerkStreakFreezes => 'Ayda 2 seri dondurmasÄ±';

  @override
  String get youPerkLegendaryMedals => 'Efsanevi madalyalar';

  @override
  String get subscriptionPurchaseFailed => 'SatÄ±n alÄ±namadÄ±. Tekrar dene.';

  @override
  String get subscriptionUnavailable =>
      'Bu cihazda uygulama iÃ§i satÄ±n alÄ±mlar kullanÄ±lamÄ±yor.';

  @override
  String get subscriptionLoadFailed => 'Abonelik seÃ§enekleri yÃ¼klenemedi.';

  @override
  String get subscriptionVerifyFailed =>
      'SatÄ±n alÄ±m doÄŸrulanamadÄ±. SatÄ±n AlmayÄ± Geri YÃ¼kle\'yi dene.';

  @override
  String get streakFreezeFailed => 'Seri dondurmasÄ± kullanÄ±lamadÄ±.';

  @override
  String get streakFreezeAlreadyUsed => 'Bu ay dondurmanÄ± zaten kullandÄ±n.';

  @override
  String get streakFreezeNoMissed =>
      'O gÃ¼nde dondurulacak kaÃ§Ä±rÄ±lmÄ±ÅŸ gÃ¶rev yok.';

  @override
  String get streakFreezeNotPastDay =>
      'Sadece geÃ§miÅŸ bir gÃ¼nÃ¼ dondurabilirsin.';

  @override
  String get myDayLoadError => 'GÃ¼nÃ¼m yÃ¼klenemedi. Yenilemek iÃ§in Ã§ek.';

  @override
  String get myDayCapReached => 'BugÃ¼nÃ¼n 5 gÃ¶rev sÄ±nÄ±rÄ±na ulaÅŸtÄ±n.';

  @override
  String get myDayRemoveTaskError => 'GÃ¶rev kaldÄ±rÄ±lamadÄ±.';

  @override
  String get shareCardTitle => 'HaftanÄ± paylaÅŸ';

  @override
  String get shareCardCta => 'GÃ¶rseli paylaÅŸ';

  @override
  String get medalTierSprout => 'Filiz';

  @override
  String get medalTierCommon => 'YaygÄ±n';

  @override
  String get medalTierRare => 'Nadir';

  @override
  String get medalTierEpic => 'DestansÄ±';

  @override
  String get medalTierLegendary => 'Efsanevi';

  @override
  String get medalCategoryTasks => 'GÃ¶revler';

  @override
  String get medalCategoryHabits => 'AlÄ±ÅŸkanlÄ±klar';

  @override
  String get medalCategoryStreaks => 'Seriler';

  @override
  String get medalCategoryMastery => 'UstalÄ±k';

  @override
  String get medalsShareTooltip => 'BaÅŸarÄ±larÄ± paylaÅŸ';

  @override
  String get medalsFilterAll => 'TÃ¼mÃ¼';

  @override
  String get addHabitTitleNew => 'Yeni bir filiz ek';

  @override
  String get addHabitTitleEdit => 'Filizine bakÄ±m yap';

  @override
  String get addHabitLabelSproutName => 'FÄ°LÄ°Z ADI';

  @override
  String get shareCardAppBarTitle => 'PaylaÅŸÄ±m KartÄ±';

  @override
  String get shareCardAppBarTitleMedal => 'MadalyanÄ± paylaÅŸ';

  @override
  String shareCardDescMedal(Object title) {
    return '$title rozetini gÃ¶ster';
  }

  @override
  String get shareCardBodyMedal =>
      'KazancÄ±nÄ± Ã§evrenle paylaÅŸ. Kart PNG olarak dÄ±ÅŸa aktarÄ±lÄ±r ve herhangi bir sosyal uygulama iÃ§in hazÄ±rdÄ±r.';

  @override
  String get shareCardCtaPreparing => 'HazÄ±rlanÄ±yorâ€¦';

  @override
  String get shareCardMilestone => 'YENÄ° KÄ°LOMETRE TAÅžI AÃ‡ILDI';

  @override
  String get shareCardStatChain => 'gÃ¼nlÃ¼k zincir';

  @override
  String get shareCardStatSprouts => 'filiz';

  @override
  String get shareCardStatMedals => 'madalya';

  @override
  String shareCardHeadlineStreak(int days) {
    return '$days GÃ¼nlÃ¼k Seri';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Madalya KazanÄ±ldÄ±';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Filiz Koruyucusu';

  @override
  String get shareCardHeadlineFirstSeeds => 'Ä°lk Tohumlar Ekildi';

  @override
  String get shareCardHeadlineGardenBegins => 'Bir BahÃ§e BaÅŸlÄ±yor';

  @override
  String get shareCardSubheadMonth =>
      'AlÄ±ÅŸkanlÄ±klarÄ±nÄ± tam bir ay baÅŸarÄ±yla besledin.';

  @override
  String get shareCardSubheadWeek =>
      'Tam bir hafta bÃ¼yÃ¼me â€” ormanÄ±nÄ±z sÄ±klaÅŸÄ±yor.';

  @override
  String get shareCardSubheadProgress =>
      'KorunaÄŸÄ±n gerÃ§ek ilerleme gÃ¶steriyor. Bakmaya devam et.';

  @override
  String get shareCardSubheadSprouts =>
      'Ä°lk filizlerin kÃ¶k salÄ±yor. Her gÃ¼n sula.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Ä°lk tohumlarÄ±n topraÄŸa ekildi. AÃ§Ä±lmalarÄ±nÄ± izle.';

  @override
  String get shareCardSubheadFallback =>
      'Her orman tek bir kÃ¼Ã§Ã¼k seÃ§imle baÅŸlar.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch â€” gÃ¼nde beÅŸ kÃ¼Ã§Ã¼k tohum, kÄ±rÄ±lmaz bir zincir. Seninkini ek.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Daily Stitch\'i dene';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Daily Stitch\'te gÃ¼nlÃ¼k zincirimi oluÅŸturuyorum â€” $code davet kodumla katÄ±l, ikimiz de bÃ¼yÃ¼yelim.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Bana Daily Stitch\'te katÄ±l';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Daily Stitch ilerlemem â€” $year Daily Stitch\'te.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Daily Stitch\'te \"$title\" madalyasÄ±nÄ± aÃ§tÄ±m. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Tamamlanan gÃ¶revler';

  @override
  String get insightsReceiptPerfectDays => 'MÃ¼kemmel gÃ¼nler';

  @override
  String get insightsReceiptCompletion => 'Tamamlanma';

  @override
  String insightsReceiptDate(String date) {
    return 'Hafta: $date';
  }

  @override
  String get insightsReceiptFooter => 'Zinciri kÄ±rma.';

  @override
  String get elementLabelWater => 'Su';

  @override
  String get elementLabelLight => 'IÅŸÄ±k';

  @override
  String get elementLabelSoil => 'Toprak';

  @override
  String get elementLabelBreeze => 'RÃ¼zgar';

  @override
  String get elementTaglineWater =>
      'Yenile. Hidrasyon, dinlenme, duygusal bakÄ±m â€” kuyuyu dolduran her ÅŸey.';

  @override
  String get elementTaglineLight =>
      'Uyan. Sabah Ä±ÅŸÄ±ÄŸÄ±, odak bloklarÄ±, Ã§alÄ±ÅŸma, meditasyon â€” enerji ve netlik.';

  @override
  String get elementTaglineSoil =>
      'YerleÅŸ. Okuma, gÃ¼nlÃ¼k, derin Ã§alÄ±ÅŸma â€” uzun vadeli gÃ¼Ã§ inÅŸa eden yavaÅŸ kÃ¶kler.';

  @override
  String get elementTaglineBreeze =>
      'Hareket et. YÃ¼rÃ¼yÃ¼ÅŸler, koÅŸular, nefes egzersizleri â€” kafayÄ± temizleyen hafif, mobil enerji.';

  @override
  String get elementWhenWater => 'TÃ¼kenmiÅŸ veya yorgun hissettiÄŸinde.';

  @override
  String get elementWhenLight => 'GÃ¼ne net bir baÅŸlangÄ±Ã§ gerektiÄŸinde.';

  @override
  String get elementWhenSoil =>
      'Ä°ÅŸ yavaÅŸ ama deÄŸerli olduÄŸunda (Ã§alÄ±ÅŸma, zanaat, bakÄ±m).';

  @override
  String get elementWhenBreeze =>
      'Bedensel (veya zihinsel) olarak hareket etmeye ve nefes almaya ihtiyacÄ±n olduÄŸunda.';

  @override
  String get bloomTierMastery => 'UstalÄ±k';

  @override
  String get bloomTierStrong => 'GÃ¼Ã§lÃ¼';

  @override
  String get bloomTierGrowing => 'BÃ¼yÃ¼yor';

  @override
  String get bloomTierSprouting => 'Filizleniyor';

  @override
  String get bloomTierLocked => 'Kilitli';

  @override
  String habitBloomSubtitle(int count, String element) {
    return '$count gÃ¼nlÃ¼k seri Â· $element';
  }

  @override
  String get medal_id_first_spark => 'Ä°lk KÄ±vÄ±lcÄ±m';

  @override
  String get medal_sub_first_spark => 'Ã‡akmaÄŸÄ± yaktÄ±n.';

  @override
  String get medal_desc_first_spark =>
      'Ä°lk gÃ¶revini tamamla. Her zincir burada baÅŸlar.';

  @override
  String get medal_id_triple_seed => 'ÃœÃ§lÃ¼ Tohum';

  @override
  String get medal_sub_triple_seed => 'ÃœÃ§Ã¼ topraÄŸa.';

  @override
  String get medal_desc_triple_seed => 'Toplam 3 gÃ¶rev tamamla.';

  @override
  String get medal_id_dozen_sower => 'On Ä°kili Ekici';

  @override
  String get medal_sub_dozen_sower => 'On iki tarla.';

  @override
  String get medal_desc_dozen_sower => 'Toplam 12 gÃ¶rev tamamla.';

  @override
  String get medal_id_quarter_century => 'Ã‡eyrek AsÄ±r';

  @override
  String get medal_sub_quarter_century => 'Evet demenin mevsimi.';

  @override
  String get medal_desc_quarter_century => 'Toplam 25 gÃ¶rev tamamla.';

  @override
  String get medal_id_productivity_titan => 'Verimlilik Devi';

  @override
  String get medal_sub_productivity_titan => 'TutarlÄ±lÄ±k birikir.';

  @override
  String get medal_desc_productivity_titan =>
      '50 gÃ¶rev tamamla â€” gerÃ§ek bir ivme oluÅŸturdun.';

  @override
  String get medal_id_century_planter => 'YÃ¼zlÃ¼k Ekici';

  @override
  String get medal_sub_century_planter => 'Kendi ormanÄ±n.';

  @override
  String get medal_desc_century_planter =>
      '100 gÃ¶rev tamamla. KullanÄ±cÄ±larÄ±n %5\'indesin.';

  @override
  String get medal_id_clean_day => 'Temiz Sayfa';

  @override
  String get medal_sub_clean_day => 'Tek bir bile yok.';

  @override
  String get medal_desc_clean_day =>
      'Tek bir gÃ¼nde ektiÄŸin her gÃ¶revi tamamla.';

  @override
  String get medal_id_triple_perfect => 'ÃœÃ§lÃ¼ MÃ¼kemmel';

  @override
  String get medal_sub_triple_perfect => 'ÃœÃ§ kusursuz koÅŸu.';

  @override
  String get medal_desc_triple_perfect => '3 mÃ¼kemmel gÃ¼n ulaÅŸ.';

  @override
  String get medal_id_perfect_week => 'MÃ¼kemmel Hafta';

  @override
  String get medal_sub_perfect_week => 'Yedi gÃ¼n kÄ±rÄ±lmadÄ±.';

  @override
  String get medal_desc_perfect_week => 'Art arda 7 mÃ¼kemmel gÃ¼n.';

  @override
  String get medal_id_two_week_chain => 'Ä°ki HaftalÄ±k Kuvvet';

  @override
  String get medal_sub_two_week_chain => 'Ä°ki hafta ateÅŸ iÃ§inde.';

  @override
  String get medal_desc_two_week_chain => '14 gÃ¼nlÃ¼k zincirini koru.';

  @override
  String get medal_id_iron_chain => 'Demir Zincir';

  @override
  String get medal_sub_iron_chain => '30 baÄŸlantÄ± dÃ¶vÃ¼ldÃ¼.';

  @override
  String get medal_desc_iron_chain =>
      '30 gÃ¼nlÃ¼k zincir. En zor gÃ¶rev madalyasÄ±.';

  @override
  String get medal_id_quarterly_chain => 'ÃœÃ§ AylÄ±k Zincir';

  @override
  String get medal_sub_quarterly_chain => 'Bir mevsim, kÄ±rÄ±lmadÄ±.';

  @override
  String get medal_desc_quarterly_chain =>
      '90 gÃ¼nlÃ¼k zincir. Efsanevi statÃ¼.';

  @override
  String get medal_id_vital_priority => 'Vital KÄ±vÄ±lcÄ±m';

  @override
  String get medal_sub_vital_priority => 'Zor olanlarÄ± seÃ§tin.';

  @override
  String get medal_desc_vital_priority => 'Vital Ã¶ncelikli 5 gÃ¶revi tamamla.';

  @override
  String get medal_id_spark_priority => 'KÄ±vÄ±lcÄ±m EÄŸitici';

  @override
  String get medal_sub_spark_priority => 'HÄ±zlÄ± kazanÃ§lar birikir.';

  @override
  String get medal_desc_spark_priority =>
      'KÄ±vÄ±lcÄ±m Ã¶ncelikli 5 gÃ¶revi tamamla.';

  @override
  String get medal_id_note_taker => 'Not Tutan';

  @override
  String get medal_sub_note_taker =>
      'KaÄŸÄ±ttaki planlar kafadaki planlarÄ± yener.';

  @override
  String get medal_desc_note_taker =>
      '5 farklÄ± gÃ¶reve hazÄ±rlÄ±k notlarÄ± ekle.';

  @override
  String get medal_id_left_behind_rescuer => 'Geri Kalan KurtarÄ±cÄ±';

  @override
  String get medal_sub_left_behind_rescuer => 'GÃ¶rev geride kalmadÄ±.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Ertesi gÃ¼n 3 kaÃ§Ä±rÄ±lmÄ±ÅŸ gÃ¶revi tekrar ekle.';

  @override
  String get medal_id_first_sprout => 'Ä°lk Filiz';

  @override
  String get medal_sub_first_sprout => 'Yeni bir gÃ¼nlÃ¼k ritÃ¼el.';

  @override
  String get medal_desc_first_sprout => 'Ä°lk alÄ±ÅŸkanlÄ±ÄŸÄ±nÄ± ek.';

  @override
  String get medal_id_trio_sprout => 'ÃœÃ§lÃ¼ Filiz';

  @override
  String get medal_sub_trio_sprout => 'KÃ¼Ã§Ã¼k bir ekosistem.';

  @override
  String get medal_desc_trio_sprout => '3 farklÄ± alÄ±ÅŸkanlÄ±k ek.';

  @override
  String get medal_id_week_of_growth => 'BÃ¼yÃ¼me HaftasÄ±';

  @override
  String get medal_sub_week_of_growth => 'KÃ¶kler tutunmaya baÅŸlÄ±yor.';

  @override
  String get medal_desc_week_of_growth =>
      '7 gÃ¼n boyunca her gÃ¼n bir alÄ±ÅŸkanlÄ±ÄŸÄ± sula.';

  @override
  String get medal_id_fortnight_floret => 'Ä°ki HaftalÄ±k Ã‡iÃ§ek';

  @override
  String get medal_sub_fortnight_floret => 'Tam Ã§iÃ§ek aÃ§ma.';

  @override
  String get medal_desc_fortnight_floret => '14 gÃ¼nlÃ¼k alÄ±ÅŸkanlÄ±k serisi.';

  @override
  String get medal_id_rooted_master => 'KÃ¶klenmiÅŸ Usta';

  @override
  String get medal_sub_rooted_master => 'Derin kÃ¶kler, derin gÃ¼Ã§.';

  @override
  String get medal_desc_rooted_master => '30 gÃ¼nlÃ¼k alÄ±ÅŸkanlÄ±k serisi.';

  @override
  String get medal_id_half_year_bloom => 'YÄ±llÄ±k Ã‡iÃ§ek';

  @override
  String get medal_sub_half_year_bloom => 'BahÃ§e artÄ±k kalÄ±cÄ±.';

  @override
  String get medal_desc_half_year_bloom =>
      'Tek bir alÄ±ÅŸkanlÄ±ÄŸÄ± 180 gÃ¼n koru.';

  @override
  String get medal_id_garden_keeper => 'BahÃ§e BekÃ§isi';

  @override
  String get medal_sub_garden_keeper => 'Ã‡eÅŸitlilik, birlikte.';

  @override
  String get medal_desc_garden_keeper =>
      'AynÄ± anda 4 farklÄ± alÄ±ÅŸkanlÄ±k bÃ¼yÃ¼t.';

  @override
  String get medal_id_hydration_hero => 'Hidrasyon KahramanÄ±';

  @override
  String get medal_sub_hydration_hero => 'Kuyuyu dolduruyorsun.';

  @override
  String get medal_desc_hydration_hero =>
      'Bir hidrasyon alÄ±ÅŸkanlÄ±ÄŸÄ± ek (su/iÃ§ecek).';

  @override
  String get medal_id_mindful_mover => 'BilinÃ§li HareketÃ§i';

  @override
  String get medal_sub_mindful_mover => 'Beden hatÄ±rlar.';

  @override
  String get medal_desc_mindful_mover =>
      'Bir hareket alÄ±ÅŸkanlÄ±ÄŸÄ± ek (yoga/yÃ¼rÃ¼yÃ¼ÅŸ/koÅŸu).';

  @override
  String get medal_id_devoted_keeper => 'AdanmÄ±ÅŸ BekÃ§i';

  @override
  String get medal_sub_devoted_keeper => 'AltmÄ±ÅŸ gÃ¼n, bir uygulama.';

  @override
  String get medal_desc_devoted_keeper =>
      'Tek bir alÄ±ÅŸkanlÄ±ÄŸÄ± aralÄ±ksÄ±z 60 gÃ¼n sula.';

  @override
  String get medal_id_tending_notes => 'BakÄ±m NotlarÄ±';

  @override
  String get medal_sub_tending_notes => 'Yolculuk boyunca dÃ¼ÅŸÃ¼n.';

  @override
  String get medal_desc_tending_notes =>
      '3 alÄ±ÅŸkanlÄ±ÄŸa bakÄ±m notlarÄ± ekle.';

  @override
  String get medalTierTaglineSprout => 'Ä°lk tohumu ek';

  @override
  String get medalTierTaglineCommon => 'AlÄ±ÅŸkanlÄ±ÄŸÄ± inÅŸa et';

  @override
  String get medalTierTaglineRare => 'GerÃ§ek bir ivme gÃ¶ster';

  @override
  String get medalTierTaglineEpic => 'Sen bir doÄŸa gÃ¼cÃ¼sÃ¼n';

  @override
  String get medalTierTaglineLegendary =>
      'Efsanevi, neredeyse kimse buraya ulaÅŸamaz';

  @override
  String get guardianHeadlineNoTasks =>
      'BugÃ¼nÃ¼n topraÄŸÄ± taze.\nÄ°lk tohumunu ek\nve bÃ¼yÃ¼rken izle.';

  @override
  String get guardianHeadlineAllDone =>
      'EktiÄŸin her tohum\nÃ§Ã§ek aÃ§tÄ±.\nDinlen, Koruyucu â€” hak ettin.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count gÃ¼n\nkÄ±rÄ±lmadan bÃ¼yÃ¼dÃ¼.\nOrmanÄ±n hayatla dolu.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Tam bir hafta Ã§iÃ§ek aÃ§tÄ±,\nKoruyucu.\nBir mÃ¼kemmel gÃ¼n daha\nzinciri uzatÄ±r.';

  @override
  String get guardianHeadlineStreak3 =>
      'Zincirin ayakta.\nHÃ¢lÃ¢ aÃ§Ä±lacak\ntohunlara bakÄ±m yap.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'GÃ¶revleri iyi yÃ¶netiyorsun.\nBir filiz ek â€”\nalÄ±ÅŸkanlÄ±klar ormanÄ±n nasÄ±l bÃ¼yÃ¼dÃ¼ÄŸÃ¼nÃ¼ belirler.';

  @override
  String get guardianHeadlineSomeDone =>
      'BazÄ± tohumlar aÃ§tÄ±,\nbazÄ± aÃ§madÄ±. Sorun deÄŸil.\nYarÄ±n yeni bir ekim gÃ¼nÃ¼.';

  @override
  String get guardianHeadlineMorning =>
      'GÃ¼naydÄ±n, Koruyucu.\nGÃ¼n henÃ¼z genÃ§\nve toprak hazÄ±r.';

  @override
  String get guardianHeadlineAfternoon =>
      'Ä°yi gÃ¼nler, Koruyucu.\nIÅŸÄ±ÄŸÄ±n yarÄ±sÄ± kaldÄ± â€”\nbakmaya devam et.';

  @override
  String get guardianHeadlineEvening =>
      'Ä°yi akÅŸamlar, Koruyucu.\nGÃ¼neÅŸ batmadan Ã¶nce\nson bir tarama.';

  @override
  String get guardianHeadlineNight =>
      'Gece yarÄ±sÄ±nda Ã§alÄ±ÅŸÄ±yor musun?\nKoruyucular bile dinlenir.\nYarÄ±nÄ±n tohumunu ÅŸimdi ek.';

  @override
  String get guardianBodyNoTasks =>
      'KorunaÄŸÄ±n ÅŸu anda sessiz. Bir niyet ekle ve gÃ¼n batÄ±mÄ±na kadar neyin deÄŸiÅŸtiÄŸine bak.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count gÃ¼ndÃ¼r devam ediyor. Zincir ÅŸans deÄŸil â€” biriken kÃ¼Ã§Ã¼k seÃ§imler. Biriktirmeye devam et.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return '$count gÃ¼nlÃ¼k zincir gerÃ§ek bir ivme. BugÃ¼n aÃ§Ä±k tohumlarÄ±nÄ± bitirmeden bitirme.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Åžimdiye kadar $count gÃ¶rev ekledin. Tek bir alÄ±ÅŸkanlÄ±k filizi eklemek, iÅŸin her gÃ¼n birikmesini saÄŸlar.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Ektiklerinin %$pct\'ini tamamlÄ±yorsun. Daha az, daha keskin tohumlar genellikle on saÃ§Ä±lÄ±mdan daha yÃ¼ksek bÃ¼yÃ¼r.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'KorunaÄŸÄ±n canlÄ±. $tasks gÃ¶rev tamamlandÄ±, $sprouts filiz bÃ¼yÃ¼yor â€” emek meyvesini veriyor.';
  }

  @override
  String get guardianInsightWaitingTitle => 'Ä°lk hamleni bekliyor';

  @override
  String get guardianInsightWaitingBody =>
      'Bir gÃ¶rev veya alÄ±ÅŸkanlÄ±k ekle, bahÃ§endeki kalÄ±plarÄ± okumaya baÅŸlayayÄ±m. Ne kadar Ã§ok ekersen, o kadar Ã§ok ÅŸey Ã¶ÄŸrenirim.';

  @override
  String get guardianInsightWaitingCta => 'Ä°lk tohumunu ek';

  @override
  String get guardianInsightChainSuperTitle => 'Zincir sÃ¼per gÃ¼cÃ¼n';

  @override
  String guardianInsightChainSuperBody(int count) {
    return '$count gÃ¼nlÃ¼k bir zincirin var. Seriler her zaman motivasyonu yener â€” yavaÅŸ gÃ¼nlerde bile sÄ±cak tut.';
  }

  @override
  String get guardianInsightChainSuperCta => 'YarÄ±nÄ±n tohumunu ekle';

  @override
  String get guardianInsightChainColdTitle =>
      'Zincir soÄŸuk â€” yeni bir tane baÅŸlat';

  @override
  String get guardianInsightChainColdBody =>
      'Daha Ã¶nce ektin, bu tekrar ekebileceÄŸin anlamÄ±na gelir. BugÃ¼n yapÄ±lan kÃ¼Ã§Ã¼k bir gÃ¶rev, yarÄ±n daha uzun bir zincirdir.';

  @override
  String get guardianInsightChainColdCta => 'Bir tohum ek';

  @override
  String get guardianInsightLessIsMoreTitle => 'Bu hafta daha az daha fazla';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Ektiklerinin yaklaÅŸÄ±k %$pct\'ini tamamlÄ±yorsun. 5 gevÅŸek niyet yerine 3 keskin niyet dene â€” kalite birikir.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'GÃ¼nÃ¼ keskinleÅŸtir';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Sonraki madalya: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return '$target ${unit}ten $value\'indesin. BirkaÃ§ dÃ¼rÃ¼st gÃ¼n daha ve senin.';
  }

  @override
  String get guardianInsightNextMedalCta => 'MadalyayÄ± gÃ¶ster';

  @override
  String get guardianInsightSteadyTitle => 'Dengeli bir mevsimdesin';

  @override
  String get guardianInsightSteadyBody =>
      'Hemen kÃ¶ÅŸede bir madalya yok â€” sorun deÄŸil. Sahip olduÄŸuna bakÄ±m yap. Bir sonraki Ã§iÃ§ek aÃ§ma yolda.';

  @override
  String get guardianInsightSteadyCta => 'Ä°lerlemeyi gÃ¶r';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      'Zincirinde 1 gÃ¶rev kaldÄ±. Gece yarÄ±sÄ± geliyor.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return 'Zincirinde $count gÃ¶rev kaldÄ±. Gece yarÄ±sÄ± geliyor.';
  }

  @override
  String get notificationEveningBodyOne =>
      'BugÃ¼n hÃ¢lÃ¢ 1 aÃ§Ä±k gÃ¶revin var.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'BugÃ¼n hÃ¢lÃ¢ $count aÃ§Ä±k gÃ¶revin var.';
  }

  @override
  String get notificationTickerTaskReminder => 'GÃ¶rev hatÄ±rlatmasÄ±';

  @override
  String get notificationTickerTaskAlarm => 'GÃ¶rev alarmÄ±';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count gÃ¼nlÃ¼k seri Â· $element';
  }
}
