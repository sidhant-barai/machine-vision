# Background Modeling & Moving Object Segmentation

## 🎯 Project Objectives
This project focuses on automated foreground segmentation and transient motion isolation within dynamic video sequences. The primary objective was to design and evaluate two distinct background subtraction architectures—Temporal Frame Differencing and adaptive Gaussian Mixture Models (GMM)—to accurately segment moving vehicles from a static surveillance background while analyzing robustness against environmental noise.

## 📐 Implemented Logic & Engineering Techniques
* **Temporal Frame Differencing:** Developed a low-latency motion detection routine utilizing pixel-wise absolute differentiation ($|I_t - I_{t-1}|$) across sequential frames. Integrated dynamic gray-level threshold constraints to isolate transient foreground object masks.
* **Adaptive Gaussian Mixture Modeling (GMM):** Implemented a robust multi-modal background subtraction framework using a mixture of Gaussians to model individual pixel variance over time. This approach adaptively learns background variations, establishing high resilience against illumination fluctuations and background micro-movements.
* **Foreground Mask Generation & Post-Processing:** Configured binary matrix operations to output clean, high-contrast foreground isolation maps representing real-time target profiles.
* **Video Stream Writing Pipelines:** Programmed automated data exporters to stream, compile, and encode output segmented pixel matrices into stable `.mp4` visualization sequences (`gmm_output.mp4` / `frame_difference_output.mp4`).

---

## 📂 Source Directory & File Registry
* `Frame_difference.m` — Temporal pixel differencing segmentation script.
* `Gaussian_mixture_models.m` — Adaptive mixture model foreground detection script.
* `car-tracking.mp4` — Base multi-object traffic surveillance video dataset used for verification.
