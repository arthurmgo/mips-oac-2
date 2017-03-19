module cpu(out);

output out;

wire[7:0] mux8_out;
wire[7:0] addr;
wire[31:0] instrucao;

wire regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch;
wire[1:0] aluop;

wire[4:0] mux5_out;
wire[31:0] mux32_out;


wire[31:0] writeback;
wire[31:0] reg_out1;
wire[31:0] reg_out2;

wire[31:0] extendido;



wire[3:0] alucontrol_input;

wire zero;
wire[31:0] alu_result;

wire[31:0] mem_out;

wire[7:0] addpc_out;

wire[7:0] addjump_out;

wire and_out;
wire cl;

clock c(.out(cl));

PC pc(.clk(cl), .reg1(mux8_out), .reg2(8'b00000000), .saida(addr));

InstructionMemory imem(.address(addr), .out(instrucao));

Control uc(.inst(instrucao[31:26]), .RegDst(regdst), .ALUSrc(alusrc), .MemtoReg(memtoreg), .RegWrite(regwrite), .MemRead(memread), .MemWrite(memwrite), .Branch(branch), .ALUOp(aluop));

MultiplexadorDst mux5(.reg1(instrucao[20:16]), .reg2(instrucao[15:11]), .controle(regdst), .result(mux5_out));

Register reg_mem(.read_reg1(instrucao[25:21]), .read_reg2(instrucao[20:16]), .write_reg(mux5_out), .write_data(writeback), .regwrite(regwrite), .read_data1(reg_out1), .read_data2(reg_out2));

Extensor ext32(.reg1(instrucao[15:0]), .result(extendido));

Multiplexador mux32_a(.reg1(reg_out2), .reg2(extendido), .controle(alusrc), .result(mux32_out));

ALUControl alu_ctrl(.funct(instrucao[5:0]), .aluop(aluop), .out(alucontrol_input));

ALU alu(.reg1(reg_out1), .reg2(mux32_out), .controle(alucontrol_input), .zero(zero), .result(alu_result));

DataMemory memory(.address(alu_result), .write_data(reg_out2), .mem_read(memread), .mem_write(memwrite), .read_data(mem_out));

Multiplexador mux32_b(.reg1(alu_result), .reg2(mem_out), .controle(memtoreg), .result(writeback));

Add1 add_pc(.inst(addr), .result(addpc_out));

ADD_JUMP add_jump(.inst1(extendido), .inst2(addpc_out), .result(addjump_out)); // ESSE AQUI

AND and1(.in1(branch), .in2(zero), .out(and_out)); // ESSE AQUI


MUX8 mux8(.in1(addpc_out), .in2(addjump_out), .controle(and_out), .out(mux8_out));



endmodule
