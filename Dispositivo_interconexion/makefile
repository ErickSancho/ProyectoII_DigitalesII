MAQ = Maquina
FIFO = FIFO
LOG = Logica
test = probador.v banco.v

EXE = Dispositivo

compilar: 
	@iverilog $(MAQ)/*.v $(FIFO)/*.v $(LOG)/*.v PCIe.v $(test) -o $(EXE)
	@vvp $(EXE)


ver:
	@nohup gtkwave dispositivo.vcd & 

AUTOINST:
	@emacs --batch ./*.v PCIe.v $(test) -f verilog-batch-auto
