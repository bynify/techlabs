# release-notes

Generate release notes for each release.

## When to Use
- Sprint complete
- Release ready
- Stakeholder demo done
- Features shipped

## Agents to Dispatch
- product-manager: Release notes content
- lead-engineer: Technical details

## Enforcement

```
⚠️ MANDATORY: Release notes required for each release

RELEASE NOTES ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST INCLUDE:
1. New Features
2. Bug Fixes
3. Improvements
4. Breaking Changes
5. Known Issues

MUST CATEGORIZE:
1. Feature (new functionality)
2. Fix (bug fix)
3. Improvement (enhancement)
4. Breaking (breaking change)
5. Security (security fix)

MUST PUBLISH:
1. Internal release notes
2. External release notes
3. User notification
```

## Execution

### Step 1: Collect Changes
```
FROM SPRINT:

1. NEW FEATURES
   - Feature name
   - Feature description
   - Feature impact

2. BUG FIXES
   - Bug ID
   - Bug description
   - Fix description

3. IMPROVEMENTS
   - Improvement name
   - Improvement description
   - Improvement impact

4. BREAKING CHANGES
   - Change name
   - Change description
   - Migration guide

5. KNOWN ISSUES
   - Issue name
   - Issue description
   - Workaround
```

### Step 2: Generate Release Notes
```markdown
# Release Notes

## Version {version}
**Release Date:** {date}

## Overview
{brief overview of release}

## New Features

### Feature 1: {name}
**Description:** {description}
**Impact:** {impact}
**Documentation:** {link}

### Feature 2: {name}
**Description:** {description}
**Impact:** {impact}
**Documentation:** {link}

## Bug Fixes

### Fix 1: {title}
**Description:** {description}
**Bug ID:** {bug_id}
**Resolution:** {resolution}

### Fix 2: {title}
**Description:** {description}
**Bug ID:** {bug_id}
**Resolution:** {resolution}

## Improvements

### Improvement 1: {name}
**Description:** {description}
**Impact:** {impact}

### Improvement 2: {name}
**Description:** {description}
**Impact:** {impact}

## Breaking Changes

### Change 1: {name}
**Description:** {description}
**Migration:** {migration_guide}

## Known Issues

### Issue 1: {name}
**Description:** {description}
**Workaround:** {workaround}

## Upgrade Guide
1. {step 1}
2. {step 2}
3. {step 3}

## Contributors
- {contributor 1}
- {contributor 2}
- {contributor 3}
```

### Step 3: Create External Release Notes
```markdown
# What's New in Version {version}

## 🚀 New Features

- **{Feature 1}**: {description}
- **{Feature 2}**: {description}

## 🐛 Bug Fixes

- Fixed {issue 1}
- Fixed {issue 2}

## ⚡ Improvements

- Improved {thing 1}
- Improved {thing 2}

## ⚠️ Breaking Changes

- {change 1}: {description}

## 📝 Known Issues

- {issue 1}: {workaround}

## Upgrade Notes
{upgrade instructions}
```

### Step 4: Notify Users
```
NOTIFICATION CHANNELS:

1. EMAIL
   - Send to users
   - Highlight new features
   - Include upgrade instructions

2. IN-APP
   - Show release notes
   - Highlight changes
   - Link to documentation

3. BLOG
   - Publish release blog post
   - Explain changes
   - Share examples

4. SOCIAL
   - Tweet about release
   - Share on LinkedIn
   - Post on Reddit
```

### Step 5: Track Release Metrics
```
AFTER RELEASE:

1. ADOPTION METRICS
   - How many users updated?
   - How many users using new features?
   - Any issues reported?

2. FEEDBACK METRICS
   - User feedback on release
   - Support tickets
   - Social media mentions

3. TECHNICAL METRICS
   - Error rates
   - Performance impact
   - Rollback rate

4. BUSINESS METRICS
   - Conversion impact
   - Revenue impact
   - User satisfaction
```

### Step 6: Update Changelog
```
AFTER RELEASE:

1. UPDATE CHANGELOG
   - Add release notes
   - Update version history
   - Update documentation

2. UPDATE KNOWLEDGE BASE
   - Update feature documentation
   - Update best practices
   - Update examples

3. UPDATE TEAM
   - Share release notes
   - Celebrate release
   - Plan next release
```

## Output
- Release notes generated
- Internal notes created
- External notes created
- Users notified
- Metrics tracked
