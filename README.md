# flutter_responsive_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Exercice: Créez une application Flutter responsive

Créez une application Flutter qui affiche une grille de 120 produits avec un layout différent selon la taille de l'écran. Utilisez le package responsive_framework pour gérer les breakpoints.

## Spécifications

### Configuration des breakpoints :
- **Mobile** : 0–800 px (1 colonne).
- **Tablette** : 801–1000 px (4 colonnes).
- **Desktop** : 1000 px et plus (6 colonnes).

### Écran principal :
Créez ResponsiveApp avec une largeur. Utilisez GridView.builder centré, limité à 1200 px de ResponsiveValue pour déterminer le nombre de colonnes selon les breakpoints.

### Composant ProductCard :
- **Mobile** : Affichez le FlutterLogo à gauche et la description à droite.
- **Tablette/Desktop** : Affichez le logo en haut et la description en bas, le logo prenant tout l'espace disponible.

## Étapes
1. Configurez les breakpoints avec ResponsiveBreakpoints.builder.
2. Créez ResponsiveApp avec un GridView.builder.
3. Implémentez ProductCard avec _buildMobileLayout et _buildGridLayout.

L'application doit être responsive et les mises en page doivent changer dynamiquement.
