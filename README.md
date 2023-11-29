# hello-DBMS
 
## *Description du projet*
Ce projet a pour but de nous faire découvrir les bases de données ainsi que les SGBD afin d'acquérir, ou approfondir les connaissances nécessaires pour préparer au mieux les données dans le but de pouvoir les manipuler le plus efficacement possible.
Pour ce faire, nous allons tout d'abord devoir réaliser une veille sur la donnée de manière générale, que vous retrouverez à la suite de cette partie puis, nous nous servirons de DBeaver afin de travailler nos données.  

## *Veille*

### **A. Qu’est ce qu’une donnée ? Sous quelle forme peut-elle se présenter ?**  
Une donnée est la représentation d'une information qui peut se présenter sous la forme d'une chaine de caractères, d'un nombre, d'une image, d'un son, d'une vidéo, d'une date, d'un graphique ou encore d'un état binaire.  

### **B. Donnez et expliquez les critères de mesure de qualité des données.**  
On peut classer les critères de mesure de qualité des données en trois parties.  
- Les critères intrinsèques:  
- Les critères garantissant l'utilisabilité
- Les critères préservant la sécurité.

Chacune de ces parties regroupent différents critères.

**Les critères intrinsèques:**
- Unicité:  
L'utilisateur ne doit pas pouvoir confondre deux informations. Un identifiant unique pour chacun et une vérification des doublons sont incontournables.

- Exhaustivité: 
Les données ne doivent pas comporter de champs manquants. Il faut vérifier les attributs spécifiques essentiels à la catégorisation mais également aux étapes d'analyse.

- Conformité: 
Le cadre d'utilisation des données doit être défini selon des règles de nommage et de formats de données afin d'éviter des valeurs inexactes et des formats inutilisables.  

- Exactitude/Précision:  
Chaque donnée doit être correcte et correspondre à la réalité, mais également précise, selon une nomenclature spécifique définie en amont. 

- Incorruptibilité:  
La donnée ne doit pas être altérée après utilisation, que ce soit par un utilisateur, par une mauvaise configuration d’une liaison avec un objet associé à la donnée, ou encore lors d’échanges entre deux systèmes d’information.  

- Cohérence:  
Les données doivent respecter une certaine logique entre elles et ne pas entrer en conflit en présentant par exemple des informations contradictoires.

**Les critères d'utilisabilité:**
- Accessibilité:  
On doit pouvoir facilement trouver les données dont on a besoin pour effectuer les tâches demandées. La classification et les capacités d'un outil de gestion de données sont primordiales pour garantir l'efficience.

- Pertinence: 
On doit disposer d'informations utiles pour exécuter des tâches avec efficacité.  

**Les critères de sécurité:**  
- Disponibilité: 
Différentes mesures doivent préserver l’accès aux données, telles que la protection, la capacité et la traçabilité. Trois grands principes à appliquer aux outils de gestion des données, à l’hébergement et au réseau informatique.

- Intégrité: 
Les droits d'accès doivent être concis afin de permettre la modification de certaines données. L'historisation des évènements relatifs au traitements des données et le versionning permettent également d'identifier d'éventuelles anomalies et de corriger le tir de manière réactive.

- Confidentialité: 
Cette dimension concerne les niveaux d’habilitation accordés aux utilisateurs.

- Règlementation: 
Les contraintes légales imposent un traitement spécifique des données personnelles ou sensibles (RGPD), mais également un devoir d'information et d'affichage pour renseigner le consommateur (Loi Agec).

- Auditabilité: 
Des mesures doivent être mises en place pour lutter contre la perte et la fuite de données, mais également pour analyser régulièrement le niveau de qualité des données.  

### **C. Définissez et comparez les notions de Data Lake, Data Warehouse et Lake House. Illustrez les différences à l’aide de schémas.**  
**Data Lake:**  
C'est un dépôt centralisé conçu pour stocker, traiter et sécuriser de grands volumes de données structurées, semi-structurées et non-structurées. Il peut traiter tout type de données et les stocker dans leur format natif, quelle que soit leur taille.  

**Data Warehouse:**  
Une technologie qui regroupe les données structurées provenant d'une ou plusieurs sources afin qu'elles puissent être comparées et analysées pour une meilleure intelligence.  

**Lake House:**  
Nouvelle architecture, ouverte, de gestion des données. Elle associe la souplesse, le faible coût et l'échelle des Data Lakes aux possibilités de gestion et aux transactions ACID des Data Warehouses. Cela permet d'exploiter toutes les données à des fins de business intelligence (BI) et de machine learning (ML). Pour résumer, Lake House est une combinaison de Data Lake et Data Warehouse.  
### **D. Donnez une définition et des exemples de systèmes de gestion de bases de données avec des illustrations.**  
Un SGBD est un ligiciel système qui permet de créer et de gérer des bases de données. 
Il existe différents types de SGBD: 
- Relationnels
- Hiérarchiques
- Orientés Réseaux
- Orientés Objets
- Orientés Documents  

### **E. Qu’est ce qu’une base de données relationnelle ? Qu’est ce qu’une base de données non relationnelle ? Donnez la différence entre les deux avec des exemples d’applications.**  
**BDD relationnelle:**  
Une base de données relationnelles (SGBDR) est une type de base de données qui stocke et fournit un accès à des points de données liés les uns aux autres. 

**BDD non relationnelle:**  
C'est une base de données qui n'utilise pas le schéma tabulaire sous forme de lignes et de colonnes. 

La principale différence entre les deux types de bases de données est la façon de stocker les données. L'une stocke dans des tables tandis que l'autre stocke la donnée sous forme de clé-valeur afin de stocker davantage en terme de quantité.  

### **F. Définissez les notions de clé étrangère et clé primaire.**  
**Clé primaire:**  
Uné clé primaire est un champ ou un ensemble de champs de table qui contient des valeurs uniques. Les valeurs de la clé peuvent être utilisées pour fairé référence a des enregistrements entiers. Une clé primaire peut être assimilée comme un identifiant unique un enregistrement dans une base de données.  

**Clé étrangère:**  
Une cl étrangère est une contrainte qui garantit l'intégrité référentielle entre deux tables. Elle identifie une colonne ou un ensemble de colonnes d'une table comme référençant une colonne ou un ensemble de colonne d'une autre table.
La clé étrangère peut être assimilée comme un couloir qui donnerait accès a une autre table dans la base de données.  
### **G. Quelles sont les propriétés ACID ?**  
Les proprités ACID sont:  
- Atomicité  
- Cohérence  
- Isolement  
- Durabilité  
### **H. Définissez les méthodes Merise et UML. Quelles sont leur utilité dans le monde de l’informatique ? Donnez des cas précis d’utilisation avec des schémas.**  
**MERISE:**  
La méthode MERISE est une méthode de conception, de développement et de réalisation de projets informatiques. Le but de cette méthode est d'arriver à concevoir un système d'information. Elle est basée sur la séparation des données et des traitements a effectuer en plusieurs modèles conceptuels et physique.  

**UML:**  
UML singnifie Unified Modeling Language. C'est un langage de modélisation graphique à base de pictogrammes conçu comme une méthode normalisée de visualisation dans les domaines du développement logiciel et en conception orientée objet.  
Ces deux méthodes permettent de modéliser et conceptualiser des bases de données. Merise va plutôt être utilisée pour des projets complèxes et de grandes ampleurs. UML va plutôt être utilisée afin d'améliorer la communication et la compréhension au sein d'une équipe car c'est un moyen normalisé de visualiser la conception d'un système de données.  

### **I. Définissez le langage SQL. Donnez les commandes les plus utilisées de ce langage et les différentes jointures qu’il est possible de faire.**  
Structured Query Language (SQL) est un langage permettant de manipuler les données et les systèmes de bases de données relationnelles.  
Les commandes les plus utilisées sont:  
- SELECT
- INSERT INTO  
- UPDATE  
- DELETE FROM
- ALTER  

Les différents types de jointures:  
- INNER JOIN  
- CROSS JOIN  
- LEFT JOIN  
- RIGHT JOIN  
- FULL JOIN  
- SELF JOIN  
- NATURAL JOIN  
