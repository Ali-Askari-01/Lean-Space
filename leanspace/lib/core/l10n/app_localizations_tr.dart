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
  String get tabToday => 'Bugün';

  @override
  String get tabProgress => 'İlerleme';

  @override
  String get tabYou => 'Sen';

  @override
  String get navMyDay => 'Günüm';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get navHelp => 'Yardım & Destek';

  @override
  String get navHistory => 'Son 7 Gün';

  @override
  String get navLeftBehind => 'Geri Kalanlar';

  @override
  String get navInsights => 'İlerlemen';

  @override
  String get navMedals => 'Madalyalarım';

  @override
  String get navManagePro => 'Pro aboneliğini yönet';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Gece yarısında çalışıyor musun';

  @override
  String get greetingMorning => 'Günaydın, Günışığı!';

  @override
  String get greetingAfternoon => 'İyi günler, Arkadaş';

  @override
  String get greetingEvening => 'İyi akşamlar, Şampiyon';

  @override
  String get greetingNight => 'İyi dinleniyorsun, Koruyucu?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Bugün · $done/$total görev';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done/$total alışkanlık';
  }

  @override
  String get todayChainGrows => 'ZİNCİR SEN BİTİRİNCE BÜYÜR';

  @override
  String get todayChainComplete => 'ZİNCİR TAMAMLANDI · BAHÇEYİ YARIN SÜSLE';

  @override
  String get taskCapInfo => 'Neden 5 görev sınırlaması var?';

  @override
  String get taskCapDiscipline => 'ÖNCE DİSİPLİN TASARIMI';

  @override
  String get taskCapTitle => 'Gününü kasıtlı olarak 5 görevle sınırlıyoruz.';

  @override
  String get taskCapBody =>
      'Kısa zincirler uzun olanlardan daha iyidir. 5\'ten 3\'ünü bitirip kazanma hissini yaşamak, 10\'dan 8\'ini bırakıp kaybetme hissini yaşamaktan daha olasıdır.';

  @override
  String get taskCapBulletDone => 'Tamamlanan görevler zincirine eklenir';

  @override
  String get taskCapBulletDoneBody =>
      '5\'ini de tamamladığın bir gün, serini bir gün uzatır.';

  @override
  String get taskCapBulletMissed => 'Kaçırılan görevler Geri Kalanlar\'a gider';

  @override
  String get taskCapBulletMissedBody =>
      'Gece yarısında tamamlanmamış görevler Geri Kalanlar\'da belirir. Sadece hâlâ önemli olanları tekrar ekle.';

  @override
  String get taskCapBulletFreeze => 'Seri dondurması bir kaçırmayı affeder';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro sana ayda 2 seri dondurması verir — kaçırılan bir günü kapsar, böylece zincirin hayatta kalır.';

  @override
  String get tasksHeader => 'Görevler';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done/$total';
  }

  @override
  String get tasksAddSeed => 'Bir görev tohumu ekle';

  @override
  String get tasksCapReached =>
      '5/5 yer kullanıldı — yeni bir tohum ekmek için birini tamamla.';

  @override
  String get tasksEmptyCta => 'İlk tohumunu ek — bugün ne önemli?';

  @override
  String get habitsHeader => 'Alışkanlıklar';

  @override
  String habitsGrowing(String count) {
    return '$count büyüyor';
  }

  @override
  String habitsBestStreak(String days) {
    return 'En iyi $days gün';
  }

  @override
  String get habitsPlantNew => 'Yeni bir alışkanlık filizi ek';

  @override
  String get habitsPlantFirst => 'Bir alışkanlık eke';

  @override
  String get habitsLocked =>
      'Pro alışkanlık slotu — daha fazla filiz ekmek için aç';

  @override
  String get habitsSlotsFull => 'Tüm alışkanlık slotları şu anda dolu.';

  @override
  String habitsStreakDays(String days) {
    return '${days}g';
  }

  @override
  String get habitsCadence => 'GÜNLÜK';

  @override
  String leftBehindBanner(String count) {
    return '$count kaçırıldı — hâlâ Geri Kalanlar\'da';
  }

  @override
  String get leftBehindTap => 'Tekrar eklemek için dokun veya bırak';

  @override
  String get leftBehindDismiss => 'Kapat';

  @override
  String get leftBehindTitle => 'Geri Kalanlar';

  @override
  String get leftBehindEmpty => 'Hiçbir şey geride kalmadı';

  @override
  String get leftBehindEmptyBody =>
      'Kaçırılmış görev yok. Ektiğin her tohum bakılıyor. Bahçe temiz.';

  @override
  String get leftBehindClearAll => 'Tümünü temizle';

  @override
  String get leftBehindClearAllConfirm => 'Tüm geri kalanlar temizlensin mi?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Bu, $count kaçırılmış görevi kalıcı olarak silecek. Bunu geri alamazsın.';
  }

  @override
  String get leftBehindReAdd => 'Bugüne tekrar ekle';

  @override
  String get leftBehindReAddButton => 'Tekrar ekle';

  @override
  String get leftBehindAddedToToday => 'Bugüne eklendi';

  @override
  String get leftBehindLetGo => 'Bırak gitsin';

  @override
  String get leftBehindHeader => 'GERİ KALANLAR';

  @override
  String get leftBehindMissedTasks => 'KAÇIRILAN GÖREVLER';

  @override
  String get leftBehindWaitingOne => '1 görev seni bekliyor.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count görev seni bekliyor.';
  }

  @override
  String get leftBehindBody =>
      'Bir görevi bugüne geri eklemek için dokun veya bırak. Tekrar eklemek serini canlı tutar.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" günümüze geri döndü.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return '\"$task\" kaldırıldı';
  }

  @override
  String get leftBehindClearedSnack => 'Geri kalanlar temizlendi';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Dün · $date';
  }

  @override
  String streakAtRisk(String count) {
    return 'Bugün için $count görev kaldı';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Son çağrı — $count görev hâlâ açık';
  }

  @override
  String get streakAtRiskBody => 'Gece yarısına yakın. Zincir bunlara bağlı.';

  @override
  String get streakAtRiskBodyLow =>
      'Hâlâ zamanın var. Temiz bir gün serini uzatır.';

  @override
  String get streakAtRiskFreeze =>
      'Dün kaçırıldı — seri dondurması kullanılsın mı?';

  @override
  String get streakFreezeUse => 'Dondurmayı kullan';

  @override
  String get streakFreezeUseForYesterday =>
      'Dünkü için aylık seri dondurmasını kullan';

  @override
  String get streakFreezeAppliedYesterday =>
      'Dün için seri dondurması uygulandı.';

  @override
  String get chainBrokenTitle => 'Zincir kırıldı. Sorun değil.';

  @override
  String get chainBrokenBody =>
      'Her uzun zincir bir gün biter. Önemli olan bugünkü ektiklerin. Mükemmel bir gün bir sonrakini başlatır.';

  @override
  String get chainBrokenCta => 'Bugüne dön';

  @override
  String get chainBrokenPlantFirst => 'Bugünün ilk tohumunu ek';

  @override
  String get chainBrokenCheck => 'Önce Geri Kalanlar\'a bak';

  @override
  String get chainBrokenBestChain => 'en iyi zincir';

  @override
  String get chainBrokenTasksDone => 'tamamlanan görev';

  @override
  String get chainBrokenSprouts => 'filiz';

  @override
  String get chainRecoveryFreshStart => 'Yeni bir başlangıç';

  @override
  String get medalsTitle => 'Madalyalarım';

  @override
  String get medalsTrophyRoom => 'Kupa Odası';

  @override
  String get medalsAllMedals => 'Tüm Madalyalar';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$total madalyadan $earned tanesi kazanıldı';
  }

  @override
  String get medalsTrophyEmpty => 'İlk rozetin bir görev uzağında';

  @override
  String get medalsTrophyFirst => 'İlk madalyanı kazandın — devam et';

  @override
  String medalsTrophyMany(String earned) {
    return 'Kupa odanda $earned madalya var';
  }

  @override
  String medalsProgressLabel(String total) {
    return '$total madalyanın ilerlemesi';
  }

  @override
  String get medalsShareCta => 'Paylaşılabilir bir kart oluştur';

  @override
  String get medalsEmptyTitle => 'Bu kategoride henüz bir şey yok';

  @override
  String get medalsEmptyBody =>
      'Kupa odanı başlatmak için bir görevi tamamla veya bir filizi sula.';

  @override
  String get medalSheetLocked => 'PRO MADALYASI';

  @override
  String medalSheetEarned(String tier) {
    return 'KAZANILDI · $tier';
  }

  @override
  String get medalSheetUnlock => 'Pro ile aç';

  @override
  String get medalSheetProgress => 'İlerleme';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Açmak için sadece $n $unit daha.';
  }

  @override
  String get medalSheetAlmost => 'Açmak için bir adım daha.';

  @override
  String get medalCategory => 'Kategori';

  @override
  String get medalShareOnSocials => 'Sosyal medyanda paylaş';

  @override
  String get medalShareLater => 'Belki sonra';

  @override
  String get medalUnlocked => 'MADALYA AÇILDI';

  @override
  String get medalProgressTitle => 'İlerleme';

  @override
  String get historyTitle => 'Son 7 Gün';

  @override
  String get historyFullTitle => 'Tam geçmiş';

  @override
  String get historyLoadError => 'Geçmiş yüklenemedi.';

  @override
  String get historyFullCalendar => 'Takvim';

  @override
  String historyCompletedPercent(String percent) {
    return '%$percent tamamlandı';
  }

  @override
  String historyThisWeek(String days) {
    return 'SON $days GÜN';
  }

  @override
  String get historyDayByDay => 'GÜN GÜN';

  @override
  String get historyEmpty =>
      'Haftanın nasıl geçtiğini görmek için biraz tohum ek.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return '$total görevden $done tanesini tamamladın. $perfect mükemmel gün.';
  }

  @override
  String get historyUpsellTitle => 'Tam geçmişini gör';

  @override
  String get historyUpsellBody =>
      'Pro 30 günlük geçmişi açar. Ücretsiz olan 7 gün gösterir.';

  @override
  String get historyPerfect => 'MÜKEMMEL';

  @override
  String get historyFrozen => 'DONMUŞ';

  @override
  String get historyToday => 'Bugün';

  @override
  String get historyEmptyDay => 'O gün hiçbir tohum ekilmedi';

  @override
  String historyLeftBehindCount(String count) {
    return '$count geride kaldı';
  }

  @override
  String get progressVitality => 'BUGÜNÜN CANLILIĞI';

  @override
  String get progressVitalityEmpty => 'Bahçenü başlatmak için bir tohum ek.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return 'Bugün $total tohumdan $done tanesi ekildi.';
  }

  @override
  String progressChainPill(String days) {
    return '$days günlük zincir';
  }

  @override
  String get progressMetricCurrent => 'Şu an';

  @override
  String get progressMetricBest => 'En iyi';

  @override
  String get progressMetricDone => 'Tamamlandı';

  @override
  String get progressMetricPerfect => 'Mükemmel';

  @override
  String get progressMetricHabits => 'Alışkanlıklar';

  @override
  String get progressHabitBlooms => 'Alışkanlık çiçekleri';

  @override
  String get progressHabitBloomsSub =>
      'Her gün suladığın filizler için seri kilometre taşları.';

  @override
  String get progressNextBadge => 'Sonraki rozet';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned/$total';
  }

  @override
  String get progressPersonalActivity => 'Kişisel Aktivite';

  @override
  String progressBrowseMonth(String month) {
    return '$month ayını görüntülüyorsun. Canlı etkinliğine dönmek için \"Bugün\"e dokun.';
  }

  @override
  String get progressJumpToToday => 'Bugün';

  @override
  String get progressCalendarLegend => 'daha koyu = daha çok tamamlandı';

  @override
  String get progressCalendarBody =>
      'Koyu yeşil mükemmel bir gün demektir. Atladıkça renk solar.';

  @override
  String get paywallTitle => 'Zinciri kırılmamış tut.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro sana tam disiplin sistemini verir.';

  @override
  String get paywallFeatures =>
      'Tam 5 alışkanlık slotu, sadece 3 değil|Tam geçmişin, sonsuza kadar|Tüm madalya seti|Her ay seri dondurması|Haftalık Makbuz + paylaşım kartları|Temalar + daha fazlası';

  @override
  String get paywallFeaturesBodies =>
      'Ücretsiz olan 3 verir. Pro hepsini açar, böylece günlük ritüelin burada yaşayabilir.|Tamamladığın her günü görüntüle — sadece son 7 değil. Haftalarca değil, yıllarca geriye bak. |Efsanevi seviye madalyalarını aç. En nadir rozetler, her şeyini verenler içindir.|Ayda 2 seri dondurması, böylece tek bir kötü gün zincirini bitirmez.|Haftanın güzel paylaşım kartları. Zincirini paylaş, başkasını başlatmaya ilham ver.|Yeni vurgu renkleri ve temaları ekledikçe aç. Her zaman ücretsiz güncellemeler.';

  @override
  String get paywallYearly => 'Yıllık';

  @override
  String get paywallYearlyCaption => 'En iyi değer · ayda ~2.50 USD civarında';

  @override
  String get paywallYearlyBadge => '%35 TASARRUF';

  @override
  String get paywallMonthly => 'Aylık';

  @override
  String get paywallMonthlyCaption =>
      'Her ay faturalanır · istediğin zaman iptal et';

  @override
  String paywallStartCta(String price) {
    return 'Pro\'yu Başlat · $price/yıl';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Pro\'yu Başlat · $price/ay';
  }

  @override
  String get paywallRestore => 'Satın almayı geri yükle';

  @override
  String get paywallTerms => 'Koşullar';

  @override
  String get paywallPrivacy => 'Gizlilik';

  @override
  String get paywallNoRestore => 'Bu hesapta önceki bir satın alım bulunamadı.';

  @override
  String get paywallRestoreLater =>
      'Satın almanı sonraki senkronizasyonda geri yükleyeceğiz.';

  @override
  String get paywallAlreadyPro => 'Pro üyesisin. Desteğin için teşekkürler.';

  @override
  String get paywallHabitSlotHead =>
      'Tüm ücretsiz alışkanlık slotlarını kullandın. Önemsediğin her ritüeli eklemek için tam seti aç.';

  @override
  String get paywallHistoryHead =>
      'Tam geçmişini gör — her mükemmel günü, her madalyayı, her geri dönüşü.';

  @override
  String get paywallMedalHead =>
      'En nadir madalyalar sadece Pro\'ya özel. Devam et — düşündüğünden daha yakınlar.';

  @override
  String get settingsYourActivity => 'AKTİVİTEN';

  @override
  String get settingsHelpInfo => 'YARDIM & BİLGİ';

  @override
  String get settingsAccount => 'HESAP';

  @override
  String get settingsNurturingTools => 'BÜYÜTME ALETLERİ';

  @override
  String get settingsReminders => 'HATIRLATMALAR';

  @override
  String get settingsWidgetSanctuary => 'WİDGET KORUNAĞI';

  @override
  String get settingsEcosystemSupport => 'EKOSİSTEM DESTEĞİ';

  @override
  String get settingsHowItWorks => 'Bu nasıl çalışır';

  @override
  String get settingsSignOut => 'Çıkış yap';

  @override
  String get settingsProActive => 'Aktif';

  @override
  String get settingsProFree => 'Ücretsiz katman';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsLanguageValue => 'Sistem varsayılanı';

  @override
  String get firstRunGreeting =>
      '5 görev. Daha fazla değil. Onları sayılı kıl.';

  @override
  String get firstRunBody => 'İlk tohumunu ek — bugün en çok ne önemli?';

  @override
  String get firstRunCta => 'İlk tohumunu ek';

  @override
  String get emptyStateClearAll => 'Tümünü temizle';

  @override
  String get cancel => 'İptal';

  @override
  String get intentionTitle1 => 'Yeni bir niyet ekelim!';

  @override
  String get intentionBody1 =>
      'Her muhteşem orman tek bir küçük choix ile başlar. Bugün neyi büyütüyoruz?';

  @override
  String get intentionTitle2 => 'Bugün ne ekelim?';

  @override
  String get intentionBody2 =>
      'Küçük tohumlar, özenle bakılırsa yüksek ağaçlara dönüşür. Şu anda en çok önemli olanı seç.';

  @override
  String get intentionTitle3 => 'Bir tohum. Bir nefes. Başla.';

  @override
  String get intentionBody3 =>
      'Tüm ormanı bir anda ekmen gerekmez — sadece bir sonraki doğru şey.';

  @override
  String get intentionTitle4 => 'Bir sonraki küçük adımı besle.';

  @override
  String get intentionBody4 =>
      'Gelecekteki sen, önümüzdeki beş dakikada yaptığın seçimlerden oluşur. Nazik bir tane hangisi?';

  @override
  String get intentionTitle5 => 'Neye dönüşmek istediğine karar ver.';

  @override
  String get intentionBody5 =>
      'Görevler tohumlardır, alışkanlıklar filizlerdir. Birlikte gurur duyduğun bir orman oluştururlar.';

  @override
  String get intentionTitle6 => 'Hatıralık bir şey ek.';

  @override
  String get intentionBody6 =>
      'Her gün muhteşem hissettirmeyebilir. Sulanmış bir tohum bile sayılır. Bir tane seçelim.';

  @override
  String get intentionTitle7 => 'Bugünü biraz daha cesur yap.';

  @override
  String get intentionBody7 =>
      'Cesaret birikir. Ertelediğin tohumu seç — adını koymak bile ileriye doğru bir adımdır.';

  @override
  String get intentionTitle8 => 'Tohumdan önce toprağı hazırla.';

  @override
  String get intentionBody8 =>
      'Bu görevi kolaylaştıracak bir zihin, araç veya küçük ritüel ne olur? Notlara ekle.';

  @override
  String get shareCardSnapshot => 'Korunağının bir anlık görüntüsü';

  @override
  String get shareCardBody =>
      'Yukarıdaki kart PNG olarak dışa aktarılır ve paylaşım sayfasına gönderilir. Hikayende paylaş, bir arkadaşına gönder veya sticker olarak yazdır.';

  @override
  String get shareCardShareMyBloom => 'Çiçeğimi paylaş';

  @override
  String get shareCardCouldNotShare => 'Şu anda paylaşılamadı';

  @override
  String shareCardProgressText(String year) {
    return 'Daily Stitch ilerlemem — $year Daily Stitch\'te.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Daily Stitch\'te \"$title\" madalyasını açtım. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Bu nasıl çalışır';

  @override
  String get howItWorksBody =>
      'Daily Stitch, küçük ve kırılmaz bir disiplin zinciri tutmana yardımcı olur. Hepsi bu.';

  @override
  String get howItWorksToday => 'Bugün sekmesi';

  @override
  String get howItWorksTodayBody =>
      'Bu senin evin. Bugünkü 5 görev ve ayarladığın alışkanlıkları gösterir. Gece yarısına kadar tamamlarsan, zincir uzar.';

  @override
  String get howItWorksCap => '5 görev sınırı özelliği';

  @override
  String get howItWorksCapBody =>
      '6. görevi eklemene izin vermiyoruz. Tüm mesele bu. Kısa zincirler uzun olanlardan iyidir. Tam açıklama için ana ekrandaki \"?\" butonuna dokun.';

  @override
  String get howItWorksHabits => 'Alışkanlıklar günlük, zincir ömür boyu';

  @override
  String get howItWorksHabitsBody =>
      'Alışkanlıklar (Sabah yogası, Su içme) sonsuza kadar yaşar. Görevler tek seferlik. İkisi de aynı seriyi besler.';

  @override
  String get howItWorksLeftBehind => 'Kaçırılan görevler → Geri Kalanlar';

  @override
  String get howItWorksLeftBehindBody =>
      'Gece yarısında, tamamlanmamış görevler Geri Kalanlar\'a taşınır. Sadece hâlâ önemli olanları tekrar ekle. Geri kalanı sessizce bırakılır.';

  @override
  String get howItWorksProgress => 'İlerleme sekmesi';

  @override
  String get howItWorksProgressBody =>
      'Seri, takvim, madalyalar, geçmiş — zaman içinde nasıl gittiğin hakkında her şey. Burada acil bir şey yok.';

  @override
  String get howItWorksYou => 'Sen sekmesi';

  @override
  String get howItWorksYouBody => 'Hesabın, ayarların, çıkış. Hepsi bu.';

  @override
  String get howItWorksRule => 'Kural: Her gün 5 küçük şey, bahane yok.';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonDismiss => 'Kapat';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonSend => 'Gönder';

  @override
  String get commonCopy => 'Kopyala';

  @override
  String get commonShowLess => 'Daha az göster';

  @override
  String get commonViewFull => 'Tam notları gör';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonDone => 'Tamamlandı';

  @override
  String get commonError => 'Bir şey yanlış gitti';

  @override
  String get commonPageNotFound => 'Sayfa Bulunamadı';

  @override
  String get commonHome => 'Ana Sayfa';

  @override
  String get commonUnknownError => 'Bilinmeyen yönlendirme hatası';

  @override
  String get commonSettingsTooltip => 'Ayarlar';

  @override
  String get commonHowThisWorks => 'Bu nasıl çalışır';

  @override
  String get myDayReminderSet => 'Hatırlatıcı ayarlandı';

  @override
  String get myDayPreparationNotes => 'HAZIRLIK NOTLARI';

  @override
  String get onboardingSkip => 'ATLA';

  @override
  String get onboardingNext => 'İleri';

  @override
  String get onboardingEnterSanctuary => 'Korunağa Gir';

  @override
  String get onboardingIntroduction => 'GİRİŞ';

  @override
  String get onboardingGrowYourForest => 'ORMANINI BÜYÜT';

  @override
  String get onboardingPage1Title => 'Koruyucunla tanış.';

  @override
  String get onboardingPage1Body =>
      'Kişisel Korunağına hoş geldin. Burada, büyümen ormanının yansır.';

  @override
  String get onboardingPage2Title => 'Tohumlar ek. Büyürken izle.';

  @override
  String get onboardingPage2Body =>
      'Her görev küçük bir tohumdur. Her alışkanlık günlük baktığın bir filizdir. Birlikte disiplin dolu bir orman oluştururlar.';

  @override
  String get onboardingPage3Title => 'Beş görev. Bir zincir.';

  @override
  String get onboardingPage3Body =>
      'Günde sadece 5 tohum ekabilirsin. Bu sınır, gerçekten önemli olan şeylere odaklanmanı ve zincirini korumanı sağlar.';

  @override
  String get onboardingPage4Title => 'Filizlerini her gün sula.';

  @override
  String get onboardingPage4Body =>
      'Alışkanlıklara dokunarak büyüt. Bir gün atla, zincir uzamaz. Koruyucu seninle birlikte büyür.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'İlk tohumunu ek.';

  @override
  String get authWelcomeBack => 'Hoş geldin, Koruyucu.';

  @override
  String get authFiveTasksDaily =>
      'Beş görev. Günlük alışkanlıklar. Bahane yok.';

  @override
  String get authSanctuaryWaiting => 'Korunağın seni bekliyor.';

  @override
  String get authSignIn => 'Giriş Yap';

  @override
  String get authSignUp => 'Kayıt Ol';

  @override
  String get authEmail => 'E-POSTA';

  @override
  String get authPassword => 'ŞİFRE';

  @override
  String get authEmailHint => 'ornek@email.com';

  @override
  String get authCreateAccount => 'Hesap oluştur';

  @override
  String get authSignInCta => 'Giriş yap';

  @override
  String get authOrContinueWith => 'veya şununla devam et';

  @override
  String get authContinueWithGoogle => 'Google ile devam et';

  @override
  String get authEnterEmail => 'E-posta adresini gir';

  @override
  String get authEnterValidEmail => 'Geçerli bir e-posta adresi gir';

  @override
  String get authPasswordTooShort => 'Şifre en az 6 karakter olmalıdır';

  @override
  String get authAccountCreated =>
      'Hesap oluşturuldu. Giriş Yap\'a geç ve şifreni kullan.';

  @override
  String get authSomethingWentWrong => 'Bir şey yanlış gitti. Tekrar dene.';

  @override
  String get authCouldNotStartGoogle => 'Google oturumu başlatılamadı.';

  @override
  String get authMidnightReset =>
      'Giriş yaparak gününün gece yarısında sıfırlandığını kabul edersin.';

  @override
  String get authSetupRequired => 'Kurulum gerekli';

  @override
  String get settingsPersonalSanctuary => 'KİŞİSEL KORUNAK';

  @override
  String get settingsHowThisWorks => 'Bu nasıl çalışır';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Uygulama nedir, sınır ve seri nasıl çalışır';

  @override
  String get settingsStreakProtection => 'Seri Koruması';

  @override
  String get settingsStreakProtectionAvailable => 'Bu ay 1 dondurma mevcut';

  @override
  String get settingsStreakProtectionUsed => 'Bu ay için kullanıldı';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Pro aboneliğini yönet';

  @override
  String get settingsProCancelPlay =>
      'Google Play\'de planı iptal et veya değiştir';

  @override
  String get settingsProUnlock =>
      'Tüm 5 alışkanlığı, tam geçmişi ve daha fazlasını aç';

  @override
  String get settingsTaskAlarms => 'Görev alarmı ve Son Çağrı';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Akşam hatırlatması ve gece yarısı uyarısı';

  @override
  String get settingsHomeScreenWidget => 'Ana ekran widget\'ı';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Zincir serini ana ekrana ekle';

  @override
  String get settingsShareBloomTracker => 'Daily Stitch\'i paylaş';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Bir arkadaşına zincirden bahset';

  @override
  String get settingsHelpSupport => 'Yardım & Destek';

  @override
  String get settingsHelpSupportSubtitle => 'SSS veya sorun bildir';

  @override
  String get settingsSignOutTile => 'Çıkış Yap';

  @override
  String get settingsAllFeaturesUnlocked => 'Tüm özellikler açıldı';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Beta sürümü — her şeyi test ederken abonelikler duraklatıldı.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'Sürüm $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Sürüm 1.0.0';

  @override
  String get settingsHabitMaster => 'Alışkanlık Ustası';

  @override
  String settingsLevel(Object level) {
    return 'Seviye $level · Alışkanlık Ustası';
  }

  @override
  String get languagePickerTitle => 'Dil';

  @override
  String get youLast7Days => 'Son 7 gün';

  @override
  String get youLast7DaysSubtitle => 'Günlük görev geçmişi';

  @override
  String get youLeftBehindSubtitle =>
      'Tekrar ekilmeyi bekleyen kaçırılan görevler';

  @override
  String get youProTier => 'Pro katmanı';

  @override
  String get youFreeTier => 'Ücretsiz katman';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Ücretsiz';

  @override
  String youLevelLabel(Object level) {
    return 'Seviye $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'En iyi $days gün';
  }

  @override
  String get youPlantHabit => 'Bir zincir başlatmak için bir alışkanlık ek.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline => 'Tam disiplin sistemini aç.';

  @override
  String get youProFeatures =>
      '5 alışkanlık slotu, tam geçmiş, efsanevi madalyalar, aylık seri dondurmaları, haftalık paylaşım kartları.';

  @override
  String get youSeePlans => 'Planları gör';

  @override
  String youFromPrice(Object price) {
    return '$price/ay\'dan başlayan fiyatlarla';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch · Alışkanlık & Yapılacak';

  @override
  String get progressMedals => 'Madalyalar';

  @override
  String get progressLast7Days => 'Son 7 gün';

  @override
  String get progressSeeAll => 'Tümünü gör';

  @override
  String get progressSeeDayByDayActivity => 'Günlük aktiviteni gör';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$total görevden $done tanesi tamamlandı · %$pct';
  }

  @override
  String get progressNoMedalsYet =>
      'Henüz madalya yok — başlamak için bir görevi tamamla veya bir filizi sula.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Tüm madalyaları gör · $earned/$total kazanıldı';
  }

  @override
  String get progressGuardianInsight => 'Koruyucu içgörüsü';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'SONRAKİ ROZET · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return '$days günlük hedef';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Yardım & Destek';

  @override
  String get helpBody =>
      'Cevapların çoğu aşağıda. Yoksa bize bir not gönder, genellikle 2-3 gün içinde yanıt veririz.';

  @override
  String get helpSectionFAQ => 'SIK SORULAN SORULAR';

  @override
  String get helpSectionContact => 'HALEN TAKILDI MI?';

  @override
  String get helpAddMessage => 'Önce kısa bir mesaj ekle.';

  @override
  String get helpOpening => 'E-posta uygulaman açılıyor…';

  @override
  String get helpEmailUs => 'Bize e-posta gönder';

  @override
  String get helpOpeningAction => 'Açılıyor…';

  @override
  String get helpCopyEmail => 'Destek e-postasını kopyala';

  @override
  String get helpCopiedEmail => 'support@dailystitch.app kopyalandı';

  @override
  String get helpNoMailApp =>
      'E-posta uygulaması bulunamadı. Bize support@dailystitch.app adresinden yazın.';

  @override
  String get helpTopicLabel => 'Konu';

  @override
  String get helpWhatHappened => 'Ne oldu?';

  @override
  String get helpHint => 'Kısa bir açıklama çok yol alır…';

  @override
  String get helpDisclaimer =>
      '\"Bize e-posta gönder\"e dokunmak, önceden doldurulmuş bir mesajla e-posta uygulamanı açar (gönderene kadar hiçbir veri cihazından ayrılmaz).';

  @override
  String get helpFaqQ1 => '5 görev sınırı nedir?';

  @override
  String get helpFaqA1 =>
      'Yerel gün başına en fazla 5 görev ekleyebilirsin. 6. görev kasıtlı olarak engellenir — disiplin aşırı yüklemeyi yener. Sınır bir özelliktir, bir kısıtlama değil.';

  @override
  String get helpFaqQ2 => 'Gece yarısında ne olur?';

  @override
  String get helpFaqA2 =>
      'Yerel gece yarısında, hâlâ açık olarak işaretli her görev \"kaçırıldı\" damgası alır ve Geri Kalanlar\'a gider. Alışkanlık, bir önceki gün tamamlanmamışsa seri sıfırlanır.';

  @override
  String get helpFaqQ3 => 'Geri Kalanlar nedir?';

  @override
  String get helpFaqA3 =>
      'Bitiremediğin görevlerin nazik bir listesi. Aç, sadece hâlâ önemli olanları tekrar ekle, gerisini bırak. Ücretsiz katman son 7 günü gösterir; Pro tam geçmişi gösterir.';

  @override
  String get helpFaqQ4 => 'Seriler nasıl çalışır?';

  @override
  String get helpFaqA4 =>
      'En az 1 görevin olduğu ve 0 kaçırdığın bir gün zinciri uzatır. Sıfır görevli günler ne uzatır ne de kırar. Bir seri dondurması ayda bir kaçırılan günü affeder.';

  @override
  String get helpFaqQ5 => 'Seri dondurması nedir?';

  @override
  String get helpFaqA5 =>
      'Takvim ayına bir \"dondurma\", sadece Pro. Kaçırıldığın bir günde kullan, zincirini canlı tut. İlerleme sekmesinde bul.';

  @override
  String get helpFaqQ6 => 'Verilerim nerede saklanıyor?';

  @override
  String get helpFaqA6 =>
      'Tüm veriler, giriş yaptığın hesap altında Supabase\'de (Postgres) saklanır. Verilerini asla satmıyoruz veya paylaşmıyoruz. Tüm ayrıntılar için Play Store listesindeki gizlilik politikasına bak.';

  @override
  String get helpFaqQ7 => 'Hesabımı nasıl silerim?';

  @override
  String get helpFaqA7 =>
      'Ayarlar → Hesap → Hesabı sil yolunu izle. Bu, profilini, görevlerini, alışkanlıklarını ve abonelik verilerini kalıcı olarak siler. Aktif Play abonelikleri Google Play\'de ayrıca iptal edilmelidir.';

  @override
  String get helpTopicsGeneral => 'Genel soru';

  @override
  String get helpTopicsBug => 'Hata raporu';

  @override
  String get helpTopicsStreak => 'Seri / devretme sorunu';

  @override
  String get helpTopicsBilling => 'Faturalama veya Pro katmanı';

  @override
  String get helpTopicsAccount => 'Hesap & veri';

  @override
  String get helpTopicsFeature => 'Özellik isteği';

  @override
  String get helpAccountAnon => '(giriş yapılmadı)';

  @override
  String get splashTagline => 'Küçük tohumları besle. Bir orman yetiştir.';

  @override
  String get priorityStandard => 'STANDART';

  @override
  String get priorityVital => 'VİTAL';

  @override
  String get prioritySpark => 'KIVILCIM';

  @override
  String get settingsDeleteAccount => 'Hesabı sil';

  @override
  String get settingsDeleteAccountSubtitle => 'Verilerini kalıcı olarak kaldır';

  @override
  String get settingsDeleteAccountConfirmTitle =>
      'Hesabını silmek istiyor musun?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Bu, profilini, görevlerini, alışkanlıklarını ve ilerlemeni kalıcı olarak siler. Aktif abonelikler Google Play\'de ayrıca iptal edilmelidir. Bu işlem geri alınamaz.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Kalıcı olarak sil';

  @override
  String get settingsDeleteAccountSuccess => 'Hesabın silindi.';

  @override
  String get settingsDeleteAccountFailed =>
      'Hesap silinemedi. Tekrar dene veya support@dailystitch.app adresine yaz.';

  @override
  String get referralYouTitle => 'Arkadaşlarını davet et · Ücretsiz Pro kazan';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$milestone arkadaştan $progress tanesi katıldı';
  }

  @override
  String get referralYouShare => 'Daveti paylaş';

  @override
  String get referralYouDetails => 'Detayları gör';

  @override
  String get referralPaywallTitle => 'Ücretsiz Pro ayı';

  @override
  String get referralPaywallBody =>
      '5 arkadaş davet et ve katılsın → 1 ay ücretsiz Pro';

  @override
  String get referralPaywallProBody =>
      'Davet etmeye devam et — ücretsiz Pro aylarını biriktir';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count/$milestone';
  }

  @override
  String get insightsLoadError =>
      'İlerlemen yüklenemedi. Daha sonra tekrar dene.';

  @override
  String get insightsMetricCurrentChain => 'MEVCUT ZİNCİR';

  @override
  String get insightsMetricBestEver => 'EN İYİ';

  @override
  String get insightsMetricTasksDone => 'TAMAMLANAN GÖREVLER';

  @override
  String get insightsMetricPerfectDays => 'MÜKEMMEL GÜNLER';

  @override
  String get insightsMetricHabits => 'ALIŞKANLIKLAR';

  @override
  String get insightsDay => 'gün';

  @override
  String get insightsDays => 'gün';

  @override
  String get insightsSectionThisWeek => 'Bu hafta';

  @override
  String get insightsShareMyWeek => 'Haftamı paylaş';

  @override
  String get insightsShareMyWeekPro => 'Haftamı paylaş · Pro';

  @override
  String get insightsShareReceiptText =>
      'Daily Stitch\'te geçen haftam. Zinciri kırma.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Son $days gün gösteriliyor';
  }

  @override
  String get insightsHistoryUpsell => 'Pro ile tam geçmişini aç';

  @override
  String get referralScreenTitle => 'Arkadaşlarını davet et';

  @override
  String get referralLaunchGift => 'Lansman ayı hediyesi';

  @override
  String get referralRewardTitle => '1 ay ücretsiz Pro kazan';

  @override
  String get referralRewardBody =>
      'Kodunu arkadaşlarınla paylaş. 5 kişi kodunu kullanarak kayıt olduğunda, Daily Stitch Pro\'yu tam bir ay açarsın.';

  @override
  String get referralYourCode => 'Davet kodun';

  @override
  String get referralCopyCodeTooltip => 'Kodu kopyala';

  @override
  String get referralCodeCopied => 'Davet kodu kopyalandı';

  @override
  String get referralShareWithFriends => 'Arkadaşlarınla paylaş';

  @override
  String get referralFooterHint =>
      'Arkadaşlar hesap oluştururken kodunu girer. Her arkadaş ödüle bir kez sayılır.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count arkadaş katıldı';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count arkadaş katıldı';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return '$count ücretsiz Pro ayı kazandın.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return '$count ücretsiz Pro ayı kazandın.';
  }

  @override
  String get referralRewardUnlocked =>
      'Ödül açıldı — ücretsiz Pro ayının tadını çıkar!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return 'Ücretsiz ayını açmak için $remaining tane daha';
  }

  @override
  String youProMemberSince(String month) {
    return '$month ayından beri Bloom Pro üyesisin';
  }

  @override
  String get youProPerksTitle => 'Pro avantajların';

  @override
  String get manageProThankYou => 'Bloom\'a destek olduğun için teşekkürler';

  @override
  String get manageProReferralHint =>
      'Pro süreni uzatmak için daha fazla arkadaş davet et';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nleanspace/.env dosyasına SUPABASE_URL ve SUPABASE_PUBLISHABLE_KEY (veya eski SUPABASE_ANON_KEY) ekle, sonra yeniden derle:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Sistem varsayılanı';

  @override
  String get languageNameEn => 'English';

  @override
  String get languageNameUr => 'اردو (Urdu)';

  @override
  String get languageNameEs => 'Español';

  @override
  String get languageNamePt => 'Português';

  @override
  String get languageNameFr => 'Français';

  @override
  String get languageNameDe => 'Deutsch';

  @override
  String get languageNameIt => 'Italiano';

  @override
  String get languageNameAr => 'العربية';

  @override
  String get languageNameTr => 'Türkçe';

  @override
  String get languageNameId => 'Bahasa Indonesia';

  @override
  String get onboardingLanguageTitle => 'Dilini seç';

  @override
  String get onboardingLanguageBody =>
      'Daily Stitch boyunca kullanmak istediğin dili seç. İstediğin zaman Ayarlar\'dan değiştirebilirsin.';

  @override
  String get onboardingLanguageContinue => 'Devam';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Arkadaş';

  @override
  String get settingsAppTheme => 'Uygulama Teması';

  @override
  String get settingsAppThemeSubtitle => 'Kişisel korunak renklerini seç';

  @override
  String get settingsInviteFriendsTitle =>
      'Arkadaşlarını davet et · Ücretsiz Pro';

  @override
  String get settingsInviteFriendsSubtitle =>
      '5 arkadaş katıldığında 1 ay ücretsiz kazan';

  @override
  String get themePickerTitle => 'Kişisel Korunak';

  @override
  String get themePickerSubtitle => 'Sana huzur veren bir renk paleti seç.';

  @override
  String get themeNameClassicBloom => 'Klasik Çiçek';

  @override
  String get themeNameSolarTerracotta => 'Güneş Terrakota';

  @override
  String get themeNameMidnightOasis => 'Gece Yarısı Vahası';

  @override
  String get themeNameLavenderDream => 'Lavanta Rüyası';

  @override
  String get themeNameNordicFrost => 'Kuzey Buzulu';

  @override
  String get themeNameCyberpunkNeon => 'Cyberpunk Neon';

  @override
  String get reminderTitle => 'Hatırlatmalar';

  @override
  String get reminderBody =>
      'Son Çağrı, görevler hâlâ açıksa gece yarısından önce sana haber verir.';

  @override
  String get reminderFinalCall => 'Son Çağrı';

  @override
  String get reminderEveningNudge => 'Akşam hatırlatması';

  @override
  String get reminderChangeTime => 'Saati değiştir';

  @override
  String get reminderSave => 'Hatırlatmaları kaydet';

  @override
  String get notificationChannelReminders => 'Daily Stitch hatırlatmaları';

  @override
  String get notificationChannelRemindersDesc =>
      'Akşam hatırlatması ve Son Çağrı hatırlatmaları';

  @override
  String get notificationChannelAlarms => 'Daily Stitch görev alarmları';

  @override
  String get notificationChannelAlarmsDesc =>
      'Görev hatırlatmaları için sesli alarmlar';

  @override
  String get notificationTaskReminderTitle => 'Görev hatırlatması';

  @override
  String get notificationFinalCallTitle => 'Son Çağrı';

  @override
  String notificationFinalCallBody(int count) {
    return 'Bugün hâlâ $count açık görevin var.';
  }

  @override
  String get notificationEveningTitle => 'Akşam kontrolü';

  @override
  String get notificationEveningBody => 'Bahçen bugün nasıl büyüdü?';

  @override
  String get widgetSetupTitle => 'Zincir widget\'ı ekle';

  @override
  String get widgetSetupBody =>
      'Serini ana ekranda tut — uygulamayı açmana gerek yok.';

  @override
  String get widgetSetupAdd => 'Ana ekrana ekle';

  @override
  String get widgetSetupStep1 => 'Ana ekranında uzun bas';

  @override
  String get widgetSetupStep2 => 'Widget\'lara dokun';

  @override
  String get widgetSetupStep3 => 'Daily Stitch\'i bul ve sürükle';

  @override
  String get widgetSetupPinSuccess =>
      'Widget\'ı yerleştirmek için ana ekranına bak.';

  @override
  String get widgetSetupPinFallback =>
      'Başlatıcın tek dokunuşla eklemeyi desteklemiyor olabilir. Aşağıdaki manuel adımları kullan.';

  @override
  String get paywallWelcomePro => 'Daily Stitch Pro\'ya hoş geldin';

  @override
  String get paywallSavePercent => '~%16 TASARRUF';

  @override
  String get paywallTermsTitle => 'Abonelik koşulları';

  @override
  String get paywallTermsBody =>
      'Faturalama Google Play tarafından yapılır. Abonelikler, mevcut dönemin sonundan en az 24 saat önce Play Store → Abonelikler\'den iptal etmediğin sürece otomatik olarak yenilenir. Aboneliğini Google Play hesabından istediğin zaman yönetebilir veya iptal edebilirsin.\n\nUygulamayı kaldırman aboneliğini iptal etmez.\n\nGösterilen fiyatlar yerel para birimindedir ve bölgeye göre değişebilir. Vergiler uygulanabilir.';

  @override
  String get paywallPrivacyTitle => 'Gizlilik';

  @override
  String get paywallPrivacyBody =>
      'LeanSpace, görevlerini, alışkanlıklarını ve seri verilerini Supabase arka ucunda hesabına bağlı olarak saklar. Verilerini asla satmıyoruz.\n\nAbonelik satın alımları Google Play tarafından işlenir. Pro durumunu onaylamak için Google\'dan doğrulanmış bir satın alım belirteci alırız. Ödeme bilgilerini görmeyiz veya saklamayız.\n\nAyarlar → Hesap silme yolundan tam veri dışa aktarma veya hesap silme talebinde bulunabilirsin.';

  @override
  String get paywallCloseTooltip => 'Kapat';

  @override
  String get paywallFooterLinks => 'Geri Yükle · Koşullar · Gizlilik';

  @override
  String get manageProTitle => 'Pro aboneliği';

  @override
  String get manageProActive => 'Aktif';

  @override
  String get manageProNotSubscribed => 'Abone değil';

  @override
  String get manageProFreeTier => 'Ücretsiz katman';

  @override
  String manageProRenewsOn(String date) {
    return '$date tarihinde yenilenir veya sona erer.';
  }

  @override
  String get manageProFreeBody =>
      'Daily Stitch Ücretsiz\'i kullanıyorsun. Tam sistemi açmak için yükselt.';

  @override
  String get manageProSectionManage => 'YÖNET';

  @override
  String get manageProOpenPlay => 'Google Play aboneliklerini aç';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'İptal et, planı değiştir veya ödeme yöntemini güncelle';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Mevcut aboneliğini (varsa) burada bul';

  @override
  String get manageProShareApp => 'Daily Stitch\'i paylaş';

  @override
  String get manageProShareSubtitle => 'Bir arkadaşına zincirden bahset';

  @override
  String get manageProSectionHelp => 'YARDIM MI LAZIM?';

  @override
  String get manageProHelpTitle => 'Yardım & Destek';

  @override
  String get manageProHelpSubtitle => 'Abonelik SSS, iletişim, hata raporları';

  @override
  String manageProBillingFooter(String version) {
    return 'Faturalama Google Play tarafından yapılır · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Google Play Store uygulamasını aç → profil resmine dokun → Ödemeler ve abonelikler → Abonelikler.';

  @override
  String get addTaskGrowSomething => 'Bir Şey Büyüt';

  @override
  String get addTaskPlantSprout => 'Bir Filiz Ek';

  @override
  String get addTaskIntentionName => 'NİYET ADI';

  @override
  String get addTaskSproutName => 'FİLİZ ADI';

  @override
  String get addTaskHintTask => 'ör. Sabah Güneş Selamı';

  @override
  String get addTaskHintHabit => 'ör. Sabah Yogası';

  @override
  String get addTaskWhen => 'NE ZAMAN?';

  @override
  String get addTaskPriority => 'ÖNCELİK';

  @override
  String get addTaskNotes => 'NOTLAR';

  @override
  String get addTaskCadenceDaily => 'Günlük';

  @override
  String get addTaskCadenceWeekdays => 'İş günleri';

  @override
  String get addTaskCadence3x => 'Haftada 3x';

  @override
  String get addTaskCadenceWeekly => 'Haftalık';

  @override
  String get addTaskPlantIntention => 'Niyet Ek';

  @override
  String get addTaskPlantSproutCta => 'Filiz Ek';

  @override
  String get addTaskPlanting => 'Ekiliyor…';

  @override
  String get addTaskNameIntentionError => 'Niyetini adlandır';

  @override
  String get addTaskNameSproutError => 'Filizini adlandır';

  @override
  String get addTaskNotesMigrationWarning =>
      'Görev kaydedildi. Notlar ve öncelik için en son Supabase migrasyonu gerekiyor — supabase/migrations/20260701000000_todos_notes_priority.sql dosyasını çalıştır.';

  @override
  String get addTaskNoSproutSlots => 'Boş filiz slotu yok — önce birini sula.';

  @override
  String get addTaskSaveSproutError => 'Filiz kaydedilemedi — tekrar dene.';

  @override
  String get addTaskElementWater => 'SU';

  @override
  String get addTaskElementLight => 'IŞIK';

  @override
  String get addTaskElementSoil => 'TOPRAK';

  @override
  String get addTaskElementBreeze => 'RÜZGAR';

  @override
  String get addTaskCadenceLabel => 'SIKLIK';

  @override
  String get addTaskPreparationNotes => 'HAZIRLIK NOTLARI';

  @override
  String get addTaskTendingNotes => 'BAKIM NOTLARI';

  @override
  String get addTaskNotesHintTask =>
      'Bu görev için araçlar veya zihin ipuçları var mı?';

  @override
  String get addTaskNotesHintHabit => 'Bu filize bakmak nasıl görünüyor?';

  @override
  String get addTaskChooseElement => 'ÖĞE SEÇ';

  @override
  String get addTaskElementsTooltip => 'Öğeler ne anlama gelir?';

  @override
  String get addTaskTaskSeed => 'Görev Tohumu';

  @override
  String get addTaskHabitSprout => 'Alışkanlık Filizi';

  @override
  String get addTaskPickElement => 'Doğru öğeyi seç';

  @override
  String get addTaskPickElementBody =>
      'Her öğe farklı bir çaba türüne karşılık gelir. Doğru olanı suladığında Koruyucu daha güçlü hale gelir.';

  @override
  String get addTaskClearForm => 'Formu temizle';

  @override
  String get shareCouldNotShare => 'Şu anda paylaşılamadı';

  @override
  String get authReferralCodeLabel => 'Davet kodu (isteğe bağlı)';

  @override
  String get authReferralCodeHint => 'Arkadaş kodu';

  @override
  String get youPerkHabitSlots => '5 alışkanlık slotu';

  @override
  String get youPerkFullHistory => 'Tam geçmiş';

  @override
  String get youPerkAllThemes => 'Tüm temalar';

  @override
  String get youPerkStreakFreezes => 'Ayda 2 seri dondurması';

  @override
  String get youPerkLegendaryMedals => 'Efsanevi madalyalar';

  @override
  String get subscriptionPurchaseFailed => 'Satın alınamadı. Tekrar dene.';

  @override
  String get subscriptionUnavailable =>
      'Bu cihazda uygulama içi satın alımlar kullanılamıyor.';

  @override
  String get subscriptionLoadFailed => 'Abonelik seçenekleri yüklenemedi.';

  @override
  String get subscriptionVerifyFailed =>
      'Satın alım doğrulanamadı. Satın Almayı Geri Yükle\'yi dene.';

  @override
  String get streakFreezeFailed => 'Seri dondurması kullanılamadı.';

  @override
  String get streakFreezeAlreadyUsed => 'Bu ay dondurmanı zaten kullandın.';

  @override
  String get streakFreezeNoMissed =>
      'O günde dondurulacak kaçırılmış görev yok.';

  @override
  String get streakFreezeNotPastDay =>
      'Sadece geçmiş bir günü dondurabilirsin.';

  @override
  String get myDayLoadError => 'Günüm yüklenemedi. Yenilemek için çek.';

  @override
  String get myDayCapReached => 'Bugünün 5 görev sınırına ulaştın.';

  @override
  String get myDayRemoveTaskError => 'Görev kaldırılamadı.';

  @override
  String get shareCardTitle => 'Haftanı paylaş';

  @override
  String get shareCardCta => 'Görseli paylaş';

  @override
  String get medalTierSprout => 'Filiz';

  @override
  String get medalTierCommon => 'Yaygın';

  @override
  String get medalTierRare => 'Nadir';

  @override
  String get medalTierEpic => 'Destansı';

  @override
  String get medalTierLegendary => 'Efsanevi';

  @override
  String get medalCategoryTasks => 'Görevler';

  @override
  String get medalCategoryHabits => 'Alışkanlıklar';

  @override
  String get medalCategoryStreaks => 'Seriler';

  @override
  String get medalCategoryMastery => 'Ustalık';

  @override
  String get medalsShareTooltip => 'Başarıları paylaş';

  @override
  String get medalsFilterAll => 'Tümü';

  @override
  String get addHabitTitleNew => 'Yeni bir filiz ek';

  @override
  String get addHabitTitleEdit => 'Filizine bakım yap';

  @override
  String get addHabitLabelSproutName => 'FİLİZ ADI';

  @override
  String get shareCardAppBarTitle => 'Paylaşım Kartı';

  @override
  String get shareCardAppBarTitleMedal => 'Madalyanı paylaş';

  @override
  String shareCardDescMedal(Object title) {
    return '$title rozetini göster';
  }

  @override
  String get shareCardBodyMedal =>
      'Kazancını çevrenle paylaş. Kart PNG olarak dışa aktarılır ve herhangi bir sosyal uygulama için hazırdır.';

  @override
  String get shareCardCtaPreparing => 'Hazırlanıyor…';

  @override
  String get shareCardMilestone => 'YENİ KİLOMETRE TAŞI AÇILDI';

  @override
  String get shareCardStatChain => 'günlük zincir';

  @override
  String get shareCardStatSprouts => 'filiz';

  @override
  String get shareCardStatMedals => 'madalya';

  @override
  String shareCardHeadlineStreak(int days) {
    return '$days Günlük Seri';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Madalya Kazanıldı';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Filiz Koruyucusu';

  @override
  String get shareCardHeadlineFirstSeeds => 'İlk Tohumlar Ekildi';

  @override
  String get shareCardHeadlineGardenBegins => 'Bir Bahçe Başlıyor';

  @override
  String get shareCardSubheadMonth =>
      'Alışkanlıklarını tam bir ay başarıyla besledin.';

  @override
  String get shareCardSubheadWeek =>
      'Tam bir hafta büyüme — ormanınız sıklaşıyor.';

  @override
  String get shareCardSubheadProgress =>
      'Korunağın gerçek ilerleme gösteriyor. Bakmaya devam et.';

  @override
  String get shareCardSubheadSprouts =>
      'İlk filizlerin kök salıyor. Her gün sula.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'İlk tohumların toprağa ekildi. Açılmalarını izle.';

  @override
  String get shareCardSubheadFallback =>
      'Her orman tek bir küçük seçimle başlar.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — günde beş küçük tohum, kırılmaz bir zincir. Seninkini ek.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Daily Stitch\'i dene';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Daily Stitch\'te günlük zincirimi oluşturuyorum — $code davet kodumla katıl, ikimiz de büyüyelim.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Bana Daily Stitch\'te katıl';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Daily Stitch ilerlemem — $year Daily Stitch\'te.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Daily Stitch\'te \"$title\" madalyasını açtım. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Tamamlanan görevler';

  @override
  String get insightsReceiptPerfectDays => 'Mükemmel günler';

  @override
  String get insightsReceiptCompletion => 'Tamamlanma';

  @override
  String insightsReceiptDate(String date) {
    return 'Hafta: $date';
  }

  @override
  String get insightsReceiptFooter => 'Zinciri kırma.';

  @override
  String get elementLabelWater => 'Su';

  @override
  String get elementLabelLight => 'Işık';

  @override
  String get elementLabelSoil => 'Toprak';

  @override
  String get elementLabelBreeze => 'Rüzgar';

  @override
  String get elementTaglineWater =>
      'Yenile. Hidrasyon, dinlenme, duygusal bakım — kuyuyu dolduran her şey.';

  @override
  String get elementTaglineLight =>
      'Uyan. Sabah ışığı, odak blokları, çalışma, meditasyon — enerji ve netlik.';

  @override
  String get elementTaglineSoil =>
      'Yerleş. Okuma, günlük, derin çalışma — uzun vadeli güç inşa eden yavaş kökler.';

  @override
  String get elementTaglineBreeze =>
      'Hareket et. Yürüyüşler, koşular, nefes egzersizleri — kafayı temizleyen hafif, mobil enerji.';

  @override
  String get elementWhenWater => 'Tükenmiş veya yorgun hissettiğinde.';

  @override
  String get elementWhenLight => 'Güne net bir başlangıç gerektiğinde.';

  @override
  String get elementWhenSoil =>
      'İş yavaş ama değerli olduğunda (çalışma, zanaat, bakım).';

  @override
  String get elementWhenBreeze =>
      'Bedensel (veya zihinsel) olarak hareket etmeye ve nefes almaya ihtiyacın olduğunda.';

  @override
  String get bloomTierMastery => 'Ustalık';

  @override
  String get bloomTierStrong => 'Güçlü';

  @override
  String get bloomTierGrowing => 'Büyüyor';

  @override
  String get bloomTierSprouting => 'Filizleniyor';

  @override
  String get bloomTierLocked => 'Kilitli';

  @override
  String habitBloomSubtitle(int count, String element) {
    return '$count günlük seri · $element';
  }

  @override
  String get medal_id_first_spark => 'İlk Kıvılcım';

  @override
  String get medal_sub_first_spark => 'Çakmağı yaktın.';

  @override
  String get medal_desc_first_spark =>
      'İlk görevini tamamla. Her zincir burada başlar.';

  @override
  String get medal_id_triple_seed => 'Üçlü Tohum';

  @override
  String get medal_sub_triple_seed => 'Üçü toprağa.';

  @override
  String get medal_desc_triple_seed => 'Toplam 3 görev tamamla.';

  @override
  String get medal_id_dozen_sower => 'On İkili Ekici';

  @override
  String get medal_sub_dozen_sower => 'On iki tarla.';

  @override
  String get medal_desc_dozen_sower => 'Toplam 12 görev tamamla.';

  @override
  String get medal_id_quarter_century => 'Çeyrek Asır';

  @override
  String get medal_sub_quarter_century => 'Evet demenin mevsimi.';

  @override
  String get medal_desc_quarter_century => 'Toplam 25 görev tamamla.';

  @override
  String get medal_id_productivity_titan => 'Verimlilik Devi';

  @override
  String get medal_sub_productivity_titan => 'Tutarlılık birikir.';

  @override
  String get medal_desc_productivity_titan =>
      '50 görev tamamla — gerçek bir ivme oluşturdun.';

  @override
  String get medal_id_century_planter => 'Yüzlük Ekici';

  @override
  String get medal_sub_century_planter => 'Kendi ormanın.';

  @override
  String get medal_desc_century_planter =>
      '100 görev tamamla. Kullanıcıların %5\'indesin.';

  @override
  String get medal_id_clean_day => 'Temiz Sayfa';

  @override
  String get medal_sub_clean_day => 'Tek bir bile yok.';

  @override
  String get medal_desc_clean_day =>
      'Tek bir günde ektiğin her görevi tamamla.';

  @override
  String get medal_id_triple_perfect => 'Üçlü Mükemmel';

  @override
  String get medal_sub_triple_perfect => 'Üç kusursuz koşu.';

  @override
  String get medal_desc_triple_perfect => '3 mükemmel gün ulaş.';

  @override
  String get medal_id_perfect_week => 'Mükemmel Hafta';

  @override
  String get medal_sub_perfect_week => 'Yedi gün kırılmadı.';

  @override
  String get medal_desc_perfect_week => 'Art arda 7 mükemmel gün.';

  @override
  String get medal_id_two_week_chain => 'İki Haftalık Kuvvet';

  @override
  String get medal_sub_two_week_chain => 'İki hafta ateş içinde.';

  @override
  String get medal_desc_two_week_chain => '14 günlük zincirini koru.';

  @override
  String get medal_id_iron_chain => 'Demir Zincir';

  @override
  String get medal_sub_iron_chain => '30 bağlantı dövüldü.';

  @override
  String get medal_desc_iron_chain =>
      '30 günlük zincir. En zor görev madalyası.';

  @override
  String get medal_id_quarterly_chain => 'Üç Aylık Zincir';

  @override
  String get medal_sub_quarterly_chain => 'Bir mevsim, kırılmadı.';

  @override
  String get medal_desc_quarterly_chain => '90 günlük zincir. Efsanevi statü.';

  @override
  String get medal_id_vital_priority => 'Vital Kıvılcım';

  @override
  String get medal_sub_vital_priority => 'Zor olanları seçtin.';

  @override
  String get medal_desc_vital_priority => 'Vital öncelikli 5 görevi tamamla.';

  @override
  String get medal_id_spark_priority => 'Kıvılcım Eğitici';

  @override
  String get medal_sub_spark_priority => 'Hızlı kazançlar birikir.';

  @override
  String get medal_desc_spark_priority =>
      'Kıvılcım öncelikli 5 görevi tamamla.';

  @override
  String get medal_id_note_taker => 'Not Tutan';

  @override
  String get medal_sub_note_taker =>
      'Kağıttaki planlar kafadaki planları yener.';

  @override
  String get medal_desc_note_taker => '5 farklı göreve hazırlık notları ekle.';

  @override
  String get medal_id_left_behind_rescuer => 'Geri Kalan Kurtarıcı';

  @override
  String get medal_sub_left_behind_rescuer => 'Görev geride kalmadı.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Ertesi gün 3 kaçırılmış görevi tekrar ekle.';

  @override
  String get medal_id_first_sprout => 'İlk Filiz';

  @override
  String get medal_sub_first_sprout => 'Yeni bir günlük ritüel.';

  @override
  String get medal_desc_first_sprout => 'İlk alışkanlığını ek.';

  @override
  String get medal_id_trio_sprout => 'Üçlü Filiz';

  @override
  String get medal_sub_trio_sprout => 'Küçük bir ekosistem.';

  @override
  String get medal_desc_trio_sprout => '3 farklı alışkanlık ek.';

  @override
  String get medal_id_week_of_growth => 'Büyüme Haftası';

  @override
  String get medal_sub_week_of_growth => 'Kökler tutunmaya başlıyor.';

  @override
  String get medal_desc_week_of_growth =>
      '7 gün boyunca her gün bir alışkanlığı sula.';

  @override
  String get medal_id_fortnight_floret => 'İki Haftalık Çiçek';

  @override
  String get medal_sub_fortnight_floret => 'Tam çiçek açma.';

  @override
  String get medal_desc_fortnight_floret => '14 günlük alışkanlık serisi.';

  @override
  String get medal_id_rooted_master => 'Köklenmiş Usta';

  @override
  String get medal_sub_rooted_master => 'Derin kökler, derin güç.';

  @override
  String get medal_desc_rooted_master => '30 günlük alışkanlık serisi.';

  @override
  String get medal_id_half_year_bloom => 'Yıllık Çiçek';

  @override
  String get medal_sub_half_year_bloom => 'Bahçe artık kalıcı.';

  @override
  String get medal_desc_half_year_bloom => 'Tek bir alışkanlığı 180 gün koru.';

  @override
  String get medal_id_garden_keeper => 'Bahçe Bekçisi';

  @override
  String get medal_sub_garden_keeper => 'Çeşitlilik, birlikte.';

  @override
  String get medal_desc_garden_keeper => 'Aynı anda 4 farklı alışkanlık büyüt.';

  @override
  String get medal_id_hydration_hero => 'Hidrasyon Kahramanı';

  @override
  String get medal_sub_hydration_hero => 'Kuyuyu dolduruyorsun.';

  @override
  String get medal_desc_hydration_hero =>
      'Bir hidrasyon alışkanlığı ek (su/içecek).';

  @override
  String get medal_id_mindful_mover => 'Bilinçli Hareketçi';

  @override
  String get medal_sub_mindful_mover => 'Beden hatırlar.';

  @override
  String get medal_desc_mindful_mover =>
      'Bir hareket alışkanlığı ek (yoga/yürüyüş/koşu).';

  @override
  String get medal_id_devoted_keeper => 'Adanmış Bekçi';

  @override
  String get medal_sub_devoted_keeper => 'Altmış gün, bir uygulama.';

  @override
  String get medal_desc_devoted_keeper =>
      'Tek bir alışkanlığı aralıksız 60 gün sula.';

  @override
  String get medal_id_tending_notes => 'Bakım Notları';

  @override
  String get medal_sub_tending_notes => 'Yolculuk boyunca düşün.';

  @override
  String get medal_desc_tending_notes => '3 alışkanlığa bakım notları ekle.';

  @override
  String get medalTierTaglineSprout => 'İlk tohumu ek';

  @override
  String get medalTierTaglineCommon => 'Alışkanlığı inşa et';

  @override
  String get medalTierTaglineRare => 'Gerçek bir ivme göster';

  @override
  String get medalTierTaglineEpic => 'Sen bir doğa gücüsün';

  @override
  String get medalTierTaglineLegendary =>
      'Efsanevi, neredeyse kimse buraya ulaşamaz';

  @override
  String get guardianHeadlineNoTasks =>
      'Bugünün toprağı taze.\nİlk tohumunu ek\nve büyürken izle.';

  @override
  String get guardianHeadlineAllDone =>
      'Ektiğin her tohum\nççek açtı.\nDinlen, Koruyucu — hak ettin.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count gün\nkırılmadan büyüdü.\nOrmanın hayatla dolu.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Tam bir hafta çiçek açtı,\nKoruyucu.\nBir mükemmel gün daha\nzinciri uzatır.';

  @override
  String get guardianHeadlineStreak3 =>
      'Zincirin ayakta.\nHâlâ açılacak\ntohunlara bakım yap.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Görevleri iyi yönetiyorsun.\nBir filiz ek —\nalışkanlıklar ormanın nasıl büyüdüğünü belirler.';

  @override
  String get guardianHeadlineSomeDone =>
      'Bazı tohumlar açtı,\nbazı açmadı. Sorun değil.\nYarın yeni bir ekim günü.';

  @override
  String get guardianHeadlineMorning =>
      'Günaydın, Koruyucu.\nGün henüz genç\nve toprak hazır.';

  @override
  String get guardianHeadlineAfternoon =>
      'İyi günler, Koruyucu.\nIşığın yarısı kaldı —\nbakmaya devam et.';

  @override
  String get guardianHeadlineEvening =>
      'İyi akşamlar, Koruyucu.\nGüneş batmadan önce\nson bir tarama.';

  @override
  String get guardianHeadlineNight =>
      'Gece yarısında çalışıyor musun?\nKoruyucular bile dinlenir.\nYarının tohumunu şimdi ek.';

  @override
  String get guardianBodyNoTasks =>
      'Korunağın şu anda sessiz. Bir niyet ekle ve gün batımına kadar neyin değiştiğine bak.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count gündür devam ediyor. Zincir şans değil — biriken küçük seçimler. Biriktirmeye devam et.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return '$count günlük zincir gerçek bir ivme. Bugün açık tohumlarını bitirmeden bitirme.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Şimdiye kadar $count görev ekledin. Tek bir alışkanlık filizi eklemek, işin her gün birikmesini sağlar.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Ektiklerinin %$pct\'ini tamamlıyorsun. Daha az, daha keskin tohumlar genellikle on saçılımdan daha yüksek büyür.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Korunağın canlı. $tasks görev tamamlandı, $sprouts filiz büyüyor — emek meyvesini veriyor.';
  }

  @override
  String get guardianInsightWaitingTitle => 'İlk hamleni bekliyor';

  @override
  String get guardianInsightWaitingBody =>
      'Bir görev veya alışkanlık ekle, bahçendeki kalıpları okumaya başlayayım. Ne kadar çok ekersen, o kadar çok şey öğrenirim.';

  @override
  String get guardianInsightWaitingCta => 'İlk tohumunu ek';

  @override
  String get guardianInsightChainSuperTitle => 'Zincir süper gücün';

  @override
  String guardianInsightChainSuperBody(int count) {
    return '$count günlük bir zincirin var. Seriler her zaman motivasyonu yener — yavaş günlerde bile sıcak tut.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Yarının tohumunu ekle';

  @override
  String get guardianInsightChainColdTitle =>
      'Zincir soğuk — yeni bir tane başlat';

  @override
  String get guardianInsightChainColdBody =>
      'Daha önce ektin, bu tekrar ekebileceğin anlamına gelir. Bugün yapılan küçük bir görev, yarın daha uzun bir zincirdir.';

  @override
  String get guardianInsightChainColdCta => 'Bir tohum ek';

  @override
  String get guardianInsightLessIsMoreTitle => 'Bu hafta daha az daha fazla';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Ektiklerinin yaklaşık %$pct\'ini tamamlıyorsun. 5 gevşek niyet yerine 3 keskin niyet dene — kalite birikir.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Günü keskinleştir';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Sonraki madalya: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return '$target ${unit}ten $value\'indesin. Birkaç dürüst gün daha ve senin.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Madalyayı göster';

  @override
  String get guardianInsightSteadyTitle => 'Dengeli bir mevsimdesin';

  @override
  String get guardianInsightSteadyBody =>
      'Hemen köşede bir madalya yok — sorun değil. Sahip olduğuna bakım yap. Bir sonraki çiçek açma yolda.';

  @override
  String get guardianInsightSteadyCta => 'İlerlemeyi gör';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      'Zincirinde 1 görev kaldı. Gece yarısı geliyor.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return 'Zincirinde $count görev kaldı. Gece yarısı geliyor.';
  }

  @override
  String get notificationEveningBodyOne => 'Bugün hâlâ 1 açık görevin var.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Bugün hâlâ $count açık görevin var.';
  }

  @override
  String get notificationTickerTaskReminder => 'Görev hatırlatması';

  @override
  String get notificationTickerTaskAlarm => 'Görev alarmı';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count günlük seri · $element';
  }
}
