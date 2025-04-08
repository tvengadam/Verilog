module not_gate_tb;
    reg A;
    wire Y;

    not_gate uut (.A(A), .Y(Y));

    initial begin
        $display("A | Y");
        $display("------");

        A = 0; #10; $display("%b | %b", A, Y);
        A = 1; #10; $display("%b | %b", A, Y);

        $finish;
    end
endmodule

