// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ديلي ستتش';

  @override
  String get tabToday => 'اليوم';

  @override
  String get tabProgress => 'التقدم';

  @override
  String get tabYou => 'أنت';

  @override
  String get navMyDay => 'يومي';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get navHelp => 'المساعدة والدعم';

  @override
  String get navHistory => 'آخر 7 أيام';

  @override
  String get navLeftBehind => 'المتروكة';

  @override
  String get navInsights => 'تقدمك';

  @override
  String get navMedals => 'ميدالياتي';

  @override
  String get navManagePro => 'إدارة اشتراك Pro';

  @override
  String get navPaywall => 'ديلي ستتش Pro';

  @override
  String get greetingLateNight => 'تسهر حتى منتصف الليل';

  @override
  String get greetingMorning => 'صباح الخير، أيتها الشمس!';

  @override
  String get greetingAfternoon => 'مساء الخير، يا صديق';

  @override
  String get greetingEvening => 'مساء الخير، أيها البطل';

  @override
  String get greetingNight => 'ترتاح جيداً، أيها الحارس؟';

  @override
  String todayTasksCount(String done, String total) {
    return 'اليوم · $done من $total مهمة';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done من $total عادات';
  }

  @override
  String get todayChainGrows => 'السلسلة تنمو كلما أنهيت';

  @override
  String get todayChainComplete => 'السلسلة مكتملة · اعتنِ بالحديقة غداً';

  @override
  String get taskCapInfo => 'لماذا حد 5 مهام؟';

  @override
  String get taskCapDiscipline => 'الانضباط أولاً بالتصميم';

  @override
  String get taskCapTitle => 'نحدد يومك بـ 5 مهام عمداً.';

  @override
  String get taskCapBody =>
      'السلاسل الصغيرة أفضل من الطويلة. من المرجح أن تنهي 3 من 5 وتشعر بالانتصار بدلاً من أن تتخلى عن 8 من 10 وتشعر بالخسارة.';

  @override
  String get taskCapBulletDone => 'يتم احتساب المهام المنجزة ضمن سلسلتك';

  @override
  String get taskCapBulletDoneBody =>
      'إن اليوم الذي تنتهي فيه من الخمسة كلها يزيد من خطك بمقدار واحد.';

  @override
  String get taskCapBulletMissed => 'يتم نقل المهام الفائتة إلى المتروكة';

  @override
  String get taskCapBulletMissedBody =>
      'في منتصف الليل، تظهر المهام غير المكتملة في المتروكة. إعادة إضافة فقط ما لا يزال يهم.';

  @override
  String get taskCapBulletFreeze => 'تجميد السلسلة يغفر الخطأ';

  @override
  String get taskCapBulletFreezeBody =>
      'يمنحك Pro تجميدَي سلسلة في الشهر - فهي تغطي يوماً ضائعاً حتى تبقى سلسلتك على قيد الحياة.';

  @override
  String get tasksHeader => 'المهام';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'أضف بذرة مهمة';

  @override
  String get tasksCapReached =>
      'تم استخدام 5/5 خانات — أنهِ واحدة لزرع بذرة جديدة.';

  @override
  String get tasksEmptyCta => 'ازرع أول بذرة — ما الذي يهم اليوم؟';

  @override
  String get habitsHeader => 'العادات';

  @override
  String habitsGrowing(String count) {
    return '$count تزايد';
  }

  @override
  String habitsBestStreak(String days) {
    return 'أفضل $days د';
  }

  @override
  String get habitsPlantNew => 'ازرع عادة جديدة';

  @override
  String get habitsPlantFirst => 'ازرع عادة';

  @override
  String get habitsLocked => 'خانة عادة Pro — افتح لزرع المزيد';

  @override
  String get habitsSlotsFull => 'جميع خانات العادة ممتلئة حاليًا.';

  @override
  String habitsStreakDays(String days) {
    return '$days د';
  }

  @override
  String get habitsCadence => 'يومي';

  @override
  String leftBehindBanner(String count) {
    return '$count غاب — لا يزال في المتروكة';
  }

  @override
  String get leftBehindTap => 'انقر للإضافة مرة أخرى أو اتركها';

  @override
  String get leftBehindDismiss => 'تجاهل';

  @override
  String get leftBehindTitle => 'المتروكة';

  @override
  String get leftBehindEmpty => 'لا شيء متروك';

  @override
  String get leftBehindEmptyBody =>
      'لا توجد مهام فائتة. كل بذرة تزرعها يتم الاعتناء بها. الحديقة نظيفة.';

  @override
  String get leftBehindClearAll => 'مسح الكل';

  @override
  String get leftBehindClearAllConfirm => 'مسح كل المتروك؟';

  @override
  String leftBehindClearAllBody(String count) {
    return 'سيؤدي هذا إلى إزالة $count من المهام الفائتة بشكل دائم. لا يمكنك التراجع عن هذا.';
  }

  @override
  String get leftBehindReAdd => 'إعادة إضافة اليوم';

  @override
  String get leftBehindReAddButton => 'إعادة الإضافة';

  @override
  String get leftBehindAddedToToday => 'يضاف إلى اليوم';

  @override
  String get leftBehindLetGo => 'اتركها';

  @override
  String get leftBehindHeader => 'المتروكة';

  @override
  String get leftBehindMissedTasks => 'المهام الفائتة';

  @override
  String get leftBehindWaitingOne => 'مهمة واحدة في انتظارك.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count من المهام في انتظارك.';
  }

  @override
  String get leftBehindBody =>
      'أعد إضافة مهمة لإعادتها إلى اليوم، أو اتركها. إعادة الإضافة تحافظ على خطك حيًا.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" عادت إلى يومك.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'تمت إزالة \"$task\"';
  }

  @override
  String get leftBehindClearedSnack => 'تم مسح المتروكة';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'أمس · $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count من المهام المتبقية لهذا اليوم';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'المكالمة الأخيرة - لا تزال $count مهمة مفتوحة';
  }

  @override
  String get streakAtRiskBody => 'منتصف الليل قريب. السلسلة تعتمد على هذه.';

  @override
  String get streakAtRiskBodyLow => 'لا يزال لديك الوقت. يوم نظيف يمتد خطك.';

  @override
  String get streakAtRiskFreeze => 'غاب بالأمس - استخدم تجميد السلسلة؟';

  @override
  String get streakFreezeUse => 'استخدم التجميد';

  @override
  String get streakFreezeUseForYesterday =>
      'استخدم تجميد السلسلة الشهري ليوم أمس';

  @override
  String get streakFreezeAppliedYesterday => 'تم تطبيق تجميد السلسلة يوم أمس.';

  @override
  String get chainBrokenTitle => 'انكسرت السلسلة. هذا جيد.';

  @override
  String get chainBrokenBody =>
      'كل سلسلة طويلة تنتهي مرة واحدة. المهم هو ما تزرعه اليوم. يوم مثالي يبدأ باليوم التالي.';

  @override
  String get chainBrokenCta => 'العودة إلى اليوم';

  @override
  String get chainBrokenPlantFirst => 'ازرع البذرة الأولى اليوم';

  @override
  String get chainBrokenCheck => 'تحقق من المتروكة أولاً';

  @override
  String get chainBrokenBestChain => 'أفضل سلسلة';

  @override
  String get chainBrokenTasksDone => 'المهام المنجزة';

  @override
  String get chainBrokenSprouts => 'براعم';

  @override
  String get chainRecoveryFreshStart => 'بداية جديدة';

  @override
  String get medalsTitle => 'ميدالياتي';

  @override
  String get medalsTrophyRoom => 'غرفة الكؤوس';

  @override
  String get medalsAllMedals => 'كل الميداليات';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned من $total الميداليات المكتسبة';
  }

  @override
  String get medalsTrophyEmpty => 'شارتك الأولى على بعد مهمة واحدة';

  @override
  String get medalsTrophyFirst => 'حصلت على ميداليتك الأولى — استمر';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned ميدالية في غرفة الكؤوس';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'التقدم نحو $total ميدالية';
  }

  @override
  String get medalsShareCta => 'أنشئ بطاقة قابلة للمشاركة';

  @override
  String get medalsEmptyTitle => 'لا شيء في هذه الفئة بعد';

  @override
  String get medalsEmptyBody => 'أنهِ مهمة أو اعتنِ ببرعم لبدء غرفة الكؤوس.';

  @override
  String get medalSheetLocked => 'ميدالية PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'مُكتسبة · $tier';
  }

  @override
  String get medalSheetUnlock => 'افتح مع Pro';

  @override
  String get medalSheetProgress => 'التقدم';

  @override
  String medalSheetHint(String n, String unit) {
    return 'فقط $n $unit إضافية لفتحها.';
  }

  @override
  String get medalSheetAlmost => 'خطوة واحدة للفتح.';

  @override
  String get medalCategory => 'الفئة';

  @override
  String get medalShareOnSocials => 'شارك على وسائل التواصل';

  @override
  String get medalShareLater => 'لاحقاً';

  @override
  String get medalUnlocked => 'تم فتح الميدالية';

  @override
  String get medalProgressTitle => 'التقدم';

  @override
  String get historyTitle => 'آخر 7 أيام';

  @override
  String get historyFullTitle => 'التاريخ الكامل';

  @override
  String get historyLoadError => 'تعذر تحميل السجل.';

  @override
  String get historyFullCalendar => 'تقويم كامل';

  @override
  String historyCompletedPercent(String percent) {
    return 'تم إكمال $percent%';
  }

  @override
  String historyThisWeek(String days) {
    return 'آخر $days أيام';
  }

  @override
  String get historyDayByDay => 'يوم بيوم';

  @override
  String get historyEmpty => 'زرع بعض البذور لرؤية أسبوعك يتكشف.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'أنجزت $done من أصل $total مهمة. $perfect يوم (أيام) مثالية.';
  }

  @override
  String get historyUpsellTitle => 'اعرض سجلك الكامل';

  @override
  String get historyUpsellBody => 'يفتح Pro 30 يوماً من السجل. المجاني يعرض 7.';

  @override
  String get historyPerfect => 'مثالي';

  @override
  String get historyFrozen => 'مجمد';

  @override
  String get historyToday => 'اليوم';

  @override
  String get historyEmptyDay => 'لم تزرع أي بذرة في ذلك اليوم';

  @override
  String historyLeftBehindCount(String count) {
    return '$count تركوا وراءهم';
  }

  @override
  String get progressVitality => 'حيوية اليوم';

  @override
  String get progressVitalityEmpty => 'ازرع بذرة لبدء حديقتك.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done من $total بذور مزروعة اليوم.';
  }

  @override
  String progressChainPill(String days) {
    return 'سلسلة $daysي';
  }

  @override
  String get progressMetricCurrent => 'الحالية';

  @override
  String get progressMetricBest => 'الأفضل';

  @override
  String get progressMetricDone => 'منجزة';

  @override
  String get progressMetricPerfect => 'مثالية';

  @override
  String get progressMetricHabits => 'العادات';

  @override
  String get progressHabitBlooms => 'إزهار العادات';

  @override
  String get progressHabitBloomsSub =>
      'معالم السلسلة للبراعم التي تسقيها يومياً.';

  @override
  String get progressNextBadge => 'الشارة التالية';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned من $total';
  }

  @override
  String get progressPersonalActivity => 'النشاط الشخصي';

  @override
  String progressBrowseMonth(String month) {
    return 'التصفح $month. اضغط على \"اليوم\" للعودة إلى نشاطك المباشر.';
  }

  @override
  String get progressJumpToToday => 'اليوم';

  @override
  String get progressCalendarLegend => 'الأغمق = الأكثر إنجازاً';

  @override
  String get progressCalendarBody =>
      'الأخضر الغامق يعني يوماً مثالياً. يتلاشى اللون كلما تخطيت.';

  @override
  String get paywallTitle => 'لا تكسر السلسلة.';

  @override
  String get paywallSubtitle => 'يمنحك Daily Stitch Pro نظام الانضباط الكامل.';

  @override
  String get paywallFeatures =>
      'جميع فتحات العادات الخمس، وليس 3 فقط|تاريخك الكامل، إلى الأبد|مجموعة الميداليات الكاملة|تجميد السلسلة كل شهر|الإيصال الأسبوعي + بطاقات المشاركة|المواضيع + المزيد';

  @override
  String get paywallFeaturesBodies =>
      'الإصدار المجاني يمنحك 3 فتحات. يفتح Pro جميع الخمس حتى تتمكن طقوسك اليومية الكاملة من العيش هنا.|تصفح كل يوم أكملته — وليس فقط آخر 7 أيام. انظر إلى السنوات الماضية، وليس الأسابيع.|افتح ميداليات الطبقة الأسطورية. أندر الشارات هي للأشخاص الذين يبذلون كل ما في وسعهم.|تجميدان شهريان حتى لا ينهي يوم سيء سلسلتك.|بطاقات مشاركة جميلة لأسبوعك. انشر سلسلتك، وألهم شخصاً آخر للبدء.|افتح ألواناً وسمات مميزة جديدة عندما نضيفها. تحديثات مجانية دائماً.';

  @override
  String get paywallYearly => 'سنوي';

  @override
  String get paywallYearlyCaption => 'أفضل قيمة · ~2.50\$/شهر';

  @override
  String get paywallYearlyBadge => 'وفر 35%';

  @override
  String get paywallMonthly => 'شهري';

  @override
  String get paywallMonthlyCaption => 'فوترة شهرية · إلغاء في أي وقت';

  @override
  String paywallStartCta(String price) {
    return 'ابدأ Pro · $price/سنة';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'ابدأ Pro · $price/شهر';
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
  String get paywallRestore => 'استعادة الشراء';

  @override
  String get paywallTerms => 'الشروط';

  @override
  String get paywallPrivacy => 'الخصوصية';

  @override
  String get paywallNoRestore =>
      'لم يتم العثور على عملية شراء سابقة على هذا الحساب.';

  @override
  String get paywallRestoreLater =>
      'سنستعيد عملية الشراء عند المزامنة التالية.';

  @override
  String get paywallAlreadyPro => 'أنت على Pro. شكراً لدعمك.';

  @override
  String get paywallHabitSlotHead =>
      'لقد استخدمت كل خانات العادات المجانية. افتح المجموعة الكاملة.';

  @override
  String get paywallHistoryHead =>
      'اعرض سجلك الكامل — كل يوم مثالي، كل ميدالية، كل عودة.';

  @override
  String get paywallMedalHead =>
      'الميداليات النادرة حصرية لـ Pro. استمر — أنت أقرب مما تظن.';

  @override
  String get settingsYourActivity => 'نشاطك';

  @override
  String get settingsHelpInfo => 'مساعدة ومعلومات';

  @override
  String get settingsAccount => 'الحساب';

  @override
  String get settingsNurturingTools => 'أدوات';

  @override
  String get settingsReminders => 'التذكيرات';

  @override
  String get settingsWidgetSanctuary => 'الودجة';

  @override
  String get settingsEcosystemSupport => 'الدعم';

  @override
  String get settingsHowItWorks => 'كيف يعمل';

  @override
  String get settingsSignOut => 'تسجيل الخروج';

  @override
  String get settingsSignOutConfirm => 'هل تريد بالتأكيد تسجيل الخروج؟';

  @override
  String get settingsProActive => 'نشط';

  @override
  String get settingsProFree => 'المستوى المجاني';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsLanguageValue => 'افتراضي النظام';

  @override
  String get firstRunGreeting => '5 مهام. لا أكثر. اجعلها ذات قيمة.';

  @override
  String get firstRunBody => 'ازرع أول بذرة — ما الذي يهم اليوم؟';

  @override
  String get firstRunCta => 'ازرع أول بذرة';

  @override
  String get emptyStateClearAll => 'مسح الكل';

  @override
  String get cancel => 'إلغاء';

  @override
  String get intentionTitle1 => 'دعونا نزرع نية جديدة!';

  @override
  String get intentionBody1 =>
      'كل غابة عظيمة تبدأ باختيار واحد صغير. أخبرني ماذا نرعى اليوم؟';

  @override
  String get intentionTitle2 => 'ماذا سننمو اليوم؟';

  @override
  String get intentionBody2 =>
      'البذور الصغيرة، إذا تم الاعتناء بها بعناية، تصبح أشجاراً طويلة. اختر الأكثر أهمية الآن.';

  @override
  String get intentionTitle3 => 'بذرة واحدة. نفس واحد. يبدأ.';

  @override
  String get intentionBody3 =>
      'ليس من الضروري أن تزرع الغابة بأكملها مرة واحدة، فقط الشيء الصحيح التالي.';

  @override
  String get intentionTitle4 => 'رعاية الخطوة الصغيرة التالية.';

  @override
  String get intentionBody4 =>
      'المستقبل — أنت مبني على الاختيارات التي تقوم بها في الدقائق الخمس القادمة. ما هي واحدة لطيفة؟';

  @override
  String get intentionTitle5 => 'اختر ما تريد أن تصبح.';

  @override
  String get intentionBody5 =>
      'المهام بذور، والعادات براعم. معاً يشكلون غابة تفتخر بها.';

  @override
  String get intentionTitle6 => 'ازرع شيئاً يستحق التذكر.';

  @override
  String get intentionBody6 =>
      'لن تشعر بالضخامة كل يوم. لا تزال البذرة المسقية ذات أهمية. لنسمِ واحداً.';

  @override
  String get intentionTitle7 => 'اجعل اليوم أكثر شجاعة قليلاً.';

  @override
  String get intentionBody7 =>
      'شجاعة تتراكم. اختر البذرة التي كنت تؤجلها — حتى تسميتها تدفعها للأمام.';

  @override
  String get intentionTitle8 => 'رعاية التربة قبل البذرة.';

  @override
  String get intentionBody8 =>
      'ما هي العقلية أو الأداة أو الطقوس الصغيرة التي ستجعل هذه المهمة أسهل؟ أضفها إلى الملاحظات.';

  @override
  String get shareCardSnapshot => 'لقطة من ملاذك';

  @override
  String get shareCardBody =>
      'يتم تصدير البطاقة أعلاه بصيغة PNG وإرسالها إلى ورقة المشاركة. انشرها على قصتك، أو أرسلها إلى صديق، أو اطبعها كملصق.';

  @override
  String get shareCardShareMyBloom => 'شارك إزهارتي';

  @override
  String get shareCardCouldNotShare => 'لا يمكن المشاركة الآن';

  @override
  String shareCardProgressText(String year) {
    return 'تقدمي في Daily Stitch — $year على Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'لقد فتحت للتو ميدالية \"$title\" في Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'كيف يعمل';

  @override
  String get howItWorksBody =>
      'يساعدك Daily Stitch في الحفاظ على سلسلة انضباط صغيرة لا تنكسر. هذا كل شيء.';

  @override
  String get howItWorksToday => 'علامة تبويب اليوم';

  @override
  String get howItWorksTodayBody =>
      'هذا هو منزلك. يعرض 5 المهام والعادات التي حددتها لليوم. أنهها قبل منتصف الليل، السلسلة تتمدد.';

  @override
  String get howItWorksCap => 'حد الـ 5 مهام هو الميزة';

  @override
  String get howItWorksCapBody =>
      'لا نسمح لك بإضافة السادس. هذه هي النقطة. السلاسل الصغيرة تتفوق على الطويلة. انقر \"?\" على الشاشة الرئيسية للشرح الكامل.';

  @override
  String get howItWorksHabits => 'العادات يومية، السلسلة للأبد';

  @override
  String get howItWorksHabitsBody =>
      'العادات (يوغا الصباح، شرب الماء) تعيش للأبد. المهام لمرة واحدة. كلاهما يغذي نفس السلسلة.';

  @override
  String get howItWorksLeftBehind => 'المهام الفائتة → المتروكة';

  @override
  String get howItWorksLeftBehindBody =>
      'عند منتصف الليل، المهام غير المكتملة تنتقل إلى المتروكة. أعد إضافة ما يهم فقط. الباقي يحصل على راحة بهدوء.';

  @override
  String get howItWorksProgress => 'علامة تبويب التقدم';

  @override
  String get howItWorksProgressBody =>
      'السلسلة، التقويم، الميداليات، السجل — كل شيء عن تقدمك مع الوقت. لا شيء عاجل هنا.';

  @override
  String get howItWorksYou => 'علامة تبويب أنت';

  @override
  String get howItWorksYouBody => 'حسابك، الإعدادات، تسجيل الخروج. هذا كل شيء.';

  @override
  String get howItWorksRule => 'القاعدة: 5 أشياء صغيرة، كل يوم، بدون أعذار.';

  @override
  String get commonRetry => 'إعادة المحاولة';

  @override
  String get commonBack => 'رجوع';

  @override
  String get commonDismiss => 'تجاهل';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get commonSend => 'إرسال';

  @override
  String get commonCopy => 'نسخ';

  @override
  String get commonShowLess => 'عرض أقل';

  @override
  String get commonViewFull => 'عرض الملاحظات الكاملة';

  @override
  String get commonEdit => 'تعديل';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonDone => 'تم';

  @override
  String get commonError => 'حدث خطأ ما';

  @override
  String get commonPageNotFound => 'الصفحة غير موجودة';

  @override
  String get commonHome => 'الرئيسية';

  @override
  String get commonUnknownError => 'خطأ توجيه غير معروف';

  @override
  String get commonSettingsTooltip => 'الإعدادات';

  @override
  String get commonHowThisWorks => 'كيف يعمل هذا';

  @override
  String get myDayReminderSet => 'تم تعيين التذكير';

  @override
  String get myDayPreparationNotes => 'ملاحظات التحضير';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingEnterSanctuary => 'دخول الملاذ';

  @override
  String get onboardingIntroduction => 'مقدمة';

  @override
  String get onboardingGrowYourForest => 'نمّي غابتك';

  @override
  String get onboardingPage1Title => 'تعرّف على حارسك.';

  @override
  String get onboardingPage1Body =>
      'مرحبًا بك في ملاذك الشخصي. هنا، يتجلى نموك في حياة غابتك.';

  @override
  String get onboardingPage2Title => 'ازرع بذوراً. شاهدها تنمو.';

  @override
  String get onboardingPage2Body =>
      'كل مهمة بذرة صغيرة. كل عادة برعم تعتني به يومياً. معاً يشكّلون غابة من الانضباط.';

  @override
  String get onboardingPage3Title => 'خمس مهام. سلسلة واحدة.';

  @override
  String get onboardingPage3Body =>
      'يمكنك زراعة 5 بذور فقط في اليوم. هذا الحد يجبرك على التركيز على ما يهم فعلاً — وحماية سلسلتك.';

  @override
  String get onboardingPage4Title => 'اعتنِ ببراعمك يومياً.';

  @override
  String get onboardingPage4Body =>
      'اضغط على العادات لتنميتها. تخطَّ يوماً ولن تمتد السلسلة. الحارس ينمو معك.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'ازرع بذرتك الأولى.';

  @override
  String get authWelcomeBack => 'مرحبًا بعودتك، يا حارس.';

  @override
  String get authFiveTasksDaily => 'خمس مهام. عادات يومية. لا أعذار.';

  @override
  String get authSanctuaryWaiting => 'ملاذك في انتظارك.';

  @override
  String get authSignIn => 'تسجيل الدخول';

  @override
  String get authSignUp => 'إنشاء حساب';

  @override
  String get authEmail => 'البريد الإلكتروني';

  @override
  String get authPassword => 'كلمة المرور';

  @override
  String get authEmailHint => 'you@email.com';

  @override
  String get authCreateAccount => 'إنشاء حساب';

  @override
  String get authSignInCta => 'تسجيل الدخول';

  @override
  String get authOrContinueWith => 'أو تابع باستخدام';

  @override
  String get authContinueWithGoogle => 'المتابعة مع Google';

  @override
  String get authEnterEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get authEnterValidEmail => 'أدخل عنوان بريد إلكتروني صالح';

  @override
  String get authPasswordTooShort => 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';

  @override
  String get authAccountCreated =>
      'تم إنشاء الحساب. انتقل إلى تسجيل الدخول واستخدم كلمة المرور.';

  @override
  String get authSomethingWentWrong => 'حدث خطأ ما. حاول مرة أخرى.';

  @override
  String get authCouldNotStartGoogle => 'تعذر بدء تسجيل الدخول عبر Google.';

  @override
  String get authMidnightReset =>
      'بتسجيل الدخول، أنت توافق على إعادة تعيين يومك عند منتصف الليل.';

  @override
  String get authSetupRequired => 'الإعداد مطلوب';

  @override
  String get settingsPersonalSanctuary => 'الملاذ الشخصي';

  @override
  String get settingsHowThisWorks => 'كيف يعمل هذا';

  @override
  String get settingsHowThisWorksSubtitle =>
      'ما هو التطبيق، وكيف يعمل حد المهام والأرقام المتتالية';

  @override
  String get settingsStreakProtection => 'حماية السلسلة';

  @override
  String get settingsStreakProtectionAvailable => 'تجميد واحد متاح هذا الشهر';

  @override
  String get settingsStreakProtectionUsed => 'مستخدم لهذا الشهر';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'إدارة اشتراك Pro';

  @override
  String get settingsProCancelPlay => 'إلغاء أو تغيير الخطة في Google Play';

  @override
  String get settingsProUnlock =>
      'افتح جميع العادات الخمس، السجل الكامل، والمزيد';

  @override
  String get settingsTaskAlarms => 'إنذارات المهام والمكالمة النهائية';

  @override
  String get settingsTaskAlarmsSubtitle => 'تنبيه مسائي وتنبيه منتصف الليل';

  @override
  String get settingsHomeScreenWidget => 'ودجة الشاشة الرئيسية';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'أضف سلسلتك إلى الشاشة الرئيسية';

  @override
  String get settingsShareBloomTracker => 'مشاركة Daily Stitch';

  @override
  String get settingsShareBloomTrackerSubtitle => 'أخبر صديقاً عن السلسلة';

  @override
  String get settingsHelpSupport => 'المساعدة والدعم';

  @override
  String get settingsHelpSupportSubtitle =>
      'الأسئلة الشائعة أو الإبلاغ عن مشكلة';

  @override
  String get settingsSignOutTile => 'تسجيل الخروج';

  @override
  String get settingsAllFeaturesUnlocked => 'جميع الميزات مفتوحة';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'إصدار تجريبي — الاشتراكات متوقفة أثناء اختبار كل شيء.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'الإصدار $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'الإصدار 1.0.0';

  @override
  String get settingsHabitMaster => 'سيد العادات';

  @override
  String settingsLevel(Object level) {
    return 'المستوى $level · سيد العادات';
  }

  @override
  String get languagePickerTitle => 'اللغة';

  @override
  String get youLast7Days => 'آخر 7 أيام';

  @override
  String get youLast7DaysSubtitle => 'سجل المهام يوم بيوم';

  @override
  String get youLeftBehindSubtitle => 'مهام فائتة في انتظار إعادة الإضافة';

  @override
  String get youProTier => 'مستوى Pro';

  @override
  String get youFreeTier => 'المستوى المجاني';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'مجاني';

  @override
  String youLevelLabel(Object level) {
    return 'المستوى $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'أفضل $days د';
  }

  @override
  String get youPlantHabit => 'ازرع عادة لبدء سلسلة.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline => 'افتح نظام الانضباط الكامل.';

  @override
  String get youProFeatures =>
      '5 فتحات عادات، السجل الكامل، ميداليات أسطورية، تجميد سلسلة شهري، بطاقات مشاركة أسبوعية.';

  @override
  String get youSeePlans => 'عرض الخطط';

  @override
  String youFromPrice(Object price) {
    return 'من $price/شهر';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch · عادات ومهام';

  @override
  String get progressMedals => 'الميداليات';

  @override
  String get progressLast7Days => 'آخر 7 أيام';

  @override
  String get progressSeeAll => 'عرض الكل';

  @override
  String get progressSeeDayByDayActivity => 'عرض نشاطك يوم بيوم';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done من $total مهمة مكتملة · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'لا ميداليات بعد — أنهِ مهمة أو اعتنِ ببرعم للبدء.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'عرض كل الميداليات · $earned من $total مكتسبة';
  }

  @override
  String get progressGuardianInsight => 'رؤية الحارس';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'الشارة التالية · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return 'هدف $days يوم';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'المساعدة والدعم';

  @override
  String get helpBody =>
      'معظم الإجابات أدناه. إذا لم تجدها، أرسل لنا رسالة ونرد عادةً خلال 2-3 أيام.';

  @override
  String get helpSectionFAQ => 'الأسئلة الشائعة';

  @override
  String get helpSectionContact => 'لا تزال عالقاً؟';

  @override
  String get helpAddMessage => 'أضف رسالة قصيرة أولاً.';

  @override
  String get helpOpening => 'جاري فتح تطبيق البريد…';

  @override
  String get helpEmailUs => 'أرسل لنا بريداً إلكترونياً';

  @override
  String get helpOpeningAction => 'جاري الفتح…';

  @override
  String get helpCopyEmail => 'نسخ البريد الإلكتروني للدعم';

  @override
  String get helpCopiedEmail => 'تم نسخ support@dailystitch.app';

  @override
  String get helpNoMailApp =>
      'لم يتم العثور على تطبيق بريد. أرسل لنا على support@dailystitch.app.';

  @override
  String get helpTopicLabel => 'الموضوع';

  @override
  String get helpWhatHappened => 'ما الذي حدث؟';

  @override
  String get helpHint => 'وصف قصير يساعد كثيراً…';

  @override
  String get helpDisclaimer =>
      'بالنقر على \"أرسل لنا بريداً\" سيفتح تطبيق البريد مع رسالة مجهزة مسبقاً (لا تغادر أي بيانات جهازك حتى ترسل).';

  @override
  String get helpFaqQ1 => 'ما هو حد 5 مهام؟';

  @override
  String get helpFaqA1 =>
      'يمكنك إضافة حتى 5 مهام في اليوم المحلي. السادس محظور عمداً — الانضباط يتفوق على الحمل الزائد. الحد هو الميزة، وليس قيداً.';

  @override
  String get helpFaqQ2 => 'ماذا يحدث عند منتصف الليل؟';

  @override
  String get helpFaqA2 =>
      'عند منتصف الليل المحلي، أي مهمة لا تزال مفتوحة يتم وضع علامة \"فائتة\" عليها والانتقال إلى المتروكة. تُعاد تعيين أرقام العادات إذا لم تُكتمل العادة في اليوم السابق.';

  @override
  String get helpFaqQ3 => 'ما هي المتروكة؟';

  @override
  String get helpFaqA3 =>
      'قائمة لطيفة ويمكن إلغاؤها بالمهام التي لم تكملها. افتحها، أعد إضافة ما يزال يهم، واترك الباقي. المستوى المجاني يرى آخر 7 أيام؛ Pro يرى السجل الكامل.';

  @override
  String get helpFaqQ4 => 'كيف تعمل الأرقام المتتالية؟';

  @override
  String get helpFaqA4 =>
      'يوم يمتد السلسلة عندما كانت لديك مهمة واحدة على الأقل ولم يتم تفويت أي منها. الأيام التي بها صفر مهام لا تمتد ولا تكسر السلسلة. تجميد السلسلة يغفر يوماً ضائعاً واحداً في الشهر.';

  @override
  String get helpFaqQ5 => 'ما هو تجميد السلسلة؟';

  @override
  String get helpFaqA5 =>
      '\"تجميد\" واحد لكل تقويم شهر، لمستوى Pro فقط. استخدمه في يوم فاتك للحفاظ على سلسلتك حية. ابحث عنه في علامة تبويب التقدم.';

  @override
  String get helpFaqQ6 => 'أين يتم تخزين بياناتي؟';

  @override
  String get helpFaqA6 =>
      'جميع البيانات مخزنة في Supabase (Postgres) تحت الحساب الذي سجل الدخول. نحن لا نبيع أو نشارك أبداً. راجع سياسة الخصوصية المرتبطة في صفحة Play Store للتفاصيل الكاملة.';

  @override
  String get helpFaqQ7 => 'كيف أحذف حسابي؟';

  @override
  String get helpFaqA7 =>
      'اذهب إلى الإعدادات ← الحساب ← حذف الحساب. يؤدي هذا إلى حذف ملفك الشخصي ومهامك وعاداتك وبيانات اشتراكك بشكل دائم. يجب إلغاء اشتراكات Play النشطة بشكل منفصل في Google Play.';

  @override
  String get helpTopicsGeneral => 'سؤال عام';

  @override
  String get helpTopicsBug => 'تقرير خطأ';

  @override
  String get helpTopicsStreak => 'مشكلة سلسلة / ترحيل';

  @override
  String get helpTopicsBilling => 'الفواتير أو مستوى Pro';

  @override
  String get helpTopicsAccount => 'الحساب والبيانات';

  @override
  String get helpTopicsFeature => 'طلب ميزة';

  @override
  String get helpAccountAnon => '(غير مسجل الدخول)';

  @override
  String get splashTagline => 'اعتني بالبذور الصغيرة. ازرع غابة.';

  @override
  String get priorityStandard => 'عادي';

  @override
  String get priorityVital => 'حيوي';

  @override
  String get prioritySpark => 'شرارة';

  @override
  String get settingsDeleteAccount => 'حذف الحساب';

  @override
  String get settingsDeleteAccountSubtitle => 'إزالة بياناتك نهائيamente';

  @override
  String get settingsDeleteAccountConfirmTitle => 'هل تريد حذف حسابك؟';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'يؤدي هذا إلى حذف ملفك الشخصي ومهامك وعاداتك وتقدمك بشكل دائم. يجب إلغاء الاشتراكات النشطة في Google Play بشكل منفصل. لا يمكن التراجع عن هذا.';

  @override
  String get settingsDeleteAccountConfirmButton => 'حذف إلى الأبد';

  @override
  String get settingsDeleteAccountSuccess => 'تم حذف حسابك.';

  @override
  String get settingsDeleteAccountFailed =>
      'لا يمكن حذف الحساب. حاول مرة أخرى أو أرسل بريداً إلكترونياً إلى support@dailystitch.app.';

  @override
  String get referralYouTitle => 'قم بدعوة الأصدقاء · اربح Pro مجاناً';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress من $milestone من الأصدقاء انضموا';
  }

  @override
  String get referralYouShare => 'مشاركة الدعوة';

  @override
  String get referralYouDetails => 'عرض التفاصيل';

  @override
  String get referralPaywallTitle => 'شهر Pro مجاني';

  @override
  String get referralPaywallBody =>
      'قم بدعوة 5 أصدقاء قاموا بالتسجيل ← شهر واحد مجاناً';

  @override
  String get referralPaywallProBody =>
      'استمر في دعوتك — قم بتكديس أشهر Pro المجانية';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError => 'تعذر تحميل تقدمك. حاول مرة أخرى لاحقاً.';

  @override
  String get insightsMetricCurrentChain => 'السلسلة الحالية';

  @override
  String get insightsMetricBestEver => 'الأفضل على الإطلاق';

  @override
  String get insightsMetricTasksDone => 'المهام المنجزة';

  @override
  String get insightsMetricPerfectDays => 'أيام مثالية';

  @override
  String get insightsMetricHabits => 'العادات';

  @override
  String get insightsDay => 'يوم';

  @override
  String get insightsDays => 'أيام';

  @override
  String get insightsSectionThisWeek => 'هذا الأسبوع';

  @override
  String get insightsShareMyWeek => 'شارك أسبوعي';

  @override
  String get insightsShareMyWeekPro => 'شارك أسبوعي · Pro';

  @override
  String get insightsShareReceiptText =>
      'أسبوعي على Daily Stitch. لا تكسر السلسلة.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'عرض آخر $days أيام';
  }

  @override
  String get insightsHistoryUpsell => 'افتح سجلك الكامل مع Pro';

  @override
  String get referralScreenTitle => 'دعوة الأصدقاء';

  @override
  String get referralLaunchGift => 'هدية شهر الإطلاق';

  @override
  String get referralRewardTitle => 'احصل على شهر واحد من Pro مجاناً';

  @override
  String get referralRewardBody =>
      'شارك رمزك مع الأصدقاء. عندما يقوم 5 أشخاص بالتسجيل باستخدامه، يمكنك فتح Daily Stitch Pro لمدة شهر كامل.';

  @override
  String get referralYourCode => 'رمز الإحالة الخاص بك';

  @override
  String get referralCopyCodeTooltip => 'نسخ الرمز';

  @override
  String get referralCodeCopied => 'تم نسخ رمز الإحالة';

  @override
  String get referralShareWithFriends => 'شارك مع الأصدقاء';

  @override
  String get referralFooterHint =>
      'يقوم الأصدقاء بإدخال رمزك عند إنشاء حساب. يتم احتساب كل صديق مرة واحدة في مكافأتك.';

  @override
  String referralFriendsJoinedOne(int count) {
    return 'انضم $count صديق';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return 'انضم $count من الأصدقاء';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'ربحت $count شهر مجانياً من Pro.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'ربحت $count شهراً مجانياً من Pro.';
  }

  @override
  String get referralRewardUnlocked =>
      'تم فتح المكافأة — استمتع بشهر Pro المجاني!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining إضافية لفتح شهرك المجاني';
  }

  @override
  String youProMemberSince(String month) {
    return 'عضو في Daily Stitch Pro منذ $month';
  }

  @override
  String get youProPerksTitle => 'امتيازات Pro الخاصة بك';

  @override
  String get manageProThankYou => 'شكراً لدعمك Daily Stitch';

  @override
  String get manageProReferralHint =>
      'قم بدعوة المزيد من الأصدقاء لتوسيع نطاق Pro الخاص بك';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nأضف SUPABASE_URL وSUPABASE_PUBLISHABLE_KEY (أو SUPABASE_ANON_KEY القديم) إلى leanspace/.env، ثم أعد البناء:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'الافتراضي للنظام';

  @override
  String get languageNameEn => 'إنجليزي';

  @override
  String get languageNameUr => 'اردو (الأردية)';

  @override
  String get languageNameEs => 'الإسبانية';

  @override
  String get languageNamePt => 'البرتغالية';

  @override
  String get languageNameFr => 'الفرنسية';

  @override
  String get languageNameDe => 'الألمانية';

  @override
  String get languageNameIt => 'الإيطالية';

  @override
  String get languageNameAr => 'العربية';

  @override
  String get languageNameTr => 'التركية';

  @override
  String get languageNameId => 'البهاسا الإندونيسية';

  @override
  String get onboardingLanguageTitle => 'اختر لغتك';

  @override
  String get onboardingLanguageBody =>
      'اختر اللغة التي ترغب في استخدامها عبر Daily Stitch. يمكنك تغييرها في أي وقت في الإعدادات.';

  @override
  String get onboardingLanguageContinue => 'متابعة';

  @override
  String get commonPro => 'للمحترفين';

  @override
  String get commonFriend => 'صديق';

  @override
  String get settingsAppTheme => 'سمة التطبيق';

  @override
  String get settingsAppThemeSubtitle => 'اختر ألوان ملاذك الشخصي';

  @override
  String get settingsInviteFriendsTitle => 'دعوة الأصدقاء · مجاني مع Pro';

  @override
  String get settingsInviteFriendsSubtitle =>
      'احصل على شهر مجاني عند انضمام 5 أصدقاء';

  @override
  String get themePickerTitle => 'ملاذ شخصي';

  @override
  String get themePickerSubtitle => 'اختر لوحة الألوان التي تجلب لك السلام.';

  @override
  String get themeNameClassicBloom => 'كلاسيك بلوم';

  @override
  String get themeNameSolarTerracotta => 'الطين الشمسي';

  @override
  String get themeNameMidnightOasis => 'واحة منتصف الليل';

  @override
  String get themeNameLavenderDream => 'حلم الخزامى';

  @override
  String get themeNameNordicFrost => 'الصقيع الشمالي';

  @override
  String get themeNameCyberpunkNeon => 'سايبربانك النيون';

  @override
  String get reminderTitle => 'التذكيرات';

  @override
  String get reminderBody =>
      'تنبهك المكالمة النهائية قبل منتصف الليل إذا كانت المهام لا تزال مفتوحة.';

  @override
  String get reminderFinalCall => 'المكالمة النهائية';

  @override
  String get reminderEveningNudge => 'تنبيه مسائي';

  @override
  String get reminderChangeTime => 'تغيير الوقت';

  @override
  String get reminderSave => 'حفظ التذكيرات';

  @override
  String get notificationChannelReminders => 'تذكيرات Daily Stitch';

  @override
  String get notificationChannelRemindersDesc =>
      'تنبيه مسائي وتذكير المكالمة النهائية';

  @override
  String get notificationChannelAlarms => 'إنذارات مهام Daily Stitch';

  @override
  String get notificationChannelAlarmsDesc => 'إنذارات عالية لتذكير المهام';

  @override
  String get notificationTaskReminderTitle => 'تذكير بالمهمة';

  @override
  String get notificationFinalCallTitle => 'المكالمة النهائية';

  @override
  String notificationFinalCallBody(int count) {
    return 'لا يزال لديك $count مهمة مفتوحة اليوم.';
  }

  @override
  String get notificationEveningTitle => 'تسجيل الوصول المسائي';

  @override
  String get notificationEveningBody => 'كيف تنمو حديقتك اليوم؟';

  @override
  String get widgetSetupTitle => 'إضافة ودجة السلسلة';

  @override
  String get widgetSetupBody =>
      'حافظ على سلسلتك على شاشتك الرئيسية — لا داعي لفتح التطبيق.';

  @override
  String get widgetSetupAdd => 'إضافة إلى الشاشة الرئيسية';

  @override
  String get widgetSetupStep1 => 'اضغط لفترة طويلة على شاشتك الرئيسية';

  @override
  String get widgetSetupStep2 => 'اضغط على الودجات';

  @override
  String get widgetSetupStep3 => 'ابحث عن Daily Stitch واسحبه';

  @override
  String get widgetSetupPinSuccess => 'تحقق من شاشتك الرئيسية لوضع الودجة.';

  @override
  String get widgetSetupPinFallback =>
      'قد لا يدعم المشغل الخاص بك الإضافة بنقرة واحدة. استخدم الخطوات اليدوية أدناه.';

  @override
  String get paywallWelcomePro => 'مرحباً بكم في Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'وفّر ~16%';

  @override
  String get paywallTermsTitle => 'شروط الاشتراك';

  @override
  String get paywallTermsBody =>
      'تتم معالجة الفواتير عن طريق Google Play. يتم تجديد الاشتراكات تلقائياً حتى تقوم بالإلغاء في Play Store ← الاشتراكات قبل 24 ساعة على الأقل من نهاية الفترة الحالية. يمكنك إدارة أو إلغاء اشتراكك في أي وقت من حساب Google Play الخاص بك.\n\nلا يؤدي إلغاء تثبيت التطبيق إلى إلغاء اشتراكك.\n\nالأسعار المعروضة هي بعملتك المحلية وقد تختلف حسب المنطقة. قد يتم تطبيق الضرائب.';

  @override
  String get paywallPrivacyTitle => 'الخصوصية';

  @override
  String get paywallPrivacyBody =>
      'يخزن Daily Stitch مهامك وعاداتك وبيانات سلسلتك على واجهتنا الخلفية Supabase المرتبطة بحسابك. نحن لا نبيع بياناتك أبداً.\n\nتتم معالجة عمليات شراء الاشتراك بواسطة Google Play. نتلقى رمز شراء موثوقاً من Google لتأكيد حالة Pro الخاصة بك. نحن لا نرى أو نخزن تفاصيل الدفع الخاصة بك.\n\nيمكنك طلب تصدير البيانات الكاملة أو حذف الحساب من الإعدادات ← حذف الحساب.';

  @override
  String get paywallCloseTooltip => 'إغلاق';

  @override
  String get paywallFooterLinks => 'استعادة · الشروط · الخصوصية';

  @override
  String get manageProTitle => 'اشتراك Pro';

  @override
  String get manageProActive => 'نشط';

  @override
  String get manageProNotSubscribed => 'غير مشترك';

  @override
  String get manageProFreeTier => 'المستوى المجاني';

  @override
  String manageProRenewsOn(String date) {
    return 'يتم تجديده أو انتهاء صلاحيته في $date.';
  }

  @override
  String get manageProFreeBody =>
      'أنت تستخدم Daily Stitch المجاني. قم بالترقية لفتح النظام الكامل.';

  @override
  String get manageProSectionManage => 'إدارة';

  @override
  String get manageProOpenPlay => 'فتح اشتراكات Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'إلغاء أو تغيير الخطة أو تحديث طريقة الدفع';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'ابحث عن اشتراكك الحالي (إن وجد) هنا';

  @override
  String get manageProShareApp => 'مشاركة Daily Stitch';

  @override
  String get manageProShareSubtitle => 'أخبر صديقاً عن السلسلة';

  @override
  String get manageProSectionHelp => 'بحاجة إلى مساعدة؟';

  @override
  String get manageProHelpTitle => 'المساعدة والدعم';

  @override
  String get manageProHelpSubtitle =>
      'الأسئلة الشائعة حول الاشتراك، جهة الاتصال، تقارير الأخطاء';

  @override
  String manageProBillingFooter(String version) {
    return 'تمت معالجة الفوترة بواسطة Google Play · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'افتح تطبيق Google Play Store ← اضغط على ملفك الشخصي ← المدفوعات والاشتراكات ← الاشتراكات.';

  @override
  String get addTaskGrowSomething => 'نمّ شيئاً';

  @override
  String get addTaskPlantSprout => 'ازرع برعماً';

  @override
  String get addTaskIntentionName => 'اسم النية';

  @override
  String get addTaskSproutName => 'اسم البرعم';

  @override
  String get addTaskHintTask => 'مثلاً، تحية شمس الصباح';

  @override
  String get addTaskHintHabit => 'مثلاً، اليوغا الصباحية';

  @override
  String get addTaskWhen => 'متى؟';

  @override
  String get addTaskPriority => 'الأولوية';

  @override
  String get addTaskNotes => 'ملاحظات';

  @override
  String get addTaskCadenceDaily => 'يومياً';

  @override
  String get addTaskCadenceWeekdays => 'أيام الأسبوع';

  @override
  String get addTaskCadence3x => '3 مرات/أسبوع';

  @override
  String get addTaskCadenceWeekly => 'أسبوعي';

  @override
  String get addTaskPlantIntention => 'ازرع النية';

  @override
  String get addTaskPlantSproutCta => 'ازرع البرعم';

  @override
  String get addTaskPlanting => 'جارٍ الزراعة…';

  @override
  String get addTaskNameIntentionError => 'سمِّ نيتك';

  @override
  String get addTaskNameSproutError => 'سمِّ برعمك';

  @override
  String get addTaskNotesMigrationWarning =>
      'تم حفظ المهمة. تحتاج الملاحظات والأولوية إلى أحدث ترحيل Supabase — قم بتشغيل supabase/migrations/20260701000000_todos_notes_priority.sql.';

  @override
  String get addTaskNoSproutSlots =>
      'لا توجد فتحات براعم فارغة — قم بالعناية بأحدها أولاً.';

  @override
  String get addTaskSaveSproutError => 'تعذر حفظ البرعم — حاول مرة أخرى.';

  @override
  String get addTaskElementWater => 'ماء';

  @override
  String get addTaskElementLight => 'ضوء';

  @override
  String get addTaskElementSoil => 'تربة';

  @override
  String get addTaskElementBreeze => 'نسيم';

  @override
  String get addTaskCadenceLabel => 'الإيقاع';

  @override
  String get addTaskPreparationNotes => 'ملاحظات التحضير';

  @override
  String get addTaskTendingNotes => 'ملاحظات العناية';

  @override
  String get addTaskNotesHintTask =>
      'هل هناك أي أدوات أو نصائح عقلية لهذه المهمة؟';

  @override
  String get addTaskNotesHintHabit => 'كيف تبدو رعاية هذا البرعم؟';

  @override
  String get addTaskChooseElement => 'اختر العنصر';

  @override
  String get addTaskElementsTooltip => 'ماذا تعني العناصر؟';

  @override
  String get addTaskTaskSeed => 'بذرة المهمة';

  @override
  String get addTaskHabitSprout => 'برعم العادة';

  @override
  String get addTaskPickElement => 'اختر العنصر المناسب';

  @override
  String get addTaskPickElementBody =>
      'يعين كل عنصر نوعاً مختلفاً من الجهد. يصبح الحارس أقوى عندما تسقيه بشكل صحيح.';

  @override
  String get addTaskClearForm => 'مسح النموذج';

  @override
  String get shareCouldNotShare => 'لا يمكن المشاركة الآن';

  @override
  String get authReferralCodeLabel => 'رمز الإحالة (اختياري)';

  @override
  String get authReferralCodeHint => 'كود الصديق';

  @override
  String get youPerkHabitSlots => '5 فتحات عادات';

  @override
  String get youPerkFullHistory => 'السجل الكامل';

  @override
  String get youPerkAllThemes => 'جميع المواضيع';

  @override
  String get youPerkStreakFreezes => 'تجميد سلسلة 2 مرة / شهر';

  @override
  String get youPerkLegendaryMedals => 'ميداليات أسطورية';

  @override
  String get subscriptionPurchaseFailed => 'فشل الشراء. حاول مرة أخرى.';

  @override
  String get subscriptionUnavailable =>
      'عمليات الشراء داخل التطبيق غير متاحة على هذا الجهاز.';

  @override
  String get subscriptionLoadFailed => 'لا يمكن تحميل خيارات الاشتراك.';

  @override
  String get subscriptionVerifyFailed =>
      'لا يمكن التحقق من الشراء. حاول استعادة الشراء.';

  @override
  String get streakFreezeFailed => 'لا يمكن استخدام تجميد السلسلة.';

  @override
  String get streakFreezeAlreadyUsed => 'لقد استخدمت تجميدك هذا الشهر بالفعل.';

  @override
  String get streakFreezeNoMissed => 'لا توجد مهام فائتة في ذلك اليوم للتجميد.';

  @override
  String get streakFreezeNotPastDay => 'يمكنك تجميد يوم الماضي فقط.';

  @override
  String get myDayLoadError => 'تعذر تحميل يومي. اسحب للتحديث.';

  @override
  String get myDayCapReached =>
      'لقد وصلت إلى الحد الأقصى المكون من 5 مهام اليوم.';

  @override
  String get myDayRemoveTaskError => 'لا يمكن إزالة المهمة.';

  @override
  String get shareCardTitle => 'شارك أسبوعك';

  @override
  String get shareCardCta => 'مشاركة الصورة';

  @override
  String get medalTierSprout => 'برعم';

  @override
  String get medalTierCommon => 'شائع';

  @override
  String get medalTierRare => 'نادر';

  @override
  String get medalTierEpic => 'ملحمي';

  @override
  String get medalTierLegendary => 'الأسطوري';

  @override
  String get medalCategoryTasks => 'المهام';

  @override
  String get medalCategoryHabits => 'العادات';

  @override
  String get medalCategoryStreaks => 'السلسلات';

  @override
  String get medalCategoryMastery => 'الإتقان';

  @override
  String get medalsShareTooltip => 'مشاركة الإنجازات';

  @override
  String get medalsFilterAll => 'الكل';

  @override
  String get addHabitTitleNew => 'ازرع برعماً جديداً';

  @override
  String get addHabitTitleEdit => 'اعتنِ ببرعمك';

  @override
  String get addHabitLabelSproutName => 'اسم البرعم';

  @override
  String get shareCardAppBarTitle => 'بطاقة المشاركة';

  @override
  String get shareCardAppBarTitleMedal => 'شارك ميداليتك';

  @override
  String shareCardDescMedal(Object title) {
    return 'أظهر شارة \"$title\" الجديدة الخاصة بك';
  }

  @override
  String get shareCardBodyMedal =>
      'شارك الانتصار مع دائرتك. يتم تصدير البطاقة بصيغة PNG وجاهزة لأي تطبيق تواصل.';

  @override
  String get shareCardCtaPreparing => 'جارٍ التحضير…';

  @override
  String get shareCardMilestone => 'تم فتح معلم جديد';

  @override
  String get shareCardStatChain => 'سلسلة أيام';

  @override
  String get shareCardStatSprouts => 'براعم';

  @override
  String get shareCardStatMedals => 'ميداليات';

  @override
  String shareCardHeadlineStreak(int days) {
    return 'سلسلة $days يوم';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count ميدالية مكتسبة';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'حارس البراعم';

  @override
  String get shareCardHeadlineFirstSeeds => 'أول البذور المزروعة';

  @override
  String get shareCardHeadlineGardenBegins => 'بداية حديقة';

  @override
  String get shareCardSubheadMonth => 'لقد اعتنيت بعاداتك بنجاح لمدة شهر كامل.';

  @override
  String get shareCardSubheadWeek => 'أسبوع كامل من النمو — غابتك تتكاثف.';

  @override
  String get shareCardSubheadProgress =>
      'ملاذك يُظهر تقدماً حقيقياً. واصل العناية.';

  @override
  String get shareCardSubheadSprouts => 'براعمك الأولى تتجذر. اسقِها يومياً.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'بذورك الأولى في التربة. شاهد فتحها.';

  @override
  String get shareCardSubheadFallback => 'كل غابة تبدأ باختيار واحد صغير.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — خمس بذور صغيرة في اليوم، سلسلة واحدة لا تنكسر. ازرع بذرتك.\n\n$url';
  }

  @override
  String get shareAppSubject => 'جرّب Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'أبني سلسلتي اليومية على Daily Stitch — انضم إليّ باستخدام رمز إحالتي $code وسننمو معاً.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'انضم إليّ على Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'تقدمي في Daily Stitch — $year على Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'لقد فتحت للتو ميدالية \"$title\" في Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'المهام المنجزة';

  @override
  String get insightsReceiptPerfectDays => 'أيام مثالية';

  @override
  String get insightsReceiptCompletion => 'النسبة المكتملة';

  @override
  String insightsReceiptDate(String date) {
    return 'أسبوع $date';
  }

  @override
  String get insightsReceiptFooter => 'لا تكسر السلسلة.';

  @override
  String get elementLabelWater => 'ماء';

  @override
  String get elementLabelLight => 'ضوء';

  @override
  String get elementLabelSoil => 'تربة';

  @override
  String get elementLabelBreeze => 'نسيم';

  @override
  String get elementTaglineWater =>
      'الاسترداد. الترطيب، الراحة، العناية العاطفية — أي شيء يعيد ملء البئر.';

  @override
  String get elementTaglineLight =>
      'الاستيقاظ. ضوء الصباح، فترات التركيز، الدراسة، التأمل — الطاقة والوضوح.';

  @override
  String get elementTaglineSoil =>
      'التأصيل. القراءة، الكتابة اليومية، العمل العميق — جذور بطيئة تبني قوة طويلة المدى.';

  @override
  String get elementTaglineBreeze =>
      'الحركة. المشي، الجري، تمارين التنفس — طاقة خفيفة متحركة تُنسي الرأس.';

  @override
  String get elementWhenWater => 'عندما تشعر بالإنهاك أو الاستنزاف.';

  @override
  String get elementWhenLight => 'عندما تحتاج بداية واضحة ليومك.';

  @override
  String get elementWhenSoil =>
      'عندما يكون العمل بطيئاً لكنه يستحق (الدراسة، الحرفية، العناية).';

  @override
  String get elementWhenBreeze =>
      'عندما يحتاج جسدك (أو عقلك) إلى الحركة والتنفس.';

  @override
  String get bloomTierMastery => 'الإتقان';

  @override
  String get bloomTierStrong => 'قوي';

  @override
  String get bloomTierGrowing => 'متنامي';

  @override
  String get bloomTierSprouting => 'بادئ بالنمو';

  @override
  String get bloomTierLocked => 'مقفل';

  @override
  String habitBloomSubtitle(int count, String element) {
    return 'سلسلة $count يوم · $element';
  }

  @override
  String get medal_id_first_spark => 'شرارة أولى';

  @override
  String get medal_sub_first_spark => 'أضعت الشرارة.';

  @override
  String get medal_desc_first_spark => 'أنجز مهمتك الأولى. كل سلسلة تبدأ هنا.';

  @override
  String get medal_id_triple_seed => 'ثلاثية البذور';

  @override
  String get medal_sub_triple_seed => 'ثلاث في التربة.';

  @override
  String get medal_desc_triple_seed => 'أنجز 3 مهام في المجموع.';

  @override
  String get medal_id_dozen_sower => 'زارع الدزينة';

  @override
  String get medal_sub_dozen_sower => 'حقل من اثني عشر.';

  @override
  String get medal_desc_dozen_sower => 'أنجز 12 مهمة في المجموع.';

  @override
  String get medal_id_quarter_century => 'ربع قرن';

  @override
  String get medal_sub_quarter_century => 'موسم من قول نعم.';

  @override
  String get medal_desc_quarter_century => 'أنجز 25 مهمة في المجموع.';

  @override
  String get medal_id_productivity_titan => 'عمال الإنتاجية';

  @override
  String get medal_sub_productivity_titan => 'الاستمرارية تتراكم.';

  @override
  String get medal_desc_productivity_titan =>
      'أنجز 50 مهمة — لقد بنيت زخماً حقيقياً.';

  @override
  String get medal_id_century_planter => 'زارع المائة';

  @override
  String get medal_sub_century_planter => 'غابة خاصة بك.';

  @override
  String get medal_desc_century_planter =>
      'أنجز 100 مهمة. أنت في أفضل 5% من المستخدمين.';

  @override
  String get medal_id_clean_day => 'يوم نظيف';

  @override
  String get medal_sub_clean_day => 'لا حشيشة واحدة.';

  @override
  String get medal_desc_clean_day => 'أنجز كل مهمة تزرعها في يوم واحد.';

  @override
  String get medal_id_triple_perfect => 'ثلاثي مثالي';

  @override
  String get medal_sub_triple_perfect => 'ثلاث جولات بلا خطأ.';

  @override
  String get medal_desc_triple_perfect => 'حقق 3 أيام مثالية.';

  @override
  String get medal_id_perfect_week => 'أسبوع مثالي';

  @override
  String get medal_sub_perfect_week => 'سبعة أيام بلا انقطاع.';

  @override
  String get medal_desc_perfect_week => '7 أيام مثالية متتالية.';

  @override
  String get medal_id_two_week_chain => 'قوة الأسبوعين';

  @override
  String get medal_sub_two_week_chain => 'أسبوعان من النار.';

  @override
  String get medal_desc_two_week_chain => 'حافظ على سلسلة 14 يوماً.';

  @override
  String get medal_id_iron_chain => 'سلسلة حديدية';

  @override
  String get medal_sub_iron_chain => '30 حلقة مطروقة.';

  @override
  String get medal_desc_iron_chain => 'سلسلة 30 يوماً. أصعب ميدالية مهام.';

  @override
  String get medal_id_quarterly_chain => 'سلسلة ربع سنوية';

  @override
  String get medal_sub_quarterly_chain => 'موسم، بلا انقطاع.';

  @override
  String get medal_desc_quarterly_chain => 'سلسلة 90 يوماً. حالة أسطورية.';

  @override
  String get medal_id_vital_priority => 'شرارة حيوية';

  @override
  String get medal_sub_vital_priority => 'اخترت الصعبة.';

  @override
  String get medal_desc_vital_priority => 'أنجز 5 مهام بدرجة أولوية حيوية.';

  @override
  String get medal_id_spark_priority => 'رواد الشرارات';

  @override
  String get medal_sub_spark_priority => 'الانتصارات السريعة تتراكم.';

  @override
  String get medal_desc_spark_priority => 'أنجز 5 مهام بدرجة أولوية شرارة.';

  @override
  String get medal_id_note_taker => 'كاتب ملاحظات';

  @override
  String get medal_sub_note_taker => 'خطط على الورق تتفوق على الخطط في الرأس.';

  @override
  String get medal_desc_note_taker => 'أضف ملاحظات تأهيل إلى 5 مهام مختلفة.';

  @override
  String get medal_id_left_behind_rescuer => 'منقذ المتروكين';

  @override
  String get medal_sub_left_behind_rescuer => 'لا مهمة متروكة.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'أعد إضافة 3 مهام فائتة في اليوم التالي.';

  @override
  String get medal_id_first_sprout => 'برعم أول';

  @override
  String get medal_sub_first_sprout => 'طقوس يومية جديدة.';

  @override
  String get medal_desc_first_sprout => 'ازرع عادتك الأولى.';

  @override
  String get medal_id_trio_sprout => 'ثلاثية البراعم';

  @override
  String get medal_sub_trio_sprout => 'نظام بيئي صغير.';

  @override
  String get medal_desc_trio_sprout => 'ازرع 3 عادات مختلفة.';

  @override
  String get medal_id_week_of_growth => 'أسبوع النمو';

  @override
  String get medal_sub_week_of_growth => 'الجذور بدأت تثبت.';

  @override
  String get medal_desc_week_of_growth => 'عتني بعادة يومياً لمدة 7 أيام.';

  @override
  String get medal_id_fortnight_floret => 'زهرة الأسبوعين';

  @override
  String get medal_sub_fortnight_floret => 'إزهار كامل.';

  @override
  String get medal_desc_fortnight_floret => 'سلسلة عادات 14 يوماً.';

  @override
  String get medal_id_rooted_master => 'سيد متجذر';

  @override
  String get medal_sub_rooted_master => 'جذور عميقة، قوة عميقة.';

  @override
  String get medal_desc_rooted_master => 'سلسلة عادات 30 يوماً.';

  @override
  String get medal_id_half_year_bloom => 'إزهار نصف سنوي';

  @override
  String get medal_sub_half_year_bloom => 'الحديقة دائمة الآن.';

  @override
  String get medal_desc_half_year_bloom =>
      'حافظ على عادة واحدة لمدة 180 يوماً.';

  @override
  String get medal_id_garden_keeper => 'حارس الحديقة';

  @override
  String get medal_sub_garden_keeper => 'تنوع، معاً.';

  @override
  String get medal_desc_garden_keeper => 'ازرع 4 عادات مختلفة في نفس الوقت.';

  @override
  String get medal_id_hydration_hero => 'بطل الترطيب';

  @override
  String get medal_sub_hydration_hero => 'تملأ البئر.';

  @override
  String get medal_desc_hydration_hero => 'ازرع عادة ترطيب (ماء/شرب).';

  @override
  String get medal_id_mindful_mover => 'متحرك واعٍ';

  @override
  String get medal_sub_mindful_mover => 'الجسم يتذكر.';

  @override
  String get medal_desc_mindful_mover => 'ازرع عادة حركة (يوغا/جري/مشي).';

  @override
  String get medal_id_devoted_keeper => 'حارس مكرس';

  @override
  String get medal_sub_devoted_keeper => 'ستون يوماً، ممارسة واحدة.';

  @override
  String get medal_desc_devoted_keeper =>
      'عتني بعادة واحدة لمدة 60 يوماً متتالية.';

  @override
  String get medal_id_tending_notes => 'ملاحظات العناية';

  @override
  String get medal_sub_tending_notes => 'تفكر أثناء السير.';

  @override
  String get medal_desc_tending_notes => 'أضف ملاحظات عناية إلى 3 عادات.';

  @override
  String get medalTierTaglineSprout => 'ازرع أول بذرة';

  @override
  String get medalTierTaglineCommon => 'بناء العادة';

  @override
  String get medalTierTaglineRare => 'إظهار زخم حقيقي';

  @override
  String get medalTierTaglineEpic => 'أنت قوة من قوى الطبيعة';

  @override
  String get medalTierTaglineLegendary => 'أسطوري، لا أحد يكاد يصل هنا';

  @override
  String get guardianHeadlineNoTasks =>
      'تربة اليوم طازجة.\nازرع بذرتك الأولى\nوانظر كيف تنمو.';

  @override
  String get guardianHeadlineAllDone =>
      'كل بذرة زرعتها\nفي إزهار.\nاسترح يا حارس — لقد كسبتها.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count أيام\nنمو متواصل.\nغابتك مليئة بالحياة.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'أسبوع كامل في إزهار،\nيا حارس.\nيوم مثالي آخر\nيُمدّ السلسلة.';

  @override
  String get guardianHeadlineStreak3 =>
      'سلسلتك صامدة.\nعتني بالبذور\nالتي تنتظر أن تتفتح.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'أنت تعتني بالمهام جيداً.\nازرع برعماً —\nالعادات تنمو الغابات.';

  @override
  String get guardianHeadlineSomeDone =>
      'بعض البذور انفتحت،\nوبعضها لا. لا بأس.\nغداً زراعة أخرى.';

  @override
  String get guardianHeadlineMorning =>
      'صباح الخير يا حارس.\nاليوم شاب\nوالتربة جاهزة.';

  @override
  String get guardianHeadlineAfternoon =>
      'مساء الخير يا حارس.\nنصف الضوء باقٍ —\nواصل العناية.';

  @override
  String get guardianHeadlineEvening =>
      'مساء الخير يا حارس.\nجولة أخيرة\nقبل غروب الشمس.';

  @override
  String get guardianHeadlineNight =>
      'تسهر حتى منتصف الليل؟\nحتى الحراس يستريحون.\nازرع بذرة الغد.';

  @override
  String get guardianBodyNoTasks =>
      'ملاذك هادئ الآن. أضف نية وانظر ما يتغير عند الغروب.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count أيام جارية. السلسلة ليست حظاً — إنها الخيارات الصغيرة المتراكمة. واصل التراكم.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'سلسلة $count أيام زخم حقيقي. أنهي البذور المفتوحة اليوم قبل أن تقول أنك انتهى.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'لقد زرعت $count مهمة حتى الآن. إضافة حتى برعم عادة واحد سيجعل العمل ينمو يوماً بعد يوم.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'أنت تنهي حوالي $pct% مما تزرعه. بذور أقل وأكثر حدة تميل إلى النمو أعلى من عشر مبعثرة.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'ملاذك حي. $tasks مهمة منجزة، $sprouts براعم تنمو — العمل يظهر.';
  }

  @override
  String get guardianInsightWaitingTitle => 'في انتظار حركتك الأولى';

  @override
  String get guardianInsightWaitingBody =>
      'أضف مهمة أو عادة وسأبدأ في قراءة الأنماط في حديقتك. كلما زرعت أكثر، كلما تعلمت أكثر.';

  @override
  String get guardianInsightWaitingCta => 'ازرع بذرتك الأولى';

  @override
  String get guardianInsightChainSuperTitle => 'السلسلة هي قوتك الخارقة';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'لقد حافظت على سلسلة $count أيام. السلاسل تتفوق على الدافع في كل مرة — حافظ عليها دافئة، حتى في الأيام البطيئة.';
  }

  @override
  String get guardianInsightChainSuperCta => 'أضف بذرة الغد';

  @override
  String get guardianInsightChainColdTitle => 'السلسلة باردة — ابدأ جديدة';

  @override
  String get guardianInsightChainColdBody =>
      'لقد زرعت من قبل، مما يعني أنك يمكنك الزراعة مرة أخرى. مهمة صغيرة منجزة اليوم هي سلسلة أطول غداً.';

  @override
  String get guardianInsightChainColdCta => 'ازرع بذرة';

  @override
  String get guardianInsightLessIsMoreTitle => 'أقل هو أكثر هذا الأسبوع';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'أنت تنهي حوالي $pct% مما تزرعه. جرب 3 نوايا حادة بدلاً من 5 فضفاضة — الجودة تتراكم.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'شحذ اليوم';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'الميدالية التالية: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'أنت عند $value من $target $unit. بضعة أيام صادقة أخرى وهي لك.';
  }

  @override
  String get guardianInsightNextMedalCta => 'عرض الميدالية';

  @override
  String get guardianInsightSteadyTitle => 'أنت في موسم مستقر';

  @override
  String get guardianInsightSteadyBody =>
      'لا ميدالية في الأفق — لا بأس. اعتني بما لديك. الإزهار التالي في الطريق.';

  @override
  String get guardianInsightSteadyCta => 'عرض التقدم';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 مهمة في سلسلتك. منتصف الليل يقترب.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count مهام في سلسلتك. منتصف الليل يقترب.';
  }

  @override
  String get notificationEveningBodyOne => 'لديك بعد مهمة واحدة مفتوحة اليوم.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'لديك بعد $count مهام مفتوحة اليوم.';
  }

  @override
  String get notificationTickerTaskReminder => 'تذكير بالمهمة';

  @override
  String get notificationTickerTaskAlarm => 'إنذار المهمة';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return 'سلسلة $count يوم · $element';
  }
}
