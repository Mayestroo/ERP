# BLOCKERS
Initial unknowns U01–U20 live in `21_OPEN_QUESTIONS_AND_EVIDENCE.md`. They do **not** prevent design and simulator work; they prevent claiming hardware and production readiness.

- B-REPO-001 | medium | repository owner | workspace has no `.git` directory (`git status --short` and `git log --oneline -10` return “not a git repository”), so the required successful-slice commit cannot be created | checked git status/log from project root; no repository initialization performed to avoid changing repo ownership/history assumptions | continue Gate A design task T002 | provide/restore the intended Git repository metadata or authorize an explicitly initialized repository.

Log new blockers as `B-ID | priority | owner | precise symptom | attempted fix | next safe task | what would unblock`. Never invent answers.
