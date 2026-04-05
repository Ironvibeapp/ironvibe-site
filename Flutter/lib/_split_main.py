# One-off script to split main.dart into part files. Run: python _split_main.py
from pathlib import Path

ROOT = Path(__file__).resolve().parent
MAIN = ROOT / "main.dart"
lines = MAIN.read_text(encoding="utf-8").splitlines(keepends=True)


def slice1(a: int, b: int) -> str:
    """1-based inclusive line numbers."""
    return "".join(lines[a - 1 : b])


def write_part(rel: str, body: str) -> None:
    path = ROOT / rel
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("part of '../main.dart';\n\n" + body, encoding="utf-8")
    print("wrote", path)


# --- Extracted ranges from main.dart (1-based, inclusive) ---
write_part("core/app_constants.dart", slice1(17, 17) + "\n" + slice1(196, 204))

write_part("core/json_helpers.dart", slice1(19, 83))

write_part(
    "core/exercise_text.dart",
    slice1(108, 120) + slice1(129, 150),
)

write_part("core/backup_utils.dart", slice1(166, 194))

write_part("theme/theme.dart", slice1(206, 657))

write_part("models/set_log.dart", slice1(755, 787))

write_part(
    "models/exercise_log.dart",
    slice1(85, 106) + slice1(690, 753),
)

write_part("models/workout_log.dart", slice1(661, 688) + slice1(849, 862))

write_part("models/client_trainer.dart", slice1(789, 847) + slice1(864, 892))

write_part(
    "data/persistence.dart",
    slice1(659, 659)
    + slice1(894, 898)
    + slice1(152, 164)
    + slice1(122, 127)
    + slice1(900, 1048),
)

write_part("models/exercise_form_data.dart", slice1(1050, 1075))

write_part("widgets/chrome_and_buttons.dart", slice1(1077, 2755))

write_part("widgets/screens.dart", slice1(2806, 5925))

print("Done. Edit main.dart: imports + part directives + main + IronVibeApp only.")
