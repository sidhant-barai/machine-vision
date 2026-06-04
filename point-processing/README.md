# Image Representation & Pixel-Point Processing

## 🎯 Objectives
This project implements the fundamental mechanics of digital image manipulation, matrix-based coordinate mapping, and pixel-level point operations. The core focus was to develop custom algorithms to handle spatial orientations and execute geometric/color transformations without relying on high-level automated black-box libraries.

## 📐 Implemented Logic & Engineering Techniques
* **Matrix Reversals:** Developed nested row and column scanning logic to manually mirror and flip multi-dimensional image arrays across horizontal and vertical axes.
* **Coordinate Space Mapping:** Built targeting logic to query, isolate, and output precise RGB color vectors at specific coordinate vectors $(x, y)$.
* **Color Space Transformations:** Dissected standard color profiles by manually separating and manipulating individual color channels (Red, Green, and Blue sub-matrices) to analyze tonal distributions.

---

## 📂 Source Directory & File Registry
* `Flipping.mux` / `flipLtRt.mux` — Spatial matrix inversion routines.
* `pixelFinder.mux` — Coordinate query and tracking script.
* `Converting.mux` — Multi-channel color space extraction.
* `duckMallardDrake.jpg` — Multi-tonal reference dataset for validation.
