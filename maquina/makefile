CC1=iverilog
CC3=emacs
TARGET1=bancoDePruebas.v cmos_cells.v
TARGET2=mux.vcd
compilar:
	$(CC1) -o programa $(TARGET1)
verilog: compilar
	./programa
gtk: verilog
	gtkwave mux.vcd
autoinst:
	$(CC3) --batch $(TARGET1) -f verilog-batch-auto
yosys:
	yosys yosys.ys
	@ sed -i 's/maquina(/maquina_E(/' maquina_E.v
	@ sed -i 's/error_out/error_out_E/' maquina_E.v
	@ sed -i 's/active_out/active_out_E/' maquina_E.v
	@ sed -i 's/idle_out/idle_out_E/' maquina_E.v
	