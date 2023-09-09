from ieee754_converter import IEEE754Converter

# Generate an array of random floating-point numbers
cases=100000
input_array1 = IEEE754Converter.random_float(cases)
input_array2 = IEEE754Converter.random_float(cases)
sum_array=IEEE754Converter.add_arrays(input_array1,input_array2)
subtract_arry=IEEE754Converter.subtract_arrays(input_array1,input_array2)

# Create an instance of the IEEE754Converter class
test1 = IEEE754Converter(input_array1)
test2 = IEEE754Converter(input_array2)
result_sum = IEEE754Converter(sum_array)
result_subtract = IEEE754Converter(subtract_arry)


destination_folder = "python_tb/test"
# Save the IEEE 754 hexadecimal representations to output.txt

test1.create_memory_file(f"{destination_folder}/test_1.mem")
test2.create_memory_file(f"{destination_folder}/test_2.mem")
result_sum.create_memory_file(f"{destination_folder}/expected_result_sum.mem")
result_subtract.create_memory_file(f"{destination_folder}/expected_result_sub.mem")