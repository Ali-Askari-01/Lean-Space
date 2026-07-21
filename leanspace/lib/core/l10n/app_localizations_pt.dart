// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

  @override
  String get tabToday => 'Hoje';

  @override
  String get tabProgress => 'Progresso';

  @override
  String get tabYou => 'Você';

  @override
  String get navMyDay => 'Meu dia';

  @override
  String get navSettings => 'Configurações';

  @override
  String get navHelp => 'Ajuda & Suporte';

  @override
  String get navHistory => 'Últimos 7 dias';

  @override
  String get navLeftBehind => 'Pendentes';

  @override
  String get navInsights => 'Seu progresso';

  @override
  String get navMedals => 'Minhas medalhas';

  @override
  String get navManagePro => 'Gerenciar assinatura Pro';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Queimando o azeite da meia-noite';

  @override
  String get greetingMorning => 'Bom dia, sol!';

  @override
  String get greetingAfternoon => 'Boa tarde, amigo';

  @override
  String get greetingEvening => 'Boa noite, campeão';

  @override
  String get greetingNight => 'Descansando bem, guardião?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Hoje · $done de $total tarefas';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done de $total hábitos';
  }

  @override
  String get todayChainGrows => 'A CORRENTE CRECE AO FINALIZAR';

  @override
  String get todayChainComplete => 'CORRENTE COMPLETA · CUIDE DO JARDIM AMANHÃ';

  @override
  String get taskCapInfo => 'Por que a restrição de 5 tarefas?';

  @override
  String get taskCapDiscipline => 'DISCIPLINA EM PRIMEIRO LUGAR POR CONCEITO';

  @override
  String get taskCapTitle => 'Limitamos seu dia a 5 tarefas de propósito.';

  @override
  String get taskCapBody =>
      'Correntes pequenas vencem as longas. Você tem mais chance de finalizar 3 de 5 e sentir a vitória do que abandonar 8 de 10 e sentir a derrota.';

  @override
  String get taskCapBulletDone =>
      'Tarefas finalizadas contam para sua corrente';

  @override
  String get taskCapBulletDoneBody =>
      'Um dia em que as 5 são finalizadas estende sua sequência em um.';

  @override
  String get taskCapBulletMissed => 'Tarefas perdidas vão para Pendentes';

  @override
  String get taskCapBulletMissedBody =>
      'À meia-noite, tarefas não finalizadas aparecem em Pendentes. Re-adicione apenas o que ainda importa.';

  @override
  String get taskCapBulletFreeze =>
      'Congelamento de sequência perdoa uma perda';

  @override
  String get taskCapBulletFreezeBody =>
      'O Pro dá 2 congelamentos de sequência por mês — eles cobrem um dia perdido para sua corrente sobreviver.';

  @override
  String get tasksHeader => 'Tarefas';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Adicionar uma semente de tarefa';

  @override
  String get tasksCapReached =>
      '5/5 espaços usados — finalize um para plantar uma nova semente.';

  @override
  String get tasksEmptyCta =>
      'Plante sua primeira semente — o que importa hoje?';

  @override
  String get habitsHeader => 'Hábitos';

  @override
  String habitsGrowing(String count) {
    return '$count crescendo';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Melhor $days d';
  }

  @override
  String get habitsPlantNew => 'Plantar um novo broto de hábito';

  @override
  String get habitsPlantFirst => 'Plantar um hábito';

  @override
  String get habitsLocked =>
      'Espaço de hábito Pro — desbloqueie para plantar mais brotos';

  @override
  String get habitsSlotsFull =>
      'Todos os espaços de hábitos estão atualmente ocupados.';

  @override
  String habitsStreakDays(String days) {
    return '${days}d';
  }

  @override
  String get habitsCadence => 'DIÁRIO';

  @override
  String leftBehindBanner(String count) {
    return '$count perdidos — ainda em Pendentes';
  }

  @override
  String get leftBehindTap => 'Toque para re-adicionar ou deixar ir';

  @override
  String get leftBehindDismiss => 'Dispensar';

  @override
  String get leftBehindTitle => 'Pendentes';

  @override
  String get leftBehindEmpty => 'Nada pendente';

  @override
  String get leftBehindEmptyBody =>
      'Nenhuma tarefa perdida. Toda semente que você planta está sendo cuidada. O jardim está limpo.';

  @override
  String get leftBehindClearAll => 'Limpar tudo';

  @override
  String get leftBehindClearAllConfirm => 'Limpar todos os pendentes?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Isso removerá permanentemente $count tarefa(s) perdida(s). Isso não pode ser desfeito.';
  }

  @override
  String get leftBehindReAdd => 'Re-adicionar hoje';

  @override
  String get leftBehindReAddButton => 'Re-adicionar';

  @override
  String get leftBehindAddedToToday => 'Adicionado ao hoje';

  @override
  String get leftBehindLetGo => 'Deixar ir';

  @override
  String get leftBehindHeader => 'PENDENTES';

  @override
  String get leftBehindMissedTasks => 'TAREFAS PERDIDAS';

  @override
  String get leftBehindWaitingOne => '1 tarefa está esperando por você.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count tarefas estão esperando por você.';
  }

  @override
  String get leftBehindBody =>
      'Re-adicione uma tarefa para trazê-la de volta ao hoje, ou deixe-a ir. Re-adicionar mantém sua corrente viva.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" está de volta no seu dia.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'Removido \"$task\"';
  }

  @override
  String get leftBehindClearedSnack => 'Pendentes limpos';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Ontem · $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count tarefa(s) restante(s) para hoje';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Último chamado — $count tarefa(s) ainda aberta(s)';
  }

  @override
  String get streakAtRiskBody =>
      'A meia-noite está próxima. A corrente depende disso.';

  @override
  String get streakAtRiskBodyLow =>
      'Você ainda tem tempo. Um dia limpo estende sua sequência.';

  @override
  String get streakAtRiskFreeze =>
      'Ontem perdido — usar congelamento de sequência?';

  @override
  String get streakFreezeUse => 'Usar congelamento';

  @override
  String get streakFreezeUseForYesterday =>
      'Usar congelamento mensal para ontem';

  @override
  String get streakFreezeAppliedYesterday =>
      'Congelamento de sequência aplicado para ontem.';

  @override
  String get chainBrokenTitle => 'A corrente quebrou. Tudo bem.';

  @override
  String get chainBrokenBody =>
      'Toda corrente longa termina uma vez. O que importa é o que você planta hoje. Um dia perfeito começa o próximo.';

  @override
  String get chainBrokenCta => 'Voltar para hoje';

  @override
  String get chainBrokenPlantFirst => 'Plante a primeira semente de hoje';

  @override
  String get chainBrokenCheck => 'Verifique Pendentes primeiro';

  @override
  String get chainBrokenBestChain => 'melhor corrente';

  @override
  String get chainBrokenTasksDone => 'tarefas feitas';

  @override
  String get chainBrokenSprouts => 'brotos';

  @override
  String get chainRecoveryFreshStart => 'Um novo começo';

  @override
  String get medalsTitle => 'Minhas medalhas';

  @override
  String get medalsTrophyRoom => 'Sala de troféus';

  @override
  String get medalsAllMedals => 'Todas as medalhas';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned de $total medalhas conquistadas';
  }

  @override
  String get medalsTrophyEmpty =>
      'Seu primeiro emblema está a uma tarefa de distância';

  @override
  String get medalsTrophyFirst =>
      'Você conquistou sua primeira medalha — continue';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned medalhas na sua sala de troféus';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'Progresso para todas as $total medalhas';
  }

  @override
  String get medalsShareCta => 'Criar um cartão compartilhável';

  @override
  String get medalsEmptyTitle => 'Nada nesta categoria ainda';

  @override
  String get medalsEmptyBody =>
      'Finalize uma tarefa ou cuide de um broto para começar sua sala de troféus.';

  @override
  String get medalSheetLocked => 'MEDALHA PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'CONQUISTADA · $tier';
  }

  @override
  String get medalSheetUnlock => 'Desbloquear com Pro';

  @override
  String get medalSheetProgress => 'Progresso';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Faltam apenas $n $unit para desbloquear.';
  }

  @override
  String get medalSheetAlmost => 'Mais um passo para desbloquear.';

  @override
  String get medalCategory => 'Categoria';

  @override
  String get medalShareOnSocials => 'Compartilhar nas redes';

  @override
  String get medalShareLater => 'Talvez depois';

  @override
  String get medalUnlocked => 'MEDALHA DESBLOQUEADA';

  @override
  String get medalProgressTitle => 'Progresso';

  @override
  String get historyTitle => 'Últimos 7 dias';

  @override
  String get historyFullTitle => 'Histórico completo';

  @override
  String get historyLoadError => 'Não foi possível carregar o histórico.';

  @override
  String get historyFullCalendar => 'Calendário completo';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% concluído';
  }

  @override
  String historyThisWeek(String days) {
    return 'ÚLTIMOS $days DIAS';
  }

  @override
  String get historyDayByDay => 'DIA A DIA';

  @override
  String get historyEmpty =>
      'Plante algumas sementes para ver sua semana se desenrolar.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Você finalizou $done de $total tarefas. $perfect dia(s) perfeito(s).';
  }

  @override
  String get historyUpsellTitle => 'Veja seu histórico completo';

  @override
  String get historyUpsellBody =>
      'O Pro desbloqueia 30 dias de histórico. O Gratuito mostra 7.';

  @override
  String get historyPerfect => 'PERFEITO';

  @override
  String get historyFrozen => 'CONGELADO';

  @override
  String get historyToday => 'Hoje';

  @override
  String get historyEmptyDay => 'Nenhuma semente plantada nesse dia';

  @override
  String historyLeftBehindCount(String count) {
    return '$count pendente(s)';
  }

  @override
  String get progressVitality => 'VITALIDADE DE HOJE';

  @override
  String get progressVitalityEmpty =>
      'Plante uma semente para começar seu jardim.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done de $total sementes plantadas hoje.';
  }

  @override
  String progressChainPill(String days) {
    return '${days}d de corrente';
  }

  @override
  String get progressMetricCurrent => 'Atual';

  @override
  String get progressMetricBest => 'Melhor';

  @override
  String get progressMetricDone => 'Feito';

  @override
  String get progressMetricPerfect => 'Perfeito';

  @override
  String get progressMetricHabits => 'Hábitos';

  @override
  String get progressHabitBlooms => 'Florações de hábitos';

  @override
  String get progressHabitBloomsSub =>
      'Marcos de sequência para os brotos que você rega diariamente.';

  @override
  String get progressNextBadge => 'Próximo emblema';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned de $total';
  }

  @override
  String get progressPersonalActivity => 'Atividade Pessoal';

  @override
  String progressBrowseMonth(String month) {
    return 'Navegando $month. Toque em \"Hoje\" para voltar à sua atividade atual.';
  }

  @override
  String get progressJumpToToday => 'Hoje';

  @override
  String get progressCalendarLegend => 'mais escuro = mais finalizados';

  @override
  String get progressCalendarBody =>
      'Verde escuro significa um dia perfeito. A tonalidade desvance conforme você pula.';

  @override
  String get paywallTitle => 'Mantenha a corrente inquebrável.';

  @override
  String get paywallSubtitle =>
      'O Daily Stitch Pro dá a você o sistema completo de disciplina.';

  @override
  String get paywallFeatures =>
      'Todos os 5 espaços de hábitos, não apenas 3|Seu histórico completo, para sempre|O conjunto completo de medalhas|Congelamento de sequência todo mês|Recibo semanal + cartões de compartilhamento|Temas + mais';

  @override
  String get paywallFeaturesBodies =>
      'O Gratuito dá 3. O Pro desbloqueia todos os cinco para que seu ritual diário completo possa viver aqui.|Navegue por cada dia que você completou — não apenas os últimos 7. Olhe para trás anos, não semanas.|Desbloqueie medalhas de nível Lendário. Os emblemas mais raros são para quem vai até o final.|2 congelamentos de sequência por mês para que um único dia ruim não encerre sua corrente.|Belos cartões de compartilhamento da sua semana. Poste sua corrente, inspire alguém mais a começar.|Desbloqueie novas cores de destaque e temas à medida que os adicionamos. Sempre atualizações gratuitas.';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallYearlyCaption => 'Melhor valor · fica ~2,50 USD/mês';

  @override
  String get paywallYearlyBadge => 'ECONOMIZE 35%';

  @override
  String get paywallMonthly => 'Mensal';

  @override
  String get paywallMonthlyCaption =>
      'Cobrado todo mês · cancele quando quiser';

  @override
  String paywallStartCta(String price) {
    return 'Iniciar Pro · $price/ano';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Iniciar Pro · $price/mês';
  }

  @override
  String get paywallRestore => 'Restaurar compra';

  @override
  String get paywallTerms => 'Termos';

  @override
  String get paywallPrivacy => 'Privacidade';

  @override
  String get paywallNoRestore =>
      'Nenhuma compra anterior encontrada nesta conta.';

  @override
  String get paywallRestoreLater =>
      'Restauraremos sua compra na próxima sincronização.';

  @override
  String get paywallAlreadyPro => 'Você já está no Pro. Obrigado pelo apoio.';

  @override
  String get paywallHabitSlotHead =>
      'Você usou todos os seus espaços de hábitos gratuitos. Desbloqueie o conjunto completo para plantar todos os rituais que importam para você.';

  @override
  String get paywallHistoryHead =>
      'Veja seu histórico completo — cada dia perfeito, cada medalha, cada retorno.';

  @override
  String get paywallMedalHead =>
      'As medalhas mais raras são exclusivas do Pro. Continue — elas estão mais perto do que você pensa.';

  @override
  String get settingsYourActivity => 'SUA ATIVIDADE';

  @override
  String get settingsHelpInfo => 'AJUDA & INFORMAÇÕES';

  @override
  String get settingsAccount => 'CONTA';

  @override
  String get settingsNurturingTools => 'FERRAMENTAS DE CUIDADO';

  @override
  String get settingsReminders => 'LEMBRETES';

  @override
  String get settingsWidgetSanctuary => 'SANTUÁRIO DO WIDGET';

  @override
  String get settingsEcosystemSupport => 'SUPORTE DO ECOSSISTEMA';

  @override
  String get settingsHowItWorks => 'Como funciona';

  @override
  String get settingsSignOut => 'Sair';

  @override
  String get settingsProActive => 'Ativo';

  @override
  String get settingsProFree => 'Nível Gratuito';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageValue => 'Padrão do sistema';

  @override
  String get firstRunGreeting => '5 tarefas. Não mais. Faça-as valer.';

  @override
  String get firstRunBody =>
      'Plante sua primeira semente — o que mais importa hoje?';

  @override
  String get firstRunCta => 'Plante sua primeira semente';

  @override
  String get emptyStateClearAll => 'Limpar tudo';

  @override
  String get cancel => 'Cancelar';

  @override
  String get intentionTitle1 => 'Vamos plantar uma nova intenção!';

  @override
  String get intentionBody1 =>
      'Toda floresta poderosa começa com uma única escolha pequena. Me diga o que estamos cuidando hoje?';

  @override
  String get intentionTitle2 => 'O que vamos cultivar hoje?';

  @override
  String get intentionBody2 =>
      'Sementinhas, cuidadas com carinho, se tornam árvores altas. Escolha a que mais importa agora.';

  @override
  String get intentionTitle3 => 'Uma semente. Uma respiração. Comece.';

  @override
  String get intentionBody3 =>
      'Você não precisa plantar a floresta inteira de uma vez — apenas a próxima coisa certa.';

  @override
  String get intentionTitle4 => 'Cuide do próximo pequeno passo.';

  @override
  String get intentionBody4 =>
      'Seu eu do futuro é construído pelas escolhas que você faz nos próximos cinco minutos. Qual é uma gentil?';

  @override
  String get intentionTitle5 => 'Escolha o que você quer se tornar.';

  @override
  String get intentionBody5 =>
      'Tarefas são sementes, hábitos são brotos. Juntos, eles formam uma floresta da qual você tem orgulho.';

  @override
  String get intentionTitle6 => 'Plante algo que vale a pena lembrar.';

  @override
  String get intentionBody6 =>
      'Nem todo dia vai parecer enorme. Uma semente regada ainda conta. Vamos nomear uma.';

  @override
  String get intentionTitle7 => 'Torne hoje um pouco mais corajoso.';

  @override
  String get intentionBody7 =>
      'A coragem se acumula. Escolha a semente que você vem adiando — mesmo nomeá-la a faz avançar.';

  @override
  String get intentionTitle8 => 'Cuide do solo antes da semente.';

  @override
  String get intentionBody8 =>
      'Qual mentalidade, ferramenta ou pequeno ritual tornará esta tarefa mais fácil? Adicione às notas.';

  @override
  String get shareCardSnapshot => 'Um instantâneo do seu santuário';

  @override
  String get shareCardBody =>
      'O cartão acima é exportado como PNG e enviado para sua aba de compartilhamento. Poste na sua história, envie a um amigo ou imprima como adesivo.';

  @override
  String get shareCardShareMyBloom => 'Compartilhar minha floração';

  @override
  String get shareCardCouldNotShare => 'Não foi possível compartilhar agora';

  @override
  String shareCardProgressText(String year) {
    return 'Meu progresso no Daily Stitch — $year no Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Acabei de desbloquear a medalha \"$title\" no Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Como funciona';

  @override
  String get howItWorksBody =>
      'O Daily Stitch ajuda você a manter uma corrente pequena e inquebrável de disciplina. É isso.';

  @override
  String get howItWorksToday => 'A aba Hoje';

  @override
  String get howItWorksTodayBody =>
      'Este é o seu lar. Mostra as 5 tarefas e os hábitos que você definiu para hoje. Finalize-os até a meia-noite, a corrente se estende.';

  @override
  String get howItWorksCap => 'A restrição de 5 tarefas é o recurso';

  @override
  String get howItWorksCapBody =>
      'Nós não deixamos você adicionar uma 6ª. Esse é o ponto todo. Correntes pequenas vencem as longas. Toque no \"?\" na tela inicial para o raciocínio completo.';

  @override
  String get howItWorksHabits =>
      'Hábitos são diários, a corrente é para sempre';

  @override
  String get howItWorksHabitsBody =>
      'Hábitos (Yoga matinal, Beber água) vivem para sempre. Tarefas são únicas. Ambos alimentam a mesma sequência.';

  @override
  String get howItWorksLeftBehind => 'Tarefas perdidas → Pendentes';

  @override
  String get howItWorksLeftBehindBody =>
      'À meia-noite, tarefas não finalizadas vão para Pendentes. Re-adicione apenas o que ainda importa. O resto recebe um afastamento silencioso.';

  @override
  String get howItWorksProgress => 'A aba Progresso';

  @override
  String get howItWorksProgressBody =>
      'Sequência, calendário, medalhas, histórico — tudo sobre como você está indo ao longo do tempo. Nada urgente vive aqui.';

  @override
  String get howItWorksYou => 'A aba Você';

  @override
  String get howItWorksYouBody => 'Sua conta, configurações, sair. É tudo.';

  @override
  String get howItWorksRule =>
      'A regra: 5 coisas pequenas, todos os dias, sem desculpas.';

  @override
  String get commonRetry => 'Tentar novamente';

  @override
  String get commonBack => 'Voltar';

  @override
  String get commonDismiss => 'Dispensar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonSend => 'Enviar';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get commonShowLess => 'Mostrar menos';

  @override
  String get commonViewFull => 'Ver notas completas';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonDone => 'Feito';

  @override
  String get commonError => 'Algo deu errado';

  @override
  String get commonPageNotFound => 'Página não encontrada';

  @override
  String get commonHome => 'Início';

  @override
  String get commonUnknownError => 'Erro de roteamento desconhecido';

  @override
  String get commonSettingsTooltip => 'Configurações';

  @override
  String get commonHowThisWorks => 'Como funciona';

  @override
  String get myDayReminderSet => 'Lembrete definido';

  @override
  String get myDayPreparationNotes => 'NOTAS DE PREPARAÇÃO';

  @override
  String get onboardingSkip => 'PULAR';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get onboardingEnterSanctuary => 'Entrar no Santuário';

  @override
  String get onboardingIntroduction => 'INTRODUÇÃO';

  @override
  String get onboardingGrowYourForest => 'CRESCA SUA FLORESTA';

  @override
  String get onboardingPage1Title => 'Conheça seu Guardião.';

  @override
  String get onboardingPage1Body =>
      'Bem-vindo ao seu Santuário Pessoal. Aqui, seu crescimento se reflete na vida da sua floresta.';

  @override
  String get onboardingPage2Title => 'Plante sementes. Veja crescer.';

  @override
  String get onboardingPage2Body =>
      'Cada tarefa é uma sementinha. Cada hábito é um broto que você cuida todos os dias. Juntos, eles formam uma floresta de disciplina.';

  @override
  String get onboardingPage3Title => 'Cinco tarefas. Uma corrente.';

  @override
  String get onboardingPage3Body =>
      'Você só pode plantar 5 sementes por dia. Essa restrição força você a se concentrar no que realmente importa — e proteger sua corrente.';

  @override
  String get onboardingPage4Title => 'Cuide dos brotos diariamente.';

  @override
  String get onboardingPage4Body =>
      'Toque nos hábitos para fazê-los crescer. Pule um dia e a corrente não se estende. O Guardião cresce com você.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Plante sua primeira semente.';

  @override
  String get authWelcomeBack => 'Bem-vindo de volta, Guardião.';

  @override
  String get authFiveTasksDaily =>
      'Cinco tarefas. Hábitos diários. Sem desculpas.';

  @override
  String get authSanctuaryWaiting => 'Seu santuário está esperando.';

  @override
  String get authSignIn => 'Entrar';

  @override
  String get authSignUp => 'Cadastrar-se';

  @override
  String get authEmail => 'E-MAIL';

  @override
  String get authPassword => 'SENHA';

  @override
  String get authEmailHint => 'seu@email.com';

  @override
  String get authCreateAccount => 'Criar conta';

  @override
  String get authSignInCta => 'Entrar';

  @override
  String get authOrContinueWith => 'ou continuar com';

  @override
  String get authContinueWithGoogle => 'Continuar com Google';

  @override
  String get authEnterEmail => 'Digite seu e-mail';

  @override
  String get authEnterValidEmail => 'Digite um endereço de e-mail válido';

  @override
  String get authPasswordTooShort => 'A senha deve ter pelo menos 6 caracteres';

  @override
  String get authAccountCreated =>
      'Conta criada. Mude para Entrar e use sua senha.';

  @override
  String get authSomethingWentWrong => 'Algo deu errado. Tente novamente.';

  @override
  String get authCouldNotStartGoogle =>
      'Não foi possível iniciar o login com Google.';

  @override
  String get authMidnightReset =>
      'Ao entrar, você aceita que seu dia reinicia à meia-noite.';

  @override
  String get authSetupRequired => 'Configuração necessária';

  @override
  String get settingsPersonalSanctuary => 'SANTUÁRIO PESSOAL';

  @override
  String get settingsHowThisWorks => 'Como funciona';

  @override
  String get settingsHowThisWorksSubtitle =>
      'O que o app faz, como a restrição e a sequência funcionam';

  @override
  String get settingsStreakProtection => 'Proteção de sequência';

  @override
  String get settingsStreakProtectionAvailable =>
      '1 congelamento disponível este mês';

  @override
  String get settingsStreakProtectionUsed => 'Usado para este mês';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Gerenciar assinatura Pro';

  @override
  String get settingsProCancelPlay => 'Cancelar ou mudar plano no Google Play';

  @override
  String get settingsProUnlock =>
      'Desbloquear todos os 5 hábitos, histórico completo e mais';

  @override
  String get settingsTaskAlarms => 'Alarmes de tarefa & Chamado Final';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Toque noturno e aviso de meia-noite';

  @override
  String get settingsHomeScreenWidget => 'Widget da tela inicial';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Adicione sua sequência de corrente à tela inicial';

  @override
  String get settingsShareBloomTracker => 'Compartilhar Daily Stitch';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Conte a um amigo sobre a corrente';

  @override
  String get settingsHelpSupport => 'Ajuda & Suporte';

  @override
  String get settingsHelpSupportSubtitle =>
      'Perguntas frequentes ou reportar um problema';

  @override
  String get settingsSignOutTile => 'Sair';

  @override
  String get settingsAllFeaturesUnlocked => 'Todos os recursos desbloqueados';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Versão beta — assinaturas pausadas enquanto testamos tudo.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'Versão $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Versão 1.0.0';

  @override
  String get settingsHabitMaster => 'Mestre dos Hábitos';

  @override
  String settingsLevel(Object level) {
    return 'Nível $level · Mestre dos Hábitos';
  }

  @override
  String get languagePickerTitle => 'Idioma';

  @override
  String get youLast7Days => 'Últimos 7 dias';

  @override
  String get youLast7DaysSubtitle => 'Histórico de tarefas dia a dia';

  @override
  String get youLeftBehindSubtitle =>
      'Tarefas perdidas esperando para serem re-adicionadas';

  @override
  String get youProTier => 'Nível Pro';

  @override
  String get youFreeTier => 'Nível Gratuito';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Grátis';

  @override
  String youLevelLabel(Object level) {
    return 'Nível $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'Melhor $days d';
  }

  @override
  String get youPlantHabit => 'Plante um hábito para iniciar uma corrente.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'Desbloqueie o sistema completo de disciplina.';

  @override
  String get youProFeatures =>
      '5 espaços de hábitos, histórico completo, medalhas lendárias, congelamentos mensais de sequência, cartões de compartilhamento semanais.';

  @override
  String get youSeePlans => 'Ver planos';

  @override
  String youFromPrice(Object price) {
    return 'a partir de $price/mês';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch · Hábitos & Tarefas';

  @override
  String get progressMedals => 'Medalhas';

  @override
  String get progressLast7Days => 'Últimos 7 dias';

  @override
  String get progressSeeAll => 'Ver todas';

  @override
  String get progressSeeDayByDayActivity => 'Veja sua atividade dia a dia';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done de $total tarefas finalizadas · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Nenhuma medalha ainda — finalize uma tarefa ou cuide de um broto para começar.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Ver todas as medalhas · $earned de $total conquistadas';
  }

  @override
  String get progressGuardianInsight => 'Insight do Guardião';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'PRÓXIMO EMBLEMA · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return 'Meta de $days dias';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Ajuda & Suporte';

  @override
  String get helpBody =>
      'A maioria das respostas está abaixo. Se não encontrar, nos envie uma mensagem e geralmente respondemos em 2–3 dias.';

  @override
  String get helpSectionFAQ => 'PERGUNTAS FREQUENTES';

  @override
  String get helpSectionContact => 'AINDA COM DÚVIDAS?';

  @override
  String get helpAddMessage => 'Adicione uma mensagem curta primeiro.';

  @override
  String get helpOpening => 'Abrindo seu app de e-mail…';

  @override
  String get helpEmailUs => 'Envie-nos um e-mail';

  @override
  String get helpOpeningAction => 'Abrindo…';

  @override
  String get helpCopyEmail => 'Copiar e-mail de suporte';

  @override
  String get helpCopiedEmail => 'Copiado support@dailystitch.app';

  @override
  String get helpNoMailApp =>
      'Nenhum app de e-mail encontrado. Envie um e-mail para support@dailystitch.app.';

  @override
  String get helpTopicLabel => 'Assunto';

  @override
  String get helpWhatHappened => 'O que aconteceu?';

  @override
  String get helpHint => 'Uma descrição curta ajuda muito…';

  @override
  String get helpDisclaimer =>
      'Ao tocar em \"Envie-nos um e-mail\", seu app de e-mail abre com uma mensagem pré-preenchida (nenhum dado sai do seu dispositivo até você enviar).';

  @override
  String get helpFaqQ1 => 'O que é a restrição de 5 tarefas?';

  @override
  String get helpFaqA1 =>
      'Você pode adicionar até 5 tarefas por dia local. A 6ª é bloqueada de propósito — disciplina vence sobrecarga. A restrição é o recurso, não uma limitação.';

  @override
  String get helpFaqQ2 => 'O que acontece à meia-noite?';

  @override
  String get helpFaqA2 =>
      'Na meia-noite do seu horário local, qualquer tarefa ainda marcada como aberta recebe o selo \"perdida\" e vai para Pendentes. Sequências de hábitos são redefinidas se o hábito não foi concluído no dia anterior.';

  @override
  String get helpFaqQ3 => 'O que são Pendentes?';

  @override
  String get helpFaqA3 =>
      'Uma lista gentil e dispensável de tarefas que você não finalizou. Abra-a, re-adicione apenas o que ainda importa e deixe o resto ir. O nível Gratuito mostra os últimos 7 dias; o Pro mostra o histórico completo.';

  @override
  String get helpFaqQ4 => 'Como as sequências funcionam?';

  @override
  String get helpFaqA4 =>
      'Um dia estende a corrente quando você teve pelo menos 1 tarefa e 0 foram perdidas. Dias com zero tarefas não estendem nem quebram a corrente. Um congelamento de sequência perdoa um dia perdido por mês.';

  @override
  String get helpFaqQ5 => 'O que é o congelamento de sequência?';

  @override
  String get helpFaqA5 =>
      'Um \"congelamento\" por mês calendário, apenas para o Pro. Use-o em um dia que você perdeu para manter sua corrente viva. Encontre-o na aba Progresso.';

  @override
  String get helpFaqQ6 => 'Onde meus dados são armazenados?';

  @override
  String get helpFaqA6 =>
      'Todos os dados ficam no Supabase (Postgres) vinculados à conta que fez login. Nunca vendemos ou compartilhamos. Veja a política de privacidade no link da listagem na Play Store para detalhes completos.';

  @override
  String get helpFaqQ7 => 'Como excluo minha conta?';

  @override
  String get helpFaqA7 =>
      'Vá para Configurações → Conta → Excluir conta. Isso remove permanentemente seu perfil, tarefas, hábitos e dados de assinatura. Assinaturas ativas do Play devem ser canceladas separadamente no Google Play.';

  @override
  String get helpTopicsGeneral => 'Pergunta geral';

  @override
  String get helpTopicsBug => 'Relatório de bug';

  @override
  String get helpTopicsStreak => 'Problema de sequência';

  @override
  String get helpTopicsBilling => 'Cobrança ou nível Pro';

  @override
  String get helpTopicsAccount => 'Conta & dados';

  @override
  String get helpTopicsFeature => 'Solicitação de recurso';

  @override
  String get helpAccountAnon => '(não conectado)';

  @override
  String get splashTagline =>
      'Cuide de pequenas sementes. Cresça uma floresta.';

  @override
  String get priorityStandard => 'PADRÃO';

  @override
  String get priorityVital => 'VITAL';

  @override
  String get prioritySpark => 'FAÍSCA';

  @override
  String get settingsDeleteAccount => 'Excluir conta';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Remover seus dados permanentemente';

  @override
  String get settingsDeleteAccountConfirmTitle => 'Excluir sua conta?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Isso exclui permanentemente seu perfil, tarefas, hábitos e progresso. Assinaturas ativas devem ser canceladas separadamente no Google Play. Isso não pode ser desfeito.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Excluir para sempre';

  @override
  String get settingsDeleteAccountSuccess => 'Sua conta foi excluída.';

  @override
  String get settingsDeleteAccountFailed =>
      'Não foi possível excluir a conta. Tente novamente ou envie um e-mail para support@dailystitch.app.';

  @override
  String get referralYouTitle => 'Convide amigos · ganhe Pro grátis';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress de $milestone amigos participaram';
  }

  @override
  String get referralYouShare => 'Compartilhar convite';

  @override
  String get referralYouDetails => 'Ver detalhes';

  @override
  String get referralPaywallTitle => 'Mês grátis de Pro';

  @override
  String get referralPaywallBody =>
      'Convide 5 amigos que se inscreverem → 1 mês de Pro grátis';

  @override
  String get referralPaywallProBody =>
      'Continue convidando — acumule meses grátis de Pro';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'Não foi possível carregar seu progresso. Tente novamente mais tarde.';

  @override
  String get insightsMetricCurrentChain => 'CORRENTE ATUAL';

  @override
  String get insightsMetricBestEver => 'MELHOR DE TODOS';

  @override
  String get insightsMetricTasksDone => 'TAREFAS FEITAS';

  @override
  String get insightsMetricPerfectDays => 'DIAS PERFEITOS';

  @override
  String get insightsMetricHabits => 'HÁBITOS';

  @override
  String get insightsDay => 'dia';

  @override
  String get insightsDays => 'dias';

  @override
  String get insightsSectionThisWeek => 'Esta semana';

  @override
  String get insightsShareMyWeek => 'Compartilhar minha semana';

  @override
  String get insightsShareMyWeekPro => 'Compartilhar minha semana · Pro';

  @override
  String get insightsShareReceiptText =>
      'Minha semana no Daily Stitch. Não quebre a corrente.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Mostrando os últimos $days dias';
  }

  @override
  String get insightsHistoryUpsell =>
      'Desbloqueie seu histórico completo com Pro';

  @override
  String get referralScreenTitle => 'Convidar amigos';

  @override
  String get referralLaunchGift => 'Presente do mês de lançamento';

  @override
  String get referralRewardTitle => 'Ganhe 1 mês de Pro grátis';

  @override
  String get referralRewardBody =>
      'Compartilhe seu código com amigos. Quando 5 pessoas se inscreverem usando ele, você desbloqueia o Daily Stitch Pro por um mês completo.';

  @override
  String get referralYourCode => 'Seu código de indicação';

  @override
  String get referralCopyCodeTooltip => 'Copiar código';

  @override
  String get referralCodeCopied => 'Código de indicação copiado';

  @override
  String get referralShareWithFriends => 'Compartilhar com amigos';

  @override
  String get referralFooterHint =>
      'Os amigos inserem seu código ao criar uma conta. Cada amigo conta uma vez para sua recompensa.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count amigo participou';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count amigos participaram';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'Você ganhou $count mês grátis de Pro.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'Você ganhou $count meses grátis de Pro.';
  }

  @override
  String get referralRewardUnlocked =>
      'Recompensa desbloqueada — aproveite seu mês grátis de Pro!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining mais para desbloquear seu mês grátis';
  }

  @override
  String youProMemberSince(String month) {
    return 'Membro Bloom Pro desde $month';
  }

  @override
  String get youProPerksTitle => 'Seus benefícios Pro';

  @override
  String get manageProThankYou => 'Obrigado por apoiar o Bloom';

  @override
  String get manageProReferralHint =>
      'Convide mais amigos para estender seu Pro';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nAdicione SUPABASE_URL e SUPABASE_PUBLISHABLE_KEY (ou o legado SUPABASE_ANON_KEY) ao arquivo leanspace/.env, depois reconstrua:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Padrão do sistema';

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
  String get onboardingLanguageTitle => 'Escolha seu idioma';

  @override
  String get onboardingLanguageBody =>
      'Escolha o idioma que você gostaria de usar no Daily Stitch. Você pode alterá-lo a qualquer momento nas Configurações.';

  @override
  String get onboardingLanguageContinue => 'Continuar';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Amigo';

  @override
  String get settingsAppTheme => 'Tema do App';

  @override
  String get settingsAppThemeSubtitle =>
      'Escolha as cores do seu santuário pessoal';

  @override
  String get settingsInviteFriendsTitle => 'Convidar amigos · Pro grátis';

  @override
  String get settingsInviteFriendsSubtitle =>
      'Ganhe 1 mês grátis quando 5 amigos participarem';

  @override
  String get themePickerTitle => 'Santuário Pessoal';

  @override
  String get themePickerSubtitle =>
      'Escolha uma paleta de cores que traga paz.';

  @override
  String get themeNameClassicBloom => 'Floração Clássica';

  @override
  String get themeNameSolarTerracotta => 'Terracota Solar';

  @override
  String get themeNameMidnightOasis => 'Oásis da Meia-Noite';

  @override
  String get themeNameLavenderDream => 'Sonho de Lavanda';

  @override
  String get themeNameNordicFrost => 'Geada Nórdica';

  @override
  String get themeNameCyberpunkNeon => 'Neon Cyberpunk';

  @override
  String get reminderTitle => 'Lembretes';

  @override
  String get reminderBody =>
      'O Chamado Final avisa você antes da meia-noite se houver tarefas ainda abertas.';

  @override
  String get reminderFinalCall => 'Chamado Final';

  @override
  String get reminderEveningNudge => 'Toque noturno';

  @override
  String get reminderChangeTime => 'Alterar horário';

  @override
  String get reminderSave => 'Salvar lembretes';

  @override
  String get notificationChannelReminders => 'Lembretes do Daily Stitch';

  @override
  String get notificationChannelRemindersDesc =>
      'Toque noturno e lembretes do Chamado Final';

  @override
  String get notificationChannelAlarms => 'Alarmes de tarefa do Daily Stitch';

  @override
  String get notificationChannelAlarmsDesc =>
      'Alarmes altos para lembretes de tarefas';

  @override
  String get notificationTaskReminderTitle => 'Lembrete de tarefa';

  @override
  String get notificationFinalCallTitle => 'Chamado Final';

  @override
  String notificationFinalCallBody(int count) {
    return 'Você ainda tem $count tarefa(s) aberta(s) hoje.';
  }

  @override
  String get notificationEveningTitle => 'Verificação noturna';

  @override
  String get notificationEveningBody => 'Como seu jardim cresceu hoje?';

  @override
  String get widgetSetupTitle => 'Adicionar widget de corrente';

  @override
  String get widgetSetupBody =>
      'Mantenha sua sequência na tela inicial — sem precisar abrir o app.';

  @override
  String get widgetSetupAdd => 'Adicionar à tela inicial';

  @override
  String get widgetSetupStep1 => 'Pressione longamente na tela inicial';

  @override
  String get widgetSetupStep2 => 'Toque em Widgets';

  @override
  String get widgetSetupStep3 => 'Encontre o Daily Stitch e arraste';

  @override
  String get widgetSetupPinSuccess =>
      'Verifique sua tela inicial para posicionar o widget.';

  @override
  String get widgetSetupPinFallback =>
      'Seu launcher pode não suportar adição com um toque. Use os passos manuais abaixo.';

  @override
  String get paywallWelcomePro => 'Bem-vindo ao Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'ECONOMIZE ~16%';

  @override
  String get paywallTermsTitle => 'Termos da assinatura';

  @override
  String get paywallTermsBody =>
      'A cobrança é tratada pelo Google Play. As assinaturas renovam automaticamente até que você cancele na Play Store → Assinaturas pelo menos 24 horas antes do término do período atual. Você pode gerenciar ou cancelar sua assinatura a qualquer momento na sua conta do Google Play.\n\nDesinstalar o app não cancela sua assinatura.\n\nOs preços exibidos estão na sua moeda local e podem variar por região. Impostos podem ser aplicados.';

  @override
  String get paywallPrivacyTitle => 'Privacidade';

  @override
  String get paywallPrivacyBody =>
      'O Daily Stitch armazena suas tarefas, hábitos e dados de sequência em nosso backend Supabase, vinculados à sua conta. Nunca vendemos seus dados.\n\nAs compras de assinatura são processadas pelo Google Play. Recebemos um token de compra verificado do Google para confirmar seu status Pro. Não vemos nem armazenamos seus dados de pagamento.\n\nVocê pode solicitar exportação completa de dados ou exclusão de conta em Configurações → Exclusão de conta.';

  @override
  String get paywallCloseTooltip => 'Fechar';

  @override
  String get paywallFooterLinks => 'Restaurar · Termos · Privacidade';

  @override
  String get manageProTitle => 'Assinatura Pro';

  @override
  String get manageProActive => 'Ativa';

  @override
  String get manageProNotSubscribed => 'Não assinado';

  @override
  String get manageProFreeTier => 'Nível Gratuito';

  @override
  String manageProRenewsOn(String date) {
    return 'Renova ou expira em $date.';
  }

  @override
  String get manageProFreeBody =>
      'Você está usando o Daily Stitch Gratuito. Faça upgrade para desbloquear o sistema completo.';

  @override
  String get manageProSectionManage => 'GERENCIAR';

  @override
  String get manageProOpenPlay => 'Abrir assinaturas do Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Cancelar, mudar plano ou atualizar método de pagamento';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Encontre sua assinatura existente (se houver) aqui';

  @override
  String get manageProShareApp => 'Compartilhar Daily Stitch';

  @override
  String get manageProShareSubtitle => 'Conte a um amigo sobre a corrente';

  @override
  String get manageProSectionHelp => 'PRECISA DE AJUDA?';

  @override
  String get manageProHelpTitle => 'Ajuda & Suporte';

  @override
  String get manageProHelpSubtitle =>
      'FAQ de assinatura, contato, relatórios de bugs';

  @override
  String manageProBillingFooter(String version) {
    return 'Cobrança tratada pelo Google Play · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Abra o app Google Play Store → toque no seu perfil → Pagamentos & assinaturas → Assinaturas.';

  @override
  String get addTaskGrowSomething => 'Cultivar Algo';

  @override
  String get addTaskPlantSprout => 'Plantar um BROTO';

  @override
  String get addTaskIntentionName => 'NOME DA INTENÇÃO';

  @override
  String get addTaskSproutName => 'NOME DO BROTO';

  @override
  String get addTaskHintTask => 'ex., Saudação ao Sol da Manhã';

  @override
  String get addTaskHintHabit => 'ex. Yoga Matinal';

  @override
  String get addTaskWhen => 'QUANDO?';

  @override
  String get addTaskPriority => 'PRIORIDADE';

  @override
  String get addTaskNotes => 'NOTAS';

  @override
  String get addTaskCadenceDaily => 'Diário';

  @override
  String get addTaskCadenceWeekdays => 'Dias úteis';

  @override
  String get addTaskCadence3x => '3x/semana';

  @override
  String get addTaskCadenceWeekly => 'Semanal';

  @override
  String get addTaskPlantIntention => 'Plantar Intenção';

  @override
  String get addTaskPlantSproutCta => 'Plantar Broto';

  @override
  String get addTaskPlanting => 'Plantando…';

  @override
  String get addTaskNameIntentionError => 'Dê um nome à sua intenção';

  @override
  String get addTaskNameSproutError => 'Dê um nome ao seu broto';

  @override
  String get addTaskNotesMigrationWarning =>
      'Tarefa salva. Notas e prioridade precisam da migração mais recente do Supabase — execute supabase/migrations/20260701000000_todos_notes_priority.sql.';

  @override
  String get addTaskNoSproutSlots =>
      'Nenhum espaço de broto vazio — cuide de um primeiro.';

  @override
  String get addTaskSaveSproutError =>
      'Não foi possível salvar o broto — tente novamente.';

  @override
  String get addTaskElementWater => 'ÁGUA';

  @override
  String get addTaskElementLight => 'LUZ';

  @override
  String get addTaskElementSoil => 'SOLO';

  @override
  String get addTaskElementBreeze => 'BRIOSA';

  @override
  String get addTaskCadenceLabel => 'CADÊNCIA';

  @override
  String get addTaskPreparationNotes => 'NOTAS DE PREPARAÇÃO';

  @override
  String get addTaskTendingNotes => 'NOTAS DE CUIDADO';

  @override
  String get addTaskNotesHintTask =>
      'Algumas ferramentas ou dicas de mentalidade para esta tarefa?';

  @override
  String get addTaskNotesHintHabit => 'Como é cuidar deste broto?';

  @override
  String get addTaskChooseElement => 'ESCOLHA O ELEMENTO';

  @override
  String get addTaskElementsTooltip => 'O que os elementos significam?';

  @override
  String get addTaskTaskSeed => 'Semente de Tarefa';

  @override
  String get addTaskHabitSprout => 'Broto de Hábito';

  @override
  String get addTaskPickElement => 'Escolha o elemento certo';

  @override
  String get addTaskPickElementBody =>
      'Cada elemento corresponde a um tipo diferente de esforço. O Guardião cresce mais forte quando você rega o elemento certo.';

  @override
  String get addTaskClearForm => 'Limpar formulário';

  @override
  String get shareCouldNotShare => 'Não foi possível compartilhar agora';

  @override
  String get authReferralCodeLabel => 'Código de indicação (opcional)';

  @override
  String get authReferralCodeHint => 'Código do amigo';

  @override
  String get youPerkHabitSlots => '5 espaços de hábitos';

  @override
  String get youPerkFullHistory => 'Histórico completo';

  @override
  String get youPerkAllThemes => 'Todos os temas';

  @override
  String get youPerkStreakFreezes => '2 congelamentos de sequência / mês';

  @override
  String get youPerkLegendaryMedals => 'Medalhas lendárias';

  @override
  String get subscriptionPurchaseFailed => 'Compra falhou. Tente novamente.';

  @override
  String get subscriptionUnavailable =>
      'Compras in-app estão indisponíveis neste dispositivo.';

  @override
  String get subscriptionLoadFailed =>
      'Não foi possível carregar as opções de assinatura.';

  @override
  String get subscriptionVerifyFailed =>
      'Não foi possível verificar a compra. Tente Restaurar compra.';

  @override
  String get streakFreezeFailed =>
      'Não foi possível usar o congelamento de sequência.';

  @override
  String get streakFreezeAlreadyUsed =>
      'Você já usou seu congelamento este mês.';

  @override
  String get streakFreezeNoMissed =>
      'Nenhuma tarefa perdida nesse dia para congelar.';

  @override
  String get streakFreezeNotPastDay => 'Você só pode congelar um dia passado.';

  @override
  String get myDayLoadError =>
      'Não foi possível carregar Meu Dia. Puxe para atualizar.';

  @override
  String get myDayCapReached =>
      'Você atingiu a restrição de 5 tarefas de hoje.';

  @override
  String get myDayRemoveTaskError => 'Não foi possível remover a tarefa.';

  @override
  String get shareCardTitle => 'Compartilhe sua semana';

  @override
  String get shareCardCta => 'Compartilhar imagem';

  @override
  String get medalTierSprout => 'Broto';

  @override
  String get medalTierCommon => 'Comum';

  @override
  String get medalTierRare => 'Raro';

  @override
  String get medalTierEpic => 'Épico';

  @override
  String get medalTierLegendary => 'Lendário';

  @override
  String get medalCategoryTasks => 'Tarefas';

  @override
  String get medalCategoryHabits => 'Hábitos';

  @override
  String get medalCategoryStreaks => 'Sequências';

  @override
  String get medalCategoryMastery => 'Maestria';

  @override
  String get medalsShareTooltip => 'Compartilhar conquistas';

  @override
  String get medalsFilterAll => 'Todas';

  @override
  String get addHabitTitleNew => 'Plantar um novo broto';

  @override
  String get addHabitTitleEdit => 'Cuidar do seu broto';

  @override
  String get addHabitLabelSproutName => 'NOME DO BROTO';

  @override
  String get shareCardAppBarTitle => 'Cartão de compartilhamento';

  @override
  String get shareCardAppBarTitleMedal => 'Compartilhe sua medalha';

  @override
  String shareCardDescMedal(Object title) {
    return 'Exiba seu novo emblema $title';
  }

  @override
  String get shareCardBodyMedal =>
      'Compartilhe a vitória com seu círculo. O cartão é exportado como PNG e está pronto para qualquer app de rede social.';

  @override
  String get shareCardCtaPreparing => 'Preparando…';

  @override
  String get shareCardMilestone => 'NOVO MARCO DESBLOQUEADO';

  @override
  String get shareCardStatChain => 'dias de corrente';

  @override
  String get shareCardStatSprouts => 'brotos';

  @override
  String get shareCardStatMedals => 'medalhas';

  @override
  String shareCardHeadlineStreak(int days) {
    return 'Sequência de $days Dias';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Medalhas Conquistadas';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Guardião de Brotos';

  @override
  String get shareCardHeadlineFirstSeeds => 'Primeiras Sementes Plantadas';

  @override
  String get shareCardHeadlineGardenBegins => 'Um Jardim Começa';

  @override
  String get shareCardSubheadMonth =>
      'Você cuidou dos seus hábitos com sucesso por um mês completo.';

  @override
  String get shareCardSubheadWeek =>
      'Uma semana completa de crescimento — sua floresta está engrossando.';

  @override
  String get shareCardSubheadProgress =>
      'Seu santuário está mostrando progresso real. Continue cuidando.';

  @override
  String get shareCardSubheadSprouts =>
      'Seus primeiros brotos estão enraizando. Regue-os diariamente.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Suas primeiras sementes estão no solo. Veja abrir.';

  @override
  String get shareCardSubheadFallback =>
      'Toda floresta começa com uma única escolha pequena.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — cinco sementinhas por dia, uma corrente inquebrável. Plante a sua.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Experimente o Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Estou construindo minha corrente diária no Daily Stitch — junte-se a mim com meu código de indicação $code e ambos crescemos.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Junte-se a mim no Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Meu progresso no Daily Stitch — $year no Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Acabei de desbloquear a medalha \"$title\" no Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Tarefas feitas';

  @override
  String get insightsReceiptPerfectDays => 'Dias perfeitos';

  @override
  String get insightsReceiptCompletion => 'Conclusão';

  @override
  String insightsReceiptDate(String date) {
    return 'Semana de $date';
  }

  @override
  String get insightsReceiptFooter => 'Não quebre a corrente.';

  @override
  String get elementLabelWater => 'Água';

  @override
  String get elementLabelLight => 'Luz';

  @override
  String get elementLabelSoil => 'Solo';

  @override
  String get elementLabelBreeze => 'Brisa';

  @override
  String get elementTaglineWater =>
      'Restaurar. Hidratação, descanso, cuidado emocional — qualquer coisa que encha o poço.';

  @override
  String get elementTaglineLight =>
      'Despertar. Luz da manhã, blocos de foco, estudo, meditação — energia e clareza.';

  @override
  String get elementTaglineSoil =>
      'Enraizar. Leitura, diário, trabalho profundo — raízes lentas que constroem força a longo prazo.';

  @override
  String get elementTaglineBreeze =>
      'Mover. Caminhadas, corridas, respiração — energia leve e móvel que limpa a cabeça.';

  @override
  String get elementWhenWater => 'Quando você se sentir esgotado ou vazio.';

  @override
  String get elementWhenLight =>
      'Quando precisar de um início claro para seu dia.';

  @override
  String get elementWhenSoil =>
      'Quando o trabalho é lento mas vale a pena (estudo, ofício, cuidado).';

  @override
  String get elementWhenBreeze =>
      'Quando seu corpo (ou mente) precisa se mover e respirar.';

  @override
  String get bloomTierMastery => 'Maestria';

  @override
  String get bloomTierStrong => 'Forte';

  @override
  String get bloomTierGrowing => 'Crescendo';

  @override
  String get bloomTierSprouting => 'Brotando';

  @override
  String get bloomTierLocked => 'Bloqueado';

  @override
  String habitBloomSubtitle(int count, String element) {
    return '$count dias de sequência · $element';
  }

  @override
  String get medal_id_first_spark => 'Primeira Faísca';

  @override
  String get medal_sub_first_spark => 'Acendeu a chama.';

  @override
  String get medal_desc_first_spark =>
      'Termine sua primeira tarefa. Toda corrente começa aqui.';

  @override
  String get medal_id_triple_seed => 'Tríplice Semente';

  @override
  String get medal_sub_triple_seed => 'Três no solo.';

  @override
  String get medal_desc_triple_seed => 'Termine 3 tarefas no total.';

  @override
  String get medal_id_dozen_sower => 'Semeador de Dúzia';

  @override
  String get medal_sub_dozen_sower => 'Um campo de doze.';

  @override
  String get medal_desc_dozen_sower => 'Termine 12 tarefas no total.';

  @override
  String get medal_id_quarter_century => 'Quarto de Século';

  @override
  String get medal_sub_quarter_century => 'Uma temporada de sim.';

  @override
  String get medal_desc_quarter_century => 'Termine 25 tarefas no total.';

  @override
  String get medal_id_productivity_titan => 'Titã da Produtividade';

  @override
  String get medal_sub_productivity_titan => 'Consistência se acumula.';

  @override
  String get medal_desc_productivity_titan =>
      'Termine 50 tarefas — você construiu momentum real.';

  @override
  String get medal_id_century_planter => 'Plantador do Século';

  @override
  String get medal_sub_century_planter => 'Uma floresta sua.';

  @override
  String get medal_desc_century_planter =>
      'Termine 100 tarefas. Você está no top 5% dos usuários.';

  @override
  String get medal_id_clean_day => 'Dia Limpo';

  @override
  String get medal_sub_clean_day => 'Nem uma erva daninha.';

  @override
  String get medal_desc_clean_day =>
      'Termine cada tarefa que planta em um único dia.';

  @override
  String get medal_id_triple_perfect => 'Tríplice Perfeito';

  @override
  String get medal_sub_triple_perfect => 'Três execuções impecáveis.';

  @override
  String get medal_desc_triple_perfect => 'Alcance 3 dias perfeitos.';

  @override
  String get medal_id_perfect_week => 'Semana Perfeita';

  @override
  String get medal_sub_perfect_week => 'Sete dias sem quebras.';

  @override
  String get medal_desc_perfect_week => '7 dias perfeitos seguidos.';

  @override
  String get medal_id_two_week_chain => 'Força do Fortnight';

  @override
  String get medal_sub_two_week_chain => 'Duas semanas em chamas.';

  @override
  String get medal_desc_two_week_chain => 'Mantenha uma corrente de 14 dias.';

  @override
  String get medal_id_iron_chain => 'Corrente de Ferro';

  @override
  String get medal_sub_iron_chain => '30 elos forjados.';

  @override
  String get medal_desc_iron_chain =>
      'Uma corrente de 30 dias. A medalha mais difícil.';

  @override
  String get medal_id_quarterly_chain => 'Corrente Trimestral';

  @override
  String get medal_sub_quarterly_chain => 'Uma temporada, sem quebras.';

  @override
  String get medal_desc_quarterly_chain =>
      'Uma corrente de 90 dias. Status lendário.';

  @override
  String get medal_id_vital_priority => 'Faísca Vital';

  @override
  String get medal_sub_vital_priority => 'Você escolheu as difíceis.';

  @override
  String get medal_desc_vital_priority =>
      'Termine 5 tarefas marcadas como Prioridade Vital.';

  @override
  String get medal_id_spark_priority => 'Domador de Faíscas';

  @override
  String get medal_sub_spark_priority => 'Vitórias rápidas se acumulam.';

  @override
  String get medal_desc_spark_priority =>
      'Termine 5 tarefas marcadas como Prioridade Faísca.';

  @override
  String get medal_id_note_taker => 'Anotador';

  @override
  String get medal_sub_note_taker =>
      'Planos no papel superam planos na cabeça.';

  @override
  String get medal_desc_note_taker =>
      'Adicione notas de preparação a 5 tarefas diferentes.';

  @override
  String get medal_id_left_behind_rescuer => 'Resgatador de Deixados';

  @override
  String get medal_sub_left_behind_rescuer =>
      'Nenhuma tarefa deixada para trás.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Re-adicione 3 tarefas perdidas no dia seguinte.';

  @override
  String get medal_id_first_sprout => 'Primeira Broto';

  @override
  String get medal_sub_first_sprout => 'Um novo ritual diário.';

  @override
  String get medal_desc_first_sprout => 'Plante seu primeiro hábito.';

  @override
  String get medal_id_trio_sprout => 'Tríplice Broto';

  @override
  String get medal_sub_trio_sprout => 'Um pequeno ecossistema.';

  @override
  String get medal_desc_trio_sprout => 'Plante 3 hábitos diferentes.';

  @override
  String get medal_id_week_of_growth => 'Semana de Crescimento';

  @override
  String get medal_sub_week_of_growth => 'As raízes começam a segurar.';

  @override
  String get medal_desc_week_of_growth =>
      'Cuide de um hábito todos os dias por 7 dias.';

  @override
  String get medal_id_fortnight_floret => 'Flor do Fortnight';

  @override
  String get medal_sub_fortnight_floret => 'Uma floração completa.';

  @override
  String get medal_desc_fortnight_floret =>
      'Uma sequência de hábitos de 14 dias.';

  @override
  String get medal_id_rooted_master => 'Mestre Enraizado';

  @override
  String get medal_sub_rooted_master => 'Raízes profundas, força profunda.';

  @override
  String get medal_desc_rooted_master => 'Uma sequência de hábitos de 30 dias.';

  @override
  String get medal_id_half_year_bloom => 'Floração Semestral';

  @override
  String get medal_sub_half_year_bloom => 'O jardim é permanente agora.';

  @override
  String get medal_desc_half_year_bloom =>
      'Mantenha um único hábito por 180 dias.';

  @override
  String get medal_id_garden_keeper => 'Guardião do Jardim';

  @override
  String get medal_sub_garden_keeper => 'Variedade, juntos.';

  @override
  String get medal_desc_garden_keeper =>
      'Cultive 4 hábitos diferentes ao mesmo tempo.';

  @override
  String get medal_id_hydration_hero => 'Herói da Hidratação';

  @override
  String get medal_sub_hydration_hero => 'Enche o poço.';

  @override
  String get medal_desc_hydration_hero =>
      'Plante um hábito de hidratação (água/bebida).';

  @override
  String get medal_id_mindful_mover => 'Movimento Consciente';

  @override
  String get medal_sub_mindful_mover => 'O corpo lembra.';

  @override
  String get medal_desc_mindful_mover =>
      'Plante um hábito de movimento (yoga/correr/caminhar).';

  @override
  String get medal_id_devoted_keeper => 'Guardião Devotado';

  @override
  String get medal_sub_devoted_keeper => 'Sessenta dias, uma prática.';

  @override
  String get medal_desc_devoted_keeper =>
      'Cuide de um único hábito por 60 dias seguidos.';

  @override
  String get medal_id_tending_notes => 'Notas de Cuidado';

  @override
  String get medal_sub_tending_notes => 'Refletindo pelo caminho.';

  @override
  String get medal_desc_tending_notes =>
      'Adicione notas de cuidado a 3 hábitos.';

  @override
  String get medalTierTaglineSprout => 'Plante a primeira semente';

  @override
  String get medalTierTaglineCommon => 'Construir o hábito';

  @override
  String get medalTierTaglineRare => 'Mostrando momentum real';

  @override
  String get medalTierTaglineEpic => 'Você é uma força da natureza';

  @override
  String get medalTierTaglineLegendary => 'Mítico, quase ninguém chega aqui';

  @override
  String get guardianHeadlineNoTasks =>
      'O solo de hoje está fresco.\nPlante sua primeira semente\ne veja crescer.';

  @override
  String get guardianHeadlineAllDone =>
      'Cada semente que você plantou\nestá em floração.\nDescanse, Guardião — você mereceu.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count dias\nde crescimento ininterrupto.\nSua floresta está cheia de vida.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Uma semana completa em floração,\nGuardião.\nMais um dia perfeito\nestende a corrente.';

  @override
  String get guardianHeadlineStreak3 =>
      'Sua corrente está segurando.\nCuide das sementes\nque esperam abrir.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Você está cuidando bem das tarefas.\nPlante um broto —\nhábitos fazem florestas crescerem.';

  @override
  String get guardianHeadlineSomeDone =>
      'Algumas sementes abriram,\noutras não. Tudo bem.\nAmanhã é outra plantação.';

  @override
  String get guardianHeadlineMorning =>
      'Bom dia, Guardião.\nO dia é jovem\ne o solo está pronto.';

  @override
  String get guardianHeadlineAfternoon =>
      'Boa tarde, Guardião.\nMetade da luz permanece —\ncontinue cuidando.';

  @override
  String get guardianHeadlineEvening =>
      'Boa noite, Guardião.\nUma última verificação\nantes do sol se pôr.';

  @override
  String get guardianHeadlineNight =>
      'Queimando o azeite da meia-noite?\nAté Guardiões descansam.\nPlante a semente de amanhã.';

  @override
  String get guardianBodyNoTasks =>
      'Seu santuário está silencioso agora. Adicione uma intenção e veja o que muda ao anoitecer.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count dias rodando. A corrente não é sorte — são as pequenas escolhas se acumulando. Continue acumulando.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Uma corrente de $count dias é momentum real. Termine as sementes abertas de hoje antes de dizer que terminou.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Você plantou $count tarefas até agora. Adicionar até um único broto de hábito faria o trabalho crescer dia após dia.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Você está terminando $pct% do que planta. Menos, mais afiadas sementes tendem a crescer mais altas que dez espalhadas.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Seu santuário está vivo. $tasks tarefas feitas, $sprouts brotos crescendo — o trabalho está se mostrando.';
  }

  @override
  String get guardianInsightWaitingTitle => 'Esperando seu primeiro movimento';

  @override
  String get guardianInsightWaitingBody =>
      'Adicione uma tarefa ou hábito e começarei a ler os padrões no seu jardim. Quanto mais você plantar, mais tenho para aprender.';

  @override
  String get guardianInsightWaitingCta => 'Plante sua primeira semente';

  @override
  String get guardianInsightChainSuperTitle => 'A corrente é seu superpoder';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Você manteve uma corrente de $count dias. Sequências vencem a motivação sempre — mantenha-a quente, mesmo nos dias lentos.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Adicione a semente de amanhã';

  @override
  String get guardianInsightChainColdTitle =>
      'A corrente está fria — comece uma nova';

  @override
  String get guardianInsightChainColdBody =>
      'Você plantou antes, o que significa que pode plantar de novo. Uma pequena tarefa feita hoje é uma corrente mais longa amanhã.';

  @override
  String get guardianInsightChainColdCta => 'Plante uma semente';

  @override
  String get guardianInsightLessIsMoreTitle => 'Menos é mais esta semana';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Você termina cerca de $pct% do que planta. Tente 3 intenções afiadas em vez de 5 soltas — qualidade se acumula.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Afie o dia';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Próxima medalha: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Você está em $value de $target $unit. Alguns dias mais honestos e é sua.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Mostrar medalha';

  @override
  String get guardianInsightSteadyTitle => 'Você está em uma temporada estável';

  @override
  String get guardianInsightSteadyBody =>
      'Nenhuma medalha à vista — tudo bem. Cuide do que tem. A próxima floração está a caminho.';

  @override
  String get guardianInsightSteadyCta => 'Ver progresso';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 tarefa na sua corrente. A meia-noite se aproxima.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count tarefas na sua corrente. A meia-noite se aproxima.';
  }

  @override
  String get notificationEveningBodyOne =>
      'Você ainda tem 1 tarefa aberta hoje.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Você ainda tem $count tarefas abertas hoje.';
  }

  @override
  String get notificationTickerTaskReminder => 'Lembrete de tarefa';

  @override
  String get notificationTickerTaskAlarm => 'Alarme de tarefa';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count dias de sequência · $element';
  }
}
