# ==============================================================================
# 使用者設定區
# ==============================================================================
RTL      := sync_cnt.v
TB       := tb_sync_cnt.v
OUTPUT   := sim_out
VCD      := sim_out.vcd

# EDA 工具路徑（若 surfer 已加入 PATH，可直接填 surfer）
EDA_TOOL := /home/hachimi/Applications/hdl_opensource_simulator/surfer

# ==============================================================================
# 目標設定
# ==============================================================================
.PHONY: all compile run wave clean

# 預設目標：編譯 -> 執行仿真 -> 開啟波形
all: compile run wave

# 步驟 1: 編譯 Verilog 原始碼與 Testbench
compile: $(OUTPUT)

$(OUTPUT): $(TB) $(RTL)
	iverilog -o $(OUTPUT) $(TB) $(RTL)

# 步驟 2: 執行仿真並產生 VCD 波形檔
run: $(VCD)

$(VCD): $(OUTPUT)
	vvp $(OUTPUT)

# 步驟 3: 開啟 Surfer 波形檢視器（加 & 讓工具在背景開啟，避免終端機被卡住）
wave: $(VCD)
	$(EDA_TOOL) $(VCD) &

# 清理產生的暫存檔
clean:
	rm -f $(OUTPUT) $(VCD)