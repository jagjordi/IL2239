//Verilog HDL for "IL2239_SAR_ADC", "SAR4" "functional"

module SAR4 ( reset, clock, comp, start, SW_inp, SW_ref, DAC_out4, DAC_out3, DAC_out2, DAC_out1, DAC_out0, out4, out3, out2, out1, out0, eoc );



  output eoc;
  output SW_inp;
  output SW_ref;
  output out0;
  output out1;
  output out2;
  output out3;
  output out4;
  output DAC_out0;
  output DAC_out1;
  output DAC_out2;
  output DAC_out3;
  output DAC_out4;

  input start;
  input reset;
  input comp;
  input clock;

  reg eoc;
  reg SW_inp = 1'b0;
  reg SW_inp_reg = 1'b0;
  reg SW_ref = 1'b0;
  reg out0 = 1'b0;
  reg out1 = 1'b0;
  reg out2 = 1'b0;
  reg out3 = 1'b0;
  reg out4 = 1'b0;
  reg DAC_out0 = 1'b0;
  reg DAC_out1 = 1'b0;
  reg DAC_out2 = 1'b0;
  reg DAC_out3 = 1'b0;
  reg DAC_out4 = 1'b0;

parameter [2:0] idle = 3'b000;
parameter [2:0] sample = 3'b001;
parameter [2:0] convInit= 3'b010;
parameter [2:0] conv4 = 3'b011;
parameter [2:0] conv3 = 3'b100;
parameter [2:0] conv2 = 3'b101;
parameter [2:0] conv1 = 3'b110;
parameter [2:0] endConv = 3'b111;

reg [2:0] state;	//	Current State
reg [2:0] next; 	//	Next State

always @(negedge clock)
begin
	if (reset) state <= idle;
	else state <= next;

end 

always @(state or start)
begin
	next = idle;
	eoc = 1'b0;
	case (state)
	idle : begin
		if (~start)
		begin
		next = idle;
		DAC_out0 = 1'b0;
		DAC_out1 = 1'b0;
		DAC_out2 = 1'b0;
		DAC_out3 = 1'b0;		
		DAC_out4 = 1'b0;		
		out0 = 1'b0;
		out1 = 1'b0;
		out2 = 1'b0;
		out3 = 1'b0; 
        out4 = 1'b0;
		eoc = 1'b0;
		SW_inp_reg = 1'b0;
		SW_ref = 1'b0;
		end	
		else if (start == 1)
		next = sample;
		end
	sample : begin
		next = convInit;
		SW_inp_reg = 1'b1;	//Connects the bottom plate of the caps to Vin
		SW_ref = 1'b0;	//Connects the bottom plate of the caps to Vref. Should not overlap with SW_in as DAC_out drops (charges escape to CM)
		eoc = 1'b0;
		DAC_out0 = 1'b1;
		DAC_out1 = 1'b1;
		DAC_out2 = 1'b1;
		DAC_out3 = 1'b1;		
		DAC_out4 = 1'b1;		
		end
	convInit : begin
		DAC_out0 = 1'b0;
		DAC_out1 = 1'b0;
		DAC_out2 = 1'b0;
		DAC_out3 = 1'b0;		
		DAC_out4 = 1'b1;		
		SW_inp_reg = 1'b0;
		SW_ref = 1'b1;
		eoc = 1'b0;
		next = conv4;
		end
    conv4 : begin
		DAC_out0 = 1'b0;
		DAC_out1 = 1'b0;
		DAC_out2 = 1'b0;
		DAC_out3 = 1'b1;
        DAC_out4 = comp;
		SW_inp_reg = 1'b0;
		SW_ref = 1'b1;
		next = conv3;
	conv3 : begin
		DAC_out0 = 1'b0;
		DAC_out1 = 1'b0;
		DAC_out2 = 1'b1;
		DAC_out3 = comp;
		SW_inp_reg = 1'b0;
		SW_ref = 1'b1;
		next = conv2;
		end
	conv2 : begin
		DAC_out0 = 1'b0;
		DAC_out1 = 1'b1;
		DAC_out2 = comp;
		SW_inp_reg = 1'b0;
		SW_ref = 1'b1;
		next = conv1;
		end
	conv1 : begin
		DAC_out0 = 1'b1;
		DAC_out1 = comp;
		SW_inp_reg = 1'b0;
		SW_ref = 1'b1;
		next = endConv;
		end
	endConv : begin
		DAC_out0 = comp;
		SW_inp_reg = 1'b0;
		SW_ref = 1'b1;
		eoc = 1'b1;
		next = sample;		
		out0 = DAC_out0;
		out1 = DAC_out1;
		out2 = DAC_out2;
		out3 = DAC_out3;
		out4 = DAC_out4;
		end
	endcase
		
end

always @(clock or SW_inp_reg) SW_inp = SW_inp_reg*(~clock);

endmodule
