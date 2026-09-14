// Définition des couleur utilisées
#let afpa-orange = rgb("#EE7623")
#let afpa-dark    = rgb("#232323")
#let afpa-pink    = rgb("#A3145A")
#let afpa-green   = rgb("#5A9E2F")
#let afpa-gray    = rgb("#F4F4F4")
#let afpa-gray-line = rgb("#DDDDDD")

#let current-section = state("current-section", "")

//  Titres de chapitre
#let chapter(number: none, title, new-page: true) = {
  current-section.update(title)
  if new-page { pagebreak(weak: true) }
  heading(level: 1, numbering: none, [
    #if number != none [#number. ]#title
  ])
}

// Paramétrage de la page de garde
#let cover-page(title, author: "Afpa") = {

  // Paramétrage du header propre à la page de garde
  set page(
    header: image("assets/afpa-logo.png", width: 3cm),
    footer: none
  )

  v(3cm)

  // Bloc de titre
  block(
    inset: (left: 0.8em),
    stroke: (left: 2pt + afpa-orange))[
        #text(26pt, fill: afpa-dark)[#upper(title)]
    ]

  v(3em)

  // Alignement du bloc de sommaire
  align(right)[
    #block(
      width: 50%,
      stroke: (top: stroke(thickness: 1pt, paint: black, dash: "dashed"),
              bottom: stroke(thickness: 1pt, paint: black, dash: "dashed")),
      inset: (y: 0.8em)
      )[
      #outline(
        title: none,
        target: heading.where(level: 1),
        indent: 1em,
      )
    ]
  ]

  v(1fr)
  align(right)[
    #text(9pt, fill: afpa-dark)[© #author]
  ]
}

// Sous-titre à puce orange (style "● NPM (Node Package Manager)")
#let subsection(title) = {
  v(0.9em)
  block[
    #text(fill: afpa-orange, size: 13pt)[●] #h(5pt)
    #text(12.5pt, weight: "bold", fill: afpa-dark)[#title]
  ]
  v(0.4em)
}

//  Encarts (callouts)

// Encart "objectif / information"
#let info-box(title, body) = {
  block(
    width: 100%,
    fill: afpa-gray,
    inset: 12pt,
    radius: 3pt,
    stroke: (left: 3pt + afpa-pink),
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align: (top, top),
      [
        #box(
          width: 22pt, height: 22pt,
          fill: afpa-pink, radius: 3pt,
        )[
          #align(center + horizon)[#text(fill: white, size: 12pt)[📖]]
        ]
      ],
      [
        #text(weight: "bold", fill: afpa-pink, size: 12pt)[#title]
        #v(0.3em)
        #body
      ]
    )
  ]
  v(0.8em)
}

// Encart "conseil / bonne pratique"
#let tip-box(title, body) = {
  block(
    width: 100%,
    fill: afpa-gray,
    inset: 12pt,
    radius: 3pt,
    stroke: (left: 3pt + afpa-green),
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align: (top, top),
      [
        #box(
          width: 22pt, height: 22pt,
          fill: afpa-green, radius: 3pt,
        )[
          #align(center + horizon)[#text(fill: white, size: 12pt)[💡]]
        ]
      ],
      [
        #text(weight: "bold", fill: afpa-green, size: 12pt)[#title]
        #v(0.3em)
        #body
      ]
    )
  ]
  v(0.8em)
}

//  Bloc "terminal"
#let term(body) = {
  block(
    width: 100%,
    fill: black,
    inset: 10pt,
    radius: 2pt,
  )[
    #set text(font: "DejaVu Sans Mono", fill: rgb("#39FF14"), size: 9.5pt)
    #body
  ]
  v(0.8em)
}

// Bloc de code (fond gris clair, style éditeur)
#let code-block(body) = {
  block(
    width: 100%,
    fill: afpa-gray,
    inset: 10pt,
    radius: 2pt,
    stroke: 0.5pt + afpa-gray-line,
  )[
    #set text(font: "DejaVu Sans Mono", size: 9.5pt, fill: afpa-dark)
    #body
  ]
  v(0.8em)
}

//  Page de crédits — insérée automatiquement en fin de document
#let credits-page() = {
  pagebreak(weak: true)
  current-section.update("Crédits")
  v(5cm)
  align(left)[
    #text(22pt, weight: "bold", fill: afpa-dark)[Crédits]
    #v(0.6em)
    #line(length: 30%, stroke: 2pt + afpa-orange)
    #v(2.5em)
    #text(13pt)[©Afpa]
    #v(0.6em)
    #text(12pt, style: "italic")[Reproduction interdite]
    #v(1.5em)
    #block(width: 75%)[
      #text(9.5pt)[Article L 122-4 du code de la propriété intellectuelle.]
      #v(0.5em)
      #text(9.5pt, style: "italic")[
        « Toute représentation ou reproduction intégrale ou partielle faite sans le
        consentement de l'auteur ou de ses ayants droit ou ayants cause est illicite.
        Il en est de même pour la traduction, l'adaptation ou la reproduction par un
        art ou un procédé quelconques. »
      ]
    ]
  ]
}

//  Fonction principale du document
#let afpa-ressource(
  title: "Titre du document",
  author: "Afpa",
  body,
) = {
  // Remplissqge des métadonnées du document
  set document(title: title, author: author)

  // Utilisation de la police "Libération"
  set text(font: "Liberation Sans", size: 10.5pt, fill: afpa-dark, lang: "fr")
  set par(justify: true, leading: 0.65em)
  set heading(numbering: none)
  show heading.where(level: 1): it => {
    v(0.4em)
    block[#text(22pt, weight: "bold", fill: afpa-dark)[#it.body]]
    v(0.3em)
    line(length: 100%, stroke: 1.5pt + afpa-orange)
    v(1em)
  }

  show link: set text(fill: afpa-orange)

  set page(
    paper: "a4",
    margin: (top: 3.4cm, bottom: 2.2cm, x: 2cm),

    // En-tête orange
    header: context {
       block(
          width: 100% + 4cm,
          height: 2.5cm,
        )[
          #place(top + left, dx: -2cm, dy: 0cm)[
            #box(width: 100% + 4cm, height: 2.5cm, fill: afpa-orange)[
              #align(horizon)[
                #pad(x: 2cm)[
                  #grid(
                    columns: (2.2cm, auto, 1fr),
                    column-gutter: 14pt,
                    align: (horizon, horizon, horizon),
                    [
                      #text(fill: white, size: 20pt, weight: "bold")[Afpa]
                    ],
                    [
                      #box(width: 1pt, height: 1.6cm, fill: white)
                    ],
                    [
                      #text(fill: white, size: 14pt, weight: "bold")[#title] \
                      #text(fill: white, size: 10.5pt)[#current-section.get()]
                    ],
                  )
                ]
              ]
            ]
          ]
        ]
     },

    // Pied de page
    footer: context {
      line(length: 100%, stroke: 0.75pt + afpa-orange)
      v(0.25em)
      align(right)[
        #text(size: 9pt, weight: "bold", fill: afpa-dark)[
          P/#counter(page).display()
        ]
      ]
    },
  )

  // Page de garde
  cover-page(title, author: author)
  pagebreak(weak: true)

  // Le body passé en paramètre
  body

  // Page de crédit
  credits-page()
}
