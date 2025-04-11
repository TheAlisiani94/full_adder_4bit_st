module full_adder_4bit_st_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] s;
    wire cout;

    // Instantiate the 4-bit full adder, using "dut" instead of "uut"
    full_adder_4bit_st dut (
        .s(s), .cout(cout),
        .a(a), .b(b), .cin(cin)
    );

    initial begin
        $monitor("Time=%0t a=%b b=%b cin=%b s=%b cout=%b (decimal: %d + %d + %d = %d, cout=%d)", 
                 $time, a, b, cin, s, cout, a, b, cin, s, cout);

        a = 4'b0000;
        b = 4'b0000;
        cin = 1'b0;

        repeat(16) begin
            #10;
            $display("Test case: a=%d, b=%d, cin=%d", a, b, cin);
            {cin, b, a} = {cin, b, a} + 1;
        end

        #10 $finish;
    end
endmodule
