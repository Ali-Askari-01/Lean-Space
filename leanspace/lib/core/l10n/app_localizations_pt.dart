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
  String get tabYou => 'VocÃª';

  @override
  String get navMyDay => 'Meu dia';

  @override
  String get navSettings => 'ConfiguraÃ§Ãµes';

  @override
  String get navHelp => 'Ajuda & Suporte';

  @override
  String get navHistory => 'Ãšltimos 7 dias';

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
  String get greetingEvening => 'Boa noite, campeÃ£o';

  @override
  String get greetingNight => 'Descansando bem, guardiÃ£o?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Hoje Â· $done de $total tarefas';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done de $total hÃ¡bitos';
  }

  @override
  String get todayChainGrows => 'A CORRENTE CRECE AO FINALIZAR';

  @override
  String get todayChainComplete =>
      'CORRENTE COMPLETA Â· CUIDE DO JARDIM AMANHÃƒ';

  @override
  String get taskCapInfo => 'Por que a restriÃ§Ã£o de 5 tarefas?';

  @override
  String get taskCapDiscipline => 'DISCIPLINA EM PRIMEIRO LUGAR POR CONCEITO';

  @override
  String get taskCapTitle => 'Limitamos seu dia a 5 tarefas de propÃ³sito.';

  @override
  String get taskCapBody =>
      'Correntes pequenas vencem as longas. VocÃª tem mais chance de finalizar 3 de 5 e sentir a vitÃ³ria do que abandonar 8 de 10 e sentir a derrota.';

  @override
  String get taskCapBulletDone =>
      'Tarefas finalizadas contam para sua corrente';

  @override
  String get taskCapBulletDoneBody =>
      'Um dia em que as 5 sÃ£o finalizadas estende sua sequÃªncia em um.';

  @override
  String get taskCapBulletMissed => 'Tarefas perdidas vÃ£o para Pendentes';

  @override
  String get taskCapBulletMissedBody =>
      'Ã€ meia-noite, tarefas nÃ£o finalizadas aparecem em Pendentes. Re-adicione apenas o que ainda importa.';

  @override
  String get taskCapBulletFreeze =>
      'Congelamento de sequÃªncia perdoa uma perda';

  @override
  String get taskCapBulletFreezeBody =>
      'O Pro dÃ¡ 2 congelamentos de sequÃªncia por mÃªs â€” eles cobrem um dia perdido para sua corrente sobreviver.';

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
      '5/5 espaÃ§os usados â€” finalize um para plantar uma nova semente.';

  @override
  String get tasksEmptyCta =>
      'Plante sua primeira semente â€” o que importa hoje?';

  @override
  String get habitsHeader => 'HÃ¡bitos';

  @override
  String habitsGrowing(String count) {
    return '$count crescendo';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Melhor $days d';
  }

  @override
  String get habitsPlantNew => 'Plantar um novo broto de hÃ¡bito';

  @override
  String get habitsPlantFirst => 'Plantar um hÃ¡bito';

  @override
  String get habitsLocked =>
      'EspaÃ§o de hÃ¡bito Pro â€” desbloqueie para plantar mais brotos';

  @override
  String get habitsSlotsFull =>
      'Todos os espaÃ§os de hÃ¡bitos estÃ£o atualmente ocupados.';

  @override
  String habitsStreakDays(String days) {
    return '${days}d';
  }

  @override
  String get habitsCadence => 'DIÃRIO';

  @override
  String leftBehindBanner(String count) {
    return '$count perdidos â€” ainda em Pendentes';
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
      'Nenhuma tarefa perdida. Toda semente que vocÃª planta estÃ¡ sendo cuidada. O jardim estÃ¡ limpo.';

  @override
  String get leftBehindClearAll => 'Limpar tudo';

  @override
  String get leftBehindClearAllConfirm => 'Limpar todos os pendentes?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Isso removerÃ¡ permanentemente $count tarefa(s) perdida(s). Isso nÃ£o pode ser desfeito.';
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
  String get leftBehindWaitingOne => '1 tarefa estÃ¡ esperando por vocÃª.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count tarefas estÃ£o esperando por vocÃª.';
  }

  @override
  String get leftBehindBody =>
      'Re-adicione uma tarefa para trazÃª-la de volta ao hoje, ou deixe-a ir. Re-adicionar mantÃ©m sua corrente viva.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" estÃ¡ de volta no seu dia.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'Removido \"$task\"';
  }

  @override
  String get leftBehindClearedSnack => 'Pendentes limpos';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Ontem Â· $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count tarefa(s) restante(s) para hoje';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Ãšltimo chamado â€” $count tarefa(s) ainda aberta(s)';
  }

  @override
  String get streakAtRiskBody =>
      'A meia-noite estÃ¡ prÃ³xima. A corrente depende disso.';

  @override
  String get streakAtRiskBodyLow =>
      'VocÃª ainda tem tempo. Um dia limpo estende sua sequÃªncia.';

  @override
  String get streakAtRiskFreeze =>
      'Ontem perdido â€” usar congelamento de sequÃªncia?';

  @override
  String get streakFreezeUse => 'Usar congelamento';

  @override
  String get streakFreezeUseForYesterday =>
      'Usar congelamento mensal para ontem';

  @override
  String get streakFreezeAppliedYesterday =>
      'Congelamento de sequÃªncia aplicado para ontem.';

  @override
  String get chainBrokenTitle => 'A corrente quebrou. Tudo bem.';

  @override
  String get chainBrokenBody =>
      'Toda corrente longa termina uma vez. O que importa Ã© o que vocÃª planta hoje. Um dia perfeito comeÃ§a o prÃ³ximo.';

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
  String get chainRecoveryFreshStart => 'Um novo comeÃ§o';

  @override
  String get medalsTitle => 'Minhas medalhas';

  @override
  String get medalsTrophyRoom => 'Sala de trofÃ©us';

  @override
  String get medalsAllMedals => 'Todas as medalhas';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned de $total medalhas conquistadas';
  }

  @override
  String get medalsTrophyEmpty =>
      'Seu primeiro emblema estÃ¡ a uma tarefa de distÃ¢ncia';

  @override
  String get medalsTrophyFirst =>
      'VocÃª conquistou sua primeira medalha â€” continue';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned medalhas na sua sala de trofÃ©us';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'Progresso para todas as $total medalhas';
  }

  @override
  String get medalsShareCta => 'Criar um cartÃ£o compartilhÃ¡vel';

  @override
  String get medalsEmptyTitle => 'Nada nesta categoria ainda';

  @override
  String get medalsEmptyBody =>
      'Finalize uma tarefa ou cuide de um broto para comeÃ§ar sua sala de trofÃ©us.';

  @override
  String get medalSheetLocked => 'MEDALHA PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'CONQUISTADA Â· $tier';
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
  String get historyTitle => 'Ãšltimos 7 dias';

  @override
  String get historyFullTitle => 'HistÃ³rico completo';

  @override
  String get historyLoadError => 'NÃ£o foi possÃ­vel carregar o histÃ³rico.';

  @override
  String get historyFullCalendar => 'CalendÃ¡rio completo';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% concluÃ­do';
  }

  @override
  String historyThisWeek(String days) {
    return 'ÃšLTIMOS $days DIAS';
  }

  @override
  String get historyDayByDay => 'DIA A DIA';

  @override
  String get historyEmpty =>
      'Plante algumas sementes para ver sua semana se desenrolar.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'VocÃª finalizou $done de $total tarefas. $perfect dia(s) perfeito(s).';
  }

  @override
  String get historyUpsellTitle => 'Veja seu histÃ³rico completo';

  @override
  String get historyUpsellBody =>
      'O Pro desbloqueia 30 dias de histÃ³rico. O Gratuito mostra 7.';

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
      'Plante uma semente para comeÃ§ar seu jardim.';

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
  String get progressMetricHabits => 'HÃ¡bitos';

  @override
  String get progressHabitBlooms => 'FloraÃ§Ãµes de hÃ¡bitos';

  @override
  String get progressHabitBloomsSub =>
      'Marcos de sequÃªncia para os brotos que vocÃª rega diariamente.';

  @override
  String get progressNextBadge => 'PrÃ³ximo emblema';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned de $total';
  }

  @override
  String get progressPersonalActivity => 'Atividade Pessoal';

  @override
  String progressBrowseMonth(String month) {
    return 'Navegando $month. Toque em \"Hoje\" para voltar Ã  sua atividade atual.';
  }

  @override
  String get progressJumpToToday => 'Hoje';

  @override
  String get progressCalendarLegend => 'mais escuro = mais finalizados';

  @override
  String get progressCalendarBody =>
      'Verde escuro significa um dia perfeito. A tonalidade desvance conforme vocÃª pula.';

  @override
  String get paywallTitle => 'Mantenha a corrente inquebrÃ¡vel.';

  @override
  String get paywallSubtitle =>
      'O Daily Stitch Pro dÃ¡ a vocÃª o sistema completo de disciplina.';

  @override
  String get paywallFeatures =>
      'Todos os 5 espaÃ§os de hÃ¡bitos, nÃ£o apenas 3|Seu histÃ³rico completo, para sempre|O conjunto completo de medalhas|Congelamento de sequÃªncia todo mÃªs|Recibo semanal + cartÃµes de compartilhamento|Temas + mais';

  @override
  String get paywallFeaturesBodies =>
      'O Gratuito dÃ¡ 3. O Pro desbloqueia todos os cinco para que seu ritual diÃ¡rio completo possa viver aqui.|Navegue por cada dia que vocÃª completou â€” nÃ£o apenas os Ãºltimos 7. Olhe para trÃ¡s anos, nÃ£o semanas.|Desbloqueie medalhas de nÃ­vel LendÃ¡rio. Os emblemas mais raros sÃ£o para quem vai atÃ© o final.|2 congelamentos de sequÃªncia por mÃªs para que um Ãºnico dia ruim nÃ£o encerre sua corrente.|Belos cartÃµes de compartilhamento da sua semana. Poste sua corrente, inspire alguÃ©m mais a comeÃ§ar.|Desbloqueie novas cores de destaque e temas Ã  medida que os adicionamos. Sempre atualizaÃ§Ãµes gratuitas.';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallYearlyCaption => 'Melhor valor Â· fica ~2,50 USD/mÃªs';

  @override
  String get paywallYearlyBadge => 'ECONOMIZE 35%';

  @override
  String get paywallMonthly => 'Mensal';

  @override
  String get paywallMonthlyCaption =>
      'Cobrado todo mÃªs Â· cancele quando quiser';

  @override
  String paywallStartCta(String price) {
    return 'Iniciar Pro Â· $price/ano';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Iniciar Pro Â· $price/mÃªs';
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
      'Restauraremos sua compra na prÃ³xima sincronizaÃ§Ã£o.';

  @override
  String get paywallAlreadyPro =>
      'VocÃª jÃ¡ estÃ¡ no Pro. Obrigado pelo apoio.';

  @override
  String get paywallHabitSlotHead =>
      'VocÃª usou todos os seus espaÃ§os de hÃ¡bitos gratuitos. Desbloqueie o conjunto completo para plantar todos os rituais que importam para vocÃª.';

  @override
  String get paywallHistoryHead =>
      'Veja seu histÃ³rico completo â€” cada dia perfeito, cada medalha, cada retorno.';

  @override
  String get paywallMedalHead =>
      'As medalhas mais raras sÃ£o exclusivas do Pro. Continue â€” elas estÃ£o mais perto do que vocÃª pensa.';

  @override
  String get settingsYourActivity => 'SUA ATIVIDADE';

  @override
  String get settingsHelpInfo => 'AJUDA & INFORMAÃ‡Ã•ES';

  @override
  String get settingsAccount => 'CONTA';

  @override
  String get settingsNurturingTools => 'FERRAMENTAS DE CUIDADO';

  @override
  String get settingsReminders => 'LEMBRETES';

  @override
  String get settingsWidgetSanctuary => 'SANTUÃRIO DO WIDGET';

  @override
  String get settingsEcosystemSupport => 'SUPORTE DO ECOSSISTEMA';

  @override
  String get settingsHowItWorks => 'Como funciona';

  @override
  String get settingsSignOut => 'Sair';

  @override
  String get settingsSignOutConfirm => 'Tem certeza de que deseja sair?';

  @override
  String get settingsProActive => 'Ativo';

  @override
  String get settingsProFree => 'NÃ­vel Gratuito';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageValue => 'PadrÃ£o do sistema';

  @override
  String get firstRunGreeting => '5 tarefas. NÃ£o mais. FaÃ§a-as valer.';

  @override
  String get firstRunBody =>
      'Plante sua primeira semente â€” o que mais importa hoje?';

  @override
  String get firstRunCta => 'Plante sua primeira semente';

  @override
  String get emptyStateClearAll => 'Limpar tudo';

  @override
  String get cancel => 'Cancelar';

  @override
  String get intentionTitle1 => 'Vamos plantar uma nova intenÃ§Ã£o!';

  @override
  String get intentionBody1 =>
      'Toda floresta poderosa comeÃ§a com uma Ãºnica escolha pequena. Me diga o que estamos cuidando hoje?';

  @override
  String get intentionTitle2 => 'O que vamos cultivar hoje?';

  @override
  String get intentionBody2 =>
      'Sementinhas, cuidadas com carinho, se tornam Ã¡rvores altas. Escolha a que mais importa agora.';

  @override
  String get intentionTitle3 => 'Uma semente. Uma respiraÃ§Ã£o. Comece.';

  @override
  String get intentionBody3 =>
      'VocÃª nÃ£o precisa plantar a floresta inteira de uma vez â€” apenas a prÃ³xima coisa certa.';

  @override
  String get intentionTitle4 => 'Cuide do prÃ³ximo pequeno passo.';

  @override
  String get intentionBody4 =>
      'Seu eu do futuro Ã© construÃ­do pelas escolhas que vocÃª faz nos prÃ³ximos cinco minutos. Qual Ã© uma gentil?';

  @override
  String get intentionTitle5 => 'Escolha o que vocÃª quer se tornar.';

  @override
  String get intentionBody5 =>
      'Tarefas sÃ£o sementes, hÃ¡bitos sÃ£o brotos. Juntos, eles formam uma floresta da qual vocÃª tem orgulho.';

  @override
  String get intentionTitle6 => 'Plante algo que vale a pena lembrar.';

  @override
  String get intentionBody6 =>
      'Nem todo dia vai parecer enorme. Uma semente regada ainda conta. Vamos nomear uma.';

  @override
  String get intentionTitle7 => 'Torne hoje um pouco mais corajoso.';

  @override
  String get intentionBody7 =>
      'A coragem se acumula. Escolha a semente que vocÃª vem adiando â€” mesmo nomeÃ¡-la a faz avanÃ§ar.';

  @override
  String get intentionTitle8 => 'Cuide do solo antes da semente.';

  @override
  String get intentionBody8 =>
      'Qual mentalidade, ferramenta ou pequeno ritual tornarÃ¡ esta tarefa mais fÃ¡cil? Adicione Ã s notas.';

  @override
  String get shareCardSnapshot => 'Um instantÃ¢neo do seu santuÃ¡rio';

  @override
  String get shareCardBody =>
      'O cartÃ£o acima Ã© exportado como PNG e enviado para sua aba de compartilhamento. Poste na sua histÃ³ria, envie a um amigo ou imprima como adesivo.';

  @override
  String get shareCardShareMyBloom => 'Compartilhar minha floraÃ§Ã£o';

  @override
  String get shareCardCouldNotShare => 'NÃ£o foi possÃ­vel compartilhar agora';

  @override
  String shareCardProgressText(String year) {
    return 'Meu progresso no Daily Stitch â€” $year no Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Acabei de desbloquear a medalha \"$title\" no Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Como funciona';

  @override
  String get howItWorksBody =>
      'O Daily Stitch ajuda vocÃª a manter uma corrente pequena e inquebrÃ¡vel de disciplina. Ã‰ isso.';

  @override
  String get howItWorksToday => 'A aba Hoje';

  @override
  String get howItWorksTodayBody =>
      'Este Ã© o seu lar. Mostra as 5 tarefas e os hÃ¡bitos que vocÃª definiu para hoje. Finalize-os atÃ© a meia-noite, a corrente se estende.';

  @override
  String get howItWorksCap => 'A restriÃ§Ã£o de 5 tarefas Ã© o recurso';

  @override
  String get howItWorksCapBody =>
      'NÃ³s nÃ£o deixamos vocÃª adicionar uma 6Âª. Esse Ã© o ponto todo. Correntes pequenas vencem as longas. Toque no \"?\" na tela inicial para o raciocÃ­nio completo.';

  @override
  String get howItWorksHabits =>
      'HÃ¡bitos sÃ£o diÃ¡rios, a corrente Ã© para sempre';

  @override
  String get howItWorksHabitsBody =>
      'HÃ¡bitos (Yoga matinal, Beber Ã¡gua) vivem para sempre. Tarefas sÃ£o Ãºnicas. Ambos alimentam a mesma sequÃªncia.';

  @override
  String get howItWorksLeftBehind => 'Tarefas perdidas â†’ Pendentes';

  @override
  String get howItWorksLeftBehindBody =>
      'Ã€ meia-noite, tarefas nÃ£o finalizadas vÃ£o para Pendentes. Re-adicione apenas o que ainda importa. O resto recebe um afastamento silencioso.';

  @override
  String get howItWorksProgress => 'A aba Progresso';

  @override
  String get howItWorksProgressBody =>
      'SequÃªncia, calendÃ¡rio, medalhas, histÃ³rico â€” tudo sobre como vocÃª estÃ¡ indo ao longo do tempo. Nada urgente vive aqui.';

  @override
  String get howItWorksYou => 'A aba VocÃª';

  @override
  String get howItWorksYouBody => 'Sua conta, configuraÃ§Ãµes, sair. Ã‰ tudo.';

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
  String get commonPageNotFound => 'PÃ¡gina nÃ£o encontrada';

  @override
  String get commonHome => 'InÃ­cio';

  @override
  String get commonUnknownError => 'Erro de roteamento desconhecido';

  @override
  String get commonSettingsTooltip => 'ConfiguraÃ§Ãµes';

  @override
  String get commonHowThisWorks => 'Como funciona';

  @override
  String get myDayReminderSet => 'Lembrete definido';

  @override
  String get myDayPreparationNotes => 'NOTAS DE PREPARAÃ‡ÃƒO';

  @override
  String get onboardingSkip => 'PULAR';

  @override
  String get onboardingNext => 'PrÃ³ximo';

  @override
  String get onboardingEnterSanctuary => 'Entrar no SantuÃ¡rio';

  @override
  String get onboardingIntroduction => 'INTRODUÃ‡ÃƒO';

  @override
  String get onboardingGrowYourForest => 'CRESCA SUA FLORESTA';

  @override
  String get onboardingPage1Title => 'ConheÃ§a seu GuardiÃ£o.';

  @override
  String get onboardingPage1Body =>
      'Bem-vindo ao seu SantuÃ¡rio Pessoal. Aqui, seu crescimento se reflete na vida da sua floresta.';

  @override
  String get onboardingPage2Title => 'Plante sementes. Veja crescer.';

  @override
  String get onboardingPage2Body =>
      'Cada tarefa Ã© uma sementinha. Cada hÃ¡bito Ã© um broto que vocÃª cuida todos os dias. Juntos, eles formam uma floresta de disciplina.';

  @override
  String get onboardingPage3Title => 'Cinco tarefas. Uma corrente.';

  @override
  String get onboardingPage3Body =>
      'VocÃª sÃ³ pode plantar 5 sementes por dia. Essa restriÃ§Ã£o forÃ§a vocÃª a se concentrar no que realmente importa â€” e proteger sua corrente.';

  @override
  String get onboardingPage4Title => 'Cuide dos brotos diariamente.';

  @override
  String get onboardingPage4Body =>
      'Toque nos hÃ¡bitos para fazÃª-los crescer. Pule um dia e a corrente nÃ£o se estende. O GuardiÃ£o cresce com vocÃª.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Plante sua primeira semente.';

  @override
  String get authWelcomeBack => 'Bem-vindo de volta, GuardiÃ£o.';

  @override
  String get authFiveTasksDaily =>
      'Cinco tarefas. HÃ¡bitos diÃ¡rios. Sem desculpas.';

  @override
  String get authSanctuaryWaiting => 'Seu santuÃ¡rio estÃ¡ esperando.';

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
  String get authEnterValidEmail => 'Digite um endereÃ§o de e-mail vÃ¡lido';

  @override
  String get authPasswordTooShort => 'A senha deve ter pelo menos 8 caracteres';

  @override
  String get authAccountCreated =>
      'Conta criada. Mude para Entrar e use sua senha.';

  @override
  String get authSomethingWentWrong => 'Algo deu errado. Tente novamente.';

  @override
  String get authCouldNotStartGoogle =>
      'NÃ£o foi possÃ­vel iniciar o login com Google.';

  @override
  String get authMidnightReset =>
      'Ao entrar, vocÃª aceita que seu dia reinicia Ã  meia-noite.';

  @override
  String get authSetupRequired => 'ConfiguraÃ§Ã£o necessÃ¡ria';

  @override
  String get settingsPersonalSanctuary => 'SANTUÃRIO PESSOAL';

  @override
  String get settingsHowThisWorks => 'Como funciona';

  @override
  String get settingsHowThisWorksSubtitle =>
      'O que o app faz, como a restriÃ§Ã£o e a sequÃªncia funcionam';

  @override
  String get settingsStreakProtection => 'ProteÃ§Ã£o de sequÃªncia';

  @override
  String get settingsStreakProtectionAvailable =>
      '1 congelamento disponÃ­vel este mÃªs';

  @override
  String get settingsStreakProtectionUsed => 'Usado para este mÃªs';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Gerenciar assinatura Pro';

  @override
  String get settingsProCancelPlay => 'Cancelar ou mudar plano no Google Play';

  @override
  String get settingsProUnlock =>
      'Desbloquear todos os 5 hÃ¡bitos, histÃ³rico completo e mais';

  @override
  String get settingsTaskAlarms => 'Alarmes de tarefa & Chamado Final';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Toque noturno e aviso de meia-noite';

  @override
  String get settingsHomeScreenWidget => 'Widget da tela inicial';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Adicione sua sequÃªncia de corrente Ã  tela inicial';

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
      'VersÃ£o beta â€” assinaturas pausadas enquanto testamos tudo.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'VersÃ£o $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'VersÃ£o 1.0.0';

  @override
  String get settingsHabitMaster => 'Mestre dos HÃ¡bitos';

  @override
  String settingsLevel(Object level) {
    return 'NÃ­vel $level Â· Mestre dos HÃ¡bitos';
  }

  @override
  String get languagePickerTitle => 'Idioma';

  @override
  String get youLast7Days => 'Ãšltimos 7 dias';

  @override
  String get youLast7DaysSubtitle => 'HistÃ³rico de tarefas dia a dia';

  @override
  String get youLeftBehindSubtitle =>
      'Tarefas perdidas esperando para serem re-adicionadas';

  @override
  String get youProTier => 'NÃ­vel Pro';

  @override
  String get youFreeTier => 'NÃ­vel Gratuito';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'GrÃ¡tis';

  @override
  String youLevelLabel(Object level) {
    return 'NÃ­vel $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'Melhor $days d';
  }

  @override
  String get youPlantHabit => 'Plante um hÃ¡bito para iniciar uma corrente.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'Desbloqueie o sistema completo de disciplina.';

  @override
  String get youProFeatures =>
      '5 espaÃ§os de hÃ¡bitos, histÃ³rico completo, medalhas lendÃ¡rias, congelamentos mensais de sequÃªncia, cartÃµes de compartilhamento semanais.';

  @override
  String get youSeePlans => 'Ver planos';

  @override
  String youFromPrice(Object price) {
    return 'a partir de $price/mÃªs';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch Â· HÃ¡bitos & Tarefas';

  @override
  String get progressMedals => 'Medalhas';

  @override
  String get progressLast7Days => 'Ãšltimos 7 dias';

  @override
  String get progressSeeAll => 'Ver todas';

  @override
  String get progressSeeDayByDayActivity => 'Veja sua atividade dia a dia';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done de $total tarefas finalizadas Â· $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Nenhuma medalha ainda â€” finalize uma tarefa ou cuide de um broto para comeÃ§ar.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Ver todas as medalhas Â· $earned de $total conquistadas';
  }

  @override
  String get progressGuardianInsight => 'Insight do GuardiÃ£o';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'PRÃ“XIMO EMBLEMA Â· $tier';
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
      'A maioria das respostas estÃ¡ abaixo. Se nÃ£o encontrar, nos envie uma mensagem e geralmente respondemos em 2â€“3 dias.';

  @override
  String get helpSectionFAQ => 'PERGUNTAS FREQUENTES';

  @override
  String get helpSectionContact => 'AINDA COM DÃšVIDAS?';

  @override
  String get helpAddMessage => 'Adicione uma mensagem curta primeiro.';

  @override
  String get helpOpening => 'Abrindo seu app de e-mailâ€¦';

  @override
  String get helpEmailUs => 'Envie-nos um e-mail';

  @override
  String get helpOpeningAction => 'Abrindoâ€¦';

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
  String get helpHint => 'Uma descriÃ§Ã£o curta ajuda muitoâ€¦';

  @override
  String get helpDisclaimer =>
      'Ao tocar em \"Envie-nos um e-mail\", seu app de e-mail abre com uma mensagem prÃ©-preenchida (nenhum dado sai do seu dispositivo atÃ© vocÃª enviar).';

  @override
  String get helpFaqQ1 => 'O que Ã© a restriÃ§Ã£o de 5 tarefas?';

  @override
  String get helpFaqA1 =>
      'VocÃª pode adicionar atÃ© 5 tarefas por dia local. A 6Âª Ã© bloqueada de propÃ³sito â€” disciplina vence sobrecarga. A restriÃ§Ã£o Ã© o recurso, nÃ£o uma limitaÃ§Ã£o.';

  @override
  String get helpFaqQ2 => 'O que acontece Ã  meia-noite?';

  @override
  String get helpFaqA2 =>
      'Na meia-noite do seu horÃ¡rio local, qualquer tarefa ainda marcada como aberta recebe o selo \"perdida\" e vai para Pendentes. SequÃªncias de hÃ¡bitos sÃ£o redefinidas se o hÃ¡bito nÃ£o foi concluÃ­do no dia anterior.';

  @override
  String get helpFaqQ3 => 'O que sÃ£o Pendentes?';

  @override
  String get helpFaqA3 =>
      'Uma lista gentil e dispensÃ¡vel de tarefas que vocÃª nÃ£o finalizou. Abra-a, re-adicione apenas o que ainda importa e deixe o resto ir. O nÃ­vel Gratuito mostra os Ãºltimos 7 dias; o Pro mostra o histÃ³rico completo.';

  @override
  String get helpFaqQ4 => 'Como as sequÃªncias funcionam?';

  @override
  String get helpFaqA4 =>
      'Um dia estende a corrente quando vocÃª teve pelo menos 1 tarefa e 0 foram perdidas. Dias com zero tarefas nÃ£o estendem nem quebram a corrente. Um congelamento de sequÃªncia perdoa um dia perdido por mÃªs.';

  @override
  String get helpFaqQ5 => 'O que Ã© o congelamento de sequÃªncia?';

  @override
  String get helpFaqA5 =>
      'Um \"congelamento\" por mÃªs calendÃ¡rio, apenas para o Pro. Use-o em um dia que vocÃª perdeu para manter sua corrente viva. Encontre-o na aba Progresso.';

  @override
  String get helpFaqQ6 => 'Onde meus dados sÃ£o armazenados?';

  @override
  String get helpFaqA6 =>
      'Todos os dados ficam em nosso backend cloud seguro, vinculados Ã  conta que fez login. Nunca vendemos ou compartilhamos. Veja a polÃ­tica de privacidade no link da listagem na Play Store para detalhes completos.';

  @override
  String get helpFaqQ7 => 'Como excluo minha conta?';

  @override
  String get helpFaqA7 =>
      'VÃ¡ para ConfiguraÃ§Ãµes â†’ Conta â†’ Excluir conta. Isso remove permanentemente seu perfil, tarefas, hÃ¡bitos e dados de assinatura. Assinaturas ativas do Play devem ser canceladas separadamente no Google Play.';

  @override
  String get helpTopicsGeneral => 'Pergunta geral';

  @override
  String get helpTopicsBug => 'RelatÃ³rio de bug';

  @override
  String get helpTopicsStreak => 'Problema de sequÃªncia';

  @override
  String get helpTopicsBilling => 'CobranÃ§a ou nÃ­vel Pro';

  @override
  String get helpTopicsAccount => 'Conta & dados';

  @override
  String get helpTopicsFeature => 'SolicitaÃ§Ã£o de recurso';

  @override
  String get helpAccountAnon => '(nÃ£o conectado)';

  @override
  String get splashTagline =>
      'Cuide de pequenas sementes. CresÃ§a uma floresta.';

  @override
  String get priorityStandard => 'PADRÃƒO';

  @override
  String get priorityVital => 'VITAL';

  @override
  String get prioritySpark => 'FAÃSCA';

  @override
  String get settingsDeleteAccount => 'Excluir conta';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Remover seus dados permanentemente';

  @override
  String get settingsDeleteAccountConfirmTitle => 'Excluir sua conta?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Isso exclui permanentemente seu perfil, tarefas, hÃ¡bitos e progresso. Assinaturas ativas devem ser canceladas separadamente no Google Play. Isso nÃ£o pode ser desfeito.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Excluir para sempre';

  @override
  String get settingsDeleteAccountSuccess => 'Sua conta foi excluÃ­da.';

  @override
  String get settingsDeleteAccountFailed =>
      'NÃ£o foi possÃ­vel excluir a conta. Tente novamente ou envie um e-mail para support@dailystitch.app.';

  @override
  String get referralYouTitle => 'Convide amigos Â· ganhe Pro grÃ¡tis';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress de $milestone amigos participaram';
  }

  @override
  String get referralYouShare => 'Compartilhar convite';

  @override
  String get referralYouDetails => 'Ver detalhes';

  @override
  String get referralPaywallTitle => 'MÃªs grÃ¡tis de Pro';

  @override
  String get referralPaywallBody =>
      'Convide 5 amigos que se inscreverem â†’ 1 mÃªs de Pro grÃ¡tis';

  @override
  String get referralPaywallProBody =>
      'Continue convidando â€” acumule meses grÃ¡tis de Pro';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'NÃ£o foi possÃ­vel carregar seu progresso. Tente novamente mais tarde.';

  @override
  String get insightsMetricCurrentChain => 'CORRENTE ATUAL';

  @override
  String get insightsMetricBestEver => 'MELHOR DE TODOS';

  @override
  String get insightsMetricTasksDone => 'TAREFAS FEITAS';

  @override
  String get insightsMetricPerfectDays => 'DIAS PERFEITOS';

  @override
  String get insightsMetricHabits => 'HÃBITOS';

  @override
  String get insightsDay => 'dia';

  @override
  String get insightsDays => 'dias';

  @override
  String get insightsSectionThisWeek => 'Esta semana';

  @override
  String get insightsShareMyWeek => 'Compartilhar minha semana';

  @override
  String get insightsShareMyWeekPro => 'Compartilhar minha semana Â· Pro';

  @override
  String get insightsShareReceiptText =>
      'Minha semana no Daily Stitch. NÃ£o quebre a corrente.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Mostrando os Ãºltimos $days dias';
  }

  @override
  String get insightsHistoryUpsell =>
      'Desbloqueie seu histÃ³rico completo com Pro';

  @override
  String get referralScreenTitle => 'Convidar amigos';

  @override
  String get referralLaunchGift => 'Presente do mÃªs de lanÃ§amento';

  @override
  String get referralRewardTitle => 'Ganhe 1 mÃªs de Pro grÃ¡tis';

  @override
  String get referralRewardBody =>
      'Compartilhe seu cÃ³digo com amigos. Quando 5 pessoas se inscreverem usando ele, vocÃª desbloqueia o Daily Stitch Pro por um mÃªs completo.';

  @override
  String get referralYourCode => 'Seu cÃ³digo de indicaÃ§Ã£o';

  @override
  String get referralCopyCodeTooltip => 'Copiar cÃ³digo';

  @override
  String get referralCodeCopied => 'CÃ³digo de indicaÃ§Ã£o copiado';

  @override
  String get referralShareWithFriends => 'Compartilhar com amigos';

  @override
  String get referralFooterHint =>
      'Os amigos inserem seu cÃ³digo ao criar uma conta. Cada amigo conta uma vez para sua recompensa.';

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
    return 'VocÃª ganhou $count mÃªs grÃ¡tis de Pro.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'VocÃª ganhou $count meses grÃ¡tis de Pro.';
  }

  @override
  String get referralRewardUnlocked =>
      'Recompensa desbloqueada â€” aproveite seu mÃªs grÃ¡tis de Pro!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining mais para desbloquear seu mÃªs grÃ¡tis';
  }

  @override
  String youProMemberSince(String month) {
    return 'Membro Bloom Pro desde $month';
  }

  @override
  String get youProPerksTitle => 'Seus benefÃ­cios Pro';

  @override
  String get manageProThankYou => 'Obrigado por apoiar o Bloom';

  @override
  String get manageProReferralHint =>
      'Convide mais amigos para estender seu Pro';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nAdicione API_BASE_URL e GOOGLE_CLIENT_ID (ou o legado GOOGLE_CLIENT_ID) ao arquivo leanspace/.env, depois reconstrua:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'PadrÃ£o do sistema';

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
  String get onboardingLanguageTitle => 'Escolha seu idioma';

  @override
  String get onboardingLanguageBody =>
      'Escolha o idioma que vocÃª gostaria de usar no Daily Stitch. VocÃª pode alterÃ¡-lo a qualquer momento nas ConfiguraÃ§Ãµes.';

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
      'Escolha as cores do seu santuÃ¡rio pessoal';

  @override
  String get settingsInviteFriendsTitle => 'Convidar amigos Â· Pro grÃ¡tis';

  @override
  String get settingsInviteFriendsSubtitle =>
      'Ganhe 1 mÃªs grÃ¡tis quando 5 amigos participarem';

  @override
  String get themePickerTitle => 'SantuÃ¡rio Pessoal';

  @override
  String get themePickerSubtitle =>
      'Escolha uma paleta de cores que traga paz.';

  @override
  String get themeNameClassicBloom => 'FloraÃ§Ã£o ClÃ¡ssica';

  @override
  String get themeNameSolarTerracotta => 'Terracota Solar';

  @override
  String get themeNameMidnightOasis => 'OÃ¡sis da Meia-Noite';

  @override
  String get themeNameLavenderDream => 'Sonho de Lavanda';

  @override
  String get themeNameNordicFrost => 'Geada NÃ³rdica';

  @override
  String get themeNameCyberpunkNeon => 'Neon Cyberpunk';

  @override
  String get reminderTitle => 'Lembretes';

  @override
  String get reminderBody =>
      'O Chamado Final avisa vocÃª antes da meia-noite se houver tarefas ainda abertas.';

  @override
  String get reminderFinalCall => 'Chamado Final';

  @override
  String get reminderEveningNudge => 'Toque noturno';

  @override
  String get reminderChangeTime => 'Alterar horÃ¡rio';

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
    return 'VocÃª ainda tem $count tarefa(s) aberta(s) hoje.';
  }

  @override
  String get notificationEveningTitle => 'VerificaÃ§Ã£o noturna';

  @override
  String get notificationEveningBody => 'Como seu jardim cresceu hoje?';

  @override
  String get widgetSetupTitle => 'Adicionar widget de corrente';

  @override
  String get widgetSetupBody =>
      'Mantenha sua sequÃªncia na tela inicial â€” sem precisar abrir o app.';

  @override
  String get widgetSetupAdd => 'Adicionar Ã  tela inicial';

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
      'Seu launcher pode nÃ£o suportar adiÃ§Ã£o com um toque. Use os passos manuais abaixo.';

  @override
  String get paywallWelcomePro => 'Bem-vindo ao Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'ECONOMIZE ~16%';

  @override
  String get paywallTermsTitle => 'Termos da assinatura';

  @override
  String get paywallTermsBody =>
      'A cobranÃ§a Ã© tratada pelo Google Play. As assinaturas renovam automaticamente atÃ© que vocÃª cancele na Play Store â†’ Assinaturas pelo menos 24 horas antes do tÃ©rmino do perÃ­odo atual. VocÃª pode gerenciar ou cancelar sua assinatura a qualquer momento na sua conta do Google Play.\n\nDesinstalar o app nÃ£o cancela sua assinatura.\n\nOs preÃ§os exibidos estÃ£o na sua moeda local e podem variar por regiÃ£o. Impostos podem ser aplicados.';

  @override
  String get paywallPrivacyTitle => 'Privacidade';

  @override
  String get paywallPrivacyBody =>
      'O Daily Stitch armazena suas tarefas, hÃ¡bitos e dados de sequÃªncia em nosso backend seguro, vinculados Ã  sua conta. Nunca vendemos seus dados.\n\nAs compras de assinatura sÃ£o processadas pelo Google Play. Recebemos um token de compra verificado do Google para confirmar seu status Pro. NÃ£o vemos nem armazenamos seus dados de pagamento.\n\nVocÃª pode solicitar exportaÃ§Ã£o completa de dados ou exclusÃ£o de conta em ConfiguraÃ§Ãµes â†’ ExclusÃ£o de conta.';

  @override
  String get paywallCloseTooltip => 'Fechar';

  @override
  String get paywallFooterLinks => 'Restaurar Â· Termos Â· Privacidade';

  @override
  String get manageProTitle => 'Assinatura Pro';

  @override
  String get manageProActive => 'Ativa';

  @override
  String get manageProNotSubscribed => 'NÃ£o assinado';

  @override
  String get manageProFreeTier => 'NÃ­vel Gratuito';

  @override
  String manageProRenewsOn(String date) {
    return 'Renova ou expira em $date.';
  }

  @override
  String get manageProFreeBody =>
      'VocÃª estÃ¡ usando o Daily Stitch Gratuito. FaÃ§a upgrade para desbloquear o sistema completo.';

  @override
  String get manageProSectionManage => 'GERENCIAR';

  @override
  String get manageProOpenPlay => 'Abrir assinaturas do Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Cancelar, mudar plano ou atualizar mÃ©todo de pagamento';

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
      'FAQ de assinatura, contato, relatÃ³rios de bugs';

  @override
  String manageProBillingFooter(String version) {
    return 'CobranÃ§a tratada pelo Google Play Â· $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Abra o app Google Play Store â†’ toque no seu perfil â†’ Pagamentos & assinaturas â†’ Assinaturas.';

  @override
  String get addTaskGrowSomething => 'Cultivar Algo';

  @override
  String get addTaskPlantSprout => 'Plantar um BROTO';

  @override
  String get addTaskIntentionName => 'NOME DA INTENÃ‡ÃƒO';

  @override
  String get addTaskSproutName => 'NOME DO BROTO';

  @override
  String get addTaskHintTask => 'ex., SaudaÃ§Ã£o ao Sol da ManhÃ£';

  @override
  String get addTaskHintHabit => 'ex. Yoga Matinal';

  @override
  String get addTaskWhen => 'QUANDO?';

  @override
  String get addTaskPriority => 'PRIORIDADE';

  @override
  String get addTaskNotes => 'NOTAS';

  @override
  String get addTaskCadenceDaily => 'DiÃ¡rio';

  @override
  String get addTaskCadenceWeekdays => 'Dias Ãºteis';

  @override
  String get addTaskCadence3x => '3x/semana';

  @override
  String get addTaskCadenceWeekly => 'Semanal';

  @override
  String get addTaskPlantIntention => 'Plantar IntenÃ§Ã£o';

  @override
  String get addTaskPlantSproutCta => 'Plantar Broto';

  @override
  String get addTaskPlanting => 'Plantandoâ€¦';

  @override
  String get addTaskNameIntentionError => 'DÃª um nome Ã  sua intenÃ§Ã£o';

  @override
  String get addTaskNameSproutError => 'DÃª um nome ao seu broto';

  @override
  String get addTaskNotesMigrationWarning =>
      'Tarefa salva. Notas e prioridade precisam da migraÃ§Ã£o mais recente do backend.';

  @override
  String get addTaskNoSproutSlots =>
      'Nenhum espaÃ§o de broto vazio â€” cuide de um primeiro.';

  @override
  String get addTaskSaveSproutError =>
      'NÃ£o foi possÃ­vel salvar o broto â€” tente novamente.';

  @override
  String get addTaskElementWater => 'ÃGUA';

  @override
  String get addTaskElementLight => 'LUZ';

  @override
  String get addTaskElementSoil => 'SOLO';

  @override
  String get addTaskElementBreeze => 'BRIOSA';

  @override
  String get addTaskCadenceLabel => 'CADÃŠNCIA';

  @override
  String get addTaskPreparationNotes => 'NOTAS DE PREPARAÃ‡ÃƒO';

  @override
  String get addTaskTendingNotes => 'NOTAS DE CUIDADO';

  @override
  String get addTaskNotesHintTask =>
      'Algumas ferramentas ou dicas de mentalidade para esta tarefa?';

  @override
  String get addTaskNotesHintHabit => 'Como Ã© cuidar deste broto?';

  @override
  String get addTaskChooseElement => 'ESCOLHA O ELEMENTO';

  @override
  String get addTaskElementsTooltip => 'O que os elementos significam?';

  @override
  String get addTaskTaskSeed => 'Semente de Tarefa';

  @override
  String get addTaskHabitSprout => 'Broto de HÃ¡bito';

  @override
  String get addTaskPickElement => 'Escolha o elemento certo';

  @override
  String get addTaskPickElementBody =>
      'Cada elemento corresponde a um tipo diferente de esforÃ§o. O GuardiÃ£o cresce mais forte quando vocÃª rega o elemento certo.';

  @override
  String get addTaskClearForm => 'Limpar formulÃ¡rio';

  @override
  String get shareCouldNotShare => 'NÃ£o foi possÃ­vel compartilhar agora';

  @override
  String get authReferralCodeLabel => 'CÃ³digo de indicaÃ§Ã£o (opcional)';

  @override
  String get authReferralCodeHint => 'CÃ³digo do amigo';

  @override
  String get youPerkHabitSlots => '5 espaÃ§os de hÃ¡bitos';

  @override
  String get youPerkFullHistory => 'HistÃ³rico completo';

  @override
  String get youPerkAllThemes => 'Todos os temas';

  @override
  String get youPerkStreakFreezes => '2 congelamentos de sequÃªncia / mÃªs';

  @override
  String get youPerkLegendaryMedals => 'Medalhas lendÃ¡rias';

  @override
  String get subscriptionPurchaseFailed => 'Compra falhou. Tente novamente.';

  @override
  String get subscriptionUnavailable =>
      'Compras in-app estÃ£o indisponÃ­veis neste dispositivo.';

  @override
  String get subscriptionLoadFailed =>
      'NÃ£o foi possÃ­vel carregar as opÃ§Ãµes de assinatura.';

  @override
  String get subscriptionVerifyFailed =>
      'NÃ£o foi possÃ­vel verificar a compra. Tente Restaurar compra.';

  @override
  String get streakFreezeFailed =>
      'NÃ£o foi possÃ­vel usar o congelamento de sequÃªncia.';

  @override
  String get streakFreezeAlreadyUsed =>
      'VocÃª jÃ¡ usou seu congelamento este mÃªs.';

  @override
  String get streakFreezeNoMissed =>
      'Nenhuma tarefa perdida nesse dia para congelar.';

  @override
  String get streakFreezeNotPastDay =>
      'VocÃª sÃ³ pode congelar um dia passado.';

  @override
  String get myDayLoadError =>
      'NÃ£o foi possÃ­vel carregar Meu Dia. Puxe para atualizar.';

  @override
  String get myDayCapReached =>
      'VocÃª atingiu a restriÃ§Ã£o de 5 tarefas de hoje.';

  @override
  String get myDayRemoveTaskError => 'NÃ£o foi possÃ­vel remover a tarefa.';

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
  String get medalTierEpic => 'Ã‰pico';

  @override
  String get medalTierLegendary => 'LendÃ¡rio';

  @override
  String get medalCategoryTasks => 'Tarefas';

  @override
  String get medalCategoryHabits => 'HÃ¡bitos';

  @override
  String get medalCategoryStreaks => 'SequÃªncias';

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
  String get shareCardAppBarTitle => 'CartÃ£o de compartilhamento';

  @override
  String get shareCardAppBarTitleMedal => 'Compartilhe sua medalha';

  @override
  String shareCardDescMedal(Object title) {
    return 'Exiba seu novo emblema $title';
  }

  @override
  String get shareCardBodyMedal =>
      'Compartilhe a vitÃ³ria com seu cÃ­rculo. O cartÃ£o Ã© exportado como PNG e estÃ¡ pronto para qualquer app de rede social.';

  @override
  String get shareCardCtaPreparing => 'Preparandoâ€¦';

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
    return 'SequÃªncia de $days Dias';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Medalhas Conquistadas';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'GuardiÃ£o de Brotos';

  @override
  String get shareCardHeadlineFirstSeeds => 'Primeiras Sementes Plantadas';

  @override
  String get shareCardHeadlineGardenBegins => 'Um Jardim ComeÃ§a';

  @override
  String get shareCardSubheadMonth =>
      'VocÃª cuidou dos seus hÃ¡bitos com sucesso por um mÃªs completo.';

  @override
  String get shareCardSubheadWeek =>
      'Uma semana completa de crescimento â€” sua floresta estÃ¡ engrossando.';

  @override
  String get shareCardSubheadProgress =>
      'Seu santuÃ¡rio estÃ¡ mostrando progresso real. Continue cuidando.';

  @override
  String get shareCardSubheadSprouts =>
      'Seus primeiros brotos estÃ£o enraizando. Regue-os diariamente.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Suas primeiras sementes estÃ£o no solo. Veja abrir.';

  @override
  String get shareCardSubheadFallback =>
      'Toda floresta comeÃ§a com uma Ãºnica escolha pequena.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch â€” cinco sementinhas por dia, uma corrente inquebrÃ¡vel. Plante a sua.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Experimente o Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Estou construindo minha corrente diÃ¡ria no Daily Stitch â€” junte-se a mim com meu cÃ³digo de indicaÃ§Ã£o $code e ambos crescemos.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Junte-se a mim no Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Meu progresso no Daily Stitch â€” $year no Daily Stitch.';
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
  String get insightsReceiptCompletion => 'ConclusÃ£o';

  @override
  String insightsReceiptDate(String date) {
    return 'Semana de $date';
  }

  @override
  String get insightsReceiptFooter => 'NÃ£o quebre a corrente.';

  @override
  String get elementLabelWater => 'Ãgua';

  @override
  String get elementLabelLight => 'Luz';

  @override
  String get elementLabelSoil => 'Solo';

  @override
  String get elementLabelBreeze => 'Brisa';

  @override
  String get elementTaglineWater =>
      'Restaurar. HidrataÃ§Ã£o, descanso, cuidado emocional â€” qualquer coisa que encha o poÃ§o.';

  @override
  String get elementTaglineLight =>
      'Despertar. Luz da manhÃ£, blocos de foco, estudo, meditaÃ§Ã£o â€” energia e clareza.';

  @override
  String get elementTaglineSoil =>
      'Enraizar. Leitura, diÃ¡rio, trabalho profundo â€” raÃ­zes lentas que constroem forÃ§a a longo prazo.';

  @override
  String get elementTaglineBreeze =>
      'Mover. Caminhadas, corridas, respiraÃ§Ã£o â€” energia leve e mÃ³vel que limpa a cabeÃ§a.';

  @override
  String get elementWhenWater => 'Quando vocÃª se sentir esgotado ou vazio.';

  @override
  String get elementWhenLight =>
      'Quando precisar de um inÃ­cio claro para seu dia.';

  @override
  String get elementWhenSoil =>
      'Quando o trabalho Ã© lento mas vale a pena (estudo, ofÃ­cio, cuidado).';

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
    return '$count dias de sequÃªncia Â· $element';
  }

  @override
  String get medal_id_first_spark => 'Primeira FaÃ­sca';

  @override
  String get medal_sub_first_spark => 'Acendeu a chama.';

  @override
  String get medal_desc_first_spark =>
      'Termine sua primeira tarefa. Toda corrente comeÃ§a aqui.';

  @override
  String get medal_id_triple_seed => 'TrÃ­plice Semente';

  @override
  String get medal_sub_triple_seed => 'TrÃªs no solo.';

  @override
  String get medal_desc_triple_seed => 'Termine 3 tarefas no total.';

  @override
  String get medal_id_dozen_sower => 'Semeador de DÃºzia';

  @override
  String get medal_sub_dozen_sower => 'Um campo de doze.';

  @override
  String get medal_desc_dozen_sower => 'Termine 12 tarefas no total.';

  @override
  String get medal_id_quarter_century => 'Quarto de SÃ©culo';

  @override
  String get medal_sub_quarter_century => 'Uma temporada de sim.';

  @override
  String get medal_desc_quarter_century => 'Termine 25 tarefas no total.';

  @override
  String get medal_id_productivity_titan => 'TitÃ£ da Produtividade';

  @override
  String get medal_sub_productivity_titan => 'ConsistÃªncia se acumula.';

  @override
  String get medal_desc_productivity_titan =>
      'Termine 50 tarefas â€” vocÃª construiu momentum real.';

  @override
  String get medal_id_century_planter => 'Plantador do SÃ©culo';

  @override
  String get medal_sub_century_planter => 'Uma floresta sua.';

  @override
  String get medal_desc_century_planter =>
      'Termine 100 tarefas. VocÃª estÃ¡ no top 5% dos usuÃ¡rios.';

  @override
  String get medal_id_clean_day => 'Dia Limpo';

  @override
  String get medal_sub_clean_day => 'Nem uma erva daninha.';

  @override
  String get medal_desc_clean_day =>
      'Termine cada tarefa que planta em um Ãºnico dia.';

  @override
  String get medal_id_triple_perfect => 'TrÃ­plice Perfeito';

  @override
  String get medal_sub_triple_perfect => 'TrÃªs execuÃ§Ãµes impecÃ¡veis.';

  @override
  String get medal_desc_triple_perfect => 'Alcance 3 dias perfeitos.';

  @override
  String get medal_id_perfect_week => 'Semana Perfeita';

  @override
  String get medal_sub_perfect_week => 'Sete dias sem quebras.';

  @override
  String get medal_desc_perfect_week => '7 dias perfeitos seguidos.';

  @override
  String get medal_id_two_week_chain => 'ForÃ§a do Fortnight';

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
      'Uma corrente de 30 dias. A medalha mais difÃ­cil.';

  @override
  String get medal_id_quarterly_chain => 'Corrente Trimestral';

  @override
  String get medal_sub_quarterly_chain => 'Uma temporada, sem quebras.';

  @override
  String get medal_desc_quarterly_chain =>
      'Uma corrente de 90 dias. Status lendÃ¡rio.';

  @override
  String get medal_id_vital_priority => 'FaÃ­sca Vital';

  @override
  String get medal_sub_vital_priority => 'VocÃª escolheu as difÃ­ceis.';

  @override
  String get medal_desc_vital_priority =>
      'Termine 5 tarefas marcadas como Prioridade Vital.';

  @override
  String get medal_id_spark_priority => 'Domador de FaÃ­scas';

  @override
  String get medal_sub_spark_priority => 'VitÃ³rias rÃ¡pidas se acumulam.';

  @override
  String get medal_desc_spark_priority =>
      'Termine 5 tarefas marcadas como Prioridade FaÃ­sca.';

  @override
  String get medal_id_note_taker => 'Anotador';

  @override
  String get medal_sub_note_taker =>
      'Planos no papel superam planos na cabeÃ§a.';

  @override
  String get medal_desc_note_taker =>
      'Adicione notas de preparaÃ§Ã£o a 5 tarefas diferentes.';

  @override
  String get medal_id_left_behind_rescuer => 'Resgatador de Deixados';

  @override
  String get medal_sub_left_behind_rescuer =>
      'Nenhuma tarefa deixada para trÃ¡s.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Re-adicione 3 tarefas perdidas no dia seguinte.';

  @override
  String get medal_id_first_sprout => 'Primeira Broto';

  @override
  String get medal_sub_first_sprout => 'Um novo ritual diÃ¡rio.';

  @override
  String get medal_desc_first_sprout => 'Plante seu primeiro hÃ¡bito.';

  @override
  String get medal_id_trio_sprout => 'TrÃ­plice Broto';

  @override
  String get medal_sub_trio_sprout => 'Um pequeno ecossistema.';

  @override
  String get medal_desc_trio_sprout => 'Plante 3 hÃ¡bitos diferentes.';

  @override
  String get medal_id_week_of_growth => 'Semana de Crescimento';

  @override
  String get medal_sub_week_of_growth => 'As raÃ­zes comeÃ§am a segurar.';

  @override
  String get medal_desc_week_of_growth =>
      'Cuide de um hÃ¡bito todos os dias por 7 dias.';

  @override
  String get medal_id_fortnight_floret => 'Flor do Fortnight';

  @override
  String get medal_sub_fortnight_floret => 'Uma floraÃ§Ã£o completa.';

  @override
  String get medal_desc_fortnight_floret =>
      'Uma sequÃªncia de hÃ¡bitos de 14 dias.';

  @override
  String get medal_id_rooted_master => 'Mestre Enraizado';

  @override
  String get medal_sub_rooted_master => 'RaÃ­zes profundas, forÃ§a profunda.';

  @override
  String get medal_desc_rooted_master =>
      'Uma sequÃªncia de hÃ¡bitos de 30 dias.';

  @override
  String get medal_id_half_year_bloom => 'FloraÃ§Ã£o Semestral';

  @override
  String get medal_sub_half_year_bloom => 'O jardim Ã© permanente agora.';

  @override
  String get medal_desc_half_year_bloom =>
      'Mantenha um Ãºnico hÃ¡bito por 180 dias.';

  @override
  String get medal_id_garden_keeper => 'GuardiÃ£o do Jardim';

  @override
  String get medal_sub_garden_keeper => 'Variedade, juntos.';

  @override
  String get medal_desc_garden_keeper =>
      'Cultive 4 hÃ¡bitos diferentes ao mesmo tempo.';

  @override
  String get medal_id_hydration_hero => 'HerÃ³i da HidrataÃ§Ã£o';

  @override
  String get medal_sub_hydration_hero => 'Enche o poÃ§o.';

  @override
  String get medal_desc_hydration_hero =>
      'Plante um hÃ¡bito de hidrataÃ§Ã£o (Ã¡gua/bebida).';

  @override
  String get medal_id_mindful_mover => 'Movimento Consciente';

  @override
  String get medal_sub_mindful_mover => 'O corpo lembra.';

  @override
  String get medal_desc_mindful_mover =>
      'Plante um hÃ¡bito de movimento (yoga/correr/caminhar).';

  @override
  String get medal_id_devoted_keeper => 'GuardiÃ£o Devotado';

  @override
  String get medal_sub_devoted_keeper => 'Sessenta dias, uma prÃ¡tica.';

  @override
  String get medal_desc_devoted_keeper =>
      'Cuide de um Ãºnico hÃ¡bito por 60 dias seguidos.';

  @override
  String get medal_id_tending_notes => 'Notas de Cuidado';

  @override
  String get medal_sub_tending_notes => 'Refletindo pelo caminho.';

  @override
  String get medal_desc_tending_notes =>
      'Adicione notas de cuidado a 3 hÃ¡bitos.';

  @override
  String get medalTierTaglineSprout => 'Plante a primeira semente';

  @override
  String get medalTierTaglineCommon => 'Construir o hÃ¡bito';

  @override
  String get medalTierTaglineRare => 'Mostrando momentum real';

  @override
  String get medalTierTaglineEpic => 'VocÃª Ã© uma forÃ§a da natureza';

  @override
  String get medalTierTaglineLegendary => 'MÃ­tico, quase ninguÃ©m chega aqui';

  @override
  String get guardianHeadlineNoTasks =>
      'O solo de hoje estÃ¡ fresco.\nPlante sua primeira semente\ne veja crescer.';

  @override
  String get guardianHeadlineAllDone =>
      'Cada semente que vocÃª plantou\nestÃ¡ em floraÃ§Ã£o.\nDescanse, GuardiÃ£o â€” vocÃª mereceu.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count dias\nde crescimento ininterrupto.\nSua floresta estÃ¡ cheia de vida.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Uma semana completa em floraÃ§Ã£o,\nGuardiÃ£o.\nMais um dia perfeito\nestende a corrente.';

  @override
  String get guardianHeadlineStreak3 =>
      'Sua corrente estÃ¡ segurando.\nCuide das sementes\nque esperam abrir.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'VocÃª estÃ¡ cuidando bem das tarefas.\nPlante um broto â€”\nhÃ¡bitos fazem florestas crescerem.';

  @override
  String get guardianHeadlineSomeDone =>
      'Algumas sementes abriram,\noutras nÃ£o. Tudo bem.\nAmanhÃ£ Ã© outra plantaÃ§Ã£o.';

  @override
  String get guardianHeadlineMorning =>
      'Bom dia, GuardiÃ£o.\nO dia Ã© jovem\ne o solo estÃ¡ pronto.';

  @override
  String get guardianHeadlineAfternoon =>
      'Boa tarde, GuardiÃ£o.\nMetade da luz permanece â€”\ncontinue cuidando.';

  @override
  String get guardianHeadlineEvening =>
      'Boa noite, GuardiÃ£o.\nUma Ãºltima verificaÃ§Ã£o\nantes do sol se pÃ´r.';

  @override
  String get guardianHeadlineNight =>
      'Queimando o azeite da meia-noite?\nAtÃ© GuardiÃµes descansam.\nPlante a semente de amanhÃ£.';

  @override
  String get guardianBodyNoTasks =>
      'Seu santuÃ¡rio estÃ¡ silencioso agora. Adicione uma intenÃ§Ã£o e veja o que muda ao anoitecer.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count dias rodando. A corrente nÃ£o Ã© sorte â€” sÃ£o as pequenas escolhas se acumulando. Continue acumulando.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Uma corrente de $count dias Ã© momentum real. Termine as sementes abertas de hoje antes de dizer que terminou.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'VocÃª plantou $count tarefas atÃ© agora. Adicionar atÃ© um Ãºnico broto de hÃ¡bito faria o trabalho crescer dia apÃ³s dia.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'VocÃª estÃ¡ terminando $pct% do que planta. Menos, mais afiadas sementes tendem a crescer mais altas que dez espalhadas.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Seu santuÃ¡rio estÃ¡ vivo. $tasks tarefas feitas, $sprouts brotos crescendo â€” o trabalho estÃ¡ se mostrando.';
  }

  @override
  String get guardianInsightWaitingTitle => 'Esperando seu primeiro movimento';

  @override
  String get guardianInsightWaitingBody =>
      'Adicione uma tarefa ou hÃ¡bito e comeÃ§arei a ler os padrÃµes no seu jardim. Quanto mais vocÃª plantar, mais tenho para aprender.';

  @override
  String get guardianInsightWaitingCta => 'Plante sua primeira semente';

  @override
  String get guardianInsightChainSuperTitle => 'A corrente Ã© seu superpoder';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'VocÃª manteve uma corrente de $count dias. SequÃªncias vencem a motivaÃ§Ã£o sempre â€” mantenha-a quente, mesmo nos dias lentos.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Adicione a semente de amanhÃ£';

  @override
  String get guardianInsightChainColdTitle =>
      'A corrente estÃ¡ fria â€” comece uma nova';

  @override
  String get guardianInsightChainColdBody =>
      'VocÃª plantou antes, o que significa que pode plantar de novo. Uma pequena tarefa feita hoje Ã© uma corrente mais longa amanhÃ£.';

  @override
  String get guardianInsightChainColdCta => 'Plante uma semente';

  @override
  String get guardianInsightLessIsMoreTitle => 'Menos Ã© mais esta semana';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'VocÃª termina cerca de $pct% do que planta. Tente 3 intenÃ§Ãµes afiadas em vez de 5 soltas â€” qualidade se acumula.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Afie o dia';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'PrÃ³xima medalha: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'VocÃª estÃ¡ em $value de $target $unit. Alguns dias mais honestos e Ã© sua.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Mostrar medalha';

  @override
  String get guardianInsightSteadyTitle =>
      'VocÃª estÃ¡ em uma temporada estÃ¡vel';

  @override
  String get guardianInsightSteadyBody =>
      'Nenhuma medalha Ã  vista â€” tudo bem. Cuide do que tem. A prÃ³xima floraÃ§Ã£o estÃ¡ a caminho.';

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
      'VocÃª ainda tem 1 tarefa aberta hoje.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'VocÃª ainda tem $count tarefas abertas hoje.';
  }

  @override
  String get notificationTickerTaskReminder => 'Lembrete de tarefa';

  @override
  String get notificationTickerTaskAlarm => 'Alarme de tarefa';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count dias de sequÃªncia Â· $element';
  }
}
