#!/usr/bin/env python3
import sys
from pathlib import Path

FEATURE_DIR = Path("bdd/features")
STEP_PREFIXES = ("Given ", "When ", "Then ", "And ", "But ")


def main() -> int:
    if not FEATURE_DIR.exists():
        print("BDD feature directory not found.")
        return 1

    feature_files = sorted(FEATURE_DIR.rglob("*.feature"))
    if not feature_files:
        print("No BDD feature files found.")
        return 1

    total_scenarios = 0
    failed = False

    for feature_path in feature_files:
        feature_name = None
        scenario_name = None
        scenario_steps = []
        scenario_has_given = False
        scenario_has_then = False
        background_has_given = False
        in_background = False

        print(f"\n{feature_path}")
        for raw_line in feature_path.read_text(encoding="utf-8").splitlines():
            line = raw_line.strip()
            if not line or line.startswith("#"):
                continue
            if line.startswith("Feature:"):
                feature_name = line
                print(feature_name)
                continue
            if line.startswith("Background:"):
                in_background = True
                background_has_given = False
                continue
            if line.startswith("Scenario:"):
                if scenario_name:
                    if not scenario_has_given or not scenario_has_then:
                        print(f"  ! Scenario missing Given/Then: {scenario_name}")
                        failed = True
                scenario_name = line
                scenario_steps = []
                scenario_has_given = background_has_given
                scenario_has_then = False
                total_scenarios += 1
                print(f"  {scenario_name}")
                in_background = False
                continue
            if line.startswith(STEP_PREFIXES):
                scenario_steps.append(line)
                if line.startswith("Given "):
                    if in_background:
                        background_has_given = True
                    else:
                        scenario_has_given = True
                if line.startswith("Then "):
                    scenario_has_then = True
                print(f"    {line}")

        if scenario_name and (not scenario_has_given or not scenario_has_then):
            print(f"  ! Scenario missing Given/Then: {scenario_name}")
            failed = True

        if not feature_name:
            print("  ! Missing Feature header")
            failed = True

    if total_scenarios == 0:
        print("No scenarios found.")
        return 1

    if failed:
        print("\nBDD suite failed validation.")
        return 1

    print(f"\nBDD suite validated {total_scenarios} scenarios.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
