
# Bachelorarbeit

## Allgemeines Thema

Diese Bachelorarbeit untersucht die Integration von KI-Tools in die Entwicklung von Flutter-Anwendungen, mit Fokus auf Code-Generierung, Unit-Tests und Fehlerbehebung. Die Arbeit wurde als Experiment durchgeführt, um die Stärken und Schwächen der verschiedenen KI-Tools zu analysieren.


## Ordner und Dateien  
  
| Ordner/Datei                | Beschreibung                                                                             |  
|-----------------------------|------------------------------------------------------------------------------------------|  
| `ba_data`                   | Enthält Skripts zur Visualisierung der Daten mit `matplotlib`.|  
| `analysis_defaults`         | Enthält die Lintig-Konfiguration die für `flutter analyze` herangezogen wurde.           |  
| `provider_shopper`          | Ausgewähltes Beispiel-Flutter-Projekt, das das `Provider`-Paket für das Zustandsmanagement verwendet. Die Anforderungen für die generierten Apps wurden aus diesem Projekt abgeleitet. Zudem wurden die zu behebenden Fehler für den zweiten Abschnitt des praktischen Teils hier integriert. Stammt aus dem offiziellen [Flutter Samples Repository](https://github.com/flutter/samples/tree/main/provider_shopper)   |  
| `shopping_app_chatgpt3`     | Flutter-Projekt, das mit ChatGPT3.5 für die Codegenerierung entwickelt wurde. Enthält alle verwendeten Prompts und Antworten in der `prompts`-Datei.          |  
| `shopping_app_chatgpt4`     | Flutter-Projekt, das mit ChatGPT4.0 für die Codegenerierung entwickelt wurde. Enthält alle verwendeten Prompts und Antworten in der `prompts`-Datei.            |  
| `shopping_app_gemini`       | Flutter-Projekt, das mit dem Gemini für die Codegenerierung entwickelt wurde. Enthält alle verwendeten Prompts und Antworten  in der `prompts`-Datei.  |  
| `prompts.pdf`               | PDF-Dokument, das die Prompts für das Basisprojekt und Unit-Tests enthält und der Arbeit als Anhang beigefügt wurde.  
| `prompts.xlsx`              | Excel-Datei, die die Anzahl der manuellen Eingriffe und weitere Details zur Projektgenerierung genau dokumentiert. Enthält auch detaillierte Aufzeichnungen über die Ansatz- und Erfolgsrate bei der Fehlerbehebung.            |  
| `vergleich.xlsx`            | Excel-Datei, die die in der Arbeit vorkommenden Tabellen enthält und auf den Metriken aus `prompts.xlsx` basiert. Zusätzlich dokumentiert sie die Ergebnisse von `flutter analyze` und beschreibt detailliert die Unterschiede und Leistungskennzahlen der einzelnen KI-generierten Projekte. |  
  
