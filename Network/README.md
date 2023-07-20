# Dossier Network

Contient les différentes infrastructures Docker pour implémenter et tester des
réseaux zero trust

- basic_tuto : Infrastructure déployée en suivant le tutoriel OpenZiti docker
  compose https://docs.openziti.io/docs/learn/quickstarts/network/local-docker-compose
- Network1: infra OpenZiti contenant
    - un contrôleur OpenZiti
    - un initialisateur du contrôleur
    - Un edge-routeur OpenZiti
    - une console web OpenZiti
    - une machine qui stream du contenu video et un serveur qui le relaie (infra
      dans repertoire video_streaming)
- Network2: infra OpenZiti contenant
    - contrôleur OpenZiti
    - initialisateur du contrôleur
    - edge router OpenZiti Cloud
    - edge router OpenZiti Base
    - edge router OpenZiti GCS
    - console web OpenZiti
    - drone
    - gcs
    - base
    - police fédérale
    - serveur vidéo qui reçoit le flux et le retransmet à des clients
- Network3: infra hybride Docker / Raspberry OpenZiti contenant
    - un contrôleur OpenZiti
    - initialisateur du contrôleur
    - Un edge-routeur OpenZiti laptop (Docker)
    - une console web OpenZiti
    - un serveur vidéo
    - les autres composants de l'infrastructure sont sur des Raspberry Pi 4


