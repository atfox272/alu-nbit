// Name: Testbench of multiplexer module
module mux_tb;

localparam IN_WIDTH = 32;
localparam SEL_WIDTH = 3;

reg [IN_WIDTH - 1:0] in [(1 <<SEL_WIDTH) - 1:0];
reg [SEL_WIDTH - 1:0] sel;
wire [IN_WIDTH - 1:0] out;

multiplexer_8to1 #(
  .IN_WIDTH(IN_WIDTH),
  .SEL_WIDTH(SEL_WIDTH)
) mux_tb (
  .in_0(in[0]),
  .in_1(in[1]),
  .in_2(in[2]),
  .in_3(in[3]),
  .in_4(in[4]),
  .in_5(in[5]),
  .in_6(in[6]),
  .in_7(in[7]),
  .sel(sel),
  .out(out)
);

initial begin
  $display("DATA_IN table------------------------------");
  for(integer i = 0; i < (1<<SEL_WIDTH); i = i + 1) begin
    in[i] <= 1000 * i;
    #1; 
    $display("input[%4d]: %11d", i, in[i]);
  end 
  $display("------------------------------------------");
  #5;
  $display("   Select    |   Output  ");
  for(integer i = 0; i < (1<<SEL_WIDTH); i = i + 1) begin
    #3; sel = i;
  end
end

always @(sel) begin
  #1; $display(" %11d | %11d ", sel, out);
end

endmodule
