/*
Copyright (c) 2015 Soheil Hashemi (soheil_hashemi@brown.edu)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

Approximate Multiplier Design Details Provided in:
Soheil Hashemi, R. Iris Bahar, and Sherief Reda, "DRUM: A Dynamic
Range Unbiased Multiplier for Approximate Applications" In
Proceedings of the IEEE/ACM International Conference on
Computer-Aided Design (ICCAD). 2015. 

*/

`include "DRUM_LOD.v"
`include "DRUM_ENCODER.v"
`include "DRUM_MUX.v"
`include "DRUM_BARREL_SHIFTER.v"

module DRUM6_16_u(a, b, r);
input [15:0]a,b;
output [31:0]r;

wire [3:0]k1,k2;
wire [3:0]m,n;
wire [15:0]l1,l2;
wire [11:0]tmp;
wire [3:0]p,q;
wire [4:0]sum;
wire [5:0]mm,nn;
DRUM_LOD u1(.in_a(a),.out_a(l1));
DRUM_LOD u2(.in_a(b),.out_a(l2));
DRUM_ENCODER u3(.in_a(l1), .out_a(k1));
DRUM_ENCODER u4(.in_a(l2), .out_a(k2));
DRUM_MUX u5(.in_a(a), .select(k1), .out(m));
DRUM_MUX u6(.in_a(b), .select(k2), .out(n));
assign p=(k1>5)?k1-5:0;
assign q=(k2>5)?k2-5:0;
assign mm=(k1>5)?({1'b1,m,1'b1}):a[5:0];
assign nn=(k2>5)?({1'b1,n,1'b1}):b[5:0];
assign tmp=mm*nn;
assign sum=p+q;

DRUM_BARREL_SHIFTER u7(.in_a(tmp), .count(sum), .out_a(r));

endmodule
