// Define the behavioral full adder first
module full_adder_bh (
    output sum, cout,  // Outputs: sum and carry-out
    input a, b, cin    // Inputs: two bits and carry-in
);
    assign sum = a ^ b ^ cin;                // Sum = a XOR b XOR cin
    assign cout = (a & b) | (b & cin) | (a & cin); // Carry-out logic
endmodule

// Define the 4-bit full adder module
module full_adder_4bit_st (
    output [3:0] s,    // 4-bit sum
    output cout,       // Carry-out
    input [3:0] a, b,  // 4-bit inputs
    input cin          // Carry-in
);
    wire n1, n2, n3;   // Internal carry signals

    full_adder_bh fa1(s[0], n1, a[0], b[0], cin);
    full_adder_bh fa2(s[1], n2, a[1], b[1], n1);
    full_adder_bh fa3(s[2], n3, a[2], b[2], n2);
    full_adder_bh fa4(s[3], cout, a[3], b[3], n3);
endmodule
