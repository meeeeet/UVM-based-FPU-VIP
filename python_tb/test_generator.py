import argparse
from base import IEEE754

# Create an argument parser
parser = argparse.ArgumentParser(description="Generate random IEEE 754 floating-point numbers and create memory files.")

# Add command-line arguments for file names
parser.add_argument("--input1", required=True, help="File name for input array 1")
parser.add_argument("--input2", required=True, help="File name for input array 2")
parser.add_argument("--output_sum", required=True, help="File name for expected result of addition")
parser.add_argument("--output_sub", required=True, help="File name for expected result of subtraction")
parser.add_argument("--cases", required=True, help="File name for expected result of subtraction")

# Parse the command-line arguments
args = parser.parse_args()

# Generate an array of random floating-point numbers
# cases = 1000
input_array1 = IEEE754.random_float(int(args.cases))
input_array2 = IEEE754.random_float(int(args.cases))
sum_array = IEEE754.add_arrays(input_array1, input_array2)
subtract_array = IEEE754.subtract_arrays(input_array1, input_array2)

# Create instances of the IEEE754 class
test1 = IEEE754(input_array1)
test2 = IEEE754(input_array2)
result_sum = IEEE754(sum_array)
result_subtract = IEEE754(subtract_array)

# Save the IEEE 754 hexadecimal representations to specified files
test1.create_memory_file(args.input1)
test2.create_memory_file(args.input2)
result_sum.create_memory_file(args.output_sum)
result_subtract.create_memory_file(args.output_sub)
