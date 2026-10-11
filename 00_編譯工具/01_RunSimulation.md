This README file has been enhanced with Google Gemini.

# 範例模擬專案：同步計數器 (Demo Code)

本目錄包含同步計數器（Synchronous Counter）的 Verilog 範例原始碼、測試平台（Testbench）以及基於 GNU Make 的自動化波形時序仿真腳本。

---

## 1. 目錄結構

```text
demo_code/
├── makefile        # 自動化建置與模擬腳本
├── sync_cnt.v      # 設計原始碼 (RTL)
└── tb_sync_cnt.v   # 測試平台 (Testbench)

```

> **注意**：請確認 `tb_sync_cnt.v` 內已加入產生 VCD 波形的語法，且輸出檔名與 Makefile 內設定一致：
> ```verilog
> initial begin
>     $dumpfile("sim_out.vcd");
>     $dumpvars(0, tb_sync_cnt);
> end
> 
> ```
> 
> 

---

## 2. Makefile 設定

該腳本使用 `iverilog` 進行編譯、`vvp` 執行模擬，並自動呼叫`surfer`波形檢視器開啟時序仿真結果。

```makefile
# ==============================================================================
# 使用者設定變數
# ==============================================================================
RTL      := sync_cnt.v
TB       := tb_sync_cnt.v
OUTPUT   := sim_out
VCD      := sim_out.vcd

# EDA 波形檢視工具路徑 (請依實際安裝位置調整)
EDA_TOOL := /home/hachimi/Applications/hdl_tools/surfer

# ==============================================================================
# 偽目標宣告
# ==============================================================================
.PHONY: all compile run wave clean

# 預設目標：編譯 -> 模擬 -> 開啟波形
all: compile run wave

# 步驟 1: 編譯 (Compile)
compile:
	iverilog -o $(OUTPUT) $(TB) $(RTL)

# 步驟 2: 執行模擬 (Simulation)
run:
	vvp $(OUTPUT)

# 步驟 3: 開啟波形檢視器 (加 & 避免阻塞終端機)
wave:
	$(EDA_TOOL) $(VCD) &

# 清理編譯與模擬產生的檔案
clean:
	rm -f $(OUTPUT) $(VCD)

```

---

## 3. 執行指令 (Quick Start)

開啟 VS Code 整合終端機（Integrated Terminal），切換至 `demo_code` 目錄後即可操作：

### 一鍵自動化執行（預設）

```bash
make all

```

或直接輸入：

```bash
make

```

此指令會自動依序執行：

1. **`compile`**：呼叫 `iverilog` 編譯 RTL 與 Testbench，產出執行檔 `sim_out`。
2. **`run`**：呼叫 `vvp` 執行模擬，產生波形檔 `sim_out.vcd`。
3. **`wave`**：啟動波形檢視工具（如 Surfer），載入波形進行驗證。

---

### 分步執行指令

| 指令 | 說明 |
| --- | --- |
| `make compile` | 僅編譯 Verilog 程式碼並產出執行檔 |
| `make run` | 僅執行模擬運算並產生波形檔 (`sim_out.vcd`) |
| `make wave` | 僅開啟波形檢視工具載入當前波形 |
| `make clean` | 刪除編譯產出的 `sim_out` 與波形檔 `sim_out.vcd` |



