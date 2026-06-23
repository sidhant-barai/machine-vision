# Autonomous Target Localization & Vision-Based Path Planning

## 🎯 Project Objectives
This project implements an intelligent autonomous search and localization framework designed to navigate a robot through multi-stage visual paths using symbolic indicators. The core objective was to engineer an automated pipeline that applies adaptive image binarization, connected component classification, and spatial color-space segmentations to isolate directional headings, dynamically tracing a valid trajectory from a starting location to a final target coordinate.

## 📐 Implemented Logic & Engineering Techniques
* **Connected Component Labeling & Segmentation:** Integrated pixel-connectivity graphs to isolate independent target bodies and structural symbols scattered across unstructured environments.
* **Geometric Feature Extraction:** Leveraged multi-dimensional morphological property matrices to extract spatial bounding boxes, area metrics, and precise center mass coordinates for every detected component.
* **Color Space Threshold Extraction:** Engineered multi-channel color profiling masks to selectively isolate target landmarks based on distinct RGB/HSV color vectors (filtering specific red origin markers and yellow direction fields).
* **Navigational Vector Heading Computations:** Developed programmatic tracking loops that calculate displacement orientation vectors between sequential landmarks, projecting directional search lines to look for next-in-sequence objects without losing tracking calibration.

---

## 📂 Source Directory & File Registry
* `treasure_hunting.m` — Master tracking execution loop, state manager, and path-validation system.
* `arrow_finder.m` — Structural geometric constraint solver for extraction of navigational markers.
* `yellow_finder.m` — Chromatic pixel segmenter for localized landmark isolation.
* `easy_hunt.jpg` / `medium_hunt.jpg` / `hard_hunt.jpg` — Progressively complex environment tracking maps.
* `Treasure_easy.jpg` / `Treasure_medium.jpg` / `Treasure_hard.jpg` — Alternative geometric target scenes for robust testing.
