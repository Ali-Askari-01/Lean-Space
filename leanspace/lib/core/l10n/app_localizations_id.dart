// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

  @override
  String get tabToday => 'Hari Ini';

  @override
  String get tabProgress => 'Progres';

  @override
  String get tabYou => 'Anda';

  @override
  String get navMyDay => 'Hari Saya';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String get navHelp => 'Bantuan & Dukungan';

  @override
  String get navHistory => '7 Hari Terakhir';

  @override
  String get navLeftBehind => 'Tertinggal';

  @override
  String get navInsights => 'Progres Anda';

  @override
  String get navMedals => 'Medali Saya';

  @override
  String get navManagePro => 'Kelola langganan Pro';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Bekerja larut malam';

  @override
  String get greetingMorning => 'Selamat pagi, matahari!';

  @override
  String get greetingAfternoon => 'Selamat siang, teman';

  @override
  String get greetingEvening => 'Selamat sore, juara';

  @override
  String get greetingNight => 'Beristirahat dengan baik, penjaga?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Hari ini · $done dari $total tugas';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done dari $total kebiasaan';
  }

  @override
  String get todayChainGrows => 'RANTAI BERGROW SAAT ANDA MENYELESAIKAN';

  @override
  String get todayChainComplete => 'RANTAI SELESAI · RAWAT KEBUN BESOK';

  @override
  String get taskCapInfo => 'Mengapa ada batas 5 tugas?';

  @override
  String get taskCapDiscipline => 'DISIPLIN-ORIENTED SEJAK AWAL';

  @override
  String get taskCapTitle =>
      'Kami membatasi hari Anda hingga 5 tugas secara sengaja.';

  @override
  String get taskCapBody =>
      'Rantai kecil lebih baik dari yang panjang. Anda lebih mungkin menyelesaikan 3 dari 5 dan merasakan kemenangan daripada meninggalkan 8 dari 10 dan merasakan kekalahan.';

  @override
  String get taskCapBulletDone => 'Tugas selesai dihitung ke dalam rantai Anda';

  @override
  String get taskCapBulletDoneBody =>
      'Hari di mana semua 5 tugas selesai memperpanjang rantai Anda satu hari.';

  @override
  String get taskCapBulletMissed => 'Tugas yang terlewat masuk ke Tertinggal';

  @override
  String get taskCapBulletMissedBody =>
      'Pada tengah malam, tugas yang belum selesai muncul di Tertinggal. Tambahkan kembali hanya yang masih penting.';

  @override
  String get taskCapBulletFreeze =>
      'Pembekuan rantai memaafkan satu hari terlewat';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro memberi Anda 2 pembekuan rantai per bulan — mereka menutupi hari yang terlewat sehingga rantai Anda bertahan.';

  @override
  String get tasksHeader => 'Tugas';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Tambah benih tugas';

  @override
  String get tasksCapReached =>
      '5/5 slot terpakai — selesaikan satu untuk menanam benih baru.';

  @override
  String get tasksEmptyCta =>
      'Tanam benih pertama Anda — apa yang penting hari ini?';

  @override
  String get habitsHeader => 'Kebiasaan';

  @override
  String habitsGrowing(String count) {
    return '$count sedang tumbuh';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Terbaik $days h';
  }

  @override
  String get habitsPlantNew => 'Tanam tunas kebiasaan baru';

  @override
  String get habitsPlantFirst => 'Tanam kebiasaan';

  @override
  String get habitsLocked =>
      'Slot kebiasaan Pro — buka kunci untuk menanam lebih banyak tunas';

  @override
  String get habitsSlotsFull => 'Semua slot kebiasaan sedang penuh.';

  @override
  String habitsStreakDays(String days) {
    return '${days}h';
  }

  @override
  String get habitsCadence => 'HARIAN';

  @override
  String leftBehindBanner(String count) {
    return '$count terlewat — masih di Tertinggal';
  }

  @override
  String get leftBehindTap => 'Ketuk untuk menambahkan kembali atau lepaskan';

  @override
  String get leftBehindDismiss => 'Abaikan';

  @override
  String get leftBehindTitle => 'Tertinggal';

  @override
  String get leftBehindEmpty => 'Tidak ada yang tertinggal';

  @override
  String get leftBehindEmptyBody =>
      'Tidak ada tugas yang terlewat. Setiap benih yang Anda tanam sedang dirawat. Kebun bersih.';

  @override
  String get leftBehindClearAll => 'Hapus semua';

  @override
  String get leftBehindClearAllConfirm => 'Hapus semua yang tertinggal?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Ini akan menghapus $count tugas yang terlewat secara permanen. Anda tidak dapat membatalkan ini.';
  }

  @override
  String get leftBehindReAdd => 'Tambahkan kembali hari ini';

  @override
  String get leftBehindReAddButton => 'Tambahkan kembali';

  @override
  String get leftBehindAddedToToday => 'Ditambahkan ke hari ini';

  @override
  String get leftBehindLetGo => 'Lepaskan';

  @override
  String get leftBehindHeader => 'TERTINGGAL';

  @override
  String get leftBehindMissedTasks => 'TUGAS YANG TERLEWAT';

  @override
  String get leftBehindWaitingOne => '1 tugas menunggu Anda.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count tugas menunggu Anda.';
  }

  @override
  String get leftBehindBody =>
      'Tambahkan kembali tugas untuk membawanya ke hari ini, atau lepaskan. Menambahkan kembali menjaga rantai Anda tetap hidup.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" kembali ke hari Anda.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'Menghapus \"$task\"';
  }

  @override
  String get leftBehindClearedSnack => 'Yang tertinggal dihapus';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Kemarin · $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count tugas tersisa untuk hari ini';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Panggilan terakhir — $count tugas masih terbuka';
  }

  @override
  String get streakAtRiskBody =>
      'Tengah malam sudah dekat. Rantai bergantung pada ini.';

  @override
  String get streakAtRiskBodyLow =>
      'Anda masih punya waktu. Hari yang bersih memperpanjang rantai Anda.';

  @override
  String get streakAtRiskFreeze =>
      'Kemarin terlewat — gunakan pembekuan rantai?';

  @override
  String get streakFreezeUse => 'Gunakan pembekuan';

  @override
  String get streakFreezeUseForYesterday =>
      'Gunakan pembekuan rantai bulanan untuk kemarin';

  @override
  String get streakFreezeAppliedYesterday =>
      'Pembekuan rantai diterapkan untuk kemarin.';

  @override
  String get chainBrokenTitle => 'Rantai putus. Itu tidak apa-apa.';

  @override
  String get chainBrokenBody =>
      'Setiap rantai panjang berakhir sekali. Yang penting adalah apa yang Anda tanam hari ini. Satu hari sempurna memulai yang berikutnya.';

  @override
  String get chainBrokenCta => 'Kembali ke hari ini';

  @override
  String get chainBrokenPlantFirst => 'Tanam benih pertama hari ini';

  @override
  String get chainBrokenCheck => 'Periksa Tertinggal terlebih dahulu';

  @override
  String get chainBrokenBestChain => 'rantai terbaik';

  @override
  String get chainBrokenTasksDone => 'tugas selesai';

  @override
  String get chainBrokenSprouts => 'tunas';

  @override
  String get chainRecoveryFreshStart => 'Mulai baru';

  @override
  String get medalsTitle => 'Medali Saya';

  @override
  String get medalsTrophyRoom => 'Ruang Trofi';

  @override
  String get medalsAllMedals => 'Semua Medali';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned dari $total medali diraih';
  }

  @override
  String get medalsTrophyEmpty =>
      'Lencana pertama Anda tinggal satu tugas lagi';

  @override
  String get medalsTrophyFirst =>
      'Anda meraih medali pertama — terus lanjutkan';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned medali di ruang trofi Anda';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'Progres menuju $total medali';
  }

  @override
  String get medalsShareCta => 'Buat kartu yang bisa dibagikan';

  @override
  String get medalsEmptyTitle => 'Belum ada di kategori ini';

  @override
  String get medalsEmptyBody =>
      'Selesaikan tugas atau rawat tunas untuk memulai ruang trofi Anda.';

  @override
  String get medalSheetLocked => 'MEDALI PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'DIRAIH · $tier';
  }

  @override
  String get medalSheetUnlock => 'Buka dengan Pro';

  @override
  String get medalSheetProgress => 'Progres';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Hanya $n $unit lagi untuk membuka.';
  }

  @override
  String get medalSheetAlmost => 'Satu langkah lagi untuk membuka.';

  @override
  String get medalCategory => 'Kategori';

  @override
  String get medalShareOnSocials => 'Bagikan ke media sosial';

  @override
  String get medalShareLater => 'Nanti saja';

  @override
  String get medalUnlocked => 'MEDALI TERBUKA';

  @override
  String get medalProgressTitle => 'Progres';

  @override
  String get historyTitle => '7 Hari Terakhir';

  @override
  String get historyFullTitle => 'Riwayat lengkap';

  @override
  String get historyLoadError => 'Tidak dapat memuat riwayat.';

  @override
  String get historyFullCalendar => 'Kalender lengkap';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% selesai';
  }

  @override
  String historyThisWeek(String days) {
    return '$days HARI TERAKHIR';
  }

  @override
  String get historyDayByDay => 'HARI PER HARI';

  @override
  String get historyEmpty =>
      'Tanam beberapa benih untuk melihat minggu Anda terungkap.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Anda menyelesaikan $done dari $total tugas. $perfect hari sempurna.';
  }

  @override
  String get historyUpsellTitle => 'Lihat riwayat lengkap';

  @override
  String get historyUpsellBody =>
      'Pro membuka 30 hari riwayat. Gratis menampilkan 7 hari.';

  @override
  String get historyPerfect => 'SEMPURNA';

  @override
  String get historyFrozen => 'BEKU';

  @override
  String get historyToday => 'Hari Ini';

  @override
  String get historyEmptyDay => 'Tidak ada benih yang ditanam hari itu';

  @override
  String historyLeftBehindCount(String count) {
    return '$count tertinggal';
  }

  @override
  String get progressVitality => 'VITALITAS HARI INI';

  @override
  String get progressVitalityEmpty => 'Tanam benih untuk memulai kebun Anda.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done dari $total benih ditanam hari ini.';
  }

  @override
  String progressChainPill(String days) {
    return 'rantai ${days}h';
  }

  @override
  String get progressMetricCurrent => 'Saat ini';

  @override
  String get progressMetricBest => 'Terbaik';

  @override
  String get progressMetricDone => 'Selesai';

  @override
  String get progressMetricPerfect => 'Sempurna';

  @override
  String get progressMetricHabits => 'Kebiasaan';

  @override
  String get progressHabitBlooms => 'Mekar kebiasaan';

  @override
  String get progressHabitBloomsSub =>
      'Tonggak rantai untuk tunas yang Anda sirami setiap hari.';

  @override
  String get progressNextBadge => 'Lencana berikutnya';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned dari $total';
  }

  @override
  String get progressPersonalActivity => 'Aktivitas Pribadi';

  @override
  String progressBrowseMonth(String month) {
    return 'Menjelajahi $month. Ketuk \"Hari Ini\" untuk kembali ke aktivitas terkini.';
  }

  @override
  String get progressJumpToToday => 'Hari Ini';

  @override
  String get progressCalendarLegend => 'lebih gelap = lebih banyak selesai';

  @override
  String get progressCalendarBody =>
      'Hijau tua berarti hari sempurna. Warna memudar saat Anda melewatkan hari.';

  @override
  String get paywallTitle => 'Pertahankan rantai tetap utuh.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro memberikan Anda sistem disiplin lengkap.';

  @override
  String get paywallFeatures =>
      'Semua 5 slot kebiasaan, bukan hanya 3|Riwayat lengkap Anda, selamanya|Set medali lengkap|Pembekuan rantai setiap bulan|Resi mingguan + kartu bagikan|Tema + lainnya';

  @override
  String get paywallFeaturesBodies =>
      'Gratis memberi Anda 3. Pro membuka semua lima sehingga ritual harian Anda bisa hidup di sini.|Jelajahi setiap hari yang telah Anda selesaikan — bukan hanya 7 hari terakhir. Lihat ke belakang bertahun-tahun, bukan minggu.|Buka kunci medali tier Legendaris. Lencana paling langka adalah untuk orang-orang yang benar-benar berkommitmen.|2 pembekuan rantai per bulan sehingga satu hari buruk tidak mengakhiri rantai Anda.|Kartu bagikan mingguan yang indah. Posting rantai Anda, inspirasi orang lain untuk memulai.|Buka kunci warna aksen dan tema baru saat kami menambahkannya. Selalu pembaruan gratis.';

  @override
  String get paywallYearly => 'Tahunan';

  @override
  String get paywallYearlyCaption =>
      'Nilai terbaik · setara dengan ~2.50 USD/bulan';

  @override
  String get paywallYearlyBadge => 'HEMAT 35%';

  @override
  String get paywallMonthly => 'Bulanan';

  @override
  String get paywallMonthlyCaption =>
      'Ditagih setiap bulan · batalkan kapan saja';

  @override
  String paywallStartCta(String price) {
    return 'Mulai Pro · $price/thn';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Mulai Pro · $price/bln';
  }

  @override
  String get paywallRestore => 'Pulihkan pembelian';

  @override
  String get paywallTerms => 'Ketentuan';

  @override
  String get paywallPrivacy => 'Privasi';

  @override
  String get paywallNoRestore =>
      'Tidak ada pembelian sebelumnya yang ditemukan di akun ini.';

  @override
  String get paywallRestoreLater =>
      'Kami akan memulihkan pembelian Anda pada sinkronisasi berikutnya.';

  @override
  String get paywallAlreadyPro =>
      'Anda sudah menggunakan Pro. Terima kasih atas dukungannya.';

  @override
  String get paywallHabitSlotHead =>
      'Anda telah menggunakan semua slot kebiasaan gratis Anda. Buka kunci set lengkap untuk menanam semua ritual yang Anda pedulikan.';

  @override
  String get paywallHistoryHead =>
      'Lihat riwayat lengkap Anda — setiap hari sempurna, setiap medali, setiap kebangkitan.';

  @override
  String get paywallMedalHead =>
      'Medali paling langka hanya untuk Pro. Terus lanjutkan — mereka lebih dekat dari yang Anda kira.';

  @override
  String get settingsYourActivity => 'AKTIVITAS ANDA';

  @override
  String get settingsHelpInfo => 'BANTUAN & INFO';

  @override
  String get settingsAccount => 'AKUN';

  @override
  String get settingsNurturingTools => 'ALAT PEMELIHARAAN';

  @override
  String get settingsReminders => 'PENGINGAT';

  @override
  String get settingsWidgetSanctuary => 'SUCCI WIDGET';

  @override
  String get settingsEcosystemSupport => 'DUKUNGAN EKOSISTEM';

  @override
  String get settingsHowItWorks => 'Cara kerjanya';

  @override
  String get settingsSignOut => 'Keluar';

  @override
  String get settingsSignOutConfirm => 'Apakah Anda yakin ingin keluar?';

  @override
  String get settingsProActive => 'Aktif';

  @override
  String get settingsProFree => 'Tier gratis';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get settingsLanguageValue => 'Default sistem';

  @override
  String get firstRunGreeting => '5 tugas. Tidak lebih. Buatlah berarti.';

  @override
  String get firstRunBody =>
      'Tanam benih pertama Anda — apa yang paling penting hari ini?';

  @override
  String get firstRunCta => 'Tanam benih pertama Anda';

  @override
  String get emptyStateClearAll => 'Hapus semua';

  @override
  String get cancel => 'Batal';

  @override
  String get intentionTitle1 => 'Yuk tanam niat baru!';

  @override
  String get intentionBody1 =>
      'Setiap hutan yang megah dimulai dari satu pilihan kecil. Ceritakan apa yang kita rawat hari ini?';

  @override
  String get intentionTitle2 => 'Apa yang ingin kita tumbuhkan hari ini?';

  @override
  String get intentionBody2 =>
      'Benih kecil, dirawat dengan penuh kasih, menjadi pohon yang tinggi. Pilih yang paling penting saat ini.';

  @override
  String get intentionTitle3 => 'Satu benih. Satu tarikan napas. Mulai.';

  @override
  String get intentionBody3 =>
      'Anda tidak harus menanam seluruh hutan sekaligus — cukup hal yang benar berikutnya.';

  @override
  String get intentionTitle4 => 'Rawat langkah kecil berikutnya.';

  @override
  String get intentionBody4 =>
      'Diri Anda di masa depan dibangun dari pilihan yang Anda buat dalam lima menit ke depan. Apa satu kebaikan yang bisa Anda lakukan?';

  @override
  String get intentionTitle5 => 'Pilih apa yang ingin Anda jadikan.';

  @override
  String get intentionBody5 =>
      'Tugas adalah benih, kebiasaan adalah tunas. Bersama-sama mereka membentuk hutan yang Anda banggakan.';

  @override
  String get intentionTitle6 => 'Tanam sesuatu yang layak dikenang.';

  @override
  String get intentionBody6 =>
      'Tidak setiap hari akan terasa luar biasa. Benih yang disiram tetap dihitung. Yuk namai satu.';

  @override
  String get intentionTitle7 => 'Buat hari ini sedikit lebih berani.';

  @override
  String get intentionBody7 =>
      'Keberanian berlipat ganda. Pilih benih yang telah Anda tunda — bahkan memberi nama sudah membuatnya maju.';

  @override
  String get intentionTitle8 => 'Rawat tanah sebelum benih.';

  @override
  String get intentionBody8 =>
      'Pola pikir, alat, atau ritual kecil apa yang akan membuat tugas ini lebih mudah? Tambahkan ke catatan.';

  @override
  String get shareCardSnapshot => 'Sekilas tentang tempat perlindungan Anda';

  @override
  String get shareCardBody =>
      'Kartu di atas diekspor sebagai PNG dan dikirim ke lembar bagikan Anda. Posting di cerita Anda, kirim ke teman, atau cetak sebagai stiker.';

  @override
  String get shareCardShareMyBloom => 'Bagikan mekaran saya';

  @override
  String get shareCardCouldNotShare => 'Tidak dapat berbagi saat ini';

  @override
  String shareCardProgressText(String year) {
    return 'Progres Daily Stitch saya — $year di Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Saya baru saja membuka medali \"$title\" di Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Cara kerjanya';

  @override
  String get howItWorksBody =>
      'Daily Stitch membantu Anda mempertahankan rantai disiplin yang kecil dan tak terputus. Itu saja.';

  @override
  String get howItWorksToday => 'Tab Hari Ini';

  @override
  String get howItWorksTodayBody =>
      'Ini adalah rumah Anda. Menampilkan 5 tugas dan kebiasaan yang Anda tetapkan untuk hari ini. Selesaikan sebelum tengah malam, rantai akan memanjang.';

  @override
  String get howItWorksCap => 'Batas 5 tugas adalah fitur utama';

  @override
  String get howItWorksCapBody =>
      'Kami tidak membiarkan Anda menambahkan tugas ke-6. Itu intinya. Rantai kecil lebih baik dari yang panjang. Ketuk \"?\" di layar utama untuk penjelasan lengkap.';

  @override
  String get howItWorksHabits =>
      'Kebiasaan bersifat harian, rantai bersifat selamanya';

  @override
  String get howItWorksHabitsBody =>
      'Kebiasaan (Yoga pagi, Minum air) hidup selamanya. Tugas bersifat satu kali. Keduanya memberi makan rantai yang sama.';

  @override
  String get howItWorksLeftBehind => 'Tugas terlewat → Tertinggal';

  @override
  String get howItWorksLeftBehindBody =>
      'Pada tengah malam, tugas yang belum selesai pindah ke Tertinggal. Tambahkan kembali hanya yang masih penting. Sisanya dilepaskan dengan tenang.';

  @override
  String get howItWorksProgress => 'Tab Progres';

  @override
  String get howItWorksProgressBody =>
      'Rantai, kalender, medali, riwayat — semuanya tentang bagaimana Anda berkembang dari waktu ke waktu. Tidak ada yang mendesak di sini.';

  @override
  String get howItWorksYou => 'Tab Anda';

  @override
  String get howItWorksYouBody => 'Akun Anda, pengaturan, keluar. Itu saja.';

  @override
  String get howItWorksRule =>
      'Aturannya: 5 hal kecil, setiap hari, tanpa alasan.';

  @override
  String get commonRetry => 'Coba lagi';

  @override
  String get commonBack => 'Kembali';

  @override
  String get commonDismiss => 'Abaikan';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonClose => 'Tutup';

  @override
  String get commonSend => 'Kirim';

  @override
  String get commonCopy => 'Salin';

  @override
  String get commonShowLess => 'Tampilkan lebih sedikit';

  @override
  String get commonViewFull => 'Lihat catatan lengkap';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonDelete => 'Hapus';

  @override
  String get commonDone => 'Selesai';

  @override
  String get commonError => 'Terjadi kesalahan';

  @override
  String get commonPageNotFound => 'Halaman Tidak Ditemukan';

  @override
  String get commonHome => 'Beranda';

  @override
  String get commonUnknownError => 'Kesalahan routing tidak dikenal';

  @override
  String get commonSettingsTooltip => 'Pengaturan';

  @override
  String get commonHowThisWorks => 'Cara kerjanya';

  @override
  String get myDayReminderSet => 'Pengingat ditetapkan';

  @override
  String get myDayPreparationNotes => 'CATATAN PERSIAPAN';

  @override
  String get onboardingSkip => 'LEWATI';

  @override
  String get onboardingNext => 'Berikutnya';

  @override
  String get onboardingEnterSanctuary => 'Masuk ke Tempat Perlindungan';

  @override
  String get onboardingIntroduction => 'PENDAHULUAN';

  @override
  String get onboardingGrowYourForest => 'TUMBUHKAN HUTAN ANDA';

  @override
  String get onboardingPage1Title => 'Kenali Penjaga Anda.';

  @override
  String get onboardingPage1Body =>
      'Selamat datang di Tempat Perlindungan Pribadi Anda. Di sini, pertumbuhan Anda tercermin dalam kehidupan hutan Anda.';

  @override
  String get onboardingPage2Title => 'Tanam benih. Saksikan mereka tumbuh.';

  @override
  String get onboardingPage2Body =>
      'Setiap tugas adalah benih kecil. Setiap kebiasaan adalah tunas yang Anda rawat setiap hari. Bersama-sama mereka membentuk hutan disiplin.';

  @override
  String get onboardingPage3Title => 'Lima tugas. Satu rantai.';

  @override
  String get onboardingPage3Body =>
      'Anda hanya bisa menanam 5 benih per hari. Batas itu memaksa Anda untuk fokus pada yang benar-benar penting — dan melindungi rantai Anda.';

  @override
  String get onboardingPage4Title => 'Rawat tunas Anda setiap hari.';

  @override
  String get onboardingPage4Body =>
      'Ketuk kebiasaan untuk menumbuhkannya. Lewati satu hari dan rantai tidak akan memanjang. Penjaga tumbuh bersama Anda.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Tanam benih pertama Anda.';

  @override
  String get authWelcomeBack => 'Selamat datang kembali, Penjaga.';

  @override
  String get authFiveTasksDaily =>
      'Lima tugas. Kebiasaan harian. Tanpa alasan.';

  @override
  String get authSanctuaryWaiting => 'Tempat perlindungan Anda menunggu.';

  @override
  String get authSignIn => 'Masuk';

  @override
  String get authSignUp => 'Daftar';

  @override
  String get authEmail => 'EMAIL';

  @override
  String get authPassword => 'KATA SANDI';

  @override
  String get authEmailHint => 'anda@email.com';

  @override
  String get authCreateAccount => 'Buat akun';

  @override
  String get authSignInCta => 'Masuk';

  @override
  String get authOrContinueWith => 'atau lanjutkan dengan';

  @override
  String get authContinueWithGoogle => 'Lanjutkan dengan Google';

  @override
  String get authEnterEmail => 'Masukkan email Anda';

  @override
  String get authEnterValidEmail => 'Masukkan alamat email yang valid';

  @override
  String get authPasswordTooShort => 'Kata sandi harus minimal 6 karakter';

  @override
  String get authAccountCreated =>
      'Akun dibuat. Beralih ke Masuk dan gunakan kata sandi Anda.';

  @override
  String get authSomethingWentWrong => 'Terjadi kesalahan. Coba lagi.';

  @override
  String get authCouldNotStartGoogle => 'Tidak dapat memulai masuk Google.';

  @override
  String get authMidnightReset =>
      'Dengan masuk, Anda menerima bahwa hari Anda direset pada tengah malam.';

  @override
  String get authSetupRequired => 'Pengaturan diperlukan';

  @override
  String get settingsPersonalSanctuary => 'TEMPAT PERLINDUNGAN PRIBADI';

  @override
  String get settingsHowThisWorks => 'Cara kerjanya';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Apa itu aplikasi, bagaimana batas dan rantai bekerja';

  @override
  String get settingsStreakProtection => 'Perlindungan Rantai';

  @override
  String get settingsStreakProtectionAvailable =>
      '1 pembekuan tersedia bulan ini';

  @override
  String get settingsStreakProtectionUsed => 'Digunakan untuk bulan ini';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Kelola langganan Pro';

  @override
  String get settingsProCancelPlay => 'Batalkan atau ubah paket di Google Play';

  @override
  String get settingsProUnlock =>
      'Buka semua 5 kebiasaan, riwayat lengkap, lainnya';

  @override
  String get settingsTaskAlarms => 'Alarm tugas & Panggilan Terakhir';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Dorongan malam dan peringatan tengah malam';

  @override
  String get settingsHomeScreenWidget => 'Widget layar beranda';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Tambahkan rantai Anda ke layar beranda';

  @override
  String get settingsShareBloomTracker => 'Bagikan Daily Stitch';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Ceritakan tentang rantai kepada teman';

  @override
  String get settingsHelpSupport => 'Bantuan & Dukungan';

  @override
  String get settingsHelpSupportSubtitle => 'FAQ atau laporkan masalah';

  @override
  String get settingsSignOutTile => 'Keluar';

  @override
  String get settingsAllFeaturesUnlocked => 'Semua fitur terbuka';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Versi beta — langganan dijeda saat kami menguji segalanya.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'Versi $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Versi 1.0.0';

  @override
  String get settingsHabitMaster => 'Master Kebiasaan';

  @override
  String settingsLevel(Object level) {
    return 'Level $level · Master Kebiasaan';
  }

  @override
  String get languagePickerTitle => 'Bahasa';

  @override
  String get youLast7Days => '7 hari terakhir';

  @override
  String get youLast7DaysSubtitle => 'Riwayat tugas hari demi hari';

  @override
  String get youLeftBehindSubtitle =>
      'Tugas yang terlewat menunggu untuk ditambahkan kembali';

  @override
  String get youProTier => 'Tier Pro';

  @override
  String get youFreeTier => 'Tier gratis';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Gratis';

  @override
  String youLevelLabel(Object level) {
    return 'Level $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'Terbaik $days h';
  }

  @override
  String get youPlantHabit => 'Tanam kebiasaan untuk memulai rantai.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline => 'Buka kunci sistem disiplin lengkap.';

  @override
  String get youProFeatures =>
      '5 slot kebiasaan, riwayat lengkap, medali legendaris, pembekuan rantai bulanan, kartu bagikan mingguan.';

  @override
  String get youSeePlans => 'Lihat paket';

  @override
  String youFromPrice(Object price) {
    return 'dari $price/bln';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch · Kebiasaan & To-Do';

  @override
  String get progressMedals => 'Medali';

  @override
  String get progressLast7Days => '7 hari terakhir';

  @override
  String get progressSeeAll => 'Lihat semua';

  @override
  String get progressSeeDayByDayActivity =>
      'Lihat aktivitas hari demi hari Anda';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done dari $total tugas selesai · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Belum ada medali — selesaikan tugas atau rawat tunas untuk memulai.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Lihat semua medali · $earned dari $total diraih';
  }

  @override
  String get progressGuardianInsight => 'Wawasan Penjaga';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'LENCANA BERIKUTNYA · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return 'Target $days hari';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Bantuan & Dukungan';

  @override
  String get helpBody =>
      'Kebanyakan jawaban ada di bawah. Jika tidak, kirimkan catatan kepada kami dan kami biasanya membalas dalam 2–3 hari.';

  @override
  String get helpSectionFAQ => 'PERTANYAAN UMUM';

  @override
  String get helpSectionContact => 'MASIH BINGUNG?';

  @override
  String get helpAddMessage => 'Tambahkan pesan singkat terlebih dahulu.';

  @override
  String get helpOpening => 'Membuka aplikasi email Anda…';

  @override
  String get helpEmailUs => 'Email kami';

  @override
  String get helpOpeningAction => 'Membuka…';

  @override
  String get helpCopyEmail => 'Salin email dukungan';

  @override
  String get helpCopiedEmail => 'Menyalin support@dailystitch.app';

  @override
  String get helpNoMailApp =>
      'Tidak ditemukan aplikasi email. Email kami di support@dailystitch.app.';

  @override
  String get helpTopicLabel => 'Topik';

  @override
  String get helpWhatHappened => 'Apa yang terjadi?';

  @override
  String get helpHint => 'Deskripsi singkat sangat membantu…';

  @override
  String get helpDisclaimer =>
      'Mengetuk \"Email kami\" membuka aplikasi email Anda dengan pesan yang sudah diisi (tidak ada data yang keluar dari perangkat Anda sampai Anda mengirim).';

  @override
  String get helpFaqQ1 => 'Apa itu batas 5 tugas?';

  @override
  String get helpFaqA1 =>
      'Anda dapat menambahkan hingga 5 tugas per hari lokal. Tugas ke-6 diblokir secara sengaja — disiplin mengalahkan beban berlebih. Batas itu adalah fitur, bukan keterbatasan.';

  @override
  String get helpFaqQ2 => 'Apa yang terjadi pada tengah malam?';

  @override
  String get helpFaqA2 =>
      'Pada tengah malam lokal Anda, setiap tugas yang masih ditandai terbuka diberi cap \"terlewat\" dan pindah ke Tertinggal. Rantai kebiasaan direset jika kebiasaan tidak diselesaikan hari sebelumnya.';

  @override
  String get helpFaqQ3 => 'Apa itu Tertinggal?';

  @override
  String get helpFaqA3 =>
      'Daftar yang lembut dan dapat ditutup dari tugas yang tidak Anda selesaikan. Buka, tambahkan kembali hanya yang masih penting, dan lepaskan sisanya. Tier gratis melihat 7 hari terakhir; Pro melihat riwayat lengkap.';

  @override
  String get helpFaqQ4 => 'Bagaimana rantai bekerja?';

  @override
  String get helpFaqA4 =>
      'Satu hari memperpanjang rantai ketika Anda memiliki setidaknya 1 tugas dan 0 yang terlewat. Hari dengan nol tugas tidak memperpanjang atau memutus rantai. Pembekuan rantai memaafkan satu hari terlewat per bulan.';

  @override
  String get helpFaqQ5 => 'Apa itu pembekuan rantai?';

  @override
  String get helpFaqA5 =>
      'Satu \"pembekuan\" per bulan kalender, hanya untuk Pro. Gunakan pada hari yang Anda lewatkan untuk menjaga rantai Anda tetap hidup. Temukan di tab Progres.';

  @override
  String get helpFaqQ6 => 'Di mana data saya disimpan?';

  @override
  String get helpFaqA6 =>
      'Semua data tersimpan di Supabase (Postgres) di bawah akun yang masuk. Kami tidak pernah menjual atau membaginya. Lihat kebijakan privasi yang tertaut di daftar Play Store untuk detail lengkap.';

  @override
  String get helpFaqQ7 => 'Bagaimana cara menghapus akun saya?';

  @override
  String get helpFaqA7 =>
      'Buka Pengaturan → Akun → Hapus akun. Ini menghapus profil, tugas, kebiasaan, dan data langganan Anda secara permanen. Langganan Play yang aktif harus dibatalkan secara terpisah di Google Play.';

  @override
  String get helpTopicsGeneral => 'Pertanyaan umum';

  @override
  String get helpTopicsBug => 'Laporan bug';

  @override
  String get helpTopicsStreak => 'Masalah rantai / bergulir';

  @override
  String get helpTopicsBilling => 'Penagihan atau tier Pro';

  @override
  String get helpTopicsAccount => 'Akun & data';

  @override
  String get helpTopicsFeature => 'Permintaan fitur';

  @override
  String get helpAccountAnon => '(belum masuk)';

  @override
  String get splashTagline => 'Rawat benih kecil. Tumbuhkan hutan.';

  @override
  String get priorityStandard => 'STANDARD';

  @override
  String get priorityVital => 'VITAL';

  @override
  String get prioritySpark => 'SPARK';

  @override
  String get settingsDeleteAccount => 'Hapus akun';

  @override
  String get settingsDeleteAccountSubtitle => 'Hapus data Anda secara permanen';

  @override
  String get settingsDeleteAccountConfirmTitle => 'Hapus akun Anda?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Ini menghapus profil, tugas, kebiasaan, dan progres Anda secara permanen. Langganan aktif harus dibatalkan di Google Play secara terpisah. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Hapus selamanya';

  @override
  String get settingsDeleteAccountSuccess => 'Akun Anda telah dihapus.';

  @override
  String get settingsDeleteAccountFailed =>
      'Tidak dapat menghapus akun. Coba lagi atau email support@dailystitch.app.';

  @override
  String get referralYouTitle => 'Undang teman · dapatkan Pro gratis';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress dari $milestone teman bergabung';
  }

  @override
  String get referralYouShare => 'Bagikan undangan';

  @override
  String get referralYouDetails => 'Lihat detail';

  @override
  String get referralPaywallTitle => 'Bulan Pro gratis';

  @override
  String get referralPaywallBody =>
      'Undang 5 teman yang mendaftar → 1 bulan Pro gratis';

  @override
  String get referralPaywallProBody =>
      'Terus mengundang — kumpulkan bulan Pro gratis';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'Tidak dapat memuat progres Anda. Coba lagi nanti.';

  @override
  String get insightsMetricCurrentChain => 'RANTAI SAAT INI';

  @override
  String get insightsMetricBestEver => 'TERBAIK SEPANJANG MASA';

  @override
  String get insightsMetricTasksDone => 'TUGAS SELESAI';

  @override
  String get insightsMetricPerfectDays => 'HARI SEMPURNA';

  @override
  String get insightsMetricHabits => 'KEBIASAAN';

  @override
  String get insightsDay => 'hari';

  @override
  String get insightsDays => 'hari';

  @override
  String get insightsSectionThisWeek => 'Minggu ini';

  @override
  String get insightsShareMyWeek => 'Bagikan minggu saya';

  @override
  String get insightsShareMyWeekPro => 'Bagikan minggu saya · Pro';

  @override
  String get insightsShareReceiptText =>
      'Minggu saya di Daily Stitch. Jangan putus rantainya.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Menampilkan $days hari terakhir';
  }

  @override
  String get insightsHistoryUpsell => 'Buka riwayat lengkap dengan Pro';

  @override
  String get referralScreenTitle => 'Undang teman';

  @override
  String get referralLaunchGift => 'Hadiah bulan peluncuran';

  @override
  String get referralRewardTitle => 'Dapatkan 1 bulan Pro gratis';

  @override
  String get referralRewardBody =>
      'Bagikan kode Anda kepada teman. Ketika 5 orang mendaftar menggunakan kode Anda, Anda membuka Daily Stitch Pro selama satu bulan penuh.';

  @override
  String get referralYourCode => 'Kode referral Anda';

  @override
  String get referralCopyCodeTooltip => 'Salin kode';

  @override
  String get referralCodeCopied => 'Kode referral disalin';

  @override
  String get referralShareWithFriends => 'Bagikan dengan teman';

  @override
  String get referralFooterHint =>
      'Teman memasukkan kode Anda saat membuat akun. Setiap teman dihitung satu kali untuk hadiah Anda.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count teman bergabung';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count teman bergabung';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'Anda telah mendapatkan $count bulan Pro gratis.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'Anda telah mendapatkan $count bulan Pro gratis.';
  }

  @override
  String get referralRewardUnlocked =>
      'Hadiah terbuka — nikmati bulan Pro gratis Anda!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining lagi untuk membuka bulan gratis Anda';
  }

  @override
  String youProMemberSince(String month) {
    return 'Anggota Pro sejak $month';
  }

  @override
  String get youProPerksTitle => 'Keistimewaan Pro Anda';

  @override
  String get manageProThankYou => 'Terima kasih telah mendukung Bloom';

  @override
  String get manageProReferralHint =>
      'Undang lebih banyak teman untuk memperpanjang Pro Anda';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nTambahkan SUPABASE_URL dan SUPABASE_PUBLISHABLE_KEY (atau SUPABASE_ANON_KEY lama) ke leanspace/.env, lalu bangun ulang:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Default sistem';

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
  String get onboardingLanguageTitle => 'Pilih bahasa Anda';

  @override
  String get onboardingLanguageBody =>
      'Pilih bahasa yang ingin Anda gunakan di Daily Stitch. Anda dapat mengubahnya kapan saja di Pengaturan.';

  @override
  String get onboardingLanguageContinue => 'Lanjutkan';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Teman';

  @override
  String get settingsAppTheme => 'Tema Aplikasi';

  @override
  String get settingsAppThemeSubtitle =>
      'Pilih warna tempat perlindungan pribadi Anda';

  @override
  String get settingsInviteFriendsTitle => 'Undang teman · Pro Gratis';

  @override
  String get settingsInviteFriendsSubtitle =>
      'Dapatkan 1 bulan gratis saat 5 teman bergabung';

  @override
  String get themePickerTitle => 'Tempat Perlindungan Pribadi';

  @override
  String get themePickerSubtitle => 'Pilih palet warna yang membawa kedamaian.';

  @override
  String get themeNameClassicBloom => 'Bloom Klasik';

  @override
  String get themeNameSolarTerracotta => 'Terracotta Surya';

  @override
  String get themeNameMidnightOasis => 'Oasis Tengah Malam';

  @override
  String get themeNameLavenderDream => 'Impian Lavender';

  @override
  String get themeNameNordicFrost => 'Embun Nordik';

  @override
  String get themeNameCyberpunkNeon => 'Neon Cyberpunk';

  @override
  String get reminderTitle => 'Pengingat';

  @override
  String get reminderBody =>
      'Panggilan Terakhir memberi tahu Anda sebelum tengah malam jika tugas masih terbuka.';

  @override
  String get reminderFinalCall => 'Panggilan Terakhir';

  @override
  String get reminderEveningNudge => 'Dorongan malam';

  @override
  String get reminderChangeTime => 'Ubah waktu';

  @override
  String get reminderSave => 'Simpan pengingat';

  @override
  String get notificationChannelReminders => 'Pengingat Daily Stitch';

  @override
  String get notificationChannelRemindersDesc =>
      'Dorongan malam dan pengingat Panggilan Terakhir';

  @override
  String get notificationChannelAlarms => 'Alarm tugas Daily Stitch';

  @override
  String get notificationChannelAlarmsDesc =>
      'Alarm keras untuk pengingat tugas';

  @override
  String get notificationTaskReminderTitle => 'Pengingat tugas';

  @override
  String get notificationFinalCallTitle => 'Panggilan Terakhir';

  @override
  String notificationFinalCallBody(int count) {
    return 'Anda masih memiliki $count tugas terbuka hari ini.';
  }

  @override
  String get notificationEveningTitle => 'Cek malam';

  @override
  String get notificationEveningBody => 'Bagaimana kebun Anda tumbuh hari ini?';

  @override
  String get widgetSetupTitle => 'Tambahkan widget rantai';

  @override
  String get widgetSetupBody =>
      'Pertahankan rantai di layar beranda Anda — tidak perlu membuka aplikasi.';

  @override
  String get widgetSetupAdd => 'Tambahkan ke layar beranda';

  @override
  String get widgetSetupStep1 => 'Tekan lama layar beranda Anda';

  @override
  String get widgetSetupStep2 => 'Ketuk Widget';

  @override
  String get widgetSetupStep3 => 'Temukan Daily Stitch dan seret ke atas';

  @override
  String get widgetSetupPinSuccess =>
      'Periksa layar beranda Anda untuk menempatkan widget.';

  @override
  String get widgetSetupPinFallback =>
      'Peluncur Anda mungkin tidak mendukung penambahan sekali ketuk. Gunakan langkah manual di bawah ini.';

  @override
  String get paywallWelcomePro => 'Selamat datang di Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'HEMAT ~16%';

  @override
  String get paywallTermsTitle => 'Ketentuan langganan';

  @override
  String get paywallTermsBody =>
      'Penagihan ditangani oleh Google Play. Langganan memperbarui secara otomatis sampai Anda membatalkan di Play Store → Langganan setidaknya 24 jam sebelum akhir periode berjalan. Anda dapat mengelola atau membatalkan langganan kapan saja dari akun Google Play Anda.\n\nMenghapus aplikasi tidak membatalkan langganan Anda.\n\nHarga yang ditampilkan dalam mata uang lokal Anda dan dapat berbeda per wilayah. Pajak mungkin berlaku.';

  @override
  String get paywallPrivacyTitle => 'Privasi';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch menyimpan tugas, kebiasaan, dan data rantai Anda di backend Supabase kami, terkait dengan akun Anda. Kami tidak pernah menjual data Anda.\n\nPembelian langganan diproses oleh Google Play. Kami menerima token pembelian terverifikasi dari Google untuk mengonfirmasi status Pro Anda. Kami tidak melihat atau menyimpan detail pembayaran Anda.\n\nAnda dapat meminta ekspor data lengkap atau penghapusan akun dari Pengaturan → Penghapusan akun.';

  @override
  String get paywallCloseTooltip => 'Tutup';

  @override
  String get paywallFooterLinks => 'Pulihkan · Ketentuan · Privasi';

  @override
  String get manageProTitle => 'Langganan Pro';

  @override
  String get manageProActive => 'Aktif';

  @override
  String get manageProNotSubscribed => 'Belum berlangganan';

  @override
  String get manageProFreeTier => 'Tier gratis';

  @override
  String manageProRenewsOn(String date) {
    return 'Memperbarui atau berakhir pada $date.';
  }

  @override
  String get manageProFreeBody =>
      'Anda menggunakan Daily Stitch Gratis. Tingkatkan untuk membuka sistem lengkap.';

  @override
  String get manageProSectionManage => 'KELOLA';

  @override
  String get manageProOpenPlay => 'Buka langganan Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Batalkan, ubah paket, atau perbarui metode pembayaran';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Temukan langganan Anda yang ada (jika ada) di sini';

  @override
  String get manageProShareApp => 'Bagikan Daily Stitch';

  @override
  String get manageProShareSubtitle => 'Ceritakan tentang rantai kepada teman';

  @override
  String get manageProSectionHelp => 'BUTUH BANTUAN?';

  @override
  String get manageProHelpTitle => 'Bantuan & Dukungan';

  @override
  String get manageProHelpSubtitle => 'FAQ langganan, kontak, laporan bug';

  @override
  String manageProBillingFooter(String version) {
    return 'Penagihan ditangani oleh Google Play · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Buka aplikasi Google Play Store → ketuk profil Anda → Pembayaran & langganan → Langganan.';

  @override
  String get addTaskGrowSomething => 'Tumbuhkan Sesuatu';

  @override
  String get addTaskPlantSprout => 'Tanam Tunas';

  @override
  String get addTaskIntentionName => 'NAMA NIAT';

  @override
  String get addTaskSproutName => 'NAMA TUNAS';

  @override
  String get addTaskHintTask => 'contoh, Salam Matahari Pagi';

  @override
  String get addTaskHintHabit => 'contoh Yoga Pagi';

  @override
  String get addTaskWhen => 'KAPAN?';

  @override
  String get addTaskPriority => 'PRIORITAS';

  @override
  String get addTaskNotes => 'CATATAN';

  @override
  String get addTaskCadenceDaily => 'Harian';

  @override
  String get addTaskCadenceWeekdays => 'Hari kerja';

  @override
  String get addTaskCadence3x => '3x/minggu';

  @override
  String get addTaskCadenceWeekly => 'Mingguan';

  @override
  String get addTaskPlantIntention => 'Tanam Niat';

  @override
  String get addTaskPlantSproutCta => 'Tanam Tunas';

  @override
  String get addTaskPlanting => 'Menanam…';

  @override
  String get addTaskNameIntentionError => 'Namai niat Anda';

  @override
  String get addTaskNameSproutError => 'Namai tunas Anda';

  @override
  String get addTaskNotesMigrationWarning =>
      'Tugas tersimpan. Catatan & prioritas memerlukan migrasi Supabase terbaru — jalankan supabase/migrations/20260701000000_todos_notes_priority.sql.';

  @override
  String get addTaskNoSproutSlots =>
      'Tidak ada slot tunas kosong — rawat satu terlebih dahulu.';

  @override
  String get addTaskSaveSproutError =>
      'Tidak dapat menyimpan tunas — coba lagi.';

  @override
  String get addTaskElementWater => 'AIR';

  @override
  String get addTaskElementLight => 'CAHAYA';

  @override
  String get addTaskElementSoil => 'TANAH';

  @override
  String get addTaskElementBreeze => 'ANGIN';

  @override
  String get addTaskCadenceLabel => 'KADENSI';

  @override
  String get addTaskPreparationNotes => 'CATATAN PERSIAPAN';

  @override
  String get addTaskTendingNotes => 'CATATAN PERAWATAN';

  @override
  String get addTaskNotesHintTask =>
      'Alat atau tips pola pikir untuk tugas ini?';

  @override
  String get addTaskNotesHintHabit => 'Seperti apa merawat tunas ini?';

  @override
  String get addTaskChooseElement => 'PILIH ELEMEN';

  @override
  String get addTaskElementsTooltip => 'Apa arti elemen-elemen ini?';

  @override
  String get addTaskTaskSeed => 'Benih Tugas';

  @override
  String get addTaskHabitSprout => 'Tunas Kebiasaan';

  @override
  String get addTaskPickElement => 'Pilih elemen yang tepat';

  @override
  String get addTaskPickElementBody =>
      'Setiap elemen mewakili jenis usaha yang berbeda. Penjaga menjadi lebih kuat saat Anda menyiram yang benar.';

  @override
  String get addTaskClearForm => 'Bersihkan formulir';

  @override
  String get shareCouldNotShare => 'Tidak dapat berbagi saat ini';

  @override
  String get authReferralCodeLabel => 'Kode referral (opsional)';

  @override
  String get authReferralCodeHint => 'Kode teman';

  @override
  String get youPerkHabitSlots => '5 slot kebiasaan';

  @override
  String get youPerkFullHistory => 'Riwayat lengkap';

  @override
  String get youPerkAllThemes => 'Semua tema';

  @override
  String get youPerkStreakFreezes => '2 pembekuan rantai / bulan';

  @override
  String get youPerkLegendaryMedals => 'Medali legendaris';

  @override
  String get subscriptionPurchaseFailed => 'Pembelian gagal. Coba lagi.';

  @override
  String get subscriptionUnavailable =>
      'Pembelian dalam aplikasi tidak tersedia di perangkat ini.';

  @override
  String get subscriptionLoadFailed => 'Tidak dapat memuat opsi langganan.';

  @override
  String get subscriptionVerifyFailed =>
      'Tidak dapat memverifikasi pembelian. Coba Pulihkan pembelian.';

  @override
  String get streakFreezeFailed => 'Tidak dapat menggunakan pembekuan rantai.';

  @override
  String get streakFreezeAlreadyUsed =>
      'Anda sudah menggunakan pembekuan bulan ini.';

  @override
  String get streakFreezeNoMissed =>
      'Tidak ada tugas yang terlewat hari itu untuk dibekukan.';

  @override
  String get streakFreezeNotPastDay =>
      'Anda hanya dapat membekukan hari yang sudah lewat.';

  @override
  String get myDayLoadError =>
      'Tidak dapat memuat Hari Saya. Tarik untuk menyegarkan.';

  @override
  String get myDayCapReached => 'Anda telah mencapai batas 5 tugas hari ini.';

  @override
  String get myDayRemoveTaskError => 'Tidak dapat menghapus tugas.';

  @override
  String get shareCardTitle => 'Bagikan minggu Anda';

  @override
  String get shareCardCta => 'Bagikan gambar';

  @override
  String get medalTierSprout => 'Tunas';

  @override
  String get medalTierCommon => 'Biasa';

  @override
  String get medalTierRare => 'Langka';

  @override
  String get medalTierEpic => 'Epik';

  @override
  String get medalTierLegendary => 'Legendaris';

  @override
  String get medalCategoryTasks => 'Tugas';

  @override
  String get medalCategoryHabits => 'Kebiasaan';

  @override
  String get medalCategoryStreaks => 'Rantai';

  @override
  String get medalCategoryMastery => 'Penguasaan';

  @override
  String get medalsShareTooltip => 'Bagikan pencapaian';

  @override
  String get medalsFilterAll => 'Semua';

  @override
  String get addHabitTitleNew => 'Tanam tunas baru';

  @override
  String get addHabitTitleEdit => 'Rawat tunas Anda';

  @override
  String get addHabitLabelSproutName => 'NAMA TUNAS';

  @override
  String get shareCardAppBarTitle => 'Kartu Bagikan';

  @override
  String get shareCardAppBarTitleMedal => 'Bagikan medali Anda';

  @override
  String shareCardDescMedal(Object title) {
    return 'Pamerkan lencana $title baru Anda';
  }

  @override
  String get shareCardBodyMedal =>
      'Bagikan kemenangan dengan lingkaran Anda. Kartu diekspor sebagai PNG dan siap untuk aplikasi sosial apa pun.';

  @override
  String get shareCardCtaPreparing => 'Mempersiapkan…';

  @override
  String get shareCardMilestone => 'TONGGAK BARU TERBUKA';

  @override
  String get shareCardStatChain => 'hari rantai';

  @override
  String get shareCardStatSprouts => 'tunas';

  @override
  String get shareCardStatMedals => 'medali';

  @override
  String shareCardHeadlineStreak(int days) {
    return 'Rantai $days Hari';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Medali Diraih';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Penjaga Tunas';

  @override
  String get shareCardHeadlineFirstSeeds => 'Benih Pertama Ditanam';

  @override
  String get shareCardHeadlineGardenBegins => 'Sebuah Kebun Dimulai';

  @override
  String get shareCardSubheadMonth =>
      'Anda telah berhasil merawat kebiasaan Anda selama satu bulan penuh.';

  @override
  String get shareCardSubheadWeek =>
      'Satu minggu penuh pertumbuhan — hutan Anda semakin lebat.';

  @override
  String get shareCardSubheadProgress =>
      'Tempat perlindungan Anda menunjukkan kemajuan nyata. Terus rawat.';

  @override
  String get shareCardSubheadSprouts =>
      'Tunas pertama Anda mulai berakar. Sirami setiap hari.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Benih pertama Anda sudah di tanah. Saksikan mereka terbuka.';

  @override
  String get shareCardSubheadFallback =>
      'Setiap hutan dimulai dari satu pilihan kecil.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — lima benih kecil sehari, satu rantai tak terputus. Tanam milik Anda.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Coba Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Saya membangun rantai harian saya di Daily Stitch — gabung dengan saya menggunakan kode referral saya $code dan kita berdua tumbuh.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Gabung dengan saya di Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Progres Daily Stitch saya — $year di Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Saya baru saja membuka medali \"$title\" di Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Tugas selesai';

  @override
  String get insightsReceiptPerfectDays => 'Hari sempurna';

  @override
  String get insightsReceiptCompletion => 'Penyelesaian';

  @override
  String insightsReceiptDate(String date) {
    return 'Minggu tanggal $date';
  }

  @override
  String get insightsReceiptFooter => 'Jangan putus rantainya.';

  @override
  String get elementLabelWater => 'Air';

  @override
  String get elementLabelLight => 'Cahaya';

  @override
  String get elementLabelSoil => 'Tanah';

  @override
  String get elementLabelBreeze => 'Angin';

  @override
  String get elementTaglineWater =>
      'Pulihkan. Hidrasi, istirahat, perawatan emosional — apa pun yang mengisi kembali.';

  @override
  String get elementTaglineLight =>
      'Bangunkan. Cahaya pagi, blok fokus, belajar, meditasi — energi dan kejernihan.';

  @override
  String get elementTaglineSoil =>
      'Pendalaman. Membaca, menulis jurnal, pekerjaan mendalam — akar kuat yang membangun kekuatan jangka panjang.';

  @override
  String get elementTaglineBreeze =>
      'Gerak. Berjalan, berlari, latihan pernapasan — energi ringan dan gerak yang membersihkan pikiran.';

  @override
  String get elementWhenWater =>
      'Saat Anda merasa lelah atau kehabisan energi.';

  @override
  String get elementWhenLight =>
      'Saat Anda butuh awal yang jelas untuk hari Anda.';

  @override
  String get elementWhenSoil =>
      'Saat pekerjaannya lambat tetapi sepadan (belajar, kerajinan, perawatan).';

  @override
  String get elementWhenBreeze =>
      'Saat tubuh (atau pikiran) Anda perlu bergerak dan bernapas.';

  @override
  String get bloomTierMastery => 'Penguasaan';

  @override
  String get bloomTierStrong => 'Kuat';

  @override
  String get bloomTierGrowing => 'Tumbuh';

  @override
  String get bloomTierSprouting => 'Bertunas';

  @override
  String get bloomTierLocked => 'Terkunci';

  @override
  String habitBloomSubtitle(int count, String element) {
    return 'Rantai $count hari · $element';
  }

  @override
  String get medal_id_first_spark => 'Percikan Pertama';

  @override
  String get medal_sub_first_spark => 'Anda menyalakan korek api.';

  @override
  String get medal_desc_first_spark =>
      'Selesaikan tugas pertama Anda. Setiap rantai dimulai dari sini.';

  @override
  String get medal_id_triple_seed => 'Triple Benih';

  @override
  String get medal_sub_triple_seed => 'Tiga ke dalam tanah.';

  @override
  String get medal_desc_triple_seed => 'Selesaikan 3 tugas secara total.';

  @override
  String get medal_id_dozen_sower => 'Penabur Sebelas';

  @override
  String get medal_sub_dozen_sower => 'Sebuah ladang dua belas.';

  @override
  String get medal_desc_dozen_sower => 'Selesaikan 12 tugas secara total.';

  @override
  String get medal_id_quarter_century => 'Seperempat Abad';

  @override
  String get medal_sub_quarter_century => 'Satu musim berkata ya.';

  @override
  String get medal_desc_quarter_century => 'Selesaikan 25 tugas secara total.';

  @override
  String get medal_id_productivity_titan => 'Titan Produktivitas';

  @override
  String get medal_sub_productivity_titan => 'Konsistensi berlipat ganda.';

  @override
  String get medal_desc_productivity_titan =>
      'Selesaikan 50 tugas — Anda telah membangun momentum nyata.';

  @override
  String get medal_id_century_planter => 'Penanam Abad';

  @override
  String get medal_sub_century_planter => 'Hutan milik Anda sendiri.';

  @override
  String get medal_desc_century_planter =>
      'Selesaikan 100 tugas. Anda termasuk 5% pengguna teratas.';

  @override
  String get medal_id_clean_day => 'Lembaran Bersih';

  @override
  String get medal_sub_clean_day => 'Tak ada satu pun gulma.';

  @override
  String get medal_desc_clean_day =>
      'Selesaikan setiap tugas yang Anda tanam dalam satu hari.';

  @override
  String get medal_id_triple_perfect => 'Triple Sempurna';

  @override
  String get medal_sub_triple_perfect => 'Tiga lari tanpa cela.';

  @override
  String get medal_desc_triple_perfect => 'Capai 3 hari sempurna.';

  @override
  String get medal_id_perfect_week => 'Minggu Sempurna';

  @override
  String get medal_sub_perfect_week => 'Tujuh hari tanpa putus.';

  @override
  String get medal_desc_perfect_week => '7 hari sempurna berturut-turut.';

  @override
  String get medal_id_two_week_chain => 'Kekuatan Dua Minggu';

  @override
  String get medal_sub_two_week_chain => 'Dua minggu menyala.';

  @override
  String get medal_desc_two_week_chain => 'Pertahankan rantai 14 hari.';

  @override
  String get medal_id_iron_chain => 'Rantai Besi';

  @override
  String get medal_sub_iron_chain => '30 tautan ditempa.';

  @override
  String get medal_desc_iron_chain => 'Rantai 30 hari. Medali tugas tersulit.';

  @override
  String get medal_id_quarterly_chain => 'Rantai Kuartalan';

  @override
  String get medal_sub_quarterly_chain => 'Satu musim, tanpa putus.';

  @override
  String get medal_desc_quarterly_chain => 'Rantai 90 hari. Status legendaris.';

  @override
  String get medal_id_vital_priority => 'Percikan Vital';

  @override
  String get medal_sub_vital_priority => 'Anda memilih yang sulit.';

  @override
  String get medal_desc_vital_priority =>
      'Selesaikan 5 tugas yang ditandai prioritas Vital.';

  @override
  String get medal_id_spark_priority => 'Penjinak Percikan';

  @override
  String get medal_sub_spark_priority => 'Kemenangan cepat bertambah.';

  @override
  String get medal_desc_spark_priority =>
      'Selesaikan 5 tugas yang ditandai prioritas Spark.';

  @override
  String get medal_id_note_taker => 'Pencatat';

  @override
  String get medal_sub_note_taker =>
      'Rencana di atas kertas lebih baik dari rencana di kepala.';

  @override
  String get medal_desc_note_taker =>
      'Tambahkan catatan persiapan ke 5 tugas berbeda.';

  @override
  String get medal_id_left_behind_rescuer => 'Penyelamat Tertinggal';

  @override
  String get medal_sub_left_behind_rescuer =>
      'Tidak ada tugas yang tertinggal.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Tambahkan kembali 3 tugas yang terlewat keesokan harinya.';

  @override
  String get medal_id_first_sprout => 'Tunas Pertama';

  @override
  String get medal_sub_first_sprout => 'Ritual harian baru.';

  @override
  String get medal_desc_first_sprout => 'Tanam kebiasaan pertama Anda.';

  @override
  String get medal_id_trio_sprout => 'Trio Tunas';

  @override
  String get medal_sub_trio_sprout => 'Ekosistem kecil.';

  @override
  String get medal_desc_trio_sprout => 'Tanam 3 kebiasaan berbeda.';

  @override
  String get medal_id_week_of_growth => 'Minggu Pertumbuhan';

  @override
  String get medal_sub_week_of_growth => 'Akar mulai bertahan.';

  @override
  String get medal_desc_week_of_growth =>
      'Rawat kebiasaan setiap hari selama 7 hari.';

  @override
  String get medal_id_fortnight_floret => 'Floret Dua Minggu';

  @override
  String get medal_sub_fortnight_floret => 'Mekar penuh.';

  @override
  String get medal_desc_fortnight_floret => 'Rantai kebiasaan 14 hari.';

  @override
  String get medal_id_rooted_master => 'Master Berakar';

  @override
  String get medal_sub_rooted_master => 'Akar dalam, kekuatan dalam.';

  @override
  String get medal_desc_rooted_master => 'Rantai kebiasaan 30 hari.';

  @override
  String get medal_id_half_year_bloom => 'Mekar Setengah Tahun';

  @override
  String get medal_sub_half_year_bloom => 'Kebun permanen sekarang.';

  @override
  String get medal_desc_half_year_bloom =>
      'Pertahankan satu kebiasaan selama 180 hari.';

  @override
  String get medal_id_garden_keeper => 'Penjaga Kebun';

  @override
  String get medal_sub_garden_keeper => 'Variasi, bersama-sama.';

  @override
  String get medal_desc_garden_keeper =>
      'Tumbuhkan 4 kebiasaan berbeda secara bersamaan.';

  @override
  String get medal_id_hydration_hero => 'Pahlawan Hidrasi';

  @override
  String get medal_sub_hydration_hero => 'Anda mengisi kembali.';

  @override
  String get medal_desc_hydration_hero =>
      'Tanam kebiasaan hidrasi (air/minum).';

  @override
  String get medal_id_mindful_mover => 'Pemindah Sadar';

  @override
  String get medal_sub_mindful_mover => 'Tubuh mengingat.';

  @override
  String get medal_desc_mindful_mover =>
      'Tanam kebiasaan bergerak (yoga/jalan/lari).';

  @override
  String get medal_id_devoted_keeper => 'Penjaga Setia';

  @override
  String get medal_sub_devoted_keeper => 'Enam puluh hari, satu latihan.';

  @override
  String get medal_desc_devoted_keeper =>
      'Rawat satu kebiasaan selama 60 hari berturut-turut.';

  @override
  String get medal_id_tending_notes => 'Catatan Perawatan';

  @override
  String get medal_sub_tending_notes => 'Renungkan saat melangkah.';

  @override
  String get medal_desc_tending_notes =>
      'Tambahkan catatan perawatan ke 3 kebiasaan.';

  @override
  String get medalTierTaglineSprout => 'Tanam benih pertama';

  @override
  String get medalTierTaglineCommon => 'Membangun kebiasaan';

  @override
  String get medalTierTaglineRare => 'Menunjukkan momentum nyata';

  @override
  String get medalTierTaglineEpic => 'Anda adalah kekuatan alam';

  @override
  String get medalTierTaglineLegendary =>
      'Mitosis, hampir tidak ada yang sampai di sini';

  @override
  String get guardianHeadlineNoTasks =>
      'Tanah hari ini segar.\nTanam benih pertama\ndan saksikan ia tumbuh.';

  @override
  String get guardianHeadlineAllDone =>
      'Setiap benih yang Anda tanam\nsedang mekar.\nIstirahatlah, Penjaga — Anda sudah mendapatkannya.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count hari\npertumbuhan tanpa putus.\nHutan Anda dipenuhi kehidupan.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Satu minggu penuh mekar,\nPenjaga.\nSatu hari sempurna lagi\nmemperpanjang rantai.';

  @override
  String get guardianHeadlineStreak3 =>
      'Rantai Anda bertahan.\nRawat benih\nyang masih menunggu untuk terbuka.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Anda merawat tugas dengan baik.\nTanam tunas —\nkebiasaan adalah cara hutan tumbuh.';

  @override
  String get guardianHeadlineSomeDone =>
      'Beberapa benih terbuka,\nbeberapa tidak. Itu tidak apa-apa.\nBesok adalah hari penanaman lagi.';

  @override
  String get guardianHeadlineMorning =>
      'Selamat pagi, Penjaga.\nHari ini masih muda\ndan tanah siap.';

  @override
  String get guardianHeadlineAfternoon =>
      'Selamat siang, Penjaga.\nSetengah cahaya tersisa —\nterus rawat.';

  @override
  String get guardianHeadlineEvening =>
      'Selamat sore, Penjaga.\nSatu sapuan terakhir\nsebelum matahari terbenam.';

  @override
  String get guardianHeadlineNight =>
      'Bekerja larut malam?\nBahkan Penjaga perlu istirahat.\nTanam benih besok sekarang.';

  @override
  String get guardianBodyNoTasks =>
      'Tempat perlindungan Anda sepi sekarang. Tambahkan satu niat dan lihat apa yang berubah saat matahari terbenam.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count hari berjalan. Rantai ini bukan keberuntungan — itu adalah pilihan-pilihan kecil yang menumpuk. Terus tumpuk.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Rantai $count hari adalah momentum nyata. Selesaikan benih hari ini yang masih terbuka sebelum Anda menyudahi.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Anda telah menanam $count tugas sejauh ini. Menambahkan satu tunas kebiasaan pun akan membuat pekerjaan berlipat ganda dari hari ke hari.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Anda menyelesaikan $pct% dari yang Anda tanam. Benih yang lebih sedikit dan tajam cenderung tumbuh lebih tinggi dari sepuluh benih yang tersebar.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Tempat perlindungan Anda hidup. $tasks tugas selesai, $sprouts tunas tumbuh — pekerjaan mulai terlihat.';
  }

  @override
  String get guardianInsightWaitingTitle => 'Menunggu langkah pertama Anda';

  @override
  String get guardianInsightWaitingBody =>
      'Tambahkan tugas atau kebiasaan dan saya akan mulai membaca pola di kebun Anda. Semakin banyak Anda tanam, semakin banyak yang bisa saya pelajari.';

  @override
  String get guardianInsightWaitingCta => 'Tanam benih pertama Anda';

  @override
  String get guardianInsightChainSuperTitle =>
      'Rantai adalah kekuatan super Anda';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Anda telah mempertahankan rantai $count hari. Rantai selalu mengalahkan motivasi — pertahankan, bahkan di hari-hari yang lambat.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Tanam benih besok';

  @override
  String get guardianInsightChainColdTitle => 'Rantai dingin — mulai yang baru';

  @override
  String get guardianInsightChainColdBody =>
      'Anda pernah menanam sebelumnya, yang berarti Anda bisa menanam lagi. Satu tugas kecil yang diselesaikan hari ini adalah rantai yang lebih panjang besok.';

  @override
  String get guardianInsightChainColdCta => 'Tanam benih';

  @override
  String get guardianInsightLessIsMoreTitle =>
      'Sedikit lebih banyak minggu ini';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Anda menyelesaikan sekitar $pct% dari yang Anda tanam. Coba 3 niat tajam alih-alih 5 yang longgar — kualitas berlipat ganda.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Perjelas hari ini';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Medali berikutnya: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Anda sudah $value dari $target $unit. Beberapa hari jujur lagi dan itu milik Anda.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Tunjukkan medali';

  @override
  String get guardianInsightSteadyTitle => 'Anda di musim yang stabil';

  @override
  String get guardianInsightSteadyBody =>
      'Tidak ada medali yang hampir diraih — tidak apa-apa. Rawat apa yang Anda miliki. Mekar berikutnya sedang dalam perjalanan.';

  @override
  String get guardianInsightSteadyCta => 'Lihat progres';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 tugas tersisa di rantai Anda. Tengah malam akan tiba.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count tugas tersisa di rantai Anda. Tengah malam akan tiba.';
  }

  @override
  String get notificationEveningBodyOne =>
      'Anda masih memiliki 1 tugas terbuka hari ini.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Anda masih memiliki $count tugas terbuka hari ini.';
  }

  @override
  String get notificationTickerTaskReminder => 'Pengingat tugas';

  @override
  String get notificationTickerTaskAlarm => 'Alarm tugas';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return 'Rantai $count hari · $element';
  }
}
