# update-docs

Update project documentation with latest changes.

## When to Use
- After feature implementation
- API changes
- Configuration changes
- Release documentation

## Execution

### Step 1: Identify Changes
```
CHECK:
1. New features added?
2. API endpoints changed?
3. Configuration updated?
4. Dependencies updated?
```

### Step 2: Update Documentation
```markdown
# Documentation Update

## README.md
- Update installation steps
- Update configuration section
- Add new features

## CHANGELOG.md
- Add version entry
- List all changes
- Breaking changes highlighted

## API Documentation
- Update OpenAPI spec
- Add new endpoints
- Update response schemas

## Configuration
- Update .env.example
- Document new variables
- Update default values
```

### Step 3: Generate Changelog
```bash
# Using conventional commits
npx conventional-changelog -p angular -i CHANGELOG.md -s

# Or manual
git log --oneline --since="2024-01-01" > changes.txt
```

### Step 4: Review & Publish
```markdown
# Documentation Review Checklist

## Completeness
- [ ] All new features documented
- [ ] All API changes documented
- [ ] All configuration changes documented
- [ ] Examples updated

## Accuracy
- [ ] Code examples work
- [ ] Screenshots current
- [ ] Links working
- [ ] Version numbers correct
```

## Output
- Documentation updated
- Changelog generated
- Review completed
- Published to docs site
