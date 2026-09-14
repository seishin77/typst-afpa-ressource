#import "@local/afpa-ressource:0.1.0": afpa-ressource

// Déclaration des variables
#let title = "Modèle de document interne à l'Afpa"
#let subtitle = "Compte rendu de réunion / Ressources pédagogiques / Notes personnelles"
#let date = datetime.today()
#let author = "Ludovic Esperce"

#show: doc => afpa-ressource(
  title: title,
  author: author,
  doc
)
= Introduction

Template #link("https://typst.app/")[typst] utilisable pour la génération de documents internes à l'#link("https://www.afpa.fr/")[Afpa].

#figure(
  image("assets/afpa-logo.png", width: 50%),
  caption: [Logo de l'Afpa],
)

Pour apprendre les bases de la rédaction d'un document vous pouvez vous référer à ces différents tutoriels :
- #link("https://typst.app/docs/reference/syntax/")[tutoriel officiel]
- #link("https://sitandr.github.io/typst-examples-book/book/basics/tutorial/markup.html")[utilisation de typst par l'exemple]

= Utilisation du modèle

== Installation de typst

=== Windows

Via Winget :
```bash
winget install --id Typst.Typst
```

=== Linux

Vous pouvez consulter le site suivant afin de voir si typst est disponible pour votre distribution : #link("https://repology.org/project/typst/versions")[repology.org].

=== MacOS

Via Brew : 
```bash
brew install typst
```

== Ajout du "package" au système

Ce modèle est disponible sous un #link("https://github.com/typst/packages")["package typst"].

Pour rendre le package utilisable sur votre ordinateur une solution est de cloner ce dépôt dans le dossier suivant (sous Windows) :
```bash
%AppData%\Local\typst\packages\local\afpa-template\0.1.0
```

Avec `%AppData%` étant contenu dans le dossier utilisateur. 

== Création d'un nouveau document

Une fois le package dans le dossier cité précédemment, vous pourrez utiliser la commande suivante pour créer un nouveau document :
```bash
typst init @local/afpa-document:0.1.0 <nom-document>
```

Cette commande créera un nouveau dossier portant le nom du document.

#pagebreak()

= Exemples de fonctionnalités

== Saut de ligne

Vous pouvez \
sauter une ligne \
en utilisant le symbole *\\*.

== Saut de page

Vous pouvez effectuer un saut de page en utilisant `#pagebreak()`.

== Listes

Voici une liste à puces :
- Java ;
  - Spring Boot ;
  - Quarkus.
- C\# ;
- C++ ;
- Rust ;
- Typescript ;
- Haskell.

Voici une liste numérotée :
+ Rust
+ C++
+ C\#
+ Java
+ Typescript

== Insertion de code

Exemple de bloc de code en utilisant *\`\`\`* pour Java :
```
public class App {

  public static void main(String[] args) {
    System.out.println("typst c'est vraiment sympa.");
  }
}
```

Exemple de code en utilisant *\`\`\`* pour C\# :
```cs
class TestClass
{
    static void Main(string[] args)
    {
        // Display the number of command line arguments.
        Console.WriteLine(args.Length);
    }
}
```

Il vous est également possible d'ajouter du code en ligne en utilisant *\`*.

Par exemple, en Java il est possible déclarer une variable de type entier initialisée à 0 en utilisant le code `int uneVariable = 0`.


#pagebreak()

= Lorem

== Lorem

=== Lorem

==== Lorem

#lorem(20)

#lorem(400)


