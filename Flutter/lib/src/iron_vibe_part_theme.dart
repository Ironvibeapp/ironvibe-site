part of 'package:fitness_app/main.dart';

/// Скругления UI: карточки / поля / диалоги — одно семейство, капсулы кнопок не трогаем.
const double kIronVibeRadiusCard = 16;
const double kIronVibeRadiusField = 8;
const double kIronVibeRadiusDialog = 14;
const double kIronVibeRadiusSegment = 10;
const double kIronVibeRadiusChip = 8;

/// Медь / латунь — единый акцент приложения (CTA, иконки, выделения).
const Color kIronVibeAccent = Color(0xFFC4A06A);

const double kIronVibeCtaHeight = 56;
const double kIronVibeCtaIconSize = 22;
const double kIronVibeCtaFontSize = 15;

String ironVibeSentenceCase(String raw) {
  if (raw.isEmpty) return raw;
  final lower = raw.toLowerCase();
  if (lower == raw) return raw;
  for (var i = 0; i < lower.length; i++) {
    final ch = lower[i];
    if (ch.toUpperCase() != ch.toLowerCase()) {
      return '${lower.substring(0, i)}${ch.toUpperCase()}${lower.substring(i + 1)}';
    }
  }
  return lower;
}

List<Color> ironVibeMetalGradientColors({required bool isDark}) {
  return isDark
      ? const [Color(0xFF454D59), Color(0xFF262A30)]
      : const [Color(0xFFC9D0DC), Color(0xFF98A4B4)];
}

List<Color> ironVibePrimaryCtaGradientColors({required bool isDark}) {
  return isDark
      ? const [Color(0xFFE4E8F0), Color(0xFF9AA3B2)]
      : const [Color(0xFF4A5364), Color(0xFF1F2530)];
}

Color ironVibeMetalBorderColor({required bool isDark}) {
  return isDark ? const Color(0x4DFFFFFF) : const Color(0x55000000);
}

Widget ironVibeFadeRule(IronVibePalette pal) {
  return DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          pal.borderSubtle.withValues(alpha: 0),
          pal.borderSubtle,
          pal.borderSubtle.withValues(alpha: 0),
        ],
      ),
    ),
    child: const SizedBox(height: 1, width: double.infinity),
  );
}

ShapeBorder ironVibeDialogShape(IronVibePalette pal) {
  return RoundedRectangleBorder(
    side: BorderSide(color: pal.borderSubtle, width: 0.5),
    borderRadius: BorderRadius.circular(kIronVibeRadiusDialog),
  );
}

List<BoxShadow> ironVibeCardShadow({required bool isDark}) {
  return isDark
      ? [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.40),
            offset: const Offset(0, 4),
            blurRadius: 14,
          ),
        ]
      : [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            offset: const Offset(0, 3),
            blurRadius: 12,
          ),
        ];
}

BoxDecoration ironVibeElevatedCardDecoration(
  IronVibePalette pal, {
  Color? color,
}) {
  return BoxDecoration(
    color: color ?? pal.card,
    borderRadius: BorderRadius.circular(kIronVibeRadiusCard),
    border: Border.all(color: pal.borderSubtle, width: 0.5),
    boxShadow: ironVibeCardShadow(isDark: pal.brightness == Brightness.dark),
  );
}

/// Палитра UI: светлая и тёмная тема через [ThemeExtension].
@immutable
class IronVibePalette extends ThemeExtension<IronVibePalette> {
  final Color scaffold;
  final Color topBar;
  final Color sheetModal;
  final Color card;
  final Color field;
  final Color dropdown;
  final Color dialog;
  final Color exerciseCardBg;
  final Color autocompleteBg;
  final Color chipSelected;
  final Color strengthTypeSelected;
  final Color cardioTypeSelected;
  final Color calendarCellSelected;
  final Color calendarMark;
  final Color calendarDayText;
  final Color calendarDayTextMuted;
  final Color borderSubtle;
  final Color borderDefault;
  final Color inputFill;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textHint;
  final Color iconPrimary;
  final Color toggleTrack;
  final Color toggleBorder;
  final Color toggleThumb;
  final Color steelOutline;
  final Color stopwatchBg;
  final Color chartLegendBorder;
  final Brightness brightness;

  const IronVibePalette({
    required this.scaffold,
    required this.topBar,
    required this.sheetModal,
    required this.card,
    required this.field,
    required this.dropdown,
    required this.dialog,
    required this.exerciseCardBg,
    required this.autocompleteBg,
    required this.chipSelected,
    required this.strengthTypeSelected,
    required this.cardioTypeSelected,
    required this.calendarCellSelected,
    required this.calendarMark,
    required this.calendarDayText,
    required this.calendarDayTextMuted,
    required this.borderSubtle,
    required this.borderDefault,
    required this.inputFill,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textHint,
    required this.iconPrimary,
    required this.toggleTrack,
    required this.toggleBorder,
    required this.toggleThumb,
    required this.steelOutline,
    required this.stopwatchBg,
    required this.chartLegendBorder,
    required this.brightness,
  });

  static IronVibePalette of(BuildContext context) => Theme.of(context).extension<IronVibePalette>()!;

  static const IronVibePalette dark = IronVibePalette(
    scaffold: Color(0xFF121212),
    topBar: Color(0xFF121212),
    sheetModal: Color(0xFF1A1E24),
    card: Color(0xFF1A1E24),
    field: Color(0xFF2A2E35),
    dropdown: Color(0xFF1E1E1E),
    dialog: Color(0xFF121212),
    exerciseCardBg: Colors.black,
    autocompleteBg: Colors.black,
    chipSelected: Color(0xFF2A2E35),
    strengthTypeSelected: Color(0xFF2A2E35),
    cardioTypeSelected: Color(0xFF2A3A45),
    calendarCellSelected: Color(0xFF2A2E35),
    calendarMark: Color(0xFFB0BEC5),
    calendarDayText: Colors.white,
    calendarDayTextMuted: Color(0xB3FFFFFF),
    borderSubtle: Color(0x3DFFFFFF),
    borderDefault: Color(0xB3FFFFFF),
    inputFill: Colors.black,
    textPrimary: Colors.white,
    textSecondary: Color(0xB3FFFFFF),
    textMuted: Color(0x8AFFFFFF),
    textHint: Color(0x8AFFFFFF),
    iconPrimary: Colors.white,
    toggleTrack: Color(0xFF2A2E35),
    toggleBorder: Color(0x66FFFFFF),
    toggleThumb: Color(0xFF3D4552),
    steelOutline: Color(0x4DFFFFFF),
    stopwatchBg: Color(0xFF1E2126),
    chartLegendBorder: Color(0x3DFFFFFF),
    brightness: Brightness.dark,
  );

  /// Светлая тема: одна база под хедер/фон (без «шва» у лого), мягкие серые вместо чёрного, хороший контраст в солнце.
  static const IronVibePalette light = IronVibePalette(
    scaffold: Color(0xFFF3F5F9),
    topBar: Color(0xFFF3F5F9),
    sheetModal: Color(0xFFFBFCFE),
    card: Color(0xFFFEFEFE),
    field: Color(0xFFE4E8F0),
    dropdown: Color(0xFFE4E8F0),
    dialog: Color(0xFFFAFBFD),
    exerciseCardBg: Color(0xFFF0F2F6),
    autocompleteBg: Color(0xFFFEFEFE),
    chipSelected: Color(0xFFD2DAE6),
    strengthTypeSelected: Color(0xFFE6ECF4),
    cardioTypeSelected: Color(0xFFE2EBF7),
    calendarCellSelected: Color(0xFFD0D8E6),
    calendarMark: Color(0xFF5A6B78),
    calendarDayText: Color(0xFF2A3140),
    calendarDayTextMuted: Color(0xFF5D6675),
    borderSubtle: Color(0x26000000),
    borderDefault: Color(0x3D000000),
    inputFill: Color(0xFFF0F2F7),
    textPrimary: Color(0xFF2A3140),
    textSecondary: Color(0xFF4B5463),
    textMuted: Color(0xFF5F6878),
    textHint: Color(0xFF737D8C),
    iconPrimary: Color(0xFF3A4354),
    toggleTrack: Color(0xFFCCD3DE),
    toggleBorder: Color(0x33000000),
    toggleThumb: Color(0xFFFFFFFF),
    steelOutline: Color(0x40000000),
    stopwatchBg: Color(0xFFE6EBF3),
    chartLegendBorder: Color(0x30000000),
    brightness: Brightness.light,
  );

  @override
  IronVibePalette copyWith({
    Color? scaffold,
    Color? topBar,
    Color? sheetModal,
    Color? card,
    Color? field,
    Color? dropdown,
    Color? dialog,
    Color? exerciseCardBg,
    Color? autocompleteBg,
    Color? chipSelected,
    Color? strengthTypeSelected,
    Color? cardioTypeSelected,
    Color? calendarCellSelected,
    Color? calendarMark,
    Color? calendarDayText,
    Color? calendarDayTextMuted,
    Color? borderSubtle,
    Color? borderDefault,
    Color? inputFill,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? textHint,
    Color? iconPrimary,
    Color? toggleTrack,
    Color? toggleBorder,
    Color? toggleThumb,
    Color? steelOutline,
    Color? stopwatchBg,
    Color? chartLegendBorder,
    Brightness? brightness,
  }) {
    return IronVibePalette(
      scaffold: scaffold ?? this.scaffold,
      topBar: topBar ?? this.topBar,
      sheetModal: sheetModal ?? this.sheetModal,
      card: card ?? this.card,
      field: field ?? this.field,
      dropdown: dropdown ?? this.dropdown,
      dialog: dialog ?? this.dialog,
      exerciseCardBg: exerciseCardBg ?? this.exerciseCardBg,
      autocompleteBg: autocompleteBg ?? this.autocompleteBg,
      chipSelected: chipSelected ?? this.chipSelected,
      strengthTypeSelected: strengthTypeSelected ?? this.strengthTypeSelected,
      cardioTypeSelected: cardioTypeSelected ?? this.cardioTypeSelected,
      calendarCellSelected: calendarCellSelected ?? this.calendarCellSelected,
      calendarMark: calendarMark ?? this.calendarMark,
      calendarDayText: calendarDayText ?? this.calendarDayText,
      calendarDayTextMuted: calendarDayTextMuted ?? this.calendarDayTextMuted,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderDefault: borderDefault ?? this.borderDefault,
      inputFill: inputFill ?? this.inputFill,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      textHint: textHint ?? this.textHint,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      toggleTrack: toggleTrack ?? this.toggleTrack,
      toggleBorder: toggleBorder ?? this.toggleBorder,
      toggleThumb: toggleThumb ?? this.toggleThumb,
      steelOutline: steelOutline ?? this.steelOutline,
      stopwatchBg: stopwatchBg ?? this.stopwatchBg,
      chartLegendBorder: chartLegendBorder ?? this.chartLegendBorder,
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  ThemeExtension<IronVibePalette> lerp(ThemeExtension<IronVibePalette>? other, double t) {
    if (other is! IronVibePalette) return this;
    if (t < 0.5) return this;
    return other;
  }
}

/// Сегменты «силовая / кардио»: в светлой теме мягкий выделенный фон, неактивная подпись контрастная (не «серое на сером»).
({Color backgroundColor, TextStyle labelStyle}) ironVibeWorkoutTypeSegmentStyle(
  IronVibePalette pal, {
  required bool isStrengthSegment,
  required bool selected,
}) {
  final isLight = pal.brightness == Brightness.light;
  final backgroundColor = selected
      ? (isStrengthSegment ? pal.strengthTypeSelected : pal.cardioTypeSelected)
      : Colors.transparent;
  final Color labelColor;
  if (isLight) {
    labelColor = selected ? pal.textPrimary : pal.iconPrimary;
  } else {
    labelColor = selected ? pal.textPrimary : pal.textSecondary;
  }
  return (
    backgroundColor: backgroundColor,
    labelStyle: TextStyle(
      color: labelColor,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
    ),
  );
}

/// Тема для [showDatePicker] под текущую IronVibe (светлая / тёмная).
Widget ironVibeDatePickerTheme(BuildContext context, Widget? child) {
  if (child == null) return const SizedBox.shrink();
  final pal = IronVibePalette.of(context);
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final scheme = isDark
      ? ColorScheme.dark(
          primary: pal.textPrimary,
          onPrimary: Colors.black,
          surface: pal.dialog,
          onSurface: pal.textPrimary,
        )
      : ColorScheme.light(
          primary: pal.iconPrimary,
          onPrimary: Colors.white,
          surface: pal.dialog,
          onSurface: pal.textPrimary,
        );
  return Theme(
    data: (isDark ? ThemeData.dark() : ThemeData.light()).copyWith(
      colorScheme: scheme,
      dialogTheme: DialogThemeData(backgroundColor: pal.dialog),
    ),
    child: child,
  );
}

/// Тема для [showTimePicker] + 24ч.
Widget ironVibeTimePickerTheme(BuildContext context, Widget? child) {
  if (child == null) return const SizedBox.shrink();
  final pal = IronVibePalette.of(context);
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final scheme = isDark
      ? ColorScheme.dark(
          primary: pal.textPrimary,
          onPrimary: Colors.black,
          surface: pal.dialog,
          onSurface: pal.textPrimary,
        )
      : ColorScheme.light(
          primary: pal.iconPrimary,
          onPrimary: Colors.white,
          surface: pal.dialog,
          onSurface: pal.textPrimary,
        );
  return Theme(
    data: (isDark ? ThemeData.dark() : ThemeData.light()).copyWith(
      colorScheme: scheme,
      dialogTheme: DialogThemeData(backgroundColor: pal.dialog),
    ),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child,
    ),
  );
}

/// Единый размер логотипа (эталон — главный экран).
const double kIronVibeStandardLogoHeight = 100.0;

/// Как у Material AppBar по умолчанию — одинаковые слоты слева/справа, лого строго по центру экрана.
const double kIronVibeHeaderSideSlotWidth = 56.0;

/// Высота слота под компактный секундомер в общем вертикальном хедере.
/// Интервалы + пресеты отдыха по бокам (по 3 кнопки), прогресс-бар, запас по шрифту.
const double kIronVibeCompactStopwatchSlotHeight = 124.0;

/// Хедер без секундомера: календарь, инструкция, клиенты и т.д.
const double kIronVibePinnedHeaderExtentLogoOnly =
    8.0 + kIronVibeStandardLogoHeight + 8.0;

/// Pinned header с секундомером (только активная тренировка).
const double kIronVibePinnedHeaderExtent =
    8.0 + kIronVibeStandardLogoHeight + 8.0 + kIronVibeCompactStopwatchSlotHeight + 8.0;

/// Высота AppBar с тем же макетом, что и pinned header (только логотип).
const double kIronVibeLogoOnlyAppBarHeight = kIronVibePinnedHeaderExtentLogoOnly;

ThemeData ironVibeBuildTheme(Brightness brightness) {
  final p = brightness == Brightness.dark ? IronVibePalette.dark : IronVibePalette.light;
  final isDark = brightness == Brightness.dark;
  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    scaffoldBackgroundColor: p.scaffold,
    fontFamily: 'Roboto',
    extensions: <ThemeExtension<dynamic>>[p],
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: p.textPrimary,
      onPrimary: isDark ? Colors.black : Colors.white,
      secondary: const Color(0xFF00B8D4),
      onSecondary: Colors.black,
      surface: p.card,
      onSurface: p.textPrimary,
      error: const Color(0xFFFF5252),
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: kIronVibeLogoOnlyAppBarHeight,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: ironVibeSystemOverlayFor(isDark ? ThemeMode.dark : ThemeMode.light),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: p.inputFill,
      labelStyle: TextStyle(color: p.textPrimary, fontSize: 13),
      hintStyle: TextStyle(color: p.textHint, fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kIronVibeRadiusField),
        borderSide: BorderSide(color: p.borderSubtle, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kIronVibeRadiusField),
        borderSide: BorderSide(color: kIronVibeAccent, width: 1.6),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kIronVibeRadiusField),
        borderSide: BorderSide(color: p.borderSubtle, width: 0.5),
      ),
    ),
  );
}

/// Календарь: единый размер сетки (экран «тренирую других»).
const double kIronVibeCalendarGridWidth = 350;
const double kIronVibeCalendarGridHeight = 340;
const EdgeInsets kIronVibeCalendarGridPadding = EdgeInsets.all(10);
const double kIronVibeCalendarCellSpacing = 4;
const int _kIronVibeCalendarMinYear = 2020;
const int _kIronVibeCalendarMaxYear = 2032;

int _ironVibeMonthPageCount() =>
    (_kIronVibeCalendarMaxYear - _kIronVibeCalendarMinYear + 1) * 12;

int _ironVibeMonthPageIndex(DateTime month) {
  final i = (month.year - _kIronVibeCalendarMinYear) * 12 + (month.month - 1);
  return i.clamp(0, _ironVibeMonthPageCount() - 1);
}

DateTime _ironVibeMonthFromPageIndex(int index) {
  final i = index.clamp(0, _ironVibeMonthPageCount() - 1);
  return DateTime(_kIronVibeCalendarMinYear, 1 + i);
}

DateTime ironVibeAlignSelectedDateToMonth(DateTime selected, DateTime month) {
  final last = DateTime(month.year, month.month + 1, 0).day;
  final day = selected.day.clamp(1, last);
  return DateTime(month.year, month.month, day);
}

class _IronVibeMonthPageView extends StatefulWidget {
  final DateTime month;
  final ValueChanged<DateTime> onMonthChanged;
  final Widget Function(BuildContext context, DateTime month) monthBuilder;

  const _IronVibeMonthPageView({
    required this.month,
    required this.onMonthChanged,
    required this.monthBuilder,
  });

  @override
  State<_IronVibeMonthPageView> createState() => _IronVibeMonthPageViewState();
}

class _IronVibeMonthPageViewState extends State<_IronVibeMonthPageView> {
  late final PageController _controller;
  late int _page;

  @override
  void initState() {
    super.initState();
    _page = _ironVibeMonthPageIndex(widget.month);
    _controller = PageController(initialPage: _page);
  }

  @override
  void didUpdateWidget(covariant _IronVibeMonthPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final next = _ironVibeMonthPageIndex(widget.month);
    if (next == _page || !_controller.hasClients) return;
    _page = next;
    _controller.jumpToPage(next);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: _ironVibeMonthPageCount(),
      onPageChanged: (index) {
        _page = index;
        widget.onMonthChanged(_ironVibeMonthFromPageIndex(index));
      },
      itemBuilder: (context, index) {
        return widget.monthBuilder(
          context,
          _ironVibeMonthFromPageIndex(index),
        );
      },
    );
  }
}

Widget _ironVibeCalendarDayCell(
  BuildContext context, {
  required int day,
  required bool isSelected,
  required bool hasMark,
  required VoidCallback onTap,
}) {
  final pal = IronVibePalette.of(context);
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? pal.calendarCellSelected : Colors.transparent,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: kIronVibeAccent, width: 1.1) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$day',
            style: TextStyle(
              color: isSelected ? pal.calendarDayText : pal.calendarDayTextMuted,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          if (hasMark) ...[
            const SizedBox(height: 3),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: pal.calendarMark,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
