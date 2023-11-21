

module testbench;

logic clock; 
logic[7:0] LED;
logic [9:0] SW;

picoMIPS4test pico0(
  .fastclk(clock),  // 50MHz Altera DE0 clock
  .SW(SW), // Switches SW0..SW9
  .LED(LED));

initial 
begin
  clock = 1'b0; 
  forever #10ns clock = ~clock; 
end

initial
  begin
  SW[9] = '0;
  #50ns SW[9] = '1;
  #10ns SW[9] = '0;
  SW[8] = '0;
  #50ns SW[7:0]= 8'b11110000; //ReW= -0.125 
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
  #10ns SW[7:0]=8'b01100000;  //ImW=  0.75
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
  #10ns SW[7:0]= 8'b00010110; //Reb = 22
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
  #10ns SW[7:0]= 8'b00000101; //Imb = 5
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
  #10ns SW[7:0]= 8'b11100101;  //Rea = -27
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
  #10ns SW[7:0]= 8'b00110100;  //Ima = 52
  #300ns SW[8] = '1;
  #60ns SW[8] = '0; //display Rey = -33.5
  #300ns SW[8] = '1;
  #60ns SW[8] = '0; //display Imy = 67.875
  #300ns SW[8] = '1;
  #60ns SW[8] = '0; //display Rez = -20.5
  #300ns SW[8] = '1;
  #60ns SW[8] = '0; //display Imz = 36.125

  #10ns SW[7:0]= 8'b00000001; //Reb = 1
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
  #10ns SW[7:0]= 8'b00000010; //Imb = 2
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
  #10ns SW[7:0]= 8'b00000011;  //Rea = 3
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
  #10ns SW[7:0]= 8'b00000111;  //Ima = 7
  #300ns SW[8] = '1;
  #60ns SW[8] = '0; //display Rey = 1.375
  #300ns SW[8] = '1;
  #60ns SW[8] = '0; //display Imy = 7.5
  #300ns SW[8] = '1;
  #60ns SW[8] = '0; //display Rez = 4.625
  #300ns SW[8] = '1;
  #60ns SW[8] = '0; //display Imz = 6.5


/*  #300ns SW[8] = '1;
  #100ns SW[8] = '0;
#50ns SW[7:0]= 8'b00010000;
  #70ns SW[8] = '1;
  #100ns SW[8] = '0;
   #10ns SW[7:0]= 8'b00100000;
  #60ns SW[8] = '1;
  #60ns SW[8] = '0;
  #300ns SW[8] = '1;
  #100ns SW[8] = '0;*/
  end

endmodule