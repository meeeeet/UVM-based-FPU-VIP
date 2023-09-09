import struct
import random
import filecmp

class IEEE754Converter:
    def __init__(self, array):
        self.array = array

    def ieee754_convert(self):
        hex_representations = []
        for number in self.array:
            packed = struct.pack('>f', number)
            hex_representation = ''.join(f'{byte:02x}' for byte in packed)
            hex_representations.append(hex_representation)
        return hex_representations

    def save_float_to_txt(self, filename):
        try:
            with open(filename, 'w') as file:
                for original in self.array:
                    file.write(f"{original:.5f}\n")
            print(f"Float values successfully saved to '{filename}'")
        except Exception as e:
            print(f"An error occurred while saving float values: {str(e)}")

    def create_memory_file(self, filename):
        try:
            with open(filename, 'w') as file:
                for hex_value in self.ieee754_convert():
                    file.write(f"{hex_value}\n")
            print(f"IEEE 754 hexadecimal representations successfully saved to '{filename}'")
        except Exception as e:
            print(f"An error occurred while creating the memory file: {str(e)}")

    @staticmethod
    def random_float(size):
        ieee754_numbers = []
        for _ in range(size):
            number = random.uniform(-1000000, 1000000)
            ieee754_numbers.append(round(number, 20))
        return ieee754_numbers
    
    @staticmethod
    def add_arrays(array1, array2):
        if len(array1) != len(array2):
            raise ValueError("Arrays must have the same length")
        
        result = [a + b for a, b in zip(array1, array2)]
        return result
    
    @staticmethod
    def subtract_arrays(array1, array2):
        if len(array1) != len(array2):
            raise ValueError("Arrays must have the same length")
        
        result = [a - b for a, b in zip(array1, array2)]
        return result
    
    @staticmethod
    def are_files_equal(file1, file2):
        are_equal = filecmp.cmp(file1, file2, shallow=False)
        if are_equal:
            print(f"Files '{file1}' and '{file2}' have the same content.")
        else:
            print(f"Files '{file1}' and '{file2}' have different content.")
        return are_equal
    
    @staticmethod
    def remove_lines_with_pattern(filename, pattern):
        with open(filename, 'r') as file:
            lines = file.readlines()

        with open(filename, 'w') as file:
            for line in lines:
                if pattern not in line:
                    file.write(line.strip() + '\n')
        print(f"Lines containing pattern '{pattern}' removed from '{filename}'")
    
    @staticmethod
    def compare_first_8_digits(line1, line2):
        return line1[:8] == line2[:8]

    @staticmethod
    def convert_hex_to_float(hex_representation):
        bytes_representation = bytes.fromhex(hex_representation)
        float_value = struct.unpack('>f', bytes_representation)[0]
        return float_value
    
    @staticmethod
    def calculate_percentage_error(value1, value2):
        if value2 == 0.0:
            return None  # To avoid division by zero
        percentage_error = abs((value1 - value2) / value2) * 100
        return percentage_error
    
    @staticmethod
    def find_differences(file1, file2, output_file):
        with open(file1, 'r') as file1_content, open(file2, 'r') as file2_content:
            file1_lines = file1_content.readlines()
            file2_lines = file2_content.readlines()
            
        percentage_errors = []  # To collect percentage error values

        with open(output_file, 'w') as output:
            for i, (line1, line2) in enumerate(zip(file1_lines, file2_lines), start=1):
                if not IEEE754Converter.compare_first_8_digits(line1, line2):
                    file1_float = IEEE754Converter.convert_hex_to_float(line1.strip())
                    file2_float = IEEE754Converter.convert_hex_to_float(line2.strip())

                    difference = file1_float - file2_float
                    percentage_error = IEEE754Converter.calculate_percentage_error(file1_float, file2_float)
                    
                    output.write(f"@[{i}] Hex:  {line1.strip()}   {line2.strip()}\n")
                    output.write(f"    Float Values: {file1_float:.20f}  {file2_float:.20f}\n")
                    output.write(f"    Difference: {difference:.20f}\n")
                    output.write(f"    %Error: {percentage_error:.10f}%\n")

                    if percentage_error > 1.00:
                        warning_message = f"Warning at line {i}:"
                        warning_message += f"\n  Hex Values:  {line1.strip()}   {line2.strip()}"
                        warning_message += f"\n  Float Values: {file1_float:.20f}  {file2_float:.20f}"
                        warning_message += f"\n  Difference: {difference:.20f}"
                        warning_message += f"\n  %Error: {percentage_error:.10f}%"
                        print(warning_message)
                    
                    percentage_errors.append(percentage_error)
        
        if percentage_errors:
            average_error = sum(percentage_errors) / len(percentage_errors)
            average_error_message = f"Average %Error across differences: {average_error:.10f}%"
            print(average_error_message)  # Center the message in an 80-character wide line
        else:
            print("No %Error values found in the log file.")
        

