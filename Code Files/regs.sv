
module regs #(parameter n = 8) // n - data bus width
(input logic clk, w1,w2, // clk and write control
 input logic [n-1:0] Wdata1,
input logic [n-1:0] Wdata2,
 input logic [3:0] R1addr1, R1addr2, R1addr3,
 input logic [3:0] R2addr1, R2addr2, R2addr3,
 output logic [n-1:0] R1data1, R1data2,
 output logic [n-1:0] R2data1, R2data2,
input logic [8:0] SW,
output logic [7:0]out);

 	// Declare 4 n-bit registers 
	logic [n-1:0] gpr [15:0];
	assign out =gpr[0];
	// write process, dest reg is Raddr2
	always_ff @ (posedge clk)
	begin
		if (w1)
            gpr[R1addr3-3] <= Wdata1;

		if (w2)
            gpr[R2addr3-3] <= Wdata2;
	end

	// read process, output 0 if %0 is selected, output SW[8] if %1,
	// output SW[7:0] if %2
	always_comb
	begin
	   if (R1addr1==4'd0)
	         R1data1 =  {n{1'b0}};
	else if (R1addr1==4'b0001)
		R1data1={7'b0000000,SW[8]};
	else if (R1addr1==4'b0010)
		R1data1=SW[7:0];
        else  R1data1 = gpr[R1addr1-3];

	   if (R2addr1==4'd0)
	         R2data1 =  {n{1'b0}};
	else if (R2addr1==4'b0001)
		R2data1={7'b0000000,SW[8]};
	else if (R2addr1==4'b0010)
		R2data1=SW[7:0];
        else  R2data1 = gpr[R2addr1-3];
	 
        if (R1addr2==4'd0)
	        R1data2 =  {n{1'b0}};

	else if (R1addr2==4'b0010)
		R1data2=SW[7:0];
	  else  R1data2 = gpr[R1addr2-3];

        if (R2addr2==4'd0)
	        R2data2 =  {n{1'b0}};

	else if (R2addr2==4'b0010)
		R2data2=SW[7:0];
	  else  R2data2 = gpr[R2addr2-3];
	end	
	

endmodule // module regs