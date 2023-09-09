
export TEST_PYTHONPATH := $(PWD)/python_tb/test_generator.py
export SCB_PYTHONPATH := $(PWD)/python_tb/scoreboard.py
export TEST_DIR := $(PWD)/python_tb/test
export TB_DIR := RTL/tb.v

# Test files
export TEST1_DIR := $(TEST_DIR)/test_1.mem
export TEST2_DIR := $(TEST_DIR)/test_2.mem
export SUM_DIR := $(TEST_DIR)/expected_result_sum.mem
export SUB_DIR := $(TEST_DIR)/expected_result_sub.mem

generate:
	@echo "Generating testcases..."
	python3 $(TEST_PYTHONPATH) \
		--input1 $(TEST1_DIR) \
		--input2 $(TEST2_DIR) \
		--output_sum $(SUM_DIR) \
		--output_sub $(SUB_DIR) \
		--cases 10
	@echo "Done!"

simulate:
	@echo "Simulating..."
	iverilog $(TB_DIR) -g2012 && vvp a.out
	rm a.out
	@echo "Done!"

scoreboard:
	@echo "Running scoreboard..."
	python3 $(SCB_PYTHONPATH)
	@echo "Done!"