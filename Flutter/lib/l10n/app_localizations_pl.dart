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
  String get instructionTitle => 'Jak to działa';

  @override
  String get instructionPhilosophy =>
      'IronVibe celowo nie ma wbudowanych katalogów ćwiczeń ani narzuconych programów. Nie uczy trenować — od tego jest YouTube i trener — tylko pomaga prowadzić statystyki po twojemu. Sam wpisujesz nazwy ćwiczeń. Opcjonalnie oznaczasz grupę mięśniową, żeby aplikacja złożyła szybki trening całego ciała z twojej listy. Im dłużej korzystasz, tym bardziej „siedzi”: aplikacja dostosowuje się do ciebie, nie odwrotnie.';

  @override
  String get instructionSectionSetControl => 'Sterowanie seriami';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Usuwa ostatnią serię. Jeśli w wierszu są już ciężar, powtórzenia lub RIR, aplikacja pyta o potwierdzenie. Pusty wiersz znika od razu. Jeśli zostaje jedna seria: w bieżącym treningu wiersz jest czyszczony; w zapisanej historii usuwane jest całe ćwiczenie.';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Dodaje nowy pusty wiersz serii w bieżącym ćwiczeniu.';

  @override
  String get instructionSetProgressLabel => 'Oś czasu';

  @override
  String get instructionSetProgressDesc =>
      'Otwiera os czasu postepu dla tego cwiczenia.';

  @override
  String get instructionSectionProgressChart => 'Wykres postepu';

  @override
  String get instructionProgressChartIntro =>
      'Trzy niezalezne trendy wg dat: czerwony — najciezsza pojedyncza seria dnia; cyan — najwiecej powtorzen w jednej serii; zolty — objetosc cwiczenia (suma ciezar × powtorzenia z dnia). Os L: ciezar; P: powtorzenia; linia zolta jest znormalizowana.';

  @override
  String get instructionProgressLineWeightLabel => 'Ciezar';

  @override
  String get instructionProgressLineWeightDesc =>
      'Czerwona linia — najwiekszy ciezar w jednej serii w kazdym dniu.';

  @override
  String get instructionProgressLineRepsLabel => 'Powtorzenia';

  @override
  String get instructionProgressLineRepsDesc =>
      'Cyan: najwiecej powtorzen w jednej serii tego dnia (bez wiazania z ciezarem max).';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Zolta linia: dzienna objetosc (tonaz), liczona jako suma ciezar × powtorzenia dla serii z obiema wartosciami.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Podczas trwajacego treningu przycisk wykresu pod seriami moze przybierac te same barwy co krzywe: czerwony gdy bijesz rekord ciezaru w jednej serii; zolty gdy laczna objetosc cwiczenia przewyzsza dotychczasowy najlepszy wynik; cyan gdy cwiczenie jest bez obciazenia a suma powtorzen ze wszystkich serii jest wyzsza niz wczesniej. Jesli spelnia sie kilka warunkow, priorytet: czerwony, potem zolty, potem cyan. Tylko podczas biezacego wpisywania treningu, nie w zapisanej historii.';

  @override
  String get instructionSectionWorkout => 'Trening';

  @override
  String get instructionAddExerciseTitle => 'Dodaj cwiczenie';

  @override
  String get instructionAddExerciseBody =>
      'Dodaje nowy blok. Najpierw wpisz nazwę bieżącego ćwiczenia — aplikacja przypomni, jeśli pole jest puste.';

  @override
  String get instructionSectionExerciseNameTools => 'Nazwa cwiczenia';

  @override
  String get instructionRenameExerciseTitle => 'Przytrzymaj, aby zmienic nazwe';

  @override
  String get instructionRenameExerciseDesc =>
      'Przytrzymaj nazwe podczas wpisywania, na propozycji z listy lub na tytule zapisanego treningu w historii — nazwa zaktualizuje sie wszedzie.';

  @override
  String get instructionRemoveFromBankTitle => 'Usun z listy';

  @override
  String get instructionRemoveFromBankDesc =>
      'Gdy lista podpowiedzi pod polem nazwy jest otwarta, dotknij krzyzyka przy wierszu — albo czerwonego krzyzyka w postepach osobistych — aby usunac te nazwe z podpowiedzi i z tabeli postepow. Zapisane treningi sie nie zmieniaja.';

  @override
  String get instructionSectionInputs => 'Dane';

  @override
  String get instructionWeightTitle => 'Ciezar';

  @override
  String get instructionWeightBody =>
      'Obciążenie sztangi lub przyrządu. Wpisz liczbę w kg albo lb — jak trenujesz. Aplikacja nie przelicza jednostek.';

  @override
  String get instructionRepsTitle => 'Powtorzenia';

  @override
  String get instructionRepsBody => 'Ile razy wykonano ruch w jednej serii.';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody =>
      'Ile powtorzen zostalo do zalamania miesniowego. Pomaga kontrolowac intensywnosc.';

  @override
  String get instructionOneRmTitle => '1RM (maks. na jedno powtorzenie)';

  @override
  String get instructionOneRmDesc =>
      'Szacowany maksymalny ciezar na jedno powtorzenie na podstawie biezacego ciezaru i liczby powtorzen. Kluczowy wskaznik sily do sledzenia postepu i doboru obciazen.';

  @override
  String get instructionExerciseVolumeTitle => 'Objętość ćwiczenia (suma)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Pod seriami, obok przycisku postępu: suma ciężar × powtórzenia dla wszystkich serii z oboma wartościami. Odświeża się przy edycji.';

  @override
  String get instructionSectionPersonalProgress => 'Postepy osobiste';

  @override
  String get instructionPersonalProgressIntro =>
      'Jedna tabela wszystkich ruchów z zapisanych treningów: najlepsza seria, szacowany 1RM i maksymalna objętość. Wyszukiwarka od razu znajduje nazwę. Gwiazdka oznacza ulubione; chip pod nazwą ustawia grupę mięśniową; czerwony krzyżyk usuwa nazwę z podpowiedzi i z tej tabeli (zapisane treningi zostają). Wejście: menu treningu albo profil klienta.';

  @override
  String get instructionSectionSaving => 'Zapisywanie';

  @override
  String get instructionFinishTitle => 'Zakoncz trening';

  @override
  String get instructionFinishBody =>
      'Potwierdza i zapisuje sesję w historii. Jeśli wyjdziesz wcześniej, możesz zapisać, odrzucić albo zostać. Gdy aplikacja się przerwie, szkic zostaje automatycznie.';

  @override
  String get instructionSectionCardio => 'Cardio i intensywnosc';

  @override
  String get instructionCardioTitle => 'Cardio';

  @override
  String get instructionCardioBody =>
      'Rejestruje czas i intensywnosc cardio (bez dystansu). Pomaga utrzymac rytm i kontrolowac wysilek.';

  @override
  String get instructionIntensityTitle => 'Intensywnosc';

  @override
  String get instructionIntensityBody =>
      'Uzyj skali wysilku (RPE), aby ocenic jak ciezki byl trening. To klucz do progresu bez przetrenowania.';

  @override
  String get instructionSectionStopwatch => 'Stoper (twoj pomocnik)';

  @override
  String get instructionStopwatchWhyTitle => 'Po co go uzywac?';

  @override
  String get instructionStopwatchWhyBody =>
      'Do kontroli przerw miedzy seriami. Krotka przerwa - wieksza gestosc; dluga przerwa - wiecej sily na ciezar.';

  @override
  String get instructionStopwatchHowTitle => 'Jak dziala?';

  @override
  String get instructionStopwatchHowBody =>
      'Srodek: czas, start/pauza i reset. Lewo i prawo: szybkie presety (ponizej). W zwyklym trybie stopera czas rosnie z setnymi sekundy. Timer jest przypiety do naglowka przy przewijaniu.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Lewa kolumna: interwaly';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 s pracy, 60 s odpoczynku. 4/4 — po 4 minuty pracy i odpoczynku na runde. 20/10 — tabata: 20 s wysilku, 10 s przerwy. Po wyborze timer na przemian przelacza prace i odpoczynek w petli, az zatrzymasz lub zresetujesz. Czerwonawy ton — praca; niebieski — odpoczynek.';

  @override
  String get instructionStopwatchRestTitle => 'Prawa kolumna: odpoczynek';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m i +5m uruchamiaja lub wydluzaja odliczanie w minutach. Gdy byl cykl interwalow, aplikacja przechodzi na to odliczanie. Gdy odliczanie juz trwa, minuty dodaja sie do pozostalego czasu. Wygodnie miedzy seriami.';

  @override
  String get instructionStopwatchProgressTitle => 'Pasek postepu';

  @override
  String get instructionStopwatchProgressBody =>
      'Przy odliczaniu i interwalach pod czasem widac pasek: ile zostalo z biezacej fazy.';

  @override
  String get instructionStopwatchSoundsTitle => 'Dzwiek i wibracje';

  @override
  String get instructionStopwatchSoundsBody =>
      'Na 3, 2 i 1 sekunde przed koncem: krotki dzwiek w aplikacji i lekka wibracja. Zmiana fazy lub zero: wyrazniejszy sygnal. Krotkie pliki w zestawie aplikacji; bez mikrofonu i pozwolenia na powiadomienia; glosnosc urzadzenia nadal ma znaczenie.';

  @override
  String get instructionSectionNavHistory => 'Historia i dane';

  @override
  String get instructionNavHistoryTitle => 'Historia / statystyki';

  @override
  String get instructionNavHistoryDesc =>
      'W kalendarzu/historii kazdy trening pokazuje laczny tonaz. Objetosc treningowa to jeden z najlepszych wskaznikow hipertrofii: im wiecej jakosciowej objetosci, tym wiecej miesni budujesz.';

  @override
  String get instructionNavImportExportTitle => 'Import / eksport';

  @override
  String get instructionNavImportExportDesc =>
      'Kopia lub przeniesienie danych przez eksport i import JSON w oknie statystyk. Kopia zawiera historię, listę ćwiczeń, ulubione i znaczniki grup mięśniowych. Kopia trenerska jest oddzielona od osobistej historii.';

  @override
  String get instructionSectionHome => 'Ekran główny';

  @override
  String get instructionThemeTitle => 'Motyw';

  @override
  String get instructionThemeDesc =>
      'Przełącznik słońce / księżyc na ekranie głównym zmienia jasny i ciemny motyw. Wybór jest zapamiętywany.';

  @override
  String get instructionTrainSelfTitle => 'Trenuję siebie';

  @override
  String get instructionTrainSelfDesc =>
      'Twoje treningi, kalendarz, postępy osobiste, ulubione, wskaźnik rytmu (jak często trenujesz) i szybki trening całego ciała z ćwiczeń z oznaczonymi grupami.';

  @override
  String get instructionTrainOthersTitle => 'Trenuję innych';

  @override
  String get instructionTrainOthersDesc =>
      'Tryb trenera: klienci, plan i osobna historia na osobę. Każdy klient ma własną tabelę postępów i ulubione.';

  @override
  String get instructionSectionAthleteMenu => 'Twój trening';

  @override
  String get instructionStartWorkoutTitle => 'Rozpocznij trening';

  @override
  String get instructionStartWorkoutDesc =>
      'Otwiera pustą sesję — nie kopiuje ostatniego treningu. Dodaj ćwiczenia, wpisz serie i zakończ, żeby zapisać.';

  @override
  String get instructionQuickWorkoutTitle => 'Szybki trening';

  @override
  String get instructionQuickWorkoutDesc =>
      'Składa sesję całego ciała z 4 ćwiczeń: klatka, plecy, jedna połowa nóg (udo przednie lub tylne — nigdy oba) i jedno na barki, ramiona lub korpus, zależnie od tego, co trenowałeś najdawniej. Najpierw ulubione. Ostatnie ciężary i powtórzenia są szare jako minimum do pobicia — każdą serię wpisujesz sam.';

  @override
  String get instructionCalendarMenuTitle => 'Kalendarz treningów';

  @override
  String get instructionCalendarMenuDesc =>
      'Widać, w które dni trenowałeś; możesz otworzyć zapisaną sesję albo dodać trening na wybraną datę i godzinę — także w przeszłości.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabela najlepszych serii, szacowanego 1RM i maksymalnej objętości. Tutaj oznaczasz ulubione i grupy mięśniowe.';

  @override
  String get instructionFavoritesMenuTitle => 'Ulubione ćwiczenia';

  @override
  String get instructionFavoritesMenuDesc =>
      'Lista oznaczona gwiazdką. Zaznacz wybrane i stuknij Złóż trening, żeby zacząć w tej kolejności. Ostatnie ciężary i powtórzenia są szare jako minimum do pobicia.';

  @override
  String get instructionSectionRhythm => 'Rytm treningów';

  @override
  String get instructionRhythmIntro =>
      'Po kilku treningach siłowych na górze ekranu treningów pojawia się wskaźnik. Pokazuje, ile dni w tygodniu trenowałeś średnio przez ostatnie cztery tygodnie. Dni wyłącznie cardio się nie liczą. To migawka gęstości, nie cel, którego aplikacja od ciebie wymaga.';

  @override
  String get instructionRhythmGaugeTitle => 'Dni w tygodniu';

  @override
  String get instructionRhythmGaugeDesc =>
      'Łuk wypełnia się od 1 do 6 dni w tygodniu. Chłodna stal oznacza spokojniejsze tempo, cieplejsze tony — większą gęstość. Wskaźnik pojawia się, gdy w tym czterotygodniowym oknie są co najmniej trzy dni siłowe.';

  @override
  String get instructionRhythmDeloadTitle =>
      'Przypomnienie o lżejszym tygodniu';

  @override
  String get instructionRhythmDeloadDesc =>
      'Jeśli trenujesz około dwóch i pół dnia w tygodniu lub częściej przez kilka tygodni bez lżejszego tygodnia, aplikacja może zasugerować zejście z tonażem i powtórzeniami o około 30% na tydzień. Im więcej dni w tygodniu, tym wcześniej pojawi się przypomnienie. To przypomnienie, nie zalecenie medyczne. Najwyżej raz w tygodniu.';

  @override
  String get instructionSectionFavorites => 'Ulubione';

  @override
  String get instructionFavoriteStarTitle => 'Gwiazdka';

  @override
  String get instructionFavoriteStarDesc =>
      'W postępach osobistych stuknij gwiazdkę przy ćwiczeniu, żeby dodać je lub usunąć z ulubionych. Ulubione zostają na górze tabeli.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Złóż trening';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'Na ekranie ulubionych zaznacz ćwiczenia. Przycisk pojawia się, gdy wybrane jest przynajmniej jedno. Ostatnie ciężary i powtórzenia są szare jako minimum do pobicia — każdą serię wpisujesz sam. Dla klienta ta sama akcja otwiera sesję tej osoby.';

  @override
  String get instructionSectionMuscleGroups =>
      'Grupy mięśniowe i szybki trening';

  @override
  String get instructionMuscleGroupsIntro =>
      'Grupy to opcjonalne etykiety przy twoich nazwach ćwiczeń. To nie katalog: służą tylko szybkiemu treningowi, żeby złożyć zrównoważony mix całego ciała. Osiem grup: klatka, plecy, barki, korpus, udo przednie, udo tylne, zginanie ramion, prostowanie ramion.';

  @override
  String get instructionMuscleGroupTagTitle => 'Jak oznaczyć';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Przy pierwszym wpisaniu nowej nazwy aplikacja pyta o grupę. Możesz pominąć przez Później albo zaznaczyć Nie do szybkiego treningu, jeśli ruch nie ma trafiać do mixu. Chip pod nazwą w postępach lub ulubionych zmienia albo kasuje etykietę.';

  @override
  String get instructionQuickWorkoutHowTitle => 'Jak składa się szybką sesję';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Cztery sloty: klatka, plecy, jedna połowa nóg, potem barki/ramiona/korpus według dawności. W podglądzie slot można zamienić na inne ćwiczenie z tej samej grupy. Jeśli mało — dodaj ćwiczenia sam.';

  @override
  String get instructionStrengthCardioTitle => 'Siła / Cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Przełącznik u góry sesji. Siła: ciężar, powtórzenia, RIR. Cardio: tylko czas i intensywność — bez pola dystansu.';

  @override
  String get instructionPreviousHintsTitle => 'Szare liczby z ostatniej sesji';

  @override
  String get instructionPreviousHintsDesc =>
      'Gdy wybierzesz ćwiczenie w sesji klienta, szybkim treningu lub sesji z ulubionych, ostatnie ciężary i powtórzenia są szare — minimum do pobicia, nie gotowa seria. Do historii trafiają tylko liczby, które wpiszesz sam.';

  @override
  String get instructionRemoveExerciseTitle => 'Usuń z tego treningu';

  @override
  String get instructionRemoveExerciseDesc =>
      'Usuwa blok tylko z bieżącej sesji. Zapisana historia nie zmienia się, dopóki nie zakończysz.';

  @override
  String get instructionReassignExerciseTitle => 'Zmień ćwiczenie w historii';

  @override
  String get instructionReassignExerciseDesc =>
      'W zapisanym treningu możesz przypisać blok do innej nazwy. Zmienia się tylko ta sesja; wykresy idą za nową nazwą. Serie zostają jak były.';

  @override
  String get instructionAutoSaveTitle => 'Przerwany trening';

  @override
  String get instructionAutoSaveDesc =>
      'Jeśli aplikacja zamknie się w trakcie sesji, zaproponuje kontynuację od tego miejsca albo usunięcie niezapisanego szkicu.';

  @override
  String get instructionSectionCalendar => 'Kalendarz';

  @override
  String get instructionCalendarAddTitle => 'Dodaj na datę';

  @override
  String get instructionCalendarAddDesc =>
      'Wybierz dzień i dodaj trening o wybranej godzinie. Przydatne, gdy chcesz dopisać pominiętą sesję.';

  @override
  String get instructionSectionTrainer => 'Tryb trenera';

  @override
  String get instructionTrainerIntro =>
      '„Trenuję innych” jest dla trenerów. Dodawaj klientów, ustawiaj sesje, planuj ćwiczenia z wyprzedzeniem i zapisuj treningi osobno dla każdej osoby. Powtórzenie ostatniej sesji jest opcjonalne. Eksport i import danych trenerskich są oddzielone od osobistej historii. Usunięcie klienta kasuje przyszłe sesje, ale minione treningi zostają do raportów.';

  @override
  String get instructionClientsTitle => 'Klienci';

  @override
  String get instructionClientsDesc =>
      'Dodawanie, edycja i usuwanie klientów. Lista pokazuje ostatnią i następną sesję. Pola profilu: cel, waga, wzrost i prywatne notatki trenera.';

  @override
  String get instructionClientProfileTitle => 'Profil klienta';

  @override
  String get instructionClientProfileDesc =>
      'Z profilu startuje pusta dzisiejsza sesja. Szare liczby z ostatniego razu pojawiają się dopiero po wyborze ćwiczenia. Historia pokazuje tylko ukończone treningi. Planuj przyszłe daty w kalendarzu. Postępy i ulubione są na tym samym ekranie. Niezapisane zmiany profilu pytają przed wyjściem.';

  @override
  String get instructionTrainerPlanTitle => 'Zaplanuj sesję';

  @override
  String get instructionTrainerPlanDesc =>
      'Planuj tylko z kalendarza trenera: wybierz klienta i datę, potem ćwiczenia. Poprzednie ciężary i powtórzenia są szarymi podpowiedziami. Zaplanowana sesja ma ikonę odtwarzania: stuknij, aby rozpocząć (dziś) lub usunąć. Do historii trafiają tylko ukończone treningi. Plan z minioną datą jest usuwany.';

  @override
  String get instructionTrainerRepeatTitle => 'Powtórz ostatni trening';

  @override
  String get instructionTrainerRepeatDesc =>
      'Opcjonalnie. Z profilu klienta albo przełącznikiem przy dodawaniu sesji w kalendarzu. Kopiuje ćwiczenia z ostatniej sesji do dzisiejszego treningu na żywo lub do nowego planu; poprzednie ciężary i powtórzenia to szare podpowiedzi, nie gotowe serie.';

  @override
  String get rhythmPerWeek => 'tygodniowo';

  @override
  String get deloadNudgeTitle => 'Lżejszy tydzień?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Trenujesz około $rate dni w tygodniu od mniej więcej $weeks tyg. To przypomnienie, nie zalecenie medyczne. Przy takim rytmie często warto zejść z tonażem i powtórzeniami o około 30% na tydzień.';
  }

  @override
  String get deloadNudgeLater => 'Nie teraz';

  @override
  String get deloadNudgeOk => 'Rozumiem';

  @override
  String get instructionHubManifest =>
      'Bez wbudowanego katalogu i gotowych programów. Sam nazywasz ćwiczenia; aplikacja prowadzi statystyki po twojemu.';

  @override
  String get instructionChapterStartTitle => 'Na dobry początek';

  @override
  String get instructionChapterStartBlurb =>
      'Ekran główny, jak trenujesz i dlaczego aplikacja nie uczy cię trenować.';

  @override
  String get instructionChapterToolsTitle => 'Narzędzia';

  @override
  String get instructionChapterToolsBlurb =>
      'Rytm, ulubione, grupy mięśni i szybki trening.';

  @override
  String get instructionChapterSessionTitle => 'Na treningu';

  @override
  String get instructionChapterSessionBlurb =>
      'Serie, pola, cardio, zapis i stoper.';

  @override
  String get instructionChapterProgressTitle => 'Postęp i dane';

  @override
  String get instructionChapterProgressBlurb =>
      'Rekordy, wykres, kalendarz, historia i kopia zapasowa.';

  @override
  String get instructionChapterCoachTitle => 'Tryb trenera';

  @override
  String get instructionChapterCoachBlurb =>
      'Podopieczni, profile, zaplanowane sesje i powtórzenie treningu.';

  @override
  String get instructionSearchHint => 'Szukaj w instrukcji';

  @override
  String get instructionSearchEmpty => 'Nic nie pasuje do wyszukiwania.';
}
