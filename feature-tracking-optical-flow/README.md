# Feature Tracking & Optical Flow Motion Analysis

## 🎯 Project Objectives
This project focuses on dense motion estimation, spatial feature tracking, and quantitative performance evaluation within dynamic video sequences. The primary objective was to build a robust tracking pipeline using a Lucas-Kanade optical flow framework verified by automated corner feature metrics, validating its mathematical accuracy against a known ground truth trajectory dataset.

## 📐 Implemented Logic & Engineering Techniques
* **Lucas-Kanade Optical Flow Extraction:** Implemented differential tracking algorithms utilizing a window-based optical flow structure to compute local pixel velocity arrays ($V_x, V_y$) across progressive video frames.
* **Feature Consistency Constraints:** Integrated native corner landmark detection (including Harris feature evaluation methods) to automatically lock onto geometric anchor points on the target object, mitigating track drift over long durations.
* **Dynamic Bounding Box Tracking:** Programmed a custom vector transposition function to continuously translate a tracking bounding box using localized displacement vectors.
* **Quantitative Accuracy Validation:** Integrated a ground-truth dataset matrix to continuously evaluate tracking trajectory deviation, providing benchmarking metrics for system evaluation.
* **Velocity Vector Fields:** Mapped dense velocity flow fields across successive frames to isolate and visualize local structural movement distributions.

---

## 📂 Source Directory & File Registry
* `Main_Task.m` — Master execution pipeline for tracking, feature correction, and error evaluation.
* `Task_2.m` — Motion vector field plotting script.
* `ShiftBbox.m` — Coordinate translation bounding box utility function.
* `red_square_gt.mat` — Target matrix containing true pixel trajectories for error benchmarking.
* `red_square_video.mp4` — Primary verification tracking video clip.
* `red_square_static.jpg` / `GingerBreadMan_first.jpg` / `GingerBreadMan_second.jpg` — Reference images utilized for calibration and vector testing.
