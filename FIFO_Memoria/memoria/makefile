SRC = memory.v
PRUEBAS = probador.v banco.v 
ESTR = memory_synth.v #memory_synth.v read_logic_synth.v write_logic_synth.v control_logic_synth.v
cmos = cmos_cells.v
EXE = MEM

yosys:
	@yosys -s script.ys > Salida_Yosys

sed: yosys
	@sed -i 's/memory/memory_synth/g' $(ESTR)
	@sed -i 's/data_out_MM/data_out_MM_synth/g' $(ESTR)

compilar: sed
	@iverilog $(SRC) $(PRUEBAS) $(ESTR) $(cmos) -o $(EXE)
	@vvp $(EXE)

ver:
	@nohup gtkwave Memoria.vcd &
	@rm -f nohup.out

clean:
	@rm *.out *.vcd $(EXE)

AUTOINST:
	@emacs --batch $(PRUEBAS) $(SRC) $(ESTR) -f verilog-batch-auto