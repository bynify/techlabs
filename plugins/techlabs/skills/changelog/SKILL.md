# changelog

Generate changelogs from git history and release notes.

## When to Use
- Preparing releases
- Communicating changes
- Generating release notes
- Version management

## Execution

### Step 1: Analyze Commits
```bash
# Get commits since last tag
git log $(git describe --tags --abbrev=0)..HEAD --oneline --no-merges

# Filter by conventional commits
git log --format="%s" | grep -E "^(feat|fix|docs|refactor|perf|test|chore)"
```

### Step 2: Categorize Changes
```
GROUP BY type:
- feat: New features
- fix: Bug fixes
- docs: Documentation
- refactor: Code improvements
- perf: Performance improvements
- chore: Maintenance

GROUP BY scope:
- api: API changes
- ui: UI changes
- db: Database changes
```

### Step 3: Generate Changelog
```markdown
# Changelog

## [1.2.0] - 2024-03-15

### Added
- feat(auth): Magic link authentication
- feat(dashboard): Export to CSV
- feat(api): Bulk operations endpoint

### Fixed
- fix(checkout): Double charge on retry
- fix(search): Indexing race condition

### Changed
- refactor(api): Unified error responses
- perf(db): Added composite indexes

### Dependencies
- Bump Next.js to 14.1
- Bump Postgres driver to 8.11

## Migration Guide
- **API**: Error responses now follow `{ error: { code, message } }` format
- **DB**: Run `npm run db:migrate` to add new indexes
```

### Step 4: Add Breaking Changes Notice
```
IF breaking change:
  MARK with BREAKING CHANGE footer in commit
  ADD migration guide section
```

## Output
- Changelog markdown file
- Release notes for GitHub
- Migration guide if needed
