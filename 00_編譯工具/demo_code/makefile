# ==============================================================================
# 使用者設定區
# RTL: Verilog 原始碼檔案名稱
# TB: Testbench 檔案名稱
# OUTPUT: 編譯後的執行檔名稱
# VCD: 仿真產生的波形檔名稱
# EDA_TOOL: EDA 工具的執行檔路徑（若已加入 PATH，可直接填工具名稱）
# ==============================================================================
RTL      := sync_cnt.v
TB       := tb_sync_cnt.v
OUTPUT   := sim_out
VCD      := sim_out.vcd
EDA_TOOL := /home/hachimi/Applications/hdl_opensource_simulator/surfer


# ==============================================================================
# 目標設定
# phony: phony targets are not real files, but just names for commands to run
# ==============================================================================
.PHONY: all compile run wave clean


# ==============================================================================
#	 Makefile 目標規則
# ==============================================================================
# 預設目標：編譯 -> 執行仿真 -> 開啟波形
all: compile run wave

# 步驟 1: 編譯 Verilog 原始碼與 Testbench
# 看到 compile 依賴 sim_out。
# 轉而去處理 sim_out 這個目標：
# 檢查 sim_out 是否存在、是否比 tb_sync_cnt.v、sync_cnt.v 舊。
# 若需要重建 → 執行 iverilog -o sim_out ...。
# 若已最新 → 印出 up to date，什麼都不做。
compile: $(OUTPUT)
$(OUTPUT): $(TB) $(RTL)
	iverilog -o $(OUTPUT) $(TB) $(RTL)

# 步驟 2: 執行仿真並產生 VCD 波形檔
# 看到 run 依賴 sim_out.vcd。
# 轉而去處理 sim_out.vcd 這個目標：
# 檢查 sim_out.vcd 是否存在、是否比 sim_out 舊。
# 若需要重建 → 執行 vvp sim_out。	
# 若已最新 → 印出 up to date，什麼都不做。
run: $(VCD)
$(VCD): $(OUTPUT)
	vvp $(OUTPUT)

# 步驟 3: 開啟 Surfer 波形檢視器（加 & 讓工具在背景開啟，避免終端機被卡住）
# 看到 wave 依賴 sim_out.vcd。
# 轉而去處理 sim_out.vcd 這個目標：
# 檢查 sim_out.vcd 是否存在、是否比 sim_out 舊。
# 若需要重建 → 執行 $(EDA_TOOL) sim_out.vcd &。
# 若已最新 → 印出 up to date，什麼都不做。
wave: $(VCD)
	$(EDA_TOOL) $(VCD) &

# 清理產生的暫存檔
clean:
	rm -f $(OUTPUT) $(VCD)