SRC = fifo.v memory.v read_logic.v write_logic.v control_logic.v
PRUEBAS = probador.v banco.v 
ESTR = fifo_synth.v #memory_synth.v read_logic_synth.v write_logic_synth.v control_logic_synth.v
cmos = cmos_cells.v
EXE = FIFO

yosys:
	@yosys -s script.ys > Salida_Yosys

sed: yosys
	@sed -i 's/fifo(/fifo_synth(/g' fifo_synth.v
	@sed -i 's/memory/memory_synth/g' fifo_synth.v
	@sed -i 's/read_logic/read_logic_synth/g' fifo_synth.v
	@sed -i 's/write_logic/write_logic_synth/g' fifo_synth.v
	@sed -i 's/control_logic/control_logic_synth/g' fifo_synth.v

	@sed -i 's/fifo_data_out/fifo_data_out_synth/g' fifo_synth.v
	@sed -i 's/almost_empty/almost_empty_synth/g' fifo_synth.v
	@sed -i 's/almost_full/almost_full_synth/g' fifo_synth.v
	@sed -i 's/fifo_full/fifo_full_synth/g' fifo_synth.v
	@sed -i 's/fifo_empty/fifo_empty_synth/g' fifo_synth.v
	@sed -i 's/error/error_synth/g' fifo_synth.v


compilar: sed
	@iverilog $(SRC) $(PRUEBAS) $(ESTR) $(cmos) -o $(EXE)
	@vvp $(EXE)

ver:
	@nohup gtkwave Resultados.vcd &
	@rm -f nohup.out

clean:
	@rm *.out *.vcd $(EXE)

AUTOINST:
	@emacs --batch $(PRUEBAS) $(SRC) fifo_synth.v -f verilog-batch-auto