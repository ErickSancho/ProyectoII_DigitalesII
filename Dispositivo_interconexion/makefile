MAQ = Maquina
FIFO = FIFO
LOG = Logica
test_general = probador.v banco.v

test_errores = banco.v probador_errores.v

test_llenado_vaciado = banco.v probador_llenado_vaciado.v

test_trafico = banco.v probador_trafico.v

CMOS = cmos_cells.v

ESTR = PCIe_synth.v

EXE = Dispositivo
EXE_errores = Dispositivo_errores
EXE_llenado = Dispositivo_llenado
EXE_trafico = Dispositivo_trafico


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
	@sed -i 's/next_pop_D0/next_pop_D0_synth/g' $(ESTR)
	@sed -i 's/next_pop_D1/next_pop_D1_synth/g' $(ESTR)


#### General ####
compilar_General: sed
	@iverilog $(MAQ)/*.v $(FIFO)/*.v $(LOG)/*.v PCIe.v  PCIe_synth.v $(test_general) $(CMOS) -o $(EXE)
	@vvp $(EXE)


ver_General:
	@nohup gtkwave dispositivo.vcd & 

#### Errores ####
compilar_errores: sed
	@iverilog $(MAQ)/*.v $(FIFO)/*.v $(LOG)/*.v PCIe.v  PCIe_synth.v $(test_errores) $(CMOS) -o $(EXE_errores)
	@vvp $(EXE_errores)


ver_errores:
	@nohup gtkwave dispositivo_errores.vcd & 

#### Llendo y vaciado ####
compilar_llenado: sed
	@iverilog $(MAQ)/*.v $(FIFO)/*.v $(LOG)/*.v PCIe.v  PCIe_synth.v $(test_llenado_vaciado) $(CMOS) -o $(EXE_llenado)
	@vvp $(EXE_llenado)


ver_llenado:
	@nohup gtkwave dispositivo_llenado_vaciado.vcd & 


compilar_trafico: sed
	@iverilog $(MAQ)/*.v $(FIFO)/*.v $(LOG)/*.v PCIe.v  PCIe_synth.v $(test_trafico) $(CMOS) -o $(EXE_trafico)
	@vvp $(EXE_trafico)


ver_trafico:
	@nohup gtkwave dispositivo_trafico.vcd & 

AUTOINST:
	@emacs --batch ./*.v PCIe.v $(test) -f verilog-batch-auto
