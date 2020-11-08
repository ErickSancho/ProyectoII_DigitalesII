sintesis: dependencia1 
	sed -i "s/demux(/demux_Sint(/g" demux_Sint.v 
	sed -i "s/mux(/mux_Sint (/g" mux_Sint.v 
	sed -i "s/Empty_and_pause(/Empty_and_pause_Sint(/g" Empty_and_pause_Sint.v
	sed -i "s/Pop_Main_and_Valid(/Pop_Main_and_Valid_Sint(/g" Pop_Main_and_Valid_Sint.v   
  	
dependencia1:
	yosys -s Sintesis1.ys
	yosys -s Sintesis2.ys
	yosys -s Sintesis3.ys
	yosys -s Sintesis4.ys


Resultados: dependencia4 dependencia5
	gtkwave parte2.vcd
	
dependencia4:
	iverilog -o bancoDePruebas.o bancoDePruebas.v
	
dependencia5:
	vvp bancoDePruebas.o

Autoinst:
	emacs --batch  bancoDePruebas.v  -f verilog-batch-auto
