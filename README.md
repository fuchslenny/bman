# 🎯 bman - Beautiful Man Pages for Sysadmins

Ein professioneller, klarer Ersatz für das klassische `man`-Kommando, optimiert für Systemadministratoren die in CLI-Umgebungen arbeiten. Fokus auf **Lesbarkeit**, **Hierarchie** und **Effizienz**.

## ✨ Features

### 🎯 Professionelles Syntax-Highlighting
Weniger ist mehr - konzentriert auf das Wesentliche:

- **Section Headers** - Cyan + Fett für klare Struktur
- **Optionen & Flags** - Grün + Fett für schnelles Auffinden (`-o`, `--option`)
- **Code-Beispiele** - Gelb + Fett für `$ command` und Code-Blöcke
- **Normaler Text** - Helles Grau für gute Lesbarkeit bei langen Sessions
- **Gedimmte Details** - Dunkles Grau für weniger wichtige Infos (Referenzen, optionale Parameter)
- **Warnungen** - Rot + Fett nur für wichtige "Warning:", "Note:", "Error:"

**Design-Prinzip:** Klare visuelle Hierarchie statt bunte Überfrachtung. Jedes Element hat einen Zweck.

### 📊 Optimiert für lange CLI-Sessions
- Muted, hochkontrastreiche Farben die nicht ermüden
- Reduzierte Farbpalette (6 statt 14 Farben)
- Fokus auf Schriftdicke (Bold) für Hierarchie
- Kein unnötiges Highlighting von URLs, Pfaden oder Zahlen
- Professionelle, cleane Darstellung

### 🔍 Leistungsstarke Such-Funktionen
- Inkrementelle Vorwärts- und Rückwärtssuche
- Hervorhebung aller Suchergebnisse
- Zähler für "Match X von Y"
- Navigation zwischen Treffern mit `n` und `N`

### ⌨️ Intuitive Tastenkombinationen
- Vim-ähnliche Navigation (`j`/`k`, `g`/`G`)
- Standard-Tastenkombis (`PgUp`/`PgDn`, Pfeiltasten)
- Multiple Wege für gleiche Aktionen

## 📦 Installation

### Voraussetzungen
- Python 3.6 oder höher
- pip (Python Package Manager)

### Automatische Installation

```bash
# Repository klonen oder Dateien herunterladen
# Dann:
sudo ./install.sh
```

Das Installations-Script:
- ✓ Prüft Python-Version
- ✓ Installiert benötigte Pakete (`rich`)
- ✓ Kopiert bman nach `/usr/local/bin`
- ✓ Macht es ausführbar
- ✓ Verifiziert die Installation

### Manuelle Installation

```bash
# Python-Paket installieren
pip install rich --break-system-packages

# bman installieren
sudo cp bman /usr/local/bin/bman
sudo chmod +x /usr/local/bin/bman
```

## 🚀 Verwendung

### Basis-Kommandos

```bash
# Man-Page anzeigen
bman ls

# Spezifische Section
bman printf 3

# In Man-Page suchen
bman grep -s "regular expression"

# Alle verfügbaren Kommandos auflisten
bman --list

# Nach Kommandos filtern
bman -l network
```

### Interaktive Navigation

Im Viewer stehen folgende Tastenkombinationen zur Verfügung:

#### Navigation
- `q`, `Q`, `Esc` - Viewer beenden
- `↑`, `k` - Eine Zeile hoch scrollen
- `↓`, `j` - Eine Zeile runter scrollen
- `PgUp`, `b`, `u` - Seite hoch
- `PgDn`, `Space`, `f` - Seite runter
- `g`, `Home` - Zum Anfang springen
- `G`, `End` - Zum Ende springen

#### Suche
- `/` - Vorwärts suchen
- `?` - Rückwärts suchen
- `n` - Zum nächsten Treffer
- `N` - Zum vorherigen Treffer

#### Hilfe
- `h`, `F1` - Hilfe-Overlay anzeigen/verstecken

## 🎨 Professional Color Scheme

Das Farbschema ist optimiert für **Lesbarkeit** bei langen Arbeitssessions:

| Element | Farbe | Style | Zweck |
|---------|-------|-------|-------|
| Section Headers | Cyan (14) | Bold | Klare Struktur und Navigation |
| Options/Flags | Green (10) | Bold für wichtige | Schnelles Auffinden von Kommando-Optionen |
| Code Examples | Yellow (11) | Bold | Hervorhebung von praktischen Beispielen |
| Normal Text | Light Gray (250) | Normal | Angenehm zu lesen, nicht zu grell |
| Dimmed Text | Dark Gray (244) | Normal | Referenzen, optionale Parameter |
| Warnings | Red (9) | Bold | Wichtige Warnungen und Hinweise |
| Search Highlight | Black on Yellow | Bold | Aktive Suchergebnisse |

**Design-Philosophie:**
- ✅ Muted Farben statt grelle, um Augenbelastung zu reduzieren
- ✅ Klare Hierarchie durch Kombination von Farbe und Schriftdicke
- ✅ Fokus auf die 3 wichtigsten Elemente: Headers, Options, Examples
- ✅ Alles andere ist gedimmt oder normal - keine Ablenkung
- ✅ Optimiert für 256-Farben Terminals, Fallback für 8-Farben

## 📊 Vergleich: man vs bman

### Klassisches `man`
```
NAME
     ls - list directory contents

SYNOPSIS
     ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]

DESCRIPTION
     For each operand that names a file of a type other than directory...
     
OPTIONS
     -a      Include directory entries whose names begin with a dot (.)
     -l      List in long format
```
*Problem: Schwarz-weiß, schwer zu scannen, keine visuelle Hierarchie*

### `bman` 🎯
```
────────────────────────────────────────────────────────────────────────────────
  NAME
────────────────────────────────────────────────────────────────────────────────

     ls - list directory contents

────────────────────────────────────────────────────────────────────────────────
  SYNOPSIS
────────────────────────────────────────────────────────────────────────────────

     ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]

────────────────────────────────────────────────────────────────────────────────
  OPTIONS
────────────────────────────────────────────────────────────────────────────────

     -a      Include directory entries whose names begin with a dot (.)
     -l      List in long format
```
*Lösung: Headers in Cyan+Bold, Optionen in Grün+Bold, cleane Trenner, klare Hierarchie*

**Was macht bman besser?**
- ✅ Klare visuelle Trennung zwischen Sections
- ✅ Optionen springen sofort ins Auge (Grün+Bold)
- ✅ Professionelles, nicht ablenkende Farbschema
- ✅ Einfach zu scannen nach den wichtigen Infos
- ✅ Angenehm für lange Reading-Sessions

## 🛠️ Deinstallation

```bash
sudo ./uninstall.sh
```

Das Deinstallations-Script:
- Entfernt bman sauber
- Prüft auf verbleibende Installationen
- Gibt Hinweise zur Paket-Bereinigung

## 🐛 Bekannte Einschränkungen

- Benötigt Terminal mit 256-Farben-Support
- Funktioniert am besten mit modernen Terminal-Emulatoren (iTerm2, Alacritty, Wezterm, etc.)
- Fallback-Farben werden automatisch in älteren Terminals verwendet

## 📝 Beispiele

### Schnelles Nachschlagen
```bash
# Git-Kommando nachschlagen
bman git

# Python-Funktion nachschlagen
bman printf 3
```

### Suchen und Filtern
```bash
# In ls nach "sort" suchen
bman ls -s sort

# Alle git-bezogenen Kommandos auflisten
bman -l git
```

### Navigation
```bash
# Öffne bman selbst und drücke:
bman bman
# Dann: 'h' für Hilfe
#       '/' zum Suchen
#       'q' zum Beenden
```

## 🎯 Warum bman?

### Für Systemadministratoren gemacht
- **Professionelle Optik** - Keine bunten Spielereien, sondern klare Hierarchie
- **Lesbarkeit First** - Muted Farben für lange CLI-Sessions ohne Augenbelastung
- **Schnelles Scannen** - Optionen und Beispiele springen sofort ins Auge
- **Fokussiert** - Nur 6 Farben, Rest über Bold/Normal für klare Struktur
- **Terminal-freundlich** - Funktioniert auf jedem Server, kein Fancy-UI nötig

### Praktische Vorteile
- ✅ **Finde Optionen schneller** - Grün+Bold statt in grauem Text suchen
- ✅ **Lerne durch Beispiele** - Code-Blocks sind gelb hervorgehoben
- ✅ **Keine Ablenkung** - Pfade, URLs, Zahlen werden NICHT bunt markiert
- ✅ **Lange Sessions** - Augenfreundliche Farben statt grelle Töne
- ✅ **Vim-Navigation** - Bekannte Shortcuts für schnelle Arbeit

### Design-Prinzipien
1. **Weniger ist mehr** - 6 Farben statt 14
2. **Hierarchie über Buntheit** - Bold macht Wichtiges wichtig
3. **Muted Palette** - Keine grellen Farben die ermüden
4. **Fokus auf Aktion** - Was kann ich tun? (Options, Examples)
5. **Professional** - Sieht aus wie ein Tool, nicht wie ein Toy

## 📜 Lizenz

MIT License - Frei verwendbar und modifizierbar

## 👨‍💻 Entwicklung

**Version:** 3.0.0 - Beautiful Edition

Features dieser Version:
- ✨ Komplett überarbeitetes Farbschema
- 🎨 Moderne UI mit Unicode-Boxen
- 🔍 Verbesserte Suche mit Highlighting
- ⌨️ Erweiterte Tastenkombinationen
- 📊 Fortschrittsbalken in Status-Bar
- 🎯 Hilfe-Overlay
- 🚀 Scroll-Indikatoren
- 💎 14 verschiedene Farb-Kategorien

## 🤝 Beitragen

Feedback und Verbesserungsvorschläge sind willkommen!

---

**Made with ❤️ for beautiful documentation**
