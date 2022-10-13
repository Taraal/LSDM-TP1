# Large Scale Data Management

## Gestion des données distribuées à large échelle

## TP 1 

### Processus

L'expérience a été menée sur le fichier small_page_links.nt, par souci de temps après expérimentation sur le cluster et pour économiser les crédits qui venaient à manquer.

Les machines du cluster ont également été modifiées en n1-standard-2 afin de ne pas dépasser le quota CPU imposé à 8 par Google Cloud, et le nombre de workers n'a pas pu dépasser 3 pour la même raison.

### Résultats


| Workers     |      Job      |  Temps  |
|:-----------:|:-------------:|:-------:|
| 1           |    Pig        |  4m11s  |
| 2           |   Pig         |  3m30s  |
| 3           |   Pig         |  3m21s  |
| 1           | PySpark       |  1m11s  |
| 2           | PySpark       |   41s   |
| 3           | PySpark       |   42s   |

On peut voir que PySpark est plus performant que Pig, mais néanmoins le nombre de workers passé 2 influe peu, voire pas du tout, sur le temps d'exécution. 