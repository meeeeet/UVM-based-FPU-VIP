#include <stdio.h>

int floatOperations(int op1, int op2, int cmd) {
    float floatOp1 = *(float*)&op1;
    float floatOp2 = *(float*)&op2;
    float floatResult;

    // Perform the specified floating-point operation based on the command
    switch (cmd) {
        case 1: // Add
            floatResult = floatOp1 + floatOp2;
            break;
        case 2: // Multiply
            floatResult = floatOp1 * floatOp2;
            break;
        case 3: // Divide
            floatResult = floatOp1 / floatOp2;
            break;
        case 4: // Float to Int
            // Convert the floating-point result to an integer
            return (int)floatOp1;
        case 5: // Int to Float
            // Convert the integer operand to a floating-point number
            floatResult = (float)(int)op1;
            break;
        default:
            printf("Invalid command!\n");
            // Return 0 for invalid commands
            return 0;
    }

    // Convert the floating-point result to IEEE 754 single precision and return it as an int
    return *(int*)&floatResult;
}