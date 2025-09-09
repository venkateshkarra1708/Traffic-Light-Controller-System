module Traffic_Light_Controller_TB;
reg clk,rst;
wire [2:0]light_S;
wire [2:0]light_E;
wire [2:0]light_N;
wire [2:0]light_W;
wire [3:0] count;
wire [2:0] ps;
Traffic_Light_Controller dut(.clk(clk) , .rst(rst) , .light_S(light_S) , .light_E(light_E)  ,.light_N(light_N),.light_W(light_W)  );
initial
begin
    clk=0;
    forever #10 clk=~clk;
end

initial
begin
    rst=1;
    #10;
    rst=0;
    #1000;
    rst=1;
    #10;
    rst=0;
    #1000;
    $finish;
end
endmodule
