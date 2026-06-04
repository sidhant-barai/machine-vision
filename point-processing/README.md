Image Representation & Pixel-Point Processing

## 🎯 Objectives
This repository introduces the fundamental concepts of digital image manipulation, matrix representations of coordinate systems, and pixel-level point operations. The goal was to manipulate spatial orientations and process basic geometric and color transformations without relying on high-level automated black-box functions.

## 🛠️ Implemented Tasks & Logic
* **Matrix Reversals (`Flipping.mux` / `flipLtRt.mux`):** Implemented row and column scanning to mirror and flip image arrays spatially across horizontal and vertical axes.
* **Coordinate Mapping (`pixelFinder.mux`):** Built custom tracking logic to query, isolate, and output exact RGB values at specific coordinate vectors $(x, y)$.
* **Color Space Transformations (`Converting.mux`):** Explored manual splitting and manipulation of individual color channels (Red, Green, Blue matrices).

## 🖼️ Sample Datasets Used
* Base test images including `duckMallardDrake.jpg` and color-isolation maps (`One_colour.jpg`, `Two_colour.jpg`) to validate index mapping precision.
