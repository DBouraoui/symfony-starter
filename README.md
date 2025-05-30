# Symfony Starter Kit

Une base de projet Symfony 7 prête à l'emploi avec Docker et les bundles essentiels préconfigurés.

---

## 🧰 Stack Technique

### 🔧 Symfony (v7.2.5) avec les bundles suivants :
- **JWT (LexikJWTAuthenticationBundle)** – Authentification par token
- **NelmioCorsBundle** – Gestion des CORS
- **Flysystem** – Gestion de fichiers (uploads, stockage, etc.)
- **Security** – Sécurité et firewall Symfony
- **Mailer** – Envoi d’e-mails
- **Messenger** – Gestion des messages (asynchrone, file d’attente)

### 🐳 Docker Services :
- **MySQL** – Base de données
- **phpMyAdmin** – Interface de gestion MySQL
- **Caddy** – Serveur web HTTPS auto-configuré
- **messenger** – Commande messenger redondante

---

## 🚀 Lancer le projet

### 1. Cloner le dépôt
```bash
git clone git@github.com:DBouraoui/symfony-starter.git
cd symfony-starter
```

### 2. Configuration de l’environnement
Copier le fichier `.env` vers `.env.local` :
```bash
cp .env .env.local
```

### 3. Configuration du JWT (LexikJWTAuthenticationBundle)

#### a. Générer les clés
```bash
bin/console lexik:jwt:generate-keypair
```

#### b. Générer une passphrase
Utiliser `openssl` :
```bash
openssl rand -base64 32
```
Ajouter la passphrase générée dans `.env.local` :
```env
JWT_PASSPHRASE=ta-passphrase-ici
```

---

#### b. Installer les dépendance
Installer les dépendance avec composer :
```bash
docker compose exec app bash && 
composer install
```

---

## ▶️ Démarrer le projet

### Avec Docker directement :
```bash
docker compose up --build --no-cache
```

### Ou avec le Makefile :
```bash
make build
```

---

## 📝 Notes
- Tu peux accéder à phpMyAdmin à l’adresse : [http://127.0.0.1:8080](http://localhost:8080)
- Les ports, services et configurations supplémentaires peuvent être modifiés dans `docker-compose.yml` et `Caddyfile`.

---

## 📦 À venir (idées d’amélioration)
- Tests automatisés
- Version prod améliorée
- CI/CD
- Version PGSQL
---

## 👨‍💻 Auteur
[DBouraoui](https://github.com/DBouraoui)