module state(i_clk,i_rst_n,i_valid,i_data,o_en,o_cnt,o_valid);
input i_clk,i_rst_n,i_valid,i_data;
output reg o_valid;
output reg o_en;
output  [2:0]o_cnt;
parameter s0= 4'b0000;
parameter s1= 4'b0001;
parameter s2= 4'b0011;
parameter s3= 4'b0110;
parameter s4= 4'b1101;
//this is a sequence check Verilog HDL，if the 4 inputs are 1101 and the en is 1
/*__________________o_en__________________________*/
reg [3:0]state1;reg flag1;
reg flag2;
always@(posedge i_clk)
begin
	if(!i_rst_n) begin o_en=0;state1=s0; flag1=0;end
	else if(i_valid) 
	begin
	case(state1)
	s0: if(i_data) begin  flag2=0;state1=s1;o_en=0; end  else if(!i_data) begin  flag2=0;state1=s0;o_en=0;end  //s0= 4'b0000=> s1= 4'b0001; s0= 4'b0000=> s0= 4'b0000
	s1: if(i_data) begin  flag2=0;state1=s2;o_en=0; end  else if(!i_data) begin  flag2=0;state1=s0;o_en=0;end  //s1= 4'b0001=> s2= 4'b0011; s1= 4'b0001=> s0= 4'b0000
	s2: if(!i_data)begin  flag2=0;state1=s3;o_en=0; end  else if(i_data)  begin  flag2=0;state1=s1;o_en=0;end  //s2= 4'b0011=> s3= 4'b0110; s2= 4'b0011=> s1= 4'b0001; 
	s3: if(i_data) begin  flag2=1;state1=s4;o_en=1; end  else if(!i_data) begin  flag2=0;state1=s0;o_en=0;end  //s3= 4'b0110=> s4= 4'b1101; s3= 4'b0110=> s0= 4'b0000;
	s4: if(i_data) begin  flag1=1;flag2=0; state1=s1;o_en=0; end  else if(!i_data) begin flag1=0;flag2=0; state1=s0;o_en=0;end  //s4= 4'b1101=> s1= 4'b0001; s4= 4'b1101=> s0= 4'b0000;
	default: begin state1=s0;o_en=0;end
	endcase
	end
	else  begin o_en=o_en;state1=state1;end
end
//if inputs are 1101-> 11011 ->110111 ->1101110->11011101 ,cnt will be 1 ,it can add up to 7 ;then stay the same;
/*__________________o_cnt__________________________*/

reg [2:0]o_cnt_reg;
always@(posedge i_clk)
begin
	if(i_clk)
	begin
	if(!i_rst_n) begin  o_cnt_reg=0;end
	else if(i_valid) 
	begin
if(o_en)
	begin
		if(flag1)
			begin 
				if( o_cnt_reg==6) begin  o_cnt_reg= o_cnt_reg;end
				else  o_cnt_reg= o_cnt_reg+1;
			end
		else
		begin 	 o_cnt_reg=0; end
	end
else o_cnt_reg=o_cnt_reg;
	end
	else begin   o_cnt_reg=o_cnt_reg;end
	end
end


assign o_cnt=(flag1)?(o_cnt_reg+1):flag2;
always@(posedge i_clk)
begin
	if(i_clk)
	begin
	if(!i_rst_n) begin o_valid=0;end
	else 
		o_valid=i_valid;
	end
end
endmodule



     

