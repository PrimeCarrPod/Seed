# TGAPP_Monetization_Architecture — Piece 09/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 09 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# UI — TGAPP Home Screen & Bounce Premium Indicators (TG026-TG027)

## TG026: TGAPP Home Screen
- **Category:** UI | **Priority:** P0 | **Effort:** Low | **Target:** 1.0.0
- **Description:** Dashboard showing license status, features, updates
- **Tech Stack:** Jetpack Compose + Material 3 + ViewModel + StateFlow

### Screen Structure
```
┌─────────────────────────────────────┐
│  TGAPP                          👤  │  ← TopAppBar
├─────────────────────────────────────┤
│  ┌───────────────────────────────┐  │
│  │  LICENSE STATUS               │  │
│  │  ● Active  •  Pro Tier        │  │  ← LicenseCard
│  │  Expires: Dec 15, 2026        │  │
│  │  [Renew Now]  [Manage]        │  │
│  └───────────────────────────────┘  │
├─────────────────────────────────────┤
│  ┌───────────────────────────────┐  │
│  │  PREMIUM FEATURES             │  │  ← FeatureGrid
│  │  ☑ Mesh Network (3 hops)      │  │
│  │  ☑ Traffic Advisory Relay     │  │
│  │  ☑ Weather Advisory Relay     │  │
│  │  ☑ Trajectory Sharing         │  │
│  │  ☑ RTT/UWB Positioning        │  │
│  │  ☑ AR Overlay                 │  │
│  │  ☑ Voice Alerts               │  │
│  │  ☑ Offline Maps               │  │
│  │  ☑ Auto Theme                 │  │
│  │  ☑ GPX/KML Export             │  │
│  │  ☑ Priority Updates           │  │
│  └───────────────────────────────┘  │
├─────────────────────────────────────┤
│  ┌───────────────────────────────┐  │
│  │  BOUNCE UPDATES               │  │  ← UpdateCard
│  │  Current: v1.0.94             │  │
│  │  Latest:  v1.0.95 ✓           │  │
│  │  [Download & Install]         │  │
│  └───────────────────────────────┘  │
├─────────────────────────────────────┤
│  ┌───────────────────────────────┐  │
│  │  FLEET MANAGEMENT (Pro)       │  │  ← FleetCard
│  │  Fleet: "Acme Logistics"      │  │
│  │  Vehicles: 47/100             │  │
│  │  [Provision New]  [Dashboard] │  │
│  └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

### Compose Implementation
```kotlin
// TGAPP - HomeScreen.kt
@Composable
fun HomeScreen(viewModel: HomeViewModel = hiltViewModel()) {
    val licenseState by viewModel.licenseState.collectAsState()
    val features by viewModel.featureList.collectAsState()
    val updateInfo by viewModel.updateInfo.collectAsState()
    val fleetInfo by viewModel.fleetInfo.collectAsState()
    
    Scaffold(topBar = { TopAppBar(title = { Text("TGAPP") }) }) { padding ->
        Column(modifier = Modifier.padding(padding).fillMaxSize()) {
            LicenseCard(licenseState)
            FeatureGrid(features)
            UpdateCard(updateInfo)
            if (licenseState.tier == "pro" || licenseState.tier == "enterprise") {
                FleetCard(fleetInfo)
            }
        }
    }
}

@Composable
fun LicenseCard(state: LicenseState) {
    Card(modifier = Modifier.fillMaxWidth(), colors = CardDefaults.cardColors(
        containerColor = when (state.status) {
            LicenseStatus.ACTIVE -> MaterialTheme.colorScheme.primaryContainer
            LicenseStatus.EXPIRED -> MaterialTheme.colorScheme.errorContainer
            LicenseStatus.REVOKED -> MaterialTheme.colorScheme.errorContainer
        }
    )) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row {
                Icon(
                    imageVector = when (state.status) {
                        LicenseStatus.ACTIVE -> Icons.Default.CheckCircle
                        else -> Icons.Default.Error
                    },
                    contentDescription = null,
                    tint = when (state.status) {
                        LicenseStatus.ACTIVE -> MaterialTheme.colorScheme.onPrimaryContainer
                        else -> MaterialTheme.colorScheme.onErrorContainer
                    }
                )
                Spacer(Modifier.width(8.dp))
                Text("License: ${state.status.label} • ${state.tier.uppercase()}",
                    style = MaterialTheme.typography.titleMedium,
                    color = when (state.status) {
                        LicenseStatus.ACTIVE -> MaterialTheme.colorScheme.onPrimaryContainer
                        else -> MaterialTheme.colorScheme.onErrorContainer
                    }
                )
            }
            if (state.expiresAt > 0) {
                Text("Expires: ${formatDate(state.expiresAt)}",
                    style = MaterialTheme.typography.bodyMedium
                )
            }
            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.End) {
                if (state.status != LicenseStatus.ACTIVE) {
                    Button(onClick = { viewModel.renewLicense() }) {
                        Text("Renew Now")
                    }
                }
                TextButton(onClick = { viewModel.openPlayStore() }) {
                    Text("Manage Subscription")
                }
            }
        }
    }
}
```

## TG027: Bounce Premium Indicators
- **Category:** UI | **Priority:** P0 | **Effort:** Low | **Target:** 1.0.93
- **Description:** Visual badges in Bounce for premium features
- **Goal:** Clear value proposition → conversion

### Implementation
```kotlin
// Bounce - PremiumBadge.kt
@Composable
fun PremiumBadge(
    feature: String,
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null
) {
    val featureGate = hiltViewModel<FeatureGate>()
    val isEnabled = featureGate.isEnabled(feature)
    
    val config = RemoteConfig.getFeature(feature)
    val isPremium = config.tier == "pro"
    
    if (!isPremium) return  // Don't show badge for free features
    
    Box(
        modifier = modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(12.dp),
        contentAlignment = Alignment.CenterStart
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .background(
                    color = if (isEnabled) 
                        MaterialTheme.colorScheme.primaryContainer 
                    else 
                        MaterialTheme.colorScheme.surfaceContainerHighest,
                    shape = RoundedCornerShape(8.dp)
                )
                .padding(12.dp)
        ) {
            Icon(
                imageVector = if (isEnabled) 
                    Icons.Default.CheckCircle 
                else 
                    Icons.Default.Lock,
                contentDescription = null,
                tint = if (isEnabled) 
                    MaterialTheme.colorScheme.onPrimaryContainer 
                else 
                    MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(Modifier.width(8.dp))
            Column {
                Text(config.displayName, style = MaterialTheme.typography.labelLarge,
                    color = if (isEnabled) 
                        MaterialTheme.colorScheme.onPrimaryContainer 
                    else 
                        MaterialTheme.colorScheme.onSurfaceVariant
                )
                if (!isEnabled) {
                    Text("Premium feature • Tap to upgrade", 
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f)
                    )
                }
            }
            Spacer(Modifier.weight(1f))
            if (!isEnabled) {
                TextButton(onClick = { 
                    onClick?.invoke() 
                    // Or: startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=com.carrpod.tgapp")))
                }) {
                    Text("Upgrade")
                }
            }
        }
    }
}
```

### Placement in Bounce UI
| Location | Feature | Badge Style |
|----------|---------|-------------|
| Main Screen Top Bar | License Status | Persistent pill badge |
| Mesh Settings | Fleet Mesh | Inline row badge |
| Traffic Layer | Traffic Relay | Map layer toggle badge |
| Positioning Settings | RTT/UWB | Algorithm selector badge |
| AR Button | AR Overlay | FAB badge |
| Export Menu | GPX/KML | Menu item badge |
| Settings | All Premium | Section header |

---

## Conversion Funnel Design

```
Bounce User (Free)
    │
    ▼
Uses Mesh (1 hop) → Sees "3-hop mesh is Premium" badge
    │
    ▼
Tries Traffic Layer → "Upgrade to see live traffic"
    │
    ▼
Clicks Upgrade → Play Store → TGAPP
    │
    ▼
Purchases → License synced → Features unlock instantly
    │
    ▼
Returns to Bounce → All badges show ✓ → "Pro Active"
```

---

*End of Piece 09/13 — See Piece 10 for Distribution: Direct APK Download & Delta Updates*