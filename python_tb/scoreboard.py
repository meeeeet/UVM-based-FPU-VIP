from base import IEEE754

result_folder = "python_tb/test/"

file1_sub = result_folder+'actual_result_sub.mem'    # from RTL
file2_sub = result_folder+'expected_result_sub.mem'  # from test_generator
output_file_sub = result_folder+'difference_sub.log'
file1_sum = result_folder+'actual_result_sum.mem'    # from RTL
file2_sum = result_folder+'expected_result_sum.mem'  # from test_generator
output_file_sum = result_folder+'difference_sum.log'

IEEE754.remove_lines_with_pattern(file1_sum, "// 0x0")
IEEE754.remove_lines_with_pattern(file1_sub, "// 0x0")

IEEE754.find_differences(file1_sum, file2_sum, output_file_sum)

IEEE754.find_differences(file1_sub, file2_sub, output_file_sub)