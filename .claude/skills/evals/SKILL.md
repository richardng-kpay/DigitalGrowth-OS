# /evals

Run or prepare an eval suite with transcript capture, model/commit pinning, and
independent grading.

## Usage

- `/evals onboarding`
- `/evals research-synthesis`
- `/evals list`

## Steps

1. If the user says `/evals list`, list suites under `Evals/` and stop.
2. Read the target suite's `README.md`.
3. Read the suite `protocol.md` if present. If no protocol exists, use the run
   instructions in the suite README.
4. Record the run header before execution:
   - date
   - model
   - `git rev-parse HEAD`
   - runner context
   - grader context
   - fixtures used
5. Run or simulate the runner pass against every required fixture.
6. Capture the full output or transcript in the suite's `results/transcripts/`
   folder.
7. Grade in a separate context. If the current harness cannot create a separate
   context, stop and report that the run is not citable.
8. Log results in `results/YYYY-MM-DD_<model>.md`.
9. Run `/eval-review` before citing the result externally.

## Rules

- Never call a self-graded run validated.
- No cherry-picking fixtures.
- Partials do not round up.
- Negative results must be visible.
