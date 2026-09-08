// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'TWOJ KLIMAT TRENINGU';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Anuluj';

  @override
  String get renameExerciseTitle => 'Zmien nazwe cwiczenia';

  @override
  String get renameExerciseEmpty => 'Nazwa nie moze byc pusta';

  @override
  String get reassignHistoryExerciseTitle => 'Zmień ćwiczenie';

  @override
  String get reassignHistoryExerciseBody =>
      'Zmienia się tylko ten trening. Serie pozostają; wykresy liczą według nowej nazwy ćwiczenia.';

  @override
  String get delete => 'Usun';

  @override
  String get yesDelete => 'Tak, usun';

  @override
  String get close => 'Zamknij';

  @override
  String get save => 'Zapisz';

  @override
  String get add => 'Dodaj';

  @override
  String get trainOthers => 'TRENUJE INNYCH';

  @override
  String get trainSelf => 'TRENUJE SIEBIE';

  @override
  String get statistics => 'STATYSTYKI';

  @override
  String get exportHistory => 'EKSPORT HISTORII TRENINGOW';

  @override
  String get historyEmpty => 'Historia jest pusta, brak danych do eksportu';

  @override
  String get exportError => 'Blad eksportu:';

  @override
  String get exportJson => 'EKSPORT JSON';

  @override
  String get importData => 'IMPORT';

  @override
  String get importSuccess => 'Dane zaimportowano pomyslnie';

  @override
  String get importError => 'Blad importu:';

  @override
  String get importNewerVersion =>
      'Plik zostal utworzony przez nowsza wersje aplikacji';

  @override
  String get importFileAccessError => 'Blad dostepu do pliku';

  @override
  String get importInvalidJson => 'Nieprawidlowy format JSON';

  @override
  String get importInvalidBackupFile =>
      'Blad: wybrano nieprawidlowy plik kopii zapasowej';

  @override
  String get importAthlete => 'IMPORTUJ ATLETE';

  @override
  String importAthleteFound(int count) {
    return 'Znaleziono zapisy $count treningow atlety, ktorego nie ma na liscie.';
  }

  @override
  String get importAthleteBackupOwn => 'NAJPIERW ZAPISZ MOJE DANE';

  @override
  String get importAthleteDecline => 'Nie dodawaj';

  @override
  String get importAthleteSuccess => 'Atleta dodany';

  @override
  String get importAthleteNotAthleteFile =>
      'Ten plik nie jest historia treningow atlety.';

  @override
  String get importAthleteEmpty => 'W tym pliku nie znaleziono treningow.';

  @override
  String get importAthleteAlreadyImported =>
      'Te treningi sa juz na tym urzadzeniu.';

  @override
  String get importAthleteUseDedicatedButton =>
      'To wyglada na historie atlety. Uzyj Importuj atlete.';

  @override
  String get shareText => 'Historia treningow IronVibe';

  @override
  String get monthStats => 'TEN MIESIAC';

  @override
  String get yearStats => 'TEN ROK';

  @override
  String get allTimeStats => 'CALY OKRES';

  @override
  String get weight => 'Ciezar';

  @override
  String get reps => 'Powtorzenia';

  @override
  String get rir => 'RIR';

  @override
  String get oneRm => '1RM';

  @override
  String get approxOneRm => '≈ 1RM:';

  @override
  String get kg => 'kg';

  @override
  String get volumeShort => 'OBJ.';

  @override
  String get addSet => 'DODAJ SERIE';

  @override
  String get addExercise => 'DODAJ CWICZENIE';

  @override
  String get finishWorkout => 'ZAKONCZ TRENING';

  @override
  String get finishWorkoutConfirmTitle => 'Zakończyć trening?';

  @override
  String get finishWorkoutConfirmBody => 'Trening zostanie zapisany.';

  @override
  String get finishWorkoutConfirmAction => 'Zakończ';

  @override
  String get workoutCompleteTitle => 'Trening zapisany';

  @override
  String get planChangesSavedTitle => 'Zmiany zapisane';

  @override
  String get startWorkout => 'ROZPOCZNIJ TRENING';

  @override
  String get quickWorkout => 'SZYBKI TRENING';

  @override
  String get quickWorkoutFullBody => 'CAŁE CIAŁO';

  @override
  String get quickWorkoutInsufficientTitle => 'Za mało danych';

  @override
  String get quickWorkoutInsufficientBody =>
      'Szybki trening wymaga ćwiczeń na klatkę, plecy, jedną grupę nóg (udo przednie lub tylne) i jedno na barki, ramiona lub korpus. Oznacz grupy w postępach osobistych — albo trenuj dalej: aplikacja zapyta przy nowej nazwie.';

  @override
  String get quickWorkoutOpenProgress => 'OTWÓRZ POSTĘPY OSOBISTE';

  @override
  String get quickWorkoutPreviewTitle => 'SZYBKI TRENING · CAŁE CIAŁO';

  @override
  String get quickWorkoutStart => 'START';

  @override
  String get quickWorkoutSwap => 'Zmień';

  @override
  String get quickWorkoutNoAlternatives => 'Brak innego ćwiczenia w tej grupie';

  @override
  String get muscleGroupPromptTitle => 'Grupa mięśni';

  @override
  String get muscleGroupPromptBody =>
      'Potrzebne do szybkiego treningu na całe ciało.';

  @override
  String get muscleGroupLater => 'Później';

  @override
  String get muscleGroupClear => 'Wyczyść';

  @override
  String get muscleGroupSkip => 'Nie do szybkiego treningu';

  @override
  String get muscleGroupChest => 'Klatka';

  @override
  String get muscleGroupBack => 'Plecy';

  @override
  String get muscleGroupShoulders => 'Barki';

  @override
  String get muscleGroupCore => 'Core';

  @override
  String get muscleGroupQuads => 'Przód uda';

  @override
  String get muscleGroupHamstrings => 'Tył uda';

  @override
  String get muscleGroupArmFlex => 'Zgięcie ramion';

  @override
  String get muscleGroupArmExt => 'Wyprost ramion';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'KALENDARZ TRENINGOW';

  @override
  String get personalProgress => 'POSTĘPY OSOBISTE';

  @override
  String get personalProgressSearchHint => 'Szukaj ćwiczenia';

  @override
  String get personalProgressBestSet => 'Najlepsza seria';

  @override
  String get personalProgressMaxVolume => 'Maks. objętość';

  @override
  String get personalProgressEmpty => 'Brak ćwiczeń w treningach';

  @override
  String get favoriteExercises => 'ULUBIONE ĆWICZENIA';

  @override
  String get favoriteExercisesEmpty => 'Brak ulubionych ćwiczeń';

  @override
  String get buildWorkoutFromFavorites => 'ZŁÓŻ TRENING';

  @override
  String get exerciseHint => 'Wpisz nazwe cwiczenia';

  @override
  String get deleteFromHistory => 'Usunac z historii?';

  @override
  String get deleteExerciseHint =>
      'nie bedzie juz pojawiac sie w podpowiedziach ani w postepach osobistych.';

  @override
  String get exerciseDeleted => 'usunieto';

  @override
  String get deleteWorkoutTitle => 'USUN';

  @override
  String get deleteWorkoutMsg =>
      'Usunac ten trening? Historia postepu zostanie utracona.';

  @override
  String get removeSetWithDataConfirm =>
      'Usunac serie z danymi? Tej akcji nie mozna cofnac.';

  @override
  String get removeExerciseFromWorkout => 'Usun cwiczenie';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'Usunac to cwiczenie z treningu? Tej akcji nie mozna cofnac.';

  @override
  String get deleteClientTitle => 'USUN KLIENTA';

  @override
  String get deleteClientMsg =>
      'Czy na pewno usunac tego klienta? Wszystkie jego przyszle treningi zostana usuniete.';

  @override
  String get noClientsTitle => 'BRAK KLIENTOW';

  @override
  String get noClientsMsg => 'Najpierw dodaj klientow w menu Klienci.';

  @override
  String get newClient => 'NOWY KLIENT';

  @override
  String get editClient => 'EDYTUJ';

  @override
  String get clientName => 'Imie';

  @override
  String get clientNameCannotChange => 'Imienia nie da sie pozniej zmienic.';

  @override
  String get clientNameTaken => 'To imie jest juz zajete. Wybierz inne.';

  @override
  String get clientGoal => 'Cel';

  @override
  String get clientWeight => 'Waga';

  @override
  String get clientHeight => 'Wzrost';

  @override
  String get clientNotes => 'Notatki';

  @override
  String get saveClientChanges => 'ZAPISZ ZMIANY';

  @override
  String get clientProfileUnsavedTitle => 'Niezapisane zmiany';

  @override
  String get clientProfileUnsavedMessage =>
      'Masz niezapisane zmiany. Zapisać przed wyjściem?';

  @override
  String get clientProfileStay => 'Zostań';

  @override
  String get clientProfileDiscard => 'Wyjdź bez zapisu';

  @override
  String get clientProfileSaveAndLeave => 'Zapisz i wyjdź';

  @override
  String get workoutRecoveryTitle => 'Trening przerwany';

  @override
  String get workoutRecoveryMessage =>
      'Poprzedni trening zakończył się niespodziewanie. Kontynuuj od zapisanych danych lub usuń szkic.';

  @override
  String get workoutRecoveryContinue => 'Kontynuuj trening';

  @override
  String get workoutRecoveryDelete => 'Usuń trening';

  @override
  String get workoutRecoverySessionMissing =>
      'Zaplanowany trening klienta został usunięty. Szkic został wyczyszczony.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Najpierw uzupełnij bieżące ćwiczenie, zanim dodasz kolejne.';

  @override
  String get switchWorkoutTypeTitle => 'Zmienić typ treningu?';

  @override
  String get switchWorkoutTypeBody =>
      'Serie drugiego typu nie zostaną zapisane w tym treningu.';

  @override
  String get switchWorkoutTypeConfirm => 'Zmień';

  @override
  String get saveWorkoutNothingToSave =>
      'Nie ma jeszcze nic do zapisania. Dodaj ciężar i powtórzenia albo czas cardio.';

  @override
  String get importedHistoryBadge => 'Import';

  @override
  String get clientWorkoutHistoryEmpty => 'Brak treningów';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Ćwiczenie nr $n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Ćwiczenie nr $n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return 'nr $n';
  }

  @override
  String get clientProfileSectionGoal => 'CEL';

  @override
  String get clientProfileSectionAnthropometry => 'ANTROPOMETRIA';

  @override
  String get clientProfileSectionTrainerNotes => 'NOTATKI TRENERA';

  @override
  String get clientProfileSectionWorkoutHistory => 'HISTORIA TRENINGÓW';

  @override
  String get clientTrainerNotesHint => 'Kontuzje, uwagi, plan…';

  @override
  String get trainerSessionDefaultTitle => 'Trening';

  @override
  String get durationMinutesShort => 'min';

  @override
  String get addTraining => 'DODAJ TRENING';

  @override
  String get repeatLastWorkout => 'Powtórz ostatni trening';

  @override
  String get repeatLastUnavailable =>
      'Ten klient nie ma jeszcze treningu do powtórzenia.';

  @override
  String get editPlan => 'Edytuj plan';

  @override
  String get trainerSessionEmpty => 'Jeszcze nie zaplanowano';

  @override
  String trainerSessionPlanned(int n) {
    return 'Plan: $n';
  }

  @override
  String get trainerClientsEmpty =>
      'Brak klientów. Dodaj kogoś, aby planować treningi.';

  @override
  String get clientNeverTrained => 'Brak treningów';

  @override
  String get clientNoUpcoming => 'Brak nadchodzącej sesji';

  @override
  String clientLastSession(String when) {
    return 'Ostatni: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Następny: $when';
  }

  @override
  String get clientSessionToday => 'dziś';

  @override
  String get clientSessionYesterday => 'wczoraj';

  @override
  String get clientSessionTomorrow => 'jutro';

  @override
  String clientSessionDaysAgo(int n) {
    return '$n dn. temu';
  }

  @override
  String clientSessionInDays(int n) {
    return 'za $n dn.';
  }

  @override
  String get clientProfileDetails => 'Profil';

  @override
  String get addSessionPickClient => 'Wybierz klienta';

  @override
  String get clientLabel => 'Klient';

  @override
  String get deleteClientBtn => 'USUN KLIENTA';

  @override
  String get clientsMenu => 'KLIENCI';

  @override
  String get dateHeader => 'Data';

  @override
  String get clientHeader => 'Klient';

  @override
  String get exerciseHeader => 'Cwiczenie';

  @override
  String get typeHeader => 'Typ';

  @override
  String get strengthType => 'Silowy';

  @override
  String get cardioType => 'Cardio';

  @override
  String get weightHeader => 'Ciezar';

  @override
  String get weightUnitsChoiceShort => 'kg / lb';

  @override
  String get progressChartWeightLegend =>
      'Ciezar — kg / lb (wedlug preferencji)';

  @override
  String get progressChartVolumeLegend => 'Objetosc (tonaz)';

  @override
  String get repsHeader => 'Powt.';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'Czas (min)';

  @override
  String get intensityHeader => 'Intensywnosc';

  @override
  String get setHeader => 'Seria';

  @override
  String get strength => 'Silowy';

  @override
  String get cardio => 'Cardio';

  @override
  String get timeMin => 'Czas (min)';

  @override
  String get intensity => 'Intensywnosc';

  @override
  String get reserve => 'Rezerwa';

  @override
  String get sets => 'Serie';

  @override
  String get time => 'Czas';

  @override
  String get rest => 'Odpoczynek';

  @override
  String get settings => 'Ustawienia';

  @override
  String get max => 'Maks';

  @override
  String get totalVolume => 'Laczna objetosc';

  @override
  String get chart => 'Wykres';

  @override
  String get progress => 'Postep';

  @override
  String get dayMonday => 'Poniedzialek';

  @override
  String get dayTuesday => 'Wtorek';

  @override
  String get dayWednesday => 'Sroda';

  @override
  String get dayThursday => 'Czwartek';

  @override
  String get dayFriday => 'Piatek';

  @override
  String get daySaturday => 'Sobota';

  @override
  String get daySunday => 'Niedziela';

  @override
  String get greetingHi => 'Czesc';

  @override
  String get greetingMorning => 'Dzien dobry';

  @override
  String get greetingAfternoon => 'Dobrego popoludnia';

  @override
  String get greetingEvening => 'Dobry wieczor';

  @override
  String get monthJanuary => 'Styczen';

  @override
  String get monthFebruary => 'Luty';

  @override
  String get monthMarch => 'Marzec';

  @override
  String get monthApril => 'Kwiecien';

  @override
  String get monthMay => 'Maj';

  @override
  String get monthJune => 'Czerwiec';

  @override
  String get monthJuly => 'Lipiec';

  @override
  String get monthAugust => 'Sierpien';

  @override
  String get monthSeptember => 'Wrzesien';

  @override
  String get monthOctober => 'Pazdziernik';

  @override
  String get monthNovember => 'Listopad';

  @override
  String get monthDecember => 'Grudzien';

  @override
  String get exerciseBenchPress => 'Wyciskanie lezac';

  @override
  String get exerciseSquat => 'Przysiad';

  @override
  String get exerciseRow => 'Wioslowanie';

  @override
  String get exerciseDeadlift => 'Martwy ciag';

  @override
  String get exerciseOverheadPress => 'Wyciskanie nad glowe';

  @override
  String get exercisePullUp => 'Podciaganie';

  @override
  String get exerciseLunges => 'Wykroki';

  @override
  String get exercisePlank => 'Deska';

  @override
  String get saveWorkout => 'ZAPISZ TRENING';

  @override
  String get deleteWorkout => 'USUN TRENING';

  @override
  String get deleteTraining => 'Usun trening';

  @override
  String get deleteTrainingQuestion => 'Usunac ten trening z harmonogramu?';

  @override
  String get addSetButton => 'Dodaj serie';

  @override
  String get progressButton => 'Postep';

  @override
  String get filterMonth => 'Miesiac';

  @override
  String get filterYear => 'Rok';

  @override
  String get filterAllTime => 'Caly okres';

  @override
  String get noteLabel => 'Notatka';

  @override
  String get addClient => 'DODAJ KLIENTA';

  @override
  String get workoutsToday => 'DZISIEJSZE TRENINGI';

  @override
  String get workoutNumberPrefix => 'Trening #';

  @override
  String get noEntries => 'Brak wpisow';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Polityka prywatności';

  @override
  String get instructionButton => 'INSTRUKCJA';

  @override
  String get instructionTitle => 'Jak to jest ułożone';

  @override
  String get instructionHubManifest =>
      'Bez katalogu ćwiczeń i gotowych programów. Nazywasz ruchy swoimi słowami — aplikacja prowadzi po nich statystyki.';

  @override
  String get instructionSearchHint => 'Szukaj w instrukcji';

  @override
  String get instructionSearchEmpty => 'Nic nie znaleziono.';

  @override
  String get instructionChapterStartTitle => 'Od czego zacząć';

  @override
  String get instructionChapterStartBlurb =>
      'Ekran główny, dwa tryby i logika aplikacji.';

  @override
  String get instructionChapterSessionTitle => 'Na treningu';

  @override
  String get instructionChapterSessionBlurb =>
      'Serie, ciężar, powtórzenia, RIR, cardio i zakończenie sesji.';

  @override
  String get instructionChapterTimerTitle => 'Stoper';

  @override
  String get instructionChapterTimerBlurb =>
      'Interwały, odpoczynek między seriami i sygnały.';

  @override
  String get instructionChapterExercisesTitle => 'Ćwiczenia i grupy';

  @override
  String get instructionChapterExercisesBlurb =>
      'Własna lista ruchów, grupy mięśni, ulubione i szybki trening.';

  @override
  String get instructionChapterProgressTitle => 'Postępy i rekordy';

  @override
  String get instructionChapterProgressBlurb =>
      'Postępy osobiste, 1RM, tonaż i wykres ćwiczenia.';

  @override
  String get instructionChapterRhythmTitle => 'Rytm i regeneracja';

  @override
  String get instructionChapterRhythmBlurb =>
      'Wskaźnik tygodniowego rytmu i tydzień roztrenowania.';

  @override
  String get instructionChapterDataTitle => 'Historia i dane';

  @override
  String get instructionChapterDataBlurb =>
      'Kalendarz, edycja wpisów, statystyki i kopia zapasowa.';

  @override
  String get instructionChapterCoachTitle => 'Tryb trenera';

  @override
  String get instructionChapterCoachBlurb =>
      'Klienci, grafik, plan sesji i druk.';

  @override
  String get instructionPhilosophy =>
      'IronVibe nie uczy trenować i nie serwuje gotowych programów — do tego jest trener i własne doświadczenie. Nie ma katalogu z tysiącami ćwiczeń: nazwy ruchów wpisujesz swoimi słowami, a aplikacja spokojnie liczy cyfry. Wszystko zostaje na urządzeniu: bez kont, subskrypcji i reklam.';

  @override
  String get instructionSectionHome => 'Ekran główny';

  @override
  String get instructionThemeTitle => 'Motyw';

  @override
  String get instructionThemeDesc =>
      'Przełącznik słońce — księżyc zmienia jasny i ciemny wygląd. Wybór zostaje zapamiętany.';

  @override
  String get instructionTrainSelfTitle => 'Trenuję siebie';

  @override
  String get instructionTrainSelfDesc =>
      'Twój obszar: treningi, kalendarz, postępy osobiste, ulubione i wskaźnik rytmu.';

  @override
  String get instructionTrainOthersTitle => 'Trenuję innych';

  @override
  String get instructionTrainOthersDesc =>
      'Tryb trenera: klienci, grafik i osobna historia na każdą osobę. Nie miesza się z twoimi treningami.';

  @override
  String get instructionLanguageTitle => 'Język';

  @override
  String get instructionLanguageDesc =>
      'Aplikacja idzie za językiem systemu — osobnego ustawienia nie ma. Obsługiwanych jest dziesięć języków.';

  @override
  String get instructionHomeLinksTitle => 'Wersja i kontakt';

  @override
  String get instructionHomeLinksDesc =>
      'Na dole ekranu głównego: numer wersji, strona, Telegram, e-mail wsparcia i polityka prywatności.';

  @override
  String get instructionSectionAthleteMenu => 'Twoje treningi';

  @override
  String get instructionStartWorkoutTitle => 'Rozpocznij trening';

  @override
  String get instructionStartWorkoutDesc =>
      'Otwiera pustą sesję — ostatni trening nie jest kopiowany. Dodajesz ćwiczenia, wpisujesz serie i kończysz, żeby zapisać.';

  @override
  String get instructionQuickWorkoutTitle => 'Szybki trening';

  @override
  String get instructionQuickWorkoutDesc =>
      'Składa całe ciało z czterech ćwiczeń według twoich znaczników grup mięśni.';

  @override
  String get instructionCalendarMenuTitle => 'Kalendarz treningów';

  @override
  String get instructionCalendarMenuDesc =>
      'Dni, w które trenowałeś. Stąd otwierasz zapisane sesje i dopisujesz pominięte.';

  @override
  String get instructionSectionPersonalProgress => 'Postępy osobiste';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabela najlepszych serii, szacowanego 1RM i maksymalnej objętości każdego ruchu.';

  @override
  String get instructionFavoritesMenuTitle => 'Ulubione ćwiczenia';

  @override
  String get instructionFavoritesMenuDesc =>
      'Ruchy oznaczone gwiazdką. Z nich składasz trening w parę stuknięć.';

  @override
  String get instructionSectionWorkout => 'Sesja';

  @override
  String get instructionStrengthCardioTitle => 'Siłowy albo cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Przełącznik u góry sesji ustawia typ. Siłowy: ciężar, powtórzenia i RIR. Cardio: czas i intensywność. Jeśli dane drugiego typu już są, aplikacja zapyta.';

  @override
  String get instructionAddExerciseTitle => 'Dodaj ćwiczenie';

  @override
  String get instructionAddExerciseBody =>
      'Nowy blok pojawi się, gdy bieżące ćwiczenie ma nazwę i przynajmniej jedną wypełnioną serię.';

  @override
  String get instructionPreviousHintsTitle => 'Szare podpowiedzi';

  @override
  String get instructionPreviousHintsDesc =>
      'Ciężar i powtórzenia z ostatniego razu są szare — to orientacja do zbicia, nie zapisana seria. Do historii trafia tylko to, co wpiszesz sam.';

  @override
  String get instructionRemoveExerciseTitle => 'Usuń ćwiczenie';

  @override
  String get instructionRemoveExerciseDesc =>
      'Czerwony krzyżyk usuwa blok z bieżącej sesji. Zapisana historia się nie zmienia.';

  @override
  String get instructionSectionSetControl => 'Wiersz serii';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc => 'Dodaje pusty wiersz następnej serii.';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Usuwa ostatnią serię. Pusty wiersz znika od razu, wypełniony — po potwierdzeniu. Jeśli seria została jedna, pola po prostu się czyszczą.';

  @override
  String get instructionSetProgressLabel => 'Wykres ćwiczenia';

  @override
  String get instructionSetProgressDesc =>
      'Otwiera dynamikę tego ruchu za miesiąc, rok albo cały czas.';

  @override
  String get instructionExerciseVolumeTitle => 'Tonaż ćwiczenia';

  @override
  String get instructionExerciseVolumeDesc =>
      'Na prawo od przycisku wykresu: suma ciężar × powtórzenia ze wszystkich wypełnionych serii. Przelicza się w locie.';

  @override
  String get instructionSectionInputs => 'Co znaczą pola';

  @override
  String get instructionWeightTitle => 'Ciężar';

  @override
  String get instructionWeightBody =>
      'Ciężar roboczy. Kilogramy albo funty — aplikacja jednostek nie przelicza i niczego nie narzuca.';

  @override
  String get instructionRepsTitle => 'Powtórzenia';

  @override
  String get instructionRepsBody => 'Ile razy wykonałeś ruch w serii.';

  @override
  String get instructionRirTitle => 'RIR — zapas powtórzeń';

  @override
  String get instructionRirBody =>
      'Ile powtórzeń mógłbyś jeszcze zrobić. 0 to praca do załamania, ∞ seria rozgrzewkowa. Prosty sposób dawkowania intensywności.';

  @override
  String get instructionOneRmTitle =>
      '1RM — maksymalny ciężar na jedno powtórzenie';

  @override
  String get instructionOneRmDesc =>
      'Szacunek ciężaru na jedno powtórzenie według wzoru Epleya, z ciężaru i powtórzeń serii. Pokazuje się pod wierszem — kluczowy punkt odniesienia siły.';

  @override
  String get instructionSectionCardio => 'Cardio';

  @override
  String get instructionCardioTitle => 'Czas';

  @override
  String get instructionCardioBody =>
      'Czas trwania bloku w minutach. Bez dystansu i tętna: aplikacja nie jest spięta z trackerami.';

  @override
  String get instructionIntensityTitle => 'Intensywność';

  @override
  String get instructionIntensityBody =>
      'Wysiłek od 1 do 5 — uproszczona skala RPE. W sesji cardio na ćwiczenie zapisuje się jeden wiersz.';

  @override
  String get instructionSectionSaving => 'Zakończenie';

  @override
  String get instructionFinishTitle => 'Zakończ trening';

  @override
  String get instructionFinishBody =>
      'Przycisk na dole sesji: aplikacja dopyta i wpisze trening do historii. Potrzebna jest przynajmniej jedna wypełniona seria.';

  @override
  String get instructionLeaveWorkoutTitle => 'Wyjście wcześniej';

  @override
  String get instructionLeaveWorkoutDesc =>
      'Jeśli zamkniesz sesję z danymi, możesz zostać, zapisać to, co wpisałeś, albo usunąć szkic.';

  @override
  String get instructionAutoSaveTitle => 'Przerwany trening';

  @override
  String get instructionAutoSaveDesc =>
      'Szkic zapisuje się sam — co minutę i przy schowaniu aplikacji. Przy następnym starcie możesz kontynuować z tego samego miejsca albo go usunąć.';

  @override
  String get instructionScreenAwakeTitle => 'Ekran nie gaśnie';

  @override
  String get instructionScreenAwakeDesc =>
      'Dopóki trwa żywa sesja, ekran zostaje włączony, żeby nie odblokowywać telefonu po każdej serii.';

  @override
  String get instructionStopwatchWhyTitle => 'Po co liczyć odpoczynek';

  @override
  String get instructionStopwatchWhyBody =>
      'Pauza między seriami to taki sam parametr pracy jak ciężar i powtórzenia: krótki odpoczynek podnosi gęstość, długi daje wyłożyć się w ciężkiej serii.';

  @override
  String get instructionStopwatchHowTitle => 'Start, pauza, reset';

  @override
  String get instructionStopwatchHowBody =>
      'Stoper jest przypięty w nagłówku sesji i zostaje w polu widzenia przy przewijaniu. Na środku czas i sterowanie; w zwykłym trybie liczy w górę, z setnymi sekundy.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Z lewej: interwały';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — minuta pracy i minuta odpoczynku. 4/4 — po cztery minuty. 20/10 — tabata. Fazy kręcą się w kółko do pauzy albo resetu: czerwony odcień to praca, niebieski — odpoczynek.';

  @override
  String get instructionStopwatchRestTitle => 'Z prawej: odpoczynek';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m i +5m uruchamiają odliczanie między seriami. Jeśli odliczanie już idzie, minuty dodają się do reszty; cykl interwałów przełączy się na odpoczynek.';

  @override
  String get instructionStopwatchProgressTitle => 'Pasek fazy';

  @override
  String get instructionStopwatchProgressBody =>
      'W odliczaniu i interwałach pod cyframi widać, ile bieżącej fazy zostało.';

  @override
  String get instructionStopwatchSoundsTitle => 'Dźwięk i wibracja';

  @override
  String get instructionStopwatchSoundsBody =>
      'Na trzy, dwie i jedną sekundę przed końcem fazy — krótki klik i lekka wibracja; przy zmianie fazy sygnał jest wyraźniejszy. Dźwięki są w aplikacji: bez mikrofonu i bez zgody na powiadomienia. Głośność bierze się z ustawień telefonu.';

  @override
  String get instructionExerciseBankIntro =>
      'Lista ćwiczeń rośnie sama: każda nowa nazwa z ukończonego treningu trafia do podpowiedzi. Nazwy są wielkimi literami, żeby ten sam ruch się nie rozdwajał.';

  @override
  String get instructionSectionExerciseNameTools => 'Nazwy';

  @override
  String get instructionRenameExerciseTitle => 'Zmień nazwę wszędzie';

  @override
  String get instructionRenameExerciseDesc =>
      'Długie naciśnięcie nazwy — w sesji, na liście podpowiedzi albo w zapisanym treningu. Nazwa zaktualizuje się w całej historii i na wykresach.';

  @override
  String get instructionRemoveFromBankTitle => 'Usuń z podpowiedzi';

  @override
  String get instructionRemoveFromBankDesc =>
      'Krzyżyk na otwartej liście podpowiedzi albo czerwony krzyżyk w postępach osobistych zdejmuje nazwę z podpowiedzi i z tabeli. Zapisane treningi zostają nietknięte.';

  @override
  String get instructionReassignExerciseTitle => 'Podmień we wpisie';

  @override
  String get instructionReassignExerciseDesc =>
      'W zapisanym treningu blok można przepisać na inny ruch. Serie zostaną jak były, ale pójdą do statystyk nowej nazwy — zmienia się tylko ta sesja.';

  @override
  String get instructionSectionMuscleGroups => 'Grupy mięśni';

  @override
  String get instructionMuscleGroupsIntro =>
      'Grupa to opcjonalny znacznik przy twojej nazwie. Potrzebna jest tylko szybkiemu treningowi, żeby złożyć zrównoważone całe ciało. Osiem grup: klatka, plecy, barki, core, przód uda, tył uda, zgięcie ramion, wyprost ramion.';

  @override
  String get instructionMuscleGroupTagTitle => 'Jak oznaczyć';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Przy pierwszym wpisaniu nowej nazwy aplikacja zapyta o grupę. Możesz odpowiedzieć Później albo Nie do szybkiego treningu, jeśli ruch nie ma wchodzić do miksu. Znacznik pod nazwą w postępach i ulubionych łatwo zmienić albo zdjąć.';

  @override
  String get instructionSectionFavorites => 'Ulubione';

  @override
  String get instructionFavoriteStarTitle => 'Gwiazdka';

  @override
  String get instructionFavoriteStarDesc =>
      'Gwiazdka jest na karcie ćwiczenia w sesji i w tabeli postępów osobistych. Ulubione trzymają się na górze listy.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Złóż trening';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'Na ekranie ulubionych zaznacz ruchy — przycisk pojawi się od razu. Sesja otworzy się w tej kolejności, z szarymi podpowiedziami z ostatniego razu. Dla klienta ta sama czynność otwiera jego trening.';

  @override
  String get instructionSectionQuickWorkout => 'Szybki trening';

  @override
  String get instructionQuickWorkoutHowTitle => 'Cztery miejsca';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Klatka, plecy, jedna połowa nóg (przód albo tył uda — nigdy oba tego samego dnia) i jeden ruch na barki, ramiona albo core. W każdym miejscu aplikacja bierze grupę, która najdłużej nie pracowała, i daje pierwszeństwo ulubionemu.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Podgląd i zamiana';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'Przed startem widać cały skład: dowolne miejsce można zamienić na inne ćwiczenie z tej samej grupy. Jeśli oznaczonych ruchów brakuje, aplikacja o tym powie i otworzy postępy osobiste, żebyś rozstawił znaczniki.';

  @override
  String get instructionPersonalProgressIntro =>
      'Jedna tabela wszystkich ruchów z zapisanych treningów. Ulubione na górze, reszta alfabetycznie; wyszukiwanie znajduje po nazwie. Otwiera się z menu treningów albo z profilu klienta.';

  @override
  String get instructionProgressBestSetTitle => 'Najlepsza seria';

  @override
  String get instructionProgressBestSetDesc =>
      'Seria z najwyższym szacowanym 1RM w całej historii. Dla ruchów bez ciężaru bierze się serię z największą liczbą powtórzeń.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Maksymalna objętość';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'Największy tonaż tego ćwiczenia w jednym treningu — punkt odniesienia, od którego wygodnie planować objętość roboczą.';

  @override
  String get instructionSectionProgressChart => 'Wykres ćwiczenia';

  @override
  String get instructionProgressChartIntro =>
      'Trzy niezależne krzywe według dat. Z lewej skala ciężaru, z prawej powtórzeń; żółta linia jest znormalizowana, żeby trendy porównywać po kształcie. Okres przełącza się — miesiąc, rok, cały czas — a dotknięcie punktu pokazuje cyfry tego dnia. Cardio na wykres nie wchodzi.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Czerwona — największy ciężar w jednej serii tego dnia.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Błękitna — najwięcej powtórzeń w serii, niekoniecznie z maksymalnym ciężarem.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Żółta — dzienny tonaż: suma ciężar × powtórzenia z serii, w których wypełnione są oba pola.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Na żywym treningu przycisk wykresu podświetla się, gdy bijesz rekord: czerwonym — po ciężarze serii, żółtym — po tonażu ćwiczenia, błękitnym — po sumie powtórzeń w ruchach bez ciężaru. Jeśli zbiegło się kilka, pierwszeństwo ma czerwony, potem żółty i błękitny. W zapisanej historii podświetlenia nie ma.';

  @override
  String get instructionRhythmIntro =>
      'Gdy w ostatnich czterech tygodniach zbierze się przynajmniej trzy dni siłowe, na górze ekranu treningów pojawia się wskaźnik rytmu. To nie cel i nie ocena — po prostu to, jak teraz chodzisz na siłownię.';

  @override
  String get instructionRhythmGaugeTitle => 'Dni w tygodniu';

  @override
  String get instructionRhythmGaugeDesc =>
      'Łuk wypełnia się od jednego do sześciu dni — średnia z czterech tygodni. Liczą się dni z pracą siłową, dni samego cardio — nie. Im gęstszy rytm, tym dalej kolor odchodzi od stali przez złoto do rdzy.';

  @override
  String get instructionRhythmInsightTitle => 'Analiza rytmu';

  @override
  String get instructionRhythmInsightDesc =>
      'Stuknij we wskaźnik: aplikacja nazwie twój tryb — spokojny, równy, gęsty albo prawie bez dni wolnych — i wyjaśni, co to znaczy dla regeneracji. U klienta trenera otwiera się ta sama analiza.';

  @override
  String get instructionRhythmDeloadTitle => 'Tydzień roztrenowania';

  @override
  String get instructionRhythmDeloadDesc =>
      'Roztrenowanie to nie pauza, tylko tydzień na pół gwizdka: ciężary robocze i liczba serii niższe o 30–50%, albo samo cardio. Mięśnie regenerują się szybciej niż więzadła, ścięgna i stawy — taki tydzień daje im czas dogonić.';

  @override
  String get instructionRhythmNudgeTitle => 'Przypomnienie';

  @override
  String get instructionRhythmNudgeDesc =>
      'Jeśli trzymasz od dwóch i pół treningów w tygodniu i dawno się nie roztrenowywałeś, aplikacja zaproponuje taki tydzień. Im gęstszy rytm, tym wcześniej pojawi się podpowiedź. Wyskakuje nie częściej niż raz w tygodniu i tylko w trybie osobistym — i zostaje rekomendacją, nie poradą medyczną.';

  @override
  String get instructionSectionCalendar => 'Kalendarz i historia';

  @override
  String get instructionCalendarBrowseTitle => 'Jak przeglądać';

  @override
  String get instructionCalendarBrowseDesc =>
      'Miesiące przesuwasz gestem, a stuknięcie w nazwę miesiąca otwiera szybki wybór daty. Kropka pod liczbą oznacza, że tego dnia był trening.';

  @override
  String get instructionCalendarAddTitle => 'Wpis wstecz';

  @override
  String get instructionCalendarAddDesc =>
      'Wybierz dzień, ustaw godzinę i dodaj trening — także za datę, która już minęła. Wygodne, gdy sesję zapomniałeś zapisać.';

  @override
  String get instructionNavHistoryTitle => 'Tonaż treningu';

  @override
  String get instructionNavHistoryDesc =>
      'Przy każdej zapisanej sesji jest łączny tonaż. Objętość to jeden z najpewniejszych punktów hipertrofii: liczy się nie rekord jednego dnia, tylko to, jak trzyma się z tygodnia na tydzień.';

  @override
  String get instructionHistoryEditTitle => 'Edycja wpisów';

  @override
  String get instructionHistoryEditDesc =>
      'Zapisany trening można rozwinąć i poprawić: dodać ćwiczenie albo serię, zmienić cyfry, usunąć sesję w całości. Zmiany zapisują się od razu.';

  @override
  String get instructionSectionStats => 'Statystyki';

  @override
  String get instructionStatsTitle => 'Podsumowanie treningów';

  @override
  String get instructionStatsDesc =>
      'Ikona wykresu w nagłówku ekranu treningów albo trenera: ile sesji było w miesiącu, w roku i w ogóle. W trybie trenera — jeszcze podział na klientów.';

  @override
  String get instructionSectionBackup => 'Kopia zapasowa';

  @override
  String get instructionNavImportExportTitle => 'Eksport i import';

  @override
  String get instructionNavImportExportDesc =>
      'Eksport składa do jednego pliku JSON historię, listę ćwiczeń, ulubione, znaczniki grup, klientów i grafik. Import miesza plik z bieżącymi danymi i pomija duplikaty — nic nie jest nadpisywane. Kopia trenera jest oddzielona od osobistej.';

  @override
  String get instructionBackupNudgeTitle => 'Przypomnienie o kopii';

  @override
  String get instructionBackupNudgeDesc =>
      'Dane żyją tylko na tym urządzeniu: bez kont i chmury. Co cztery tygodnie aplikacja zaproponuje zapisać kopię — jeśli telefon zginie, historia wróci tylko z pliku.';

  @override
  String get instructionTrainerIntro =>
      '«Trenuję innych» to osobny obszar do pracy z ludźmi: klienci, grafik i własna historia na każdego. Osobiste treningi i dane trenera się nie przecinają.';

  @override
  String get instructionClientsTitle => 'Klienci';

  @override
  String get instructionClientsDesc =>
      'Lista z celem, ostatnią i następną sesją. Na karcie: cel, waga, wzrost i prywatne notatki trenera. Imię ustawia się przy tworzeniu i potem się nie zmienia.';

  @override
  String get instructionClientProfileTitle => 'Profil klienta';

  @override
  String get instructionClientProfileDesc =>
      'Stąd startuje dzisiejsza sesja i otwierają się postępy, ulubione oraz historia po miesiącach. Jeśli siłowych dni wystarczy, jest też wskaźnik rytmu. Usunięcie klienta zdejmuje przyszłe sesje, ale minione treningi zostają do rozliczenia.';

  @override
  String get instructionTrainerScheduleTitle => 'Grafik';

  @override
  String get instructionTrainerScheduleDesc =>
      'Kalendarz trenera pokazuje sesje wszystkich klientów: ikona odtwarzania to zaplanowana, ptaszek — zakończona, klepsydra — dzisiejsza w toku. Puste plany minionych dni znikają same.';

  @override
  String get instructionTrainerPlanTitle => 'Plan sesji';

  @override
  String get instructionTrainerPlanDesc =>
      'Na przyszłą datę ćwiczenia i notatkę można rozstawić z wyprzedzeniem i zapisać, nie kończąc treningu. Ciężar i powtórzenia z ostatniego razu przyjdą szarymi podpowiedziami. Do historii trafiają tylko zakończone sesje.';

  @override
  String get instructionTrainerRepeatTitle => 'Powtórz ostatni';

  @override
  String get instructionTrainerRepeatDesc =>
      'Z profilu klienta albo przełącznikiem przy dodawaniu sesji w kalendarzu. Kopiuje się skład ćwiczeń; ciężar i powtórzenia przychodzą szarymi podpowiedziami, nie gotowymi seriami.';

  @override
  String get instructionPrintSessionTitle => 'Druk sesji';

  @override
  String get instructionPrintSessionDesc =>
      'W zakończonym treningu ikona druku w nagłówku składa arkusz A4 ze składem i cyframi dnia. Dalej okno systemowe: drukarka, PDF albo wysyłka do klienta.';

  @override
  String get instructionImportAthleteTitle => 'Import historii atlety';

  @override
  String get instructionImportAthleteDesc =>
      'Osobny przycisk w statystykach trenera: plik z trybu osobistego zakłada się jako nowego klienta wraz z ulubionymi i znacznikami grup. Przeniesione treningi są oznaczone jako importowane, a nazwy ćwiczeń nie mieszają się z twoimi.';

  @override
  String get printSession => 'Drukuj';

  @override
  String get printSessionEmpty =>
      'Na razie nie ma czego drukować. Zapisz przynajmniej jedną serię.';

  @override
  String get printSessionShareText => 'Sesja IronVibe';

  @override
  String get rhythmPerWeek => 'tygodniowo';

  @override
  String get deloadNudgeTitle => 'Tydzień aktywnego wypoczynku?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Trenujesz około $rate dni w tygodniu od mniej więcej $weeks tyg. Dobry moment na tydzień aktywnego wypoczynku: robocze ciężary i serie niższe o 30–50% albo samo cardio. To rekomendacja, nie porada medyczna.';
  }

  @override
  String get deloadNudgeLater => 'Nie teraz';

  @override
  String get deloadNudgeOk => 'Rozumiem';

  @override
  String get backupNudgeTitle => 'Zapisać kopię?';

  @override
  String get backupNudgeBody =>
      'Dane są tylko na tym urządzeniu. Jeśli je zgubisz albo padnie pamięć, historia zniknie. Udostępnij kopię teraz albo odłóż o 28 dni.';

  @override
  String get backupNudgeShare => 'Udostępnij';

  @override
  String get backupNudgeLater => 'Później';

  @override
  String get rhythmInsightTitle => 'Rytm treningów';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'Trenujesz średnio około $rate razy w tygodniu.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name trenuje średnio około $rate razy w tygodniu.';
  }

  @override
  String get rhythmInsightBandLight => 'Spokojny rytm';

  @override
  String get rhythmInsightBandSteady => 'Równy rytm';

  @override
  String get rhythmInsightBandDense => 'Gęsty rytm';

  @override
  String get rhythmInsightBandVeryDense => 'Prawie bez dni wolnych';

  @override
  String get rhythmInsightHowTitle => 'Skąd ta liczba';

  @override
  String get rhythmInsightWindow =>
      'Średnia z ostatnich czterech tygodni. Liczą się dni z ćwiczeniami siłowymi; dni wyłącznie cardio — nie. To nie cel i nie ocena, tylko twój obecny rytm.';

  @override
  String get rhythmInsightWhatTitle => 'Tydzień aktywnego wypoczynku';

  @override
  String get rhythmInsightWhatBody =>
      'To nie pauza, tylko tydzień na pół gwizdka: robocze ciężary i liczba serii niższe o 30–50%. Możesz też odłożyć siłowe i zostawić cardio albo inną aktywność. Mięśnie regenerują się szybciej niż stawy, więzadła i ścięgna — taki tydzień daje im czas dogonić.';

  @override
  String get rhythmInsightPaceTitle => 'Co to znaczy';

  @override
  String get rhythmInsightAdviceLight =>
      'Między treningami jest dość wolnych dni, zmęczenie się nie spiętrza. Na razie nie trzeba planować aktywnego wypoczynku — przy takim rytmie ciało regeneruje się samo.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Równy rytm, na którym można pracować latami. Jeśli treningi są ciężkie, co kilka miesięcy bierz tydzień aktywnego wypoczynku — lepiej wcześniej, niż gdy ciężary staną.';

  @override
  String get rhythmInsightAdviceDense =>
      'Treningi idą gęsto, a zmęczenie zbiera się po cichu. Tydzień aktywnego wypoczynku co dwa–trzy miesiące zwykle trzyma postęp lepiej niż praca bez przerw.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Prawie każdy dzień pod obciążeniem. Tak można, jeśli sen i jedzenie nadążają. Przy takim rytmie tydzień aktywnego wypoczynku mniej więcej raz w miesiącu to zwykła profilaktyka stawów i więzadeł, nie słabość.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Właśnie na takim rytmie ludzie trzymają się latami.';

  @override
  String get rhythmInsightPraiseDense =>
      'Trenujesz często — taki grafik sam się nie układa.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Wygląda na to, że namierzyłeś tajny tryb organizmu.';

  @override
  String get rhythmInsightRecentLighter =>
      'Ostatnio obciążenie już było niższe niż zwykle — aktywny wypoczynek można uznać za zaliczony. Nabieraj tempa.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Taki rytm trzyma się już $weeks tygodnia.',
      many: 'Taki rytm trzyma się już $weeks tygodni.',
      few: 'Taki rytm trzyma się już $weeks tygodnie.',
      one: 'Taki rytm trzyma się już $weeks tydzień.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'To rekomendacja, nie porada medyczna. Jeśli czujesz się dobrze — nic nie trzeba zmieniać.';
}
