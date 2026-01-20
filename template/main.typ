#import "../lib.typ": *

#show: project.with(
  title: "Developing an Object Detection System for Drones",
  author: "Nguyen Van A",
  supervisors: ("Dr. Pham Van B",),
  abstract: [Abstract text...],
  acknowledgments: [Thanks...],
)

= Introduction
This is the main body.

= Methodology
More main body content.

// --- 1. MANUAL BIBLIOGRAPHY ---
// Place this here so it appears BEFORE appendices
#pagebreak()
#bibliography("refs.bib", title: "References", style: "ieee")

// --- 2. SWITCH TO APPENDIX MODE ---
#show: appendix

= Survey Data
This is now "Appendix A: Survey Data". The heading styling is automatically updated.

= Code Listings
This is "Appendix B: Code Listings".
