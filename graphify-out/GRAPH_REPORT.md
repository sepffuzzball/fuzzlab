# Graph Report - media  (2026-09-06)

## Corpus Check
- Corpus is ~11,264 words - fits in a single context window. You may not need a graph.

## Summary
- 163 nodes · 375 edges · 8 communities
- Extraction: 86% EXTRACTED · 13% INFERRED · 1% AMBIGUOUS · INFERRED: 50 edges (avg confidence: 0.87)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Download and Library Automation
- Media Playback Infrastructure
- Media Request Management
- Flux Storage Orchestration
- Media Discovery and Indexing
- Arr Automation Services
- Monitoring and Databases
- Plex Storage Deployment

## God Nodes (most connected - your core abstractions)
1. `CephFS CSI Driver` - 41 edges
2. `SMB CSI Driver` - 26 edges
3. `cluster-secrets Secret (postBuild substituteFrom)` - 11 edges
4. `cluster-settings ConfigMap (postBuild substituteFrom)` - 11 edges
5. `Prowlarr HelmRelease (indexer)` - 10 edges
6. `deluge` - 10 edges
7. `radarr` - 10 edges
8. `slskd` - 10 edges
9. `DiscoveryLastFM Flux Kustomization` - 9 edges
10. `Readarr Audio Flux Kustomization` - 9 edges

## Surprising Connections (you probably didn't know these)
- `Soundscout HelmRelease` --semantically_similar_to--> `DiscoveryLastFM Flux Kustomization`  [INFERRED] [semantically similar]
  soundscout/app/helmrelease.yaml → discoverylastfm/ks.yaml
- `Jellyfin HelmRelease` --semantically_similar_to--> `Overseerr HelmRelease`  [INFERRED] [semantically similar]
  jellyfin/app/helmrelease.yaml → overseerr/app/helmrelease.yaml
- `Tautulli` --conceptually_related_to--> `Plex`  [INFERRED]
  tautulli/app/helmrelease.yaml → plex/app/helmrelease.yaml
- `Audiobookshelf Flux Kustomization` --semantically_similar_to--> `LazyLibrarian Flux Kustomization`  [INFERRED] [semantically similar]
  audiobookshelf/ks.yaml → lazylibrarian/ks.yaml
- `Lidarr ExternalSecret` --semantically_similar_to--> `Sonarr ExternalSecret`  [INFERRED] [semantically similar]
  lidarr/app/externalsecret.yaml → sonarr/app/externalsecret.yaml

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Media apps that access shared lcl SMB storage** — jellyfin_app_helmrelease_helmrelease, overseerr_app_helmrelease_helmrelease, readarr_audio_app_helmrelease_helmrelease, soundscout_app_helmrelease_helmrelease [INFERRED 0.85]
- **Media apps monitored by gatus uptime checks** — discoverylastfm_ks_fluxkustomization, overseerr_ks_fluxkustomization, readarr_audio_ks_fluxkustomization, slskd_ks_fluxkustomization, watcharr_ks_fluxkustomization [INFERRED 0.85]
- **Readarr Audio PostgreSQL database integration via Crunchy Postgres** — readarr_audio_app_externalsecret_readarr_audio_db, crunchy_pgo_secrets, crunchy_postgres_operator, readarr_audio_app_helmrelease_helmrelease [INFERRED 0.85]
- **Postgres-Backed Media Apps** — kubernetes_apps_media_lidarr_pr_app_helmrelease_app, kubernetes_apps_media_readarr_app_helmrelease_app, kubernetes_apps_media_sonarr_ks_app [INFERRED 0.85]
- **Apps Sharing LCL Media Storage** — kubernetes_apps_media_lidarr_pr_app_helmrelease_app, kubernetes_apps_media_plex_app_helmrelease_app, kubernetes_apps_media_readarr_app_helmrelease_app [INFERRED 0.85]
- **Media Apps Sharing LCL NAS Storage** — lidarr_app_helmrelease, sonarr_app_helmrelease, roon_app_helmrelease, tdarr_app_helmrelease [INFERRED 0.85]
- **Media Apps Deployed via app-template Chart** — lidarr_app_helmrelease, sonarr_app_helmrelease, roon_app_helmrelease, tdarr_app_helmrelease [INFERRED 0.85]
- **Media apps mounting the shared lcl media library volume** — kubernetes_apps_media_audiobookshelf_app_helmrelease_audiobookshelf, kubernetes_apps_media_prowlarr_app_helmrelease_prowlarr, kubernetes_apps_media_sabnzbd_app_helmrelease_sabnzbd [INFERRED 0.95]
- **Media apps deployed via the app-template Helm chart with cephfs config storage** — kubernetes_apps_media_audiobookshelf_app_helmrelease_audiobookshelf, kubernetes_apps_media_discoverylastfm_app_helmrelease_discoverylastfm, kubernetes_apps_media_prowlarr_app_helmrelease_prowlarr, kubernetes_apps_media_sabnzbd_app_helmrelease_sabnzbd, kubernetes_apps_media_watcharr_app_helmrelease_watcharr [INFERRED 0.90]
- **Media apps integrated with Crunchy Postgres** — kubernetes_apps_media_prowlarr_ks_prowlarr, kubernetes_apps_media_lidarr_pr_ks_lidarr_pr, kubernetes_apps_media_tautulli_ks_tautulli [INFERRED 0.85]
- **Shared local media storage (lcl / lcl-downloads)** — alac_to_flac_app_helmrelease_alac_to_flac, deluge_app_helmrelease_deluge, lazylibrarian_app_helmrelease_lazylibrarian, radarr_app_helmrelease_radarr, slskd_app_helmrelease_slskd, alac_to_flac_app_helmrelease_lcl, deluge_app_helmrelease_lcl_downloads, alac_to_flac_app_helmrelease_lcl_music [INFERRED 0.85]
- **Apps deployed via the app-template Helm chart** — alac_to_flac_app_helmrelease_alac_to_flac, deluge_app_helmrelease_deluge, lazylibrarian_app_helmrelease_lazylibrarian, radarr_app_helmrelease_radarr, slskd_app_helmrelease_slskd, alac_to_flac_app_helmrelease_app_template [INFERRED 0.85]
- **Flux apps depending on cephfs/SMB storage drivers** — deluge_ks_kustomization, lidarr_ks_kustomization, radarr_ks_kustomization, tdarr_ks_kustomization, alac_to_flac_app_helmrelease_csi_driver_cephfs, alac_to_flac_app_helmrelease_csi_driver_smb [INFERRED 0.85]

## Communities (8 total, 0 thin omitted)

### Community 0 - "Download and Library Automation"
Cohesion: 0.14
Nodes (31): alac-to-flac, app-template Helm chart, csi-driver-cephfs, csi-driver-smb, lcl (shared media storage), lcl-music (music storage), alac-to-flac kustomization, deluge (+23 more)

### Community 1 - "Media Playback Infrastructure"
Cohesion: 0.12
Nodes (28): app-template OCIRepository Helm chart, CephFS CSI Driver, Gatus internal monitoring component, GPU hardware transcoding for Jellyfin, Jellyfin HelmRelease, Jellyfin Application Kustomization, Jellyfin LoadBalancer Service, Jellyfin Config Storage (CephFS PVC/PV) (+20 more)

### Community 2 - "Media Request Management"
Cohesion: 0.12
Nodes (28): Crunchy Postgres Operator, CSI Driver CephFS, CSI Driver SMB, Gatus Monitoring Component, Jellyfin, Jellyfin Flux Kustomization, Lidarr-PR Database ExternalSecret, Lidarr-PR (+20 more)

### Community 3 - "Flux Storage Orchestration"
Cohesion: 0.27
Nodes (24): alac-to-flac Flux Kustomization, Audiobookshelf Flux Kustomization, cluster-secrets Secret (postBuild substituteFrom), cluster-settings ConfigMap (postBuild substituteFrom), SMB CSI Driver, DiscoveryLastFM Flux Kustomization, flux-system GitRepository (sourceRef), Flux System GitRepository (+16 more)

### Community 4 - "Media Discovery and Indexing"
Cohesion: 0.16
Nodes (23): csi-cephfs-sc CephFS storage class, cluster-media-secrets Secret (shared API keys), DiscoveryLastFM app secret (sops), app-template OCIRepository Helm chart, AudioBookshelf HelmRelease (media server), AudioBookshelf kustomization overlay, AudioBookshelf config PVC/PV (cephfs, 2Gi), DiscoveryLastFM HelmRelease (scrobbling service) (+15 more)

### Community 5 - "Arr Automation Services"
Cohesion: 0.24
Nodes (14): crunchy-pgo-secrets ClusterSecretStore, Lidarr ExternalSecret, Lidarr HelmRelease, Lidarr app Kustomization, Lidarr CephFS PVC/PersistentVolume, lcl Downloads SMB Storage, Readarr Audio Postgres ExternalSecret, Readarr Audio HelmRelease (+6 more)

### Community 6 - "Monitoring and Databases"
Cohesion: 0.28
Nodes (9): Crunchy Postgres Operator, Gatus external monitoring component, Prowlarr Flux Kustomization (external monitor), Tautulli, Tautulli HelmRelease, Tautulli Kustomization, Tautulli Config PV, Tautulli Config PVC (+1 more)

### Community 7 - "Plex Storage Deployment"
Cohesion: 0.47
Nodes (6): Plex HelmRelease, Plex Kustomization, Plex Cache PV, Plex Config PV, Plex Cache PVC, Plex Config PVC

## Ambiguous Edges - Review These
- `lcl (shared media storage)` → `lcl-music (music storage)`  [AMBIGUOUS]
  alac-to-flac/app/helmrelease.yaml · relation: conceptually_related_to
- `lcl (shared media storage)` → `lcl-downloads (downloads storage)`  [AMBIGUOUS]
  alac-to-flac/app/helmrelease.yaml · relation: conceptually_related_to

## Knowledge Gaps
- **14 isolated node(s):** `Jellyfin Flux Kustomization`, `Soundscout Flux Kustomization`, `Jellyfin LoadBalancer Service`, `Plex Media Server`, `Jellyfin` (+9 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 18 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `lcl (shared media storage)` and `lcl-music (music storage)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **What is the exact relationship between `lcl (shared media storage)` and `lcl-downloads (downloads storage)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `CephFS CSI Driver` connect `Media Playback Infrastructure` to `Flux Storage Orchestration`, `Media Discovery and Indexing`, `Arr Automation Services`, `Monitoring and Databases`?**
  _High betweenness centrality (0.347) - this node is a cross-community bridge._
- **Why does `Lidarr-PR Flux Kustomization` connect `Media Playback Infrastructure` to `Media Request Management`, `Flux Storage Orchestration`, `Monitoring and Databases`?**
  _High betweenness centrality (0.198) - this node is a cross-community bridge._
- **Why does `Lidarr-PR Kustomization` connect `Media Request Management` to `Media Playback Infrastructure`?**
  _High betweenness centrality (0.188) - this node is a cross-community bridge._
- **Are the 5 inferred relationships involving `CephFS CSI Driver` (e.g. with `SMB CSI Driver` and `Lidarr CephFS PVC/PersistentVolume`) actually correct?**
  _`CephFS CSI Driver` has 5 INFERRED edges - model-reasoned connections that need verification._
- **What connects `Jellyfin Flux Kustomization`, `Soundscout Flux Kustomization`, `Jellyfin LoadBalancer Service` to the rest of the system?**
  _14 weakly-connected nodes found - possible documentation gaps or missing edges._