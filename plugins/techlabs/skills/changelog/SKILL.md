# changelog

Auto-generate changelog from commits and releases.

## When to Use
- After each release
- After each sprint
- After each deployment
- After each feature

## Agents to Dispatch
- lead-engineer: Changelog management
- All agents: Commit messages

## Enforcement

```
⚠️ MANDATORY: Changelog must be maintained

CHANGELOG ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST FOLLOW:
1. Conventional Commits format
2. Semantic Versioning
3. Changelog Standards

MUST INCLUDE:
1. Version number
2. Release date
3. Changes list
4. Breaking changes

MUST CATEGORIZE:
1. Features (new functionality)
2. Fixes (bug fixes)
3. Performance (performance improvements)
4. Documentation (doc changes)
5. Breaking (breaking changes)

MUST MAINTAIN:
1. CHANGELOG.md file
2. Git tags
3. GitHub releases
```

## Execution

### Step 1: Define Commit Convention
```
COMMIT FORMAT:
<type>(<scope>): <description>

TYPES:
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Code refactoring
- perf: Performance improvement
- test: Adding tests
- build: Build changes
- ci: CI changes
- chore: Maintenance

EXAMPLES:
- feat(auth): add login functionality
- fix(api): resolve timeout issue
- docs(readme): update installation guide
- perf(database): optimize query performance
```

### Step 2: Implement Changelog
```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- New feature description

### Changed
- Change description

### Removed
- Removed feature description

### Fixed
- Bug fix description

### Security
- Security fix description

## [1.0.0] - 2024-01-01

### Added
- Feature 1: Description
- Feature 2: Description

### Changed
- Change 1: Description
- Change 2: Description

### Fixed
- Fix 1: Description
- Fix 2: Description

### Security
- Security fix 1: Description
```

### Step 3: Auto-Generate Changelog
```javascript
async function generateChangelog(fromTag, toTag) {
  // Get all commits between tags
  const commits = await getCommits(fromTag, toTag);
  
  // Parse commits
  const parsed = commits.map(commit => parseCommit(commit));
  
  // Group by type
  const grouped = {
    added: parsed.filter(c => c.type === 'feat'),
    changed: parsed.filter(c => c.type === 'refactor'),
    removed: parsed.filter(c => c.type === 'remove'),
    fixed: parsed.filter(c => c.type === 'fix'),
    security: parsed.filter(c => c.type === 'security'),
    performance: parsed.filter(c => c.type === 'perf'),
    documentation: parsed.filter(c => c.type === 'docs')
  };
  
  // Generate changelog
  const changelog = generateMarkdown(grouped);
  
  return changelog;
}

function parseCommit(commit) {
  // Parse conventional commit format
  const match = commit.message.match(/^(\w+)(?:\(([^)]+)\))?: (.+)$/);
  
  if (match) {
    return {
      type: match[1],
      scope: match[2],
      description: match[3],
      hash: commit.hash,
      date: commit.date
    };
  }
  
  return {
    type: 'other',
    description: commit.message,
    hash: commit.hash,
    date: commit.date
  };
}

function generateMarkdown(grouped) {
  let markdown = '';
  
  if (grouped.added.length > 0) {
    markdown += '### Added\n';
    grouped.added.forEach(commit => {
      markdown += `- ${commit.description} (${commit.hash})\n`;
    });
    markdown += '\n';
  }
  
  if (grouped.fixed.length > 0) {
    markdown += '### Fixed\n';
    grouped.fixed.forEach(commit => {
      markdown += `- ${commit.description} (${commit.hash})\n`;
    });
    markdown += '\n';
  }
  
  // ... other categories
  
  return markdown;
}
```

### Step 4: Create Changelog File
```markdown
# CHANGELOG

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- {feature}

### Changed
- {change}

### Fixed
- {fix}

## [1.2.0] - 2024-01-15

### Added
- feat(auth): add login functionality (#123)
- feat(dashboard): add analytics dashboard (#124)

### Fixed
- fix(api): resolve timeout issue (#125)
- fix(ui): fix button alignment (#126)

### Changed
- refactor(core): improve code structure (#127)

## [1.1.0] - 2024-01-01

### Added
- feat(users): add user management (#120)
- feat(reports): add reporting feature (#121)

### Fixed
- fix(auth): fix login bug (#122)

### Security
- security(deps): update dependencies (#123)

## [1.0.0] - 2024-01-01

### Added
- Initial release
- Core functionality
- User authentication
- Dashboard
```

### Step 5: Integrate with CI/CD
```yaml
# GitHub Actions workflow

name: Generate Changelog

on:
  release:
    types: [published]

jobs:
  changelog:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0
      
      - name: Generate changelog
        run: |
          # Get previous tag
          PREV_TAG=$(git describe --tags --abbrev=0 HEAD~1 2>/dev/null || echo "")
          
          # Generate changelog
          changelog=$(node scripts/generate-changelog.js $PREV_TAG HEAD)
          
          # Update CHANGELOG.md
          echo "$changelog" > CHANGELOG.md
          
          # Commit and push
          git config user.name "GitHub Action"
          git config user.email "action@github.com"
          git add CHANGELOG.md
          git commit -m "docs: update changelog"
          git push
```

### Step 6: Publish Release
```
AFTER CHANGELOG GENERATION:

1. CREATE GITHUB RELEASE
   - Tag: {version}
   - Title: {version}
   - Description: {changelog}

2. UPDATE DOCUMENTATION
   - Update CHANGELOG.md
   - Update README.md
   - Update website

3. NOTIFY USERS
   - Email notification
   - In-app notification
   - Social media

4. TRACK METRICS
   - Release adoption
   - User feedback
   - Issue reports
```

### Step 7: Version Management
```
VERSIONING RULES:

MAJOR (X.0.0):
- Breaking changes
- Major new features
- API changes

MINOR (0.X.0):
- New features
- Bug fixes
- Improvements

PATCH (0.0.X):
- Bug fixes
- Minor improvements
- Documentation

VERSION BUMP:
- feat: minor bump
- fix: patch bump
- BREAKING CHANGE: major bump
```

## Output
- Changelog generated
- Changes categorized
- Version bumped
- Release published
- Users notified
