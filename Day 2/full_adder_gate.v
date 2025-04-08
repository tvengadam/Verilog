// ========== Gate Level Full Adder ==========
module full_adder_gate (
    input a, b, cin,
    output sum, cout
);
    wire s1, c1, c2;

    xor (s1, a, b);
    xor (sum, s1, cin);
    and (c1, a, b);
    and (c2, s1, cin);
    or  (cout, c1, c2);
endmodule

// ========== Dataflow Full Adder ==========
module full_adder_dataflow (
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

// ========== Behavioral Full Adder ==========
module full_adder_behavioral (
    input a, b, cin,
    output reg sum, cout
);
    always @ (a or b or cin)
    begin
        {cout, sum} = a + b + cin;
    end
endmodule

// ========== Testbench ==========
module tb_all_full_adders;
    reg a, b, cin;
    wire sum_gate, cout_gate;
    wire sum_dataflow, cout_dataflow;
    wire sum_behavioral, cout_behavioral;

    // Instantiate all 3 modules
    full_adder_gate       FA1 (.a(a), .b(b), .cin(cin), .sum(sum_gate), .cout(cout_gate));
    full_adder_dataflow   FA2 (.a(a), .b(b), .cin(cin), .sum(sum_dataflow), .cout(cout_dataflow));
    full_adder_behavioral FA3 (.a(a), .b(b), .cin(cin), .sum(sum_behavioral), .cout(cout_behavioral));

    initial begin
        $dumpfile("fulladder_all.vcd");
        $dumpvars(0, tb_all_full_adders);

        $display("A B Cin | GATE:Sum Cout | DATAFLOW:Sum Cout | BEHAVIORAL:Sum Cout");

        a=0; b=0; cin=0; #10;
        $display("%b %b  %b  |   %b     %b     |     %b        %b     |     %b         %b", 
                  a, b, cin, sum_gate, cout_gate, sum_dataflow, cout_dataflow, sum_behavioral, cout_behavioral);

        a=0; b=1; cin=1; #10;
        $display("%b %b  %b  |   %b     %b     |     %b        %b     |     %b         %b", 
                  a, b, cin, sum_gate, cout_gate, sum_dataflow, cout_dataflow, sum_behavioral, cout_behavioral);

        a=1; b=0; cin=0; #10;
        $display("%b %b  %b  |   %b     %b     |     %b        %b     |     %b         %b", 
                  a, b, cin, sum_gate, cout_gate, sum_dataflow, cout_dataflow, sum_behavioral, cout_behavioral);

        a=1; b=1; cin=1; #10;
        $display("%b %b  %b  |   %b     %b     |     %b        %b     |     %b         %b", 
                  a, b, cin, sum_gate, cout_gate, sum_dataflow, cout_dataflow, sum_behavioral, cout_behavioral);

        $finish;
    end
endmodule

