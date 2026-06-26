# create-monitoring-plan

Create comprehensive monitoring plan for business metrics, UX, and performance.

## When to Use
- After development complete
- Before launch
- Business metrics needed
- Continuous improvement planning

## Agents to Dispatch
- product-manager: Business metrics
- data-analyst: Data tracking
- ux-designer: UX metrics

## Enforcement

```
⚠️ MANDATORY: Monitoring plan required before launch

MONITORING PLAN ENFORCEMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MUST INCLUDE:
1. Business Metrics
   - Revenue metrics
   - Conversion metrics
   - User acquisition metrics
   - Retention metrics

2. UX Metrics
   - User satisfaction
   - Task completion rate
   - Error rates
   - Time on task

3. Technical Metrics
   - Performance (response time, uptime)
   - Errors (error rate, crash rate)
   - Usage (active users, sessions)

4. Data Tracking
   - Events to track
   - Properties to capture
   - Dimensions to analyze

5. Dashboards
   - Executive dashboard
   - Product dashboard
   - Technical dashboard

6. Alerts
   - Critical alerts
   - Warning alerts
   - Info alerts

7. Reports
   - Daily reports
   - Weekly reports
   - Monthly reports
```

## Execution

### Step 1: Define Business Metrics
```
ASK USER:

1. REVENUE METRICS
   - What's the revenue model?
   - What's the target revenue?
   - What's the conversion target?
   - What's the churn target?

2. USER METRICS
   - What's the target DAU/MAU?
   - What's the retention target?
   - What's the engagement target?

3. GROWTH METRICS
   - What's the growth target?
   - What's the acquisition target?
   - What's the activation target?
```

### Step 2: Define UX Metrics
```
ASK USER:

1. USER SATISFACTION
   - NPS target?
   - CSAT target?
   - User feedback collection?

2. USABILITY
   - Task completion rate target?
   - Time on task target?
   - Error rate target?

3. ENGAGEMENT
   - Session duration target?
   - Pages per session target?
   - Feature adoption target?
```

### Step 3: Create Monitoring Plan
```markdown
# Monitoring Plan

## 1. Business Metrics

### 1.1 Revenue Metrics
| Metric | Target | Measurement | Frequency |
|--------|--------|-------------|-----------|
| MRR | ${amount} | Monthly | Monthly |
| ARR | ${amount} | Annual | Quarterly |
| ARPU | ${amount} | Per user | Monthly |
| LTV | ${amount} | Per user | Quarterly |
| CAC | ${amount} | Per user | Monthly |
| LTV:CAC | {ratio} | Ratio | Monthly |

### 1.2 Conversion Metrics
| Metric | Target | Measurement | Frequency |
|--------|--------|-------------|-----------|
| Trial→Paid | {rate}% | Conversion | Daily |
| Free→Paid | {rate}% | Conversion | Daily |
| Upsell | {rate}% | Conversion | Weekly |
| Downgrade | {rate}% | Churn | Weekly |

### 1.3 Retention Metrics
| Metric | Target | Measurement | Frequency |
|--------|--------|-------------|-----------|
| D1 Retention | {rate}% | Cohort | Daily |
| D7 Retention | {rate}% | Cohort | Weekly |
| D30 Retention | {rate}% | Cohort | Monthly |
| Churn Rate | {rate}% | Monthly | Monthly |

## 2. UX Metrics

### 2.1 User Satisfaction
| Metric | Target | Measurement | Frequency |
|--------|--------|-------------|-----------|
| NPS | {score} | Survey | Quarterly |
| CSAT | {score}% | Survey | Monthly |
| CES | {score} | Survey | Quarterly |

### 2.2 Usability
| Metric | Target | Measurement | Frequency |
|--------|--------|-------------|-----------|
| Task Completion | {rate}% | Analytics | Daily |
| Time on Task | {time}s | Analytics | Daily |
| Error Rate | {rate}% | Analytics | Daily |
| Help Requests | {count} | Support | Weekly |

### 2.3 Engagement
| Metric | Target | Measurement | Frequency |
|--------|--------|-------------|-----------|
| DAU | {count} | Analytics | Daily |
| MAU | {count} | Analytics | Monthly |
| Session Duration | {time}m | Analytics | Daily |
| Pages per Session | {count} | Analytics | Daily |

## 3. Technical Metrics

### 3.1 Performance
| Metric | Target | Measurement | Frequency |
|--------|--------|-------------|-----------|
| Response Time | <200ms | APM | Real-time |
| Uptime | 99.9% | Monitoring | Real-time |
| Error Rate | <0.1% | Logging | Real-time |

### 3.2 Usage
| Metric | Target | Measurement | Frequency |
|--------|--------|-------------|-----------|
| Active Users | {count} | Analytics | Daily |
| API Calls | {count} | Logs | Daily |
| Storage Used | {size} | Metrics | Daily |

## 4. Data Tracking

### 4.1 Events to Track
| Event | Properties | Trigger |
|-------|------------|---------|
| user_signup | source, plan | On signup |
| user_login | method, device | On login |
| feature_used | feature, duration | On feature use |
| purchase | amount, product | On purchase |
| churn | reason, feedback | On cancel |

### 4.2 Properties to Capture
| Property | Type | Description |
|----------|------|-------------|
| user_id | string | Unique user ID |
| timestamp | datetime | Event timestamp |
| device | string | Device type |
| browser | string | Browser |
| location | string | User location |

## 5. Dashboards

### 5.1 Executive Dashboard
- Revenue trends
- Growth metrics
- Key KPIs

### 5.2 Product Dashboard
- User engagement
- Feature adoption
- UX metrics

### 5.3 Technical Dashboard
- Performance metrics
- Error rates
- System health

## 6. Alerts

### 6.1 Critical Alerts
| Alert | Condition | Action |
|-------|-----------|--------|
| Revenue Drop | >20% day-over-day | Investigate immediately |
| Error Spike | >5% error rate | Investigate immediately |
| Uptime Drop | <99% uptime | Investigate immediately |

### 6.2 Warning Alerts
| Alert | Condition | Action |
|-------|-----------|--------|
| Conversion Drop | >10% week-over-week | Review within 24h |
| Churn Spike | >5% increase | Review within 24h |
| Performance Degradation | >200ms P95 | Review within 24h |

### 6.3 Info Alerts
| Alert | Condition | Action |
|-------|-----------|--------|
| New Feature Adoption | <10% adoption | Review weekly |
| Support Ticket Increase | >20% increase | Review weekly |

## 7. Reports

### 7.1 Daily Reports
- Revenue summary
- User activity
- Technical health

### 7.2 Weekly Reports
- Conversion trends
- UX feedback
- Feature adoption

### 7.3 Monthly Reports
- Business review
- Product review
- Technical review

## 8. Feedback Loop

### 8.1 Monitoring → Proposal
- Daily: Review metrics
- Weekly: Identify issues
- Monthly: Propose improvements

### 8.2 Proposal → Planning
- Review proposals
- Prioritize improvements
- Create new planning

### 8.3 Planning → Development
- Assign improvements
- Track progress
- Measure impact
```

### Step 4: Multi-Agent Review
```
REVIEW WITH:

PRODUCT-MANAGER:
- "Business metrics are comprehensive"
- "Targets are realistic"
- "Dashboards are useful"

DATA-ANALYST:
- "Tracking is complete"
- "Data quality is good"
- "Analysis is actionable"

UX-DESIGNER:
- "UX metrics are relevant"
- "User feedback is captured"
- "Usability is measured"

ALL MUST AGREE
```

### Step 5: Save & Validate
```
SAVE TO:
- docs/monitoring-plan.md

VALIDATE:
- All metrics defined?
- All targets set?
- All dashboards designed?
- All alerts configured?
- All reports scheduled?

IF VALID:
- Mark as APPROVED
- Proceed to launch

IF INVALID:
- Mark as DRAFT
- Request revisions
```

## Output
- Monitoring plan created
- Business metrics defined
- UX metrics defined
- Dashboards designed
- Alerts configured
- Reports scheduled
- Ready for launch
