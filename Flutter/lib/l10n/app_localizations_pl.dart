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
  String get addSet => '+ DODAJ SERIE';

  @override
  String get addExercise => '+ DODAJ CWICZENIE';

  @override
  String get finishWorkout => 'ZAKONCZ TRENING';

  @override
  String get startWorkout => 'ROZPOCZNIJ TRENING';

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
  String get exerciseHint => 'Wpisz nazwe cwiczenia';

  @override
  String get deleteFromHistory => 'Usunac z historii?';

  @override
  String get deleteExerciseHint =>
      'nie bedzie juz pojawiac sie w podpowiedziach.';

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
  String get addClient => '+ DODAJ KLIENTA';

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
      'IronVibe celowo nie ma wbudowanych katalogów ćwiczeń ani narzuconych programów. Nie uczy trenować — od tego jest YouTube i trener — tylko pomaga prowadzić statystyki po twojemu. Sam wpisujesz nazwy ćwiczeń swoimi słowami, zamiast wybierać z ogromnej listy. Im dłużej korzystasz, tym bardziej „siedzi”: aplikacja dostosowuje się do ciebie, nie odwrotnie.';

  @override
  String get instructionSectionSetControl => 'Sterowanie seriami';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Usuwa ostatnia serie. Jesli ma wpisane dane, aplikacja pyta o potwierdzenie.';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Dodaje nowy wiersz serii w biezacym cwiczeniu.';

  @override
  String get instructionSetProgressLabel => 'Oś czasu';

  @override
  String get instructionSetProgressDesc =>
      'Otwiera os czasu postepu dla tego cwiczenia.';

  @override
  String get instructionSectionProgressChart => 'Wykres postepu';

  @override
  String get instructionProgressChartIntro =>
      'Dwa niezalezne trendy wg dat: czerwony — najciezsza pojedyncza seria dnia (kg/lb); cyan — najwiecej powtorzen w jednej serii (dowolny ciezar). Os L: ciezar; P: powtorzenia.';

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
  String get instructionSectionWorkout => 'Trening';

  @override
  String get instructionAddExerciseTitle => 'Dodaj cwiczenie';

  @override
  String get instructionAddExerciseBody =>
      'Tworzy nowy blok dla kolejnego cwiczenia.';

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
      'Gdy lista podpowiedzi pod polem nazwy jest otwarta, dotknij krzyzyka przy wierszu, aby usunac te nazwe z osobistej bazy.';

  @override
  String get instructionSectionInputs => 'Dane';

  @override
  String get instructionWeightTitle => 'Ciezar';

  @override
  String get instructionWeightBody =>
      'Obciazenie sztangi lub przyrzadu (kg/lb).';

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
      'Postępy osobiste służą do śledzenia progresu w poszczególnych ćwiczeniach: w tabeli widać każdy ruch z zapisanego dziennika i można łatwo porównać wyniki. Wyszukiwarka od razu zawęża listę do szukanej nazwy. Wejście: ekran treningu (przycisk pod kalendarzem) lub profil klienta.';

  @override
  String get instructionSectionSaving => 'Zapisywanie';

  @override
  String get instructionFinishTitle => 'Zakoncz trening';

  @override
  String get instructionFinishBody =>
      'Zapisuje cala sesje w historii. Dopoki nie nacisniesz tego przycisku, nic nie zostanie zapisane.';

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
      'Zakonczone treningi w kalendarzu oraz zestawienia pod ikona wykresu na paskach aplikacji.';

  @override
  String get instructionNavImportExportTitle => 'Import / eksport';

  @override
  String get instructionNavImportExportDesc =>
      'Kopia lub przeniesienie danych przez eksport i import JSON w oknie statystyk.';
}
