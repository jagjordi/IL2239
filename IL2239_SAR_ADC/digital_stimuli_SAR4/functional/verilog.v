//Verilog HDL for "IL2239_SAR_ADC", "digital_stimuli_SAR4" "functional"


module digital_stimuli_SAR4 ( start, comp );

output start;
output comp;

reg start;
reg comp;

initial
begin
	start = 1'b0;
	comp  = 1'b0;
	#40 start = 1'b1;	//40ns
	#135 comp = 1'b1;	//175ns
	#25  comp = 1'b0;	//200ns
	#125 comp = 1'b1;	//325ns
	#25 comp = 1'b0;	//350ns
	#175 comp = 1'b1;	//525ns
	#25 comp = 1'b0;	//550ns
	#25 comp = 1'b1;	//575ns
	#25 comp = 1'b0;	//600ns
end

endmodule
