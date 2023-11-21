
`include "alucodes.sv"  
module alu #(parameter n =8) (
   input logic [n-1:0] a, b, // ALU operands
   //input logic [n-1:0] c, d, // MUL operands
   input logic [2:0] func, // ALU function code
   output logic flag, // ALU flags V,N,Z,C
   output logic [n-1:0] result // ALU result
   //output logic [n-1:0] MULresult // MUL result
);       
//------------- code starts here ---------

// create an n-bit adder 
// and then build the ALU around the adder
logic[n-1:0] ar,b1; // temp signals
//logic [15:0]Rmul;
//signed_mult m(.out(Rmul), .a(c), .b(d));
always_comb
begin
   if((func==`RSUB)||(func==`RSUBMUL)||(func==`RBEQ)||(func==`RBNE))
      b1 = ~b + 1'b1; // 2's complement subtrahend
   else b1 = b;

   ar = a+b1; // n-bit adder
end // always_comb
   
// create the ALU, use signal ar in arithmetic operations
always_comb
begin
  //default output values; prevent latches 
  flag = 1'b0;
  result = a; // default
  //MULresult = 0;
  case(func)
  	`RA : result = a;
	//`RB   : result = b;
     `RADD, `RBEQ, `RSUB,  `RBNE  : begin
	     result = ar; // arithmetic addition

		end

    //`RMUL  : MULresult = Rmul[14:7];
    `RADDMUL, `RSUBMUL : begin
		result = ar;
		//MULresult = Rmul[14:7];
		end
   endcase
	 
 
    // calculate flags Z and N
  flag = result == {n{1'b0}}; // Z

 
 end //always_comb

endmodule //end of module ALU


