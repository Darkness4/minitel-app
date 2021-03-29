# Détails sur les fonctionnalités

## Stormshield

---

Objectif 1: **En tant qu'utilisateur, je souhaite me connecter à Stormshield.**

Solution : **Requête HTTP avec Cookie modifié + HTML Parsing** .

---

Objectif 2: **En tant qu'utilisateur, je souhaite me connecter automatiquement à Stormshield.**

Solution : **Paramètres dans SharedPreferences, mot de passe dans FlutterSecureStorage.** 

---

## Agenda

---

Objectif 1 : **En tant qu'utilisateur, je souhaite voir les cours.**

Solution : **Multiple requêtes HTTP, téléchargement du .ics en tant que File + ICS Parsing** 

---

Objectif 2 : **En tant qu'utilisateur, je souhaite être notifié des cours.**

Solution : **[flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)**

---

Objectif 3 : **En tant qu'utilisateur, je modifier les paramètres de notification des cours.**

Solution : **Paramètre dans SharedPreferences**

---

## Portail EMSE

---

Objectif 1 : **En tant qu'utilisateur, je souhaite me connecter au portail EMSE.**

Solution : **Multiple requêtes HTTP + conservation des cookies + Webview** 

---

Objectif 2 : **En tant qu'utilisateur, je souhaite être notifié des cours.**

Solution : **[flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)**

---

Objectif 3 : **En tant qu'utilisateur, je modifier les paramètres de notification des cours.**

Solution : **Paramètre dans SharedPreferences**

---

## Imprimante

Objectif : **En tant qu'utilisateur, je souhaite me connecter à l'imprimante.**

Solution : **Multiple requêtes HTTP NTLM + conservation des cookies + Webview** 

---

## News

---

Objectif 1 : **En tant qu'utilisateur, je souhaite voir les versions de l'application et pouvoir télécharger.**

Solution :  **HTTP + Github API**

---

Objectif 2 : **En tant qu'utilisateur, je souhaite voir les news de Minitel.**

Solution :  HTTP + Twitter API

---

## Reporting

---

Objectif 1 : **En tant que membre de Minitel, je souhaite que l'utilisateur m'envoie les données de diagnostique réseaux.**

Solution :  **Dart IO Process Run + Mail/Share/Slack API**

---

Objectif 2 : **En tant qu'utilisateur, je souhaite voir l'état des serveurs.**

Solution :  HTTP + Zabbix API

---

## Autres

---

Objectif 1 : **En tant qu'utilisateur, je souhaite avoir des raccourcis pour les liens EMSE.**

Solution :  **Url Launcher**

---

Objectif 2 : **En tant qu'utilisateur, je souhaite afficher le wiki Minitel.**

Solution :  WebView

---



