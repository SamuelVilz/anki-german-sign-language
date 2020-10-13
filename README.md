Dies ist ein Projekt, mit dem Lernkarten für die Software [Anki](https://apps.ankiweb.net/) erstellt werden können, welches Vokabeln der Deutschen Gebärdensprache (DGS) enthält. Es umfasst derzeit **über 4.000 Gebärden**.

Grundlage für diese Lernkarten ist [SignDict](https://signdict.org), das offene Wörterbuch für Gebärdensprache, entwickelt von Bodo Tasche. Die Videoinhalte kommen von verschiedenen Quellen und Nutzern.

Das Gros des Ruby-Codes stammt aus dem [Repository von blinry](https://github.com/blinry/anki-german-sign-language), von dem dieses Repo bislang ein Forkprojekt ist.

## Installation

Das neueste generierte Deck ist auf [from AnkiWeb](https://ankiweb.net/shared/info/43097702) zu finden. Zur Nutzung von Anki und .apkg-Dateien, bitte Google verwenden.

**Hinweis:** Die Nutzung des Decks benötigt Internetzugriff, da die Kurzvideos auf Abruf gestreamt werden. Außerdem sind diese Videos nur auf Android getestet, nicht auf Apple. Anki Desktop scheint nicht damit klarzukommen.

Note: Using this Anki deck requires an Internet connection, as the videos are streamed on-demand.  Also, the video player does not seem to work on every platform: It is known to work in Anki's Android app, but not in the Linux desktop version.

## Beitragen

Bei Verbesserungsvorschlägen oder Fehlern, einfach [einen neuen Issue eröffnen](https://github.com/SamuelVilz/anki-german-sign-language/issues) oder (wie ich) den Code forken, sich selbst dransetzen und einen Pull Request machen :)

Dieses Projekt nutzt zum einen das [CrowdAnki](https://github.com/Stvad/CrowdAnki) Add-On, zum anderen [genanki Library](https://github.com/kerrickstaley/genanki). Es sei die Möglichkeit erwähnt, dass man eventuell eine ältere Version von Anki Desktop installieren muss, damit CrowdAnki funktioniert (man beachte dabei auch den [Issues Tab von CrowdAnki](https://github.com/Stvad/CrowdAnki/issues)).
Diese Probleme ergeben sich allerdings nicht bei der Nutzung des Jupyter Notebooks ('Anki DGS.ipynb'),

## Eigene Decks erstellen

Gut dokumentierter Code zum Prozess der Erstellung eigens definierter Vokabeldecks findet sich in 'Anki DGS.ipynb'. Der Umgang mit Jupyter Notebooks lässt sich mithilfe von Youtube und etwas Motivation leicht erlernen.
Alle Decks in 'Custom Decks' wurden mit diesem Jupyter Notebook erstellt, die Vorgehensweise lässt sich darin einsehen.

## Lizens

Alle Videos stehen unter einer [Creative Commons License](https://creativecommons.org/).
