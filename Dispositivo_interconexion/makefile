MAQ = Maquina
FIFO = FIFO
LOG = Logica
test = probador.v banco.v
CMOS = cmos_cells.v

ESTR = PCIe_synth.v

EXE = Dispositivo

yosys:
	@yosys script.ys >> Salida_yosys

sed: yosys
	@sed -i 's/PCIe/PCIe_synth/g' $(ESTR)
	@sed -i 's/maquina/maquina_synth/g' $(ESTR)
	@sed -i 's/fifo/fifo_synth/g' $(ESTR)
	@sed -i 's/Pop_Main_and_Valid/Pop_Main_and_Valid_synth/g' $(ESTR)
	@sed -i 's/demux/demux_synth/g' $(ESTR)
	@sed -i 's/Empty_and_pause/Empty_and_pause_synth/g' $(ESTR)
	@sed -i 's/mux/mux_synth/g' $(ESTR)
#Senales
	@sed -i 's/data_out0/data_out0_synth/g' $(ESTR)
	@sed -i 's/data_out1/data_out1_synth/g' $(ESTR)
	@sed -i 's/error_out/error_out_synth/g' $(ESTR)
	@sed -i 's/active_out/active_out_synth/g' $(ESTR)
	@sed -i 's/idle_out/idle_out_synth/g' $(ESTR)
	@sed -i 's/errors/errors_synth/g' $(ESTR)
	@sed -i 's/MAIN_FIFO_pause/MAIN_FIFO_pause_synth/g' $(ESTR)
	@sed -i 's/almost_empty_d0/almost_empty_d0_synth/g' $(ESTR)
	@sed -i 's/almost_empty_d1/almost_empty_d1_synth/g' $(ESTR)



compilar: sed
	@iverilog $(MAQ)/*.v $(FIFO)/*.v $(LOG)/*.v PCIe.v  PCIe_synth.v $(test) $(CMOS) -o $(EXE)
	@vvp $(EXE)


ver:
	@nohup gtkwave dispositivo.vcd & 





AUTOINST:
	@emacs --batch ./*.v PCIe.v $(test) -f verilog-batch-auto
