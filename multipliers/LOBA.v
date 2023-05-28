`timescale 1ns / 1ps

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
module LOBA0s
    # (parameter k=4, parameter n=14, parameter m=8)
    (a, b, r);

    input [n-1:0] a;
    input [m-1:0] b;
    output [n+m-1:0] r;

    wire [n-1:0] a_temp;
    wire [m-1:0] b_temp;
    wire [n+m-1:0] r_temp;
    wire out_sign;

    LOBA0u #(.K(k), .NA(n), .NB(m)) u1 (.a(a_temp), .b(b_temp), .r(r_temp));

    assign a_temp = a[n-1] ? ~a + 1 : a;
    assign b_temp = b[m-1] ? ~b + 1 : b;
    assign out_sign = a[n-1] ^ b[m-1];
    assign r = out_sign ? ~ r_temp + 1 : r_temp;

    endmodule


module LOBA0u
    #(parameter K=4, parameter NA=16, parameter NB=16)
    (a, b, r);

    input [NA-1:0] a;
    input [NB-1:0] b;
    output [NA+NB-1:0] r;

    wire [K-1:0] Ah;
    wire [K-1:0] Al;
    wire [$clog2(NA)-1:0] k1a;
    wire [$clog2(NA)-1:0] k2a;

    wire [K-1:0] Bh;
    wire [K-1:0] Bl;
    wire [$clog2(NB)-1:0] k1b;
    wire [$clog2(NB)-1:0] k2b;

    LOBA_SPLIT #(.N(NA)) u1 (.X(a), .Xh(Ah), .kh(k1a), .Xl(Al), .kl(k2a));
    LOBA_SPLIT #(.N(NB)) u2 (.X(b), .Xh(Bh), .kh(k1b), .Xl(Bl), .kl(k2b));

    assign r = ((Ah*Bh)<<(k1a+k1b-(2*(K-1))));

endmodule

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

module LOBA1s
    # (parameter k=4, parameter n=14, parameter m=8)
    (a, b, r);

    input [n-1:0] a;
    input [m-1:0] b;
    output [n+m-1:0] r;

    wire [n-1:0] a_temp;
    wire [m-1:0] b_temp;
    wire [n+m-1:0] r_temp;
    wire out_sign;

    LOBA1u #(.K(k), .NA(n), .NB(m)) u1 (.a(a_temp), .b(b_temp), .r(r_temp));

    assign a_temp = a[n-1] ? ~a + 1 : a;
    assign b_temp = b[m-1] ? ~b + 1 : b;
    assign out_sign = a[n-1] ^ b[m-1];
    assign r = out_sign ? ~ r_temp + 1 : r_temp;

    endmodule


module LOBA1u
    #(parameter K=4, parameter NA=16, parameter NB=16)
    (a, b, r);

    input [NA-1:0] a;
    input [NB-1:0] b;
    output [NA+NB-1:0] r;

    wire [K-1:0] Ah;
    wire [K-1:0] Al;
    wire [$clog2(NA)-1:0] k1a;
    wire [$clog2(NA)-1:0] k2a;

    wire [K-1:0] Bh;
    wire [K-1:0] Bl;
    wire [$clog2(NB)-1:0] k1b;
    wire [$clog2(NB)-1:0] k2b;

    LOBA_SPLIT #(.N(NA)) u1 (.X(a), .Xh(Ah), .kh(k1a), .Xl(Al), .kl(k2a));
    LOBA_SPLIT #(.N(NB)) u2 (.X(b), .Xh(Bh), .kh(k1b), .Xl(Bl), .kl(k2b));

    assign r = ((Ah*Bh)<<(k1a+k1b-6)) + ((Ah*Bl)<<(k1a+k2b-6));

endmodule

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

module LOBA2s
    # (parameter k=4, parameter n=14, parameter m=8)
    (a, b, r);

    input [n-1:0] a;
    input [m-1:0] b;
    output [n+m-1:0] r;

    wire [n-1:0] a_temp;
    wire [m-1:0] b_temp;
    wire [n+m-1:0] r_temp;
    wire out_sign;

    LOBA2u #(.K(k), .NA(n), .NB(m)) u1 (.a(a_temp), .b(b_temp), .r(r_temp));

    assign a_temp = a[n-1] ? ~a + 1 : a;
    assign b_temp = b[m-1] ? ~b + 1 : b;
    assign out_sign = a[n-1] ^ b[m-1];
    assign r = out_sign ? ~ r_temp + 1 : r_temp;

    endmodule


module LOBA2u
    #(parameter K=4, parameter NA=16, parameter NB=16)
    (a, b, r);

    input [NA-1:0] a;
    input [NB-1:0] b;
    output [NA+NB-1:0] r;

    wire [K-1:0] Ah;
    wire [K-1:0] Al;
    wire [$clog2(NA)-1:0] k1a;
    wire [$clog2(NA)-1:0] k2a;

    wire [K-1:0] Bh;
    wire [K-1:0] Bl;
    wire [$clog2(NB)-1:0] k1b;
    wire [$clog2(NB)-1:0] k2b;

    LOBA_SPLIT #(.N(NA)) u1 (.X(a), .Xh(Ah), .kh(k1a), .Xl(Al), .kl(k2a));
    LOBA_SPLIT #(.N(NB)) u2 (.X(b), .Xh(Bh), .kh(k1b), .Xl(Bl), .kl(k2b));

    assign r = ((Ah*Bh)<<(k1a+k1b-6)) + ((Ah*Bl)<<(k1a+k2b-6)) + ((Al*Bh)<<(k2a+k1b-6));

endmodule

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

module LOBA3s
    # (parameter k=4, parameter n=14, parameter m=8)
    (a, b, r);

    input [n-1:0] a;
    input [m-1:0] b;
    output [n+m-1:0] r;

    wire [n-1:0] a_temp;
    wire [m-1:0] b_temp;
    wire [n+m-1:0] r_temp;
    wire out_sign;

    LOBA3u #(.K(k), .NA(n), .NB(m)) u1 (.a(a_temp), .b(b_temp), .r(r_temp));

    assign a_temp = a[n-1] ? ~a + 1 : a;
    assign b_temp = b[m-1] ? ~b + 1 : b;
    assign out_sign = a[n-1] ^ b[m-1];
    assign r = out_sign ? ~ r_temp + 1 : r_temp;

    endmodule


module LOBA3u
    #(parameter K=4, parameter NA=16, parameter NB=16)
    (a, b, r);

    input [NA-1:0] a;
    input [NB-1:0] b;
    output [NA+NB-1:0] r;

    wire [K-1:0] Ah;
    wire [K-1:0] Al;
    wire [$clog2(NA)-1:0] k1a;
    wire [$clog2(NA)-1:0] k2a;

    wire [K-1:0] Bh;
    wire [K-1:0] Bl;
    wire [$clog2(NB)-1:0] k1b;
    wire [$clog2(NB)-1:0] k2b;

    LOBA_SPLIT #(.N(NA)) u1 (.X(a), .Xh(Ah), .kh(k1a), .Xl(Al), .kl(k2a));
    LOBA_SPLIT #(.N(NB)) u2 (.X(b), .Xh(Bh), .kh(k1b), .Xl(Bl), .kl(k2b));

    assign r = ((Ah*Bh)<<(k1a+k1b-6)) + ((Ah*Bl)<<(k1a+k2b-6)) + ((Al*Bh)<<(k2a+k1b-6)) + ((Al*Bl)<<(k2a+k2b-6));

endmodule

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

module LOBA_SPLIT
    # (parameter K=4, parameter N=16)
    (X, Xh, Xl, kh, kl);

    input [N-1:0] X;
    output reg [K-1:0] Xh;
    output reg [K-1:0] Xl;
    output reg [$clog2(N)-1:0] kh;
    output reg [$clog2(N)-1:0] kl;

    wire [N-1:0] lobh;
    wire [N-1:0] lobl;
    reg [N-1:0] lower;
    genvar i;

    LOBA_LOB #(.N(N)) u1 (.x(X), .y(lobh));
    LOBA_LOB #(.N(N)) u2 (.x(lower), .y(lobl));
    LOBA_MUX #(.k_in(K), .n_in(N)) u3 (.in_a(X), .select(kh), .out(Xh));
    LOBA_MUX #(.k_in(K), .n_in(N)) u4 (.in_a(X), .select(kl), .out(Xl));
    LOBA_LOWER #(.n_in(N)) u5 (.in_a(X), .select(kh-K), .out(lower));

    generate
        for (i=N-1; i>=K-1; i=i-1) begin
            always @ (*) begin
                if (lobh[i] == 1) begin
                    kh <= i;
                end

                if (lobl[i] == 1) begin
                    kl <= i;
                end
            end
        end
    endgenerate
endmodule


module LOBA_MUX
    #(parameter k_in=4, parameter n_in=16)
    (in_a, select, out);

    input [$clog2(n_in)-1:0] select;
    input [n_in-1:0] in_a;
    output reg [k_in-1:0] out;
    integer i;

    always @ (*) begin
        out = 0;
        for (i=k_in-1; i<(n_in); i=i+1) begin
            if (select == i) begin
                out <= in_a[i -: k_in];
            end
        end
    end

endmodule


module LOBA_LOWER
    #(parameter n_in=16)
    (in_a, select, out);

    input [$clog2(n_in)-1:0] select;
    input [n_in-1:0] in_a;
    output reg [n_in-1:0] out;
    genvar i;

    for (i=n_in-1; i>=0; i=i-1) begin
        always @ (*) begin
            //out = 0;
            if (select == i) begin
                out[n_in-1:i] <= 0;
                out[i:0] <= in_a[i:0];
            end
        end
    end

endmodule


module LOBA_LOB
    # (parameter N=16)
    (x, y);
    input [N-1:0] x;
    output reg [N-1:0] y;
    integer k;
    reg [N-1:0]w;
    always @ (*) begin
        y[N-1]=x[N-1];
        w[N-1]=x[N-1]?0:1;
        for (k=N-2;k>=0;k=k-1) begin
            w[k]=x[k]?0:w[k+1];
            y[k]=w[k+1]&x[k];
        end
    end
endmodule





