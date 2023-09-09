from ieee754_converter import IEEE754Converter

result_folder = "python_tb/test"

IEEE754Converter.remove_lines_with_pattern("M:/GitHub/IEEE-754-single-precision-FPU/python_tb/test/actual_result_sum.mem", "// 0x0")
IEEE754Converter.remove_lines_with_pattern("M:/GitHub/IEEE-754-single-precision-FPU/python_tb/test/actual_result_sub.mem", "// 0x0")

file1_sum = 'M:/GitHub/IEEE-754-single-precision-FPU/python_tb/test/actual_result_sum.mem'    # from RTL
file2_sum = 'M:/GitHub/IEEE-754-single-precision-FPU/python_tb/test/expected_result_sum.mem'  # from test_generator
output_file_sum = 'M:/GitHub/IEEE-754-single-precision-FPU/python_tb/test/difference_sum.log'

IEEE754Converter.find_differences(file1_sum, file2_sum, output_file_sum)

file1_sub = 'M:/GitHub/IEEE-754-single-precision-FPU/python_tb/test/actual_result_sub.mem'    # from RTL
file2_sub = 'M:/GitHub/IEEE-754-single-precision-FPU/python_tb/test/expected_result_sub.mem'  # from test_generator
output_file_sub = 'M:/GitHub/IEEE-754-single-precision-FPU/python_tb/test/difference_sub.log'

IEEE754Converter.find_differences(file1_sub, file2_sub, output_file_sub)