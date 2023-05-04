module loba1 #(
    parameter N=16,
    parameter K=4)
    (A, B, P);

    input [N-1:0] A;
    input [N-1:0] B;
    output reg [(2*N)-1:0] P;

    reg [K-1:0] Ah, Bh, Bl;
    reg [N-1:0] ka1, kb1, kb2;
    integer shift0, shift1;

    loba_xh high1 (.x(A), .xh(Ah), .kh(ka1));
    loba_xh high2 (.x(B), .xh(Bh), .kh(kb1));
    loba_xl low2 (.x(B), .kh(kb1), .xl(Bl), .kl(kb2));

    loba_ssg sfht0 (.k1(ka1), .k2(kb1), .shift(shift0));
    loba_ssg sfht1 (.k1(ka1), .k2(kb2), .shift(shift1));

    assign P =
        ((Ah * Bh) << shift0)
        +
        ((Ah * Bl) << shift1);

endmodule
