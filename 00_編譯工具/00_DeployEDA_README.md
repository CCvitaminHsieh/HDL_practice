This README file is enhanced with Google Gemini.

# Environment Setup & Prerequisites

## 1. Current OS
- **OS**: Ubuntu 22.04 LTS

## 2. EDA Tools & VScode Extensions
This project relies on the following open-source EDA tools and VScode plugins:

- **Simulation**:
  - [Icarus Verilog](https://steveicarus.github.io/iverilog/) (`v11.0` stable)
- **Waveform Viewers**:
  - [GTKWave](http://gtkwave.sourceforge.net/)
  - [Surfer](https://surfer-project.org/) *(Modern waveform viewer alternative to GTKWave)*
- **Visual Studio Code Extensions**:
  - [Digital IDE](https://marketplace.visualstudio.com/items?itemName=sterben.fpga-support) (`sterben`)
  - [Makefile Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools) (`Microsoft`)
  - [CMake Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools) (`Microsoft`)

---

## 3. Installation Guide

### Step 1: Install Icarus Verilog & GTKWave
Install the simulation and waveform packages via APT:
  ```bash
  sudo apt update
  sudo apt install -y iverilog gtkwave

  ```

### Step 2: Set Up Surfer (Optional Waveform Viewer)

Download and extract the latest pre-built binary from the [Surfer Project](https://surfer-project.org/):



### Step 3: Configure VS Code

1. Install [Visual Studio Code](https://code.visualstudio.com/).
2. Install the recommended extensions from the CLI or via the Extensions view: 

    ```bash
    code --install-extension sterben.fpga-support
    code --install-extension ms-vscode.makefile-tools
    code --install-extension ms-vscode.cmake-tools
    ```
