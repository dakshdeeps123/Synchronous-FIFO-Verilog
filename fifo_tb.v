module tb();

  reg clk, rst;
  reg [7:0] data_in;
  reg wr_en, rd_en;

  wire [7:0] data_out;
  wire full, empty;

  fifo dut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin

    // Initial values
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    #10;
    rst = 0;

    // Write 4 values
    @(negedge clk);
    wr_en = 1;
    data_in = 8'd10;

    @(negedge clk);
    data_in = 8'd20;

    @(negedge clk);
    data_in = 8'd30;

    @(negedge clk);
    data_in = 8'd40;

    @(negedge clk);
    wr_en = 0;

    // Read 4 values
    rd_en = 1;

    repeat(4) @(negedge clk);

    rd_en = 0;

    // Finish simulation
    #20;
    $finish;

  end

  initial begin
    $monitor("Time=%0t | wr_en=%b | rd_en=%b | data_in=%d | data_out=%d | count=%d | full=%b | empty=%b",
              $time, wr_en, rd_en, data_in, data_out, dut.count, full, empty);
  end
initial begin 
$fsdbDumpfile("waveform");
$fsdbDumpvars(0,tb);
end
endmodule
