#let project(
  title: "",
  subtitle: none,
  author: "",
  degree: "Master of Software Engineering",
  university: "FPT UNIVERSITY",
  ministry: "MINISTRY OF EDUCATION AND TRAINING",
  supervisors: (),
  year: str(datetime.today().year()),
  abstract: [],
  acknowledgments: [],
  // We keep this optionally, but for full control you can place it manually
  bibliography-file: none,
  bib-style: "ieee",
  body
) = {
  // --- 1. Global Setup ---
  set document(author: author, title: title)
  set text(font: "Times New Roman", size: 12pt, lang: "en")
  set page(paper: "a4", margin: 2.5cm)
  set par(leading: 0.7em, first-line-indent: 0pt, spacing: 12pt, justify: true)

  // --- 2. Cover Page ---
  page(header: none, footer: none)[
    #set align(center)
    #v(1cm)
    #text(weight: "bold")[#ministry \ #university]
    #v(4cm)
    #text(weight: "bold", size: 16pt, title)
    #if subtitle != none {
      par(leading: 0.5em)[#subtitle]
    }
    #v(4cm)
    by \
    #text(weight: "bold", author)
    #v(1fr)
    A thesis submitted in conformity with the requirements \
    for the degree of #degree
    #v(2cm)
    Copyright by #author \
    #year
  ]

  // --- 3. Title Page ---
  page(header: none, footer: none)[
    #set align(center)
    #v(1cm)
    #text(weight: "bold")[#ministry \ #university]
    #v(3cm)
    #text(weight: "bold", size: 16pt, title)
    #v(3cm)
    by \
    #text(weight: "bold", author)
    #v(1fr)
    A thesis submitted in conformity with the requirements \
    for the degree of #degree
    #v(1fr)
    #align(left)[
      #text(weight: "bold")[Supervisor:]
      #grid(
        columns: (auto, auto),
        gutter: 1em,
        ..supervisors.enumerate().map(((i, name)) => (
          [#(i + 1).], [#name]
        )).flatten()
      )
    ]
    #v(2cm)
    Copyright by #author \
    #year
  ]

  // --- 4. Abstract ---
  page[
    #set align(center)
    #text(weight: "bold", size: 14pt)[#title] \
    #v(0.5em)
    #author \
    Degree: #degree \
    #university \
    Year of Convocation: #year
    #v(1cm)
    #text(weight: "bold", size: 14pt)[Abstract]
    #set align(left)
    #set par(leading: 1em)
    #abstract
  ]

  // --- 5. Acknowledgments ---
  if acknowledgments != [] {
    page[
      #heading(outlined: false, numbering: none)[Acknowledgments]
      #acknowledgments
    ]
  }

  // --- 6. Front Matter ---
  set page(numbering: "i")
  counter(page).update(1)
  
  outline(title: "Table of Contents", indent: auto)
  pagebreak()
  
  outline(title: "List of Tables", target: figure.where(kind: table))
  pagebreak()
  
  outline(title: "List of Figures", target: figure.where(kind: image))
  pagebreak()

  // --- 7. Main Body ---
  set page(numbering: "1")
  counter(page).update(1)
  set heading(numbering: "1.1")
  
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(2em)
    align(center, text(size: 14pt, weight: "bold", it))
    v(1em)
  }
  show heading.where(level: 2): it => {
    text(size: 12pt, weight: "bold", it)
    v(0.5em)
  }

  body

  // Note: Bibliography is now manual to allow correct ordering before Appendices
  if bibliography-file != none {
    pagebreak()
    show bibliography: set text(size: 12pt)
    bibliography(bibliography-file, title: "References", style: bib-style)
  }
}

// --- 8. The Appendix Rule ---
// Call this function using `#show: appendix` in your body
#let appendix(body) = {
  // Reset counter and change numbering to Alpha (A.1)
  counter(heading).update(0)
  set heading(numbering: "A.1")
  
  // Custom display for Appendix Heading 1: "Appendix A: Title"
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(2em)
    align(center, text(size: 14pt, weight: "bold")[
      Appendix #counter(heading).display("A"): #it.body
    ])
    v(1em)
  }
  
  body
}