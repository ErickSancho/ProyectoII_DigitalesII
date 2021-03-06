/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.3.0-18+deb9u1 -O2 -fdebug-prefix-map=/build/yosys-XOsRIM/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

(* top =  1  *)
(* src = "maquina.v:1" *)
module maquina_synth(clk, reset, init, Umbral_MF_alto, Umbral_MF_bajo, Umbral_VC_alto, Umbral_VC_bajo, Umbral_D_alto, Umbral_D_bajo, FIFO_empties, FIFO_errors, Umbral_MF_alto_interno_synth, Umbral_MF_bajo_interno_synth, Umbral_VC_alto_interno_synth, Umbral_VC_bajo_interno_synth, Umbral_D_alto_interno_synth, Umbral_D_bajo_interno_synth, error_out_synth, errors_out_synth, active_out_synth, idle_out_synth);
  (* src = "maquina.v:47" *)
  wire [4:0] _000_;
  (* src = "maquina.v:47" *)
  wire [4:0] _001_;
  (* src = "maquina.v:47" *)
  wire [4:0] _002_;
  (* src = "maquina.v:47" *)
  wire [4:0] _003_;
  (* src = "maquina.v:47" *)
  wire [4:0] _004_;
  (* src = "maquina.v:47" *)
  wire [4:0] _005_;
  (* src = "maquina.v:47" *)
  wire [4:0] _006_;
  (* src = "maquina.v:47" *)
  wire _007_;
  (* src = "maquina.v:47" *)
  wire _008_;
  (* src = "maquina.v:47" *)
  wire [4:0] _009_;
  (* src = "maquina.v:47" *)
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  (* src = "maquina.v:11" *)
  input [4:0] FIFO_empties;
  (* src = "maquina.v:12" *)
  input [4:0] FIFO_errors;
  (* src = "maquina.v:39" *)
  wire [4:0] FIFO_errors_temp;
  (* src = "maquina.v:9" *)
  input [4:0] Umbral_D_alto;
  (* src = "maquina.v:17" *)
  output [4:0] Umbral_D_alto_interno_synth;
  (* src = "maquina.v:10" *)
  input [4:0] Umbral_D_bajo;
  (* src = "maquina.v:18" *)
  output [4:0] Umbral_D_bajo_interno_synth;
  (* src = "maquina.v:5" *)
  input [4:0] Umbral_MF_alto;
  (* src = "maquina.v:13" *)
  output [4:0] Umbral_MF_alto_interno_synth;
  (* src = "maquina.v:6" *)
  input [4:0] Umbral_MF_bajo;
  (* src = "maquina.v:14" *)
  output [4:0] Umbral_MF_bajo_interno_synth;
  (* src = "maquina.v:7" *)
  input [4:0] Umbral_VC_alto;
  (* src = "maquina.v:15" *)
  output [4:0] Umbral_VC_alto_interno_synth;
  (* src = "maquina.v:8" *)
  input [4:0] Umbral_VC_bajo;
  (* src = "maquina.v:16" *)
  output [4:0] Umbral_VC_bajo_interno_synth;
  (* src = "maquina.v:21" *)
  output active_out_synth;
  (* src = "maquina.v:35" *)
  wire active_out_synth_temp;
  (* src = "maquina.v:2" *)
  input clk;
  (* src = "maquina.v:19" *)
  output error_out_synth;
  (* src = "maquina.v:33" *)
  wire error_out_synth_temp;
  (* src = "maquina.v:20" *)
  output [4:0] errors_out_synth;
  (* onehot = 32'd1 *)
  wire [4:0] estado;
  (* src = "maquina.v:22" *)
  output idle_out_synth;
  (* src = "maquina.v:36" *)
  wire idle_out_synth_temp;
  (* src = "maquina.v:4" *)
  input init;
  (* src = "maquina.v:3" *)
  input reset;
  NAND _177_ (
    .A(FIFO_empties[1]),
    .B(FIFO_empties[0]),
    .Y(_011_)
  );
  NOT _178_ (
    .A(FIFO_empties[2]),
    .Y(_012_)
  );
  NOT _179_ (
    .A(FIFO_empties[3]),
    .Y(_013_)
  );
  NOR _180_ (
    .A(_013_),
    .B(_012_),
    .Y(_014_)
  );
  NAND _181_ (
    .A(_014_),
    .B(FIFO_empties[4]),
    .Y(_015_)
  );
  NOR _182_ (
    .A(_015_),
    .B(_011_),
    .Y(_016_)
  );
  NOT _183_ (
    .A(FIFO_errors[0]),
    .Y(_017_)
  );
  NOT _184_ (
    .A(FIFO_errors[1]),
    .Y(_018_)
  );
  NAND _185_ (
    .A(_018_),
    .B(_017_),
    .Y(_019_)
  );
  NOT _186_ (
    .A(FIFO_errors[4]),
    .Y(_020_)
  );
  NOR _187_ (
    .A(FIFO_errors[3]),
    .B(FIFO_errors[2]),
    .Y(_021_)
  );
  NAND _188_ (
    .A(_021_),
    .B(_020_),
    .Y(_022_)
  );
  NOR _189_ (
    .A(_022_),
    .B(_019_),
    .Y(_023_)
  );
  NOT _190_ (
    .A(reset),
    .Y(_024_)
  );
  NOR _191_ (
    .A(_024_),
    .B(init),
    .Y(_025_)
  );
  NOR _192_ (
    .A(estado[2]),
    .B(estado[3]),
    .Y(_026_)
  );
  NOT _193_ (
    .A(_026_),
    .Y(_027_)
  );
  NAND _194_ (
    .A(_027_),
    .B(_025_),
    .Y(_028_)
  );
  NOT _195_ (
    .A(_028_),
    .Y(_029_)
  );
  NAND _196_ (
    .A(_029_),
    .B(_023_),
    .Y(_030_)
  );
  NOR _197_ (
    .A(_030_),
    .B(_016_),
    .Y(_134_)
  );
  NOT _198_ (
    .A(estado[1]),
    .Y(_031_)
  );
  NAND _199_ (
    .A(reset),
    .B(_031_),
    .Y(_159_)
  );
  NOT _200_ (
    .A(init),
    .Y(_032_)
  );
  NOR _201_ (
    .A(_027_),
    .B(estado[4]),
    .Y(_033_)
  );
  NOR _202_ (
    .A(_033_),
    .B(_032_),
    .Y(_034_)
  );
  NOR _203_ (
    .A(_034_),
    .B(estado[0]),
    .Y(_035_)
  );
  NOR _204_ (
    .A(_035_),
    .B(_024_),
    .Y(_175_)
  );
  NAND _205_ (
    .A(_025_),
    .B(estado[4]),
    .Y(_036_)
  );
  NOR _206_ (
    .A(FIFO_errors[4]),
    .B(FIFO_errors[2]),
    .Y(_037_)
  );
  NOR _207_ (
    .A(_019_),
    .B(FIFO_errors[3]),
    .Y(_038_)
  );
  NAND _208_ (
    .A(_038_),
    .B(_037_),
    .Y(_039_)
  );
  NOR _209_ (
    .A(_028_),
    .B(_039_),
    .Y(_040_)
  );
  NAND _210_ (
    .A(_040_),
    .B(_016_),
    .Y(_041_)
  );
  NAND _211_ (
    .A(_041_),
    .B(_036_),
    .Y(_176_)
  );
  NOR _212_ (
    .A(_024_),
    .B(_017_),
    .Y(_000_[0])
  );
  NOR _213_ (
    .A(_024_),
    .B(_018_),
    .Y(_000_[1])
  );
  NOT _214_ (
    .A(FIFO_errors[2]),
    .Y(_042_)
  );
  NOR _215_ (
    .A(_024_),
    .B(_042_),
    .Y(_000_[2])
  );
  NOT _216_ (
    .A(FIFO_errors[3]),
    .Y(_043_)
  );
  NOR _217_ (
    .A(_024_),
    .B(_043_),
    .Y(_000_[3])
  );
  NOR _218_ (
    .A(_024_),
    .B(_020_),
    .Y(_000_[4])
  );
  NOT _219_ (
    .A(estado[3]),
    .Y(_044_)
  );
  NOR _220_ (
    .A(_024_),
    .B(_044_),
    .Y(_010_)
  );
  NOT _221_ (
    .A(estado[2]),
    .Y(_045_)
  );
  NOR _222_ (
    .A(_024_),
    .B(_045_),
    .Y(_007_)
  );
  NOT _223_ (
    .A(FIFO_errors_temp[0]),
    .Y(_046_)
  );
  NAND _224_ (
    .A(reset),
    .B(estado[1]),
    .Y(_047_)
  );
  NOR _225_ (
    .A(_047_),
    .B(_046_),
    .Y(_009_[0])
  );
  NOT _226_ (
    .A(FIFO_errors_temp[1]),
    .Y(_048_)
  );
  NOR _227_ (
    .A(_047_),
    .B(_048_),
    .Y(_009_[1])
  );
  NOT _228_ (
    .A(FIFO_errors_temp[2]),
    .Y(_049_)
  );
  NOR _229_ (
    .A(_047_),
    .B(_049_),
    .Y(_009_[2])
  );
  NOT _230_ (
    .A(FIFO_errors_temp[3]),
    .Y(_050_)
  );
  NOR _231_ (
    .A(_047_),
    .B(_050_),
    .Y(_009_[3])
  );
  NOT _232_ (
    .A(FIFO_errors_temp[4]),
    .Y(_051_)
  );
  NOR _233_ (
    .A(_047_),
    .B(_051_),
    .Y(_009_[4])
  );
  NOT _234_ (
    .A(_047_),
    .Y(_008_)
  );
  NOR _235_ (
    .A(Umbral_D_bajo_interno_synth[0]),
    .B(estado[4]),
    .Y(_052_)
  );
  NOT _236_ (
    .A(Umbral_D_bajo[0]),
    .Y(_053_)
  );
  NAND _237_ (
    .A(_053_),
    .B(estado[4]),
    .Y(_054_)
  );
  NAND _238_ (
    .A(_054_),
    .B(reset),
    .Y(_055_)
  );
  NOR _239_ (
    .A(_055_),
    .B(_052_),
    .Y(_002_[0])
  );
  NOR _240_ (
    .A(Umbral_D_bajo_interno_synth[1]),
    .B(estado[4]),
    .Y(_056_)
  );
  NOT _241_ (
    .A(Umbral_D_bajo[1]),
    .Y(_057_)
  );
  NAND _242_ (
    .A(_057_),
    .B(estado[4]),
    .Y(_058_)
  );
  NAND _243_ (
    .A(_058_),
    .B(reset),
    .Y(_059_)
  );
  NOR _244_ (
    .A(_059_),
    .B(_056_),
    .Y(_002_[1])
  );
  NOR _245_ (
    .A(Umbral_D_bajo_interno_synth[2]),
    .B(estado[4]),
    .Y(_060_)
  );
  NOT _246_ (
    .A(Umbral_D_bajo[2]),
    .Y(_061_)
  );
  NAND _247_ (
    .A(_061_),
    .B(estado[4]),
    .Y(_062_)
  );
  NAND _248_ (
    .A(_062_),
    .B(reset),
    .Y(_063_)
  );
  NOR _249_ (
    .A(_063_),
    .B(_060_),
    .Y(_002_[2])
  );
  NOR _250_ (
    .A(Umbral_D_bajo_interno_synth[3]),
    .B(estado[4]),
    .Y(_064_)
  );
  NOT _251_ (
    .A(Umbral_D_bajo[3]),
    .Y(_065_)
  );
  NAND _252_ (
    .A(_065_),
    .B(estado[4]),
    .Y(_066_)
  );
  NAND _253_ (
    .A(_066_),
    .B(reset),
    .Y(_067_)
  );
  NOR _254_ (
    .A(_067_),
    .B(_064_),
    .Y(_002_[3])
  );
  NOR _255_ (
    .A(Umbral_D_bajo_interno_synth[4]),
    .B(estado[4]),
    .Y(_069_)
  );
  NOT _256_ (
    .A(Umbral_D_bajo[4]),
    .Y(_070_)
  );
  NAND _257_ (
    .A(_070_),
    .B(estado[4]),
    .Y(_071_)
  );
  NAND _258_ (
    .A(_071_),
    .B(reset),
    .Y(_072_)
  );
  NOR _259_ (
    .A(_072_),
    .B(_069_),
    .Y(_002_[4])
  );
  NOR _260_ (
    .A(Umbral_D_alto_interno_synth[0]),
    .B(estado[4]),
    .Y(_073_)
  );
  NOT _261_ (
    .A(Umbral_D_alto[0]),
    .Y(_074_)
  );
  NAND _262_ (
    .A(_074_),
    .B(estado[4]),
    .Y(_075_)
  );
  NAND _263_ (
    .A(_075_),
    .B(reset),
    .Y(_076_)
  );
  NOR _264_ (
    .A(_076_),
    .B(_073_),
    .Y(_001_[0])
  );
  NOR _265_ (
    .A(Umbral_D_alto_interno_synth[1]),
    .B(estado[4]),
    .Y(_077_)
  );
  NOT _266_ (
    .A(Umbral_D_alto[1]),
    .Y(_078_)
  );
  NAND _267_ (
    .A(_078_),
    .B(estado[4]),
    .Y(_079_)
  );
  NAND _268_ (
    .A(_079_),
    .B(reset),
    .Y(_080_)
  );
  NOR _269_ (
    .A(_080_),
    .B(_077_),
    .Y(_001_[1])
  );
  NOR _270_ (
    .A(Umbral_D_alto_interno_synth[2]),
    .B(estado[4]),
    .Y(_081_)
  );
  NOT _271_ (
    .A(Umbral_D_alto[2]),
    .Y(_082_)
  );
  NAND _272_ (
    .A(_082_),
    .B(estado[4]),
    .Y(_083_)
  );
  NAND _273_ (
    .A(_083_),
    .B(reset),
    .Y(_084_)
  );
  NOR _274_ (
    .A(_084_),
    .B(_081_),
    .Y(_001_[2])
  );
  NOR _275_ (
    .A(Umbral_D_alto_interno_synth[3]),
    .B(estado[4]),
    .Y(_085_)
  );
  NOT _276_ (
    .A(Umbral_D_alto[3]),
    .Y(_086_)
  );
  NAND _277_ (
    .A(_086_),
    .B(estado[4]),
    .Y(_087_)
  );
  NAND _278_ (
    .A(_087_),
    .B(reset),
    .Y(_088_)
  );
  NOR _279_ (
    .A(_088_),
    .B(_085_),
    .Y(_001_[3])
  );
  NOR _280_ (
    .A(Umbral_D_alto_interno_synth[4]),
    .B(estado[4]),
    .Y(_089_)
  );
  NOT _281_ (
    .A(Umbral_D_alto[4]),
    .Y(_090_)
  );
  NAND _282_ (
    .A(_090_),
    .B(estado[4]),
    .Y(_091_)
  );
  NAND _283_ (
    .A(_091_),
    .B(reset),
    .Y(_092_)
  );
  NOR _284_ (
    .A(_092_),
    .B(_089_),
    .Y(_001_[4])
  );
  NOR _285_ (
    .A(Umbral_VC_bajo_interno_synth[0]),
    .B(estado[4]),
    .Y(_093_)
  );
  NOT _286_ (
    .A(Umbral_VC_bajo[0]),
    .Y(_094_)
  );
  NAND _287_ (
    .A(_094_),
    .B(estado[4]),
    .Y(_095_)
  );
  NAND _288_ (
    .A(_095_),
    .B(reset),
    .Y(_096_)
  );
  NOR _289_ (
    .A(_096_),
    .B(_093_),
    .Y(_006_[0])
  );
  NOR _290_ (
    .A(Umbral_VC_bajo_interno_synth[1]),
    .B(estado[4]),
    .Y(_097_)
  );
  NOT _291_ (
    .A(Umbral_VC_bajo[1]),
    .Y(_098_)
  );
  NAND _292_ (
    .A(_098_),
    .B(estado[4]),
    .Y(_099_)
  );
  NAND _293_ (
    .A(_099_),
    .B(reset),
    .Y(_100_)
  );
  NOR _294_ (
    .A(_100_),
    .B(_097_),
    .Y(_006_[1])
  );
  NOR _295_ (
    .A(Umbral_VC_bajo_interno_synth[2]),
    .B(estado[4]),
    .Y(_101_)
  );
  NOT _296_ (
    .A(Umbral_VC_bajo[2]),
    .Y(_102_)
  );
  NAND _297_ (
    .A(_102_),
    .B(estado[4]),
    .Y(_103_)
  );
  NAND _298_ (
    .A(_103_),
    .B(reset),
    .Y(_104_)
  );
  NOR _299_ (
    .A(_104_),
    .B(_101_),
    .Y(_006_[2])
  );
  NOR _300_ (
    .A(Umbral_VC_bajo_interno_synth[3]),
    .B(estado[4]),
    .Y(_105_)
  );
  NOT _301_ (
    .A(Umbral_VC_bajo[3]),
    .Y(_106_)
  );
  NAND _302_ (
    .A(_106_),
    .B(estado[4]),
    .Y(_107_)
  );
  NAND _303_ (
    .A(_107_),
    .B(reset),
    .Y(_108_)
  );
  NOR _304_ (
    .A(_108_),
    .B(_105_),
    .Y(_006_[3])
  );
  NOR _305_ (
    .A(Umbral_VC_bajo_interno_synth[4]),
    .B(estado[4]),
    .Y(_109_)
  );
  NOT _306_ (
    .A(Umbral_VC_bajo[4]),
    .Y(_110_)
  );
  NAND _307_ (
    .A(_110_),
    .B(estado[4]),
    .Y(_111_)
  );
  NAND _308_ (
    .A(_111_),
    .B(reset),
    .Y(_112_)
  );
  NOR _309_ (
    .A(_112_),
    .B(_109_),
    .Y(_006_[4])
  );
  NOR _310_ (
    .A(Umbral_VC_alto_interno_synth[0]),
    .B(estado[4]),
    .Y(_113_)
  );
  NOT _311_ (
    .A(Umbral_VC_alto[0]),
    .Y(_114_)
  );
  NAND _312_ (
    .A(_114_),
    .B(estado[4]),
    .Y(_115_)
  );
  NAND _313_ (
    .A(_115_),
    .B(reset),
    .Y(_116_)
  );
  NOR _314_ (
    .A(_116_),
    .B(_113_),
    .Y(_005_[0])
  );
  NOR _315_ (
    .A(Umbral_VC_alto_interno_synth[1]),
    .B(estado[4]),
    .Y(_117_)
  );
  NOT _316_ (
    .A(Umbral_VC_alto[1]),
    .Y(_118_)
  );
  NAND _317_ (
    .A(_118_),
    .B(estado[4]),
    .Y(_119_)
  );
  NAND _318_ (
    .A(_119_),
    .B(reset),
    .Y(_120_)
  );
  NOR _319_ (
    .A(_120_),
    .B(_117_),
    .Y(_005_[1])
  );
  NOR _320_ (
    .A(Umbral_VC_alto_interno_synth[2]),
    .B(estado[4]),
    .Y(_121_)
  );
  NOT _321_ (
    .A(Umbral_VC_alto[2]),
    .Y(_122_)
  );
  NAND _322_ (
    .A(_122_),
    .B(estado[4]),
    .Y(_123_)
  );
  NAND _323_ (
    .A(_123_),
    .B(reset),
    .Y(_124_)
  );
  NOR _324_ (
    .A(_124_),
    .B(_121_),
    .Y(_005_[2])
  );
  NOR _325_ (
    .A(Umbral_VC_alto_interno_synth[3]),
    .B(estado[4]),
    .Y(_125_)
  );
  NOT _326_ (
    .A(Umbral_VC_alto[3]),
    .Y(_126_)
  );
  NAND _327_ (
    .A(_126_),
    .B(estado[4]),
    .Y(_127_)
  );
  NAND _328_ (
    .A(_127_),
    .B(reset),
    .Y(_128_)
  );
  NOR _329_ (
    .A(_128_),
    .B(_125_),
    .Y(_005_[3])
  );
  NOR _330_ (
    .A(Umbral_VC_alto_interno_synth[4]),
    .B(estado[4]),
    .Y(_129_)
  );
  NOT _331_ (
    .A(Umbral_VC_alto[4]),
    .Y(_130_)
  );
  NAND _332_ (
    .A(_130_),
    .B(estado[4]),
    .Y(_131_)
  );
  NAND _333_ (
    .A(_131_),
    .B(reset),
    .Y(_132_)
  );
  NOR _334_ (
    .A(_132_),
    .B(_129_),
    .Y(_005_[4])
  );
  NOR _335_ (
    .A(Umbral_MF_bajo_interno_synth[0]),
    .B(estado[4]),
    .Y(_133_)
  );
  NOT _336_ (
    .A(Umbral_MF_bajo[0]),
    .Y(_135_)
  );
  NAND _337_ (
    .A(_135_),
    .B(estado[4]),
    .Y(_136_)
  );
  NAND _338_ (
    .A(_136_),
    .B(reset),
    .Y(_137_)
  );
  NOR _339_ (
    .A(_137_),
    .B(_133_),
    .Y(_004_[0])
  );
  NOR _340_ (
    .A(Umbral_MF_bajo_interno_synth[1]),
    .B(estado[4]),
    .Y(_138_)
  );
  NOT _341_ (
    .A(Umbral_MF_bajo[1]),
    .Y(_139_)
  );
  NAND _342_ (
    .A(_139_),
    .B(estado[4]),
    .Y(_140_)
  );
  NAND _343_ (
    .A(_140_),
    .B(reset),
    .Y(_141_)
  );
  NOR _344_ (
    .A(_141_),
    .B(_138_),
    .Y(_004_[1])
  );
  NOR _345_ (
    .A(Umbral_MF_bajo_interno_synth[2]),
    .B(estado[4]),
    .Y(_142_)
  );
  NOT _346_ (
    .A(Umbral_MF_bajo[2]),
    .Y(_143_)
  );
  NAND _347_ (
    .A(_143_),
    .B(estado[4]),
    .Y(_144_)
  );
  NAND _348_ (
    .A(_144_),
    .B(reset),
    .Y(_145_)
  );
  NOR _349_ (
    .A(_145_),
    .B(_142_),
    .Y(_004_[2])
  );
  NOR _350_ (
    .A(Umbral_MF_bajo_interno_synth[3]),
    .B(estado[4]),
    .Y(_146_)
  );
  NOT _351_ (
    .A(Umbral_MF_bajo[3]),
    .Y(_147_)
  );
  NAND _352_ (
    .A(_147_),
    .B(estado[4]),
    .Y(_148_)
  );
  NAND _353_ (
    .A(_148_),
    .B(reset),
    .Y(_149_)
  );
  NOR _354_ (
    .A(_149_),
    .B(_146_),
    .Y(_004_[3])
  );
  NOR _355_ (
    .A(Umbral_MF_bajo_interno_synth[4]),
    .B(estado[4]),
    .Y(_150_)
  );
  NOT _356_ (
    .A(Umbral_MF_bajo[4]),
    .Y(_151_)
  );
  NAND _357_ (
    .A(_151_),
    .B(estado[4]),
    .Y(_152_)
  );
  NAND _358_ (
    .A(_152_),
    .B(reset),
    .Y(_153_)
  );
  NOR _359_ (
    .A(_153_),
    .B(_150_),
    .Y(_004_[4])
  );
  NOR _360_ (
    .A(Umbral_MF_alto_interno_synth[0]),
    .B(estado[4]),
    .Y(_154_)
  );
  NOT _361_ (
    .A(Umbral_MF_alto[0]),
    .Y(_155_)
  );
  NAND _362_ (
    .A(_155_),
    .B(estado[4]),
    .Y(_156_)
  );
  NAND _363_ (
    .A(_156_),
    .B(reset),
    .Y(_157_)
  );
  NOR _364_ (
    .A(_157_),
    .B(_154_),
    .Y(_003_[0])
  );
  NOR _365_ (
    .A(Umbral_MF_alto_interno_synth[1]),
    .B(estado[4]),
    .Y(_158_)
  );
  NOT _366_ (
    .A(Umbral_MF_alto[1]),
    .Y(_160_)
  );
  NAND _367_ (
    .A(_160_),
    .B(estado[4]),
    .Y(_161_)
  );
  NAND _368_ (
    .A(_161_),
    .B(reset),
    .Y(_162_)
  );
  NOR _369_ (
    .A(_162_),
    .B(_158_),
    .Y(_003_[1])
  );
  NOR _370_ (
    .A(Umbral_MF_alto_interno_synth[2]),
    .B(estado[4]),
    .Y(_163_)
  );
  NOT _371_ (
    .A(Umbral_MF_alto[2]),
    .Y(_164_)
  );
  NAND _372_ (
    .A(_164_),
    .B(estado[4]),
    .Y(_165_)
  );
  NAND _373_ (
    .A(_165_),
    .B(reset),
    .Y(_166_)
  );
  NOR _374_ (
    .A(_166_),
    .B(_163_),
    .Y(_003_[2])
  );
  NOR _375_ (
    .A(Umbral_MF_alto_interno_synth[3]),
    .B(estado[4]),
    .Y(_167_)
  );
  NOT _376_ (
    .A(Umbral_MF_alto[3]),
    .Y(_168_)
  );
  NAND _377_ (
    .A(_168_),
    .B(estado[4]),
    .Y(_169_)
  );
  NAND _378_ (
    .A(_169_),
    .B(reset),
    .Y(_170_)
  );
  NOR _379_ (
    .A(_170_),
    .B(_167_),
    .Y(_003_[3])
  );
  NOR _380_ (
    .A(Umbral_MF_alto_interno_synth[4]),
    .B(estado[4]),
    .Y(_171_)
  );
  NOT _381_ (
    .A(Umbral_MF_alto[4]),
    .Y(_172_)
  );
  NAND _382_ (
    .A(_172_),
    .B(estado[4]),
    .Y(_173_)
  );
  NAND _383_ (
    .A(_173_),
    .B(reset),
    .Y(_174_)
  );
  NOR _384_ (
    .A(_174_),
    .B(_171_),
    .Y(_003_[4])
  );
  NOR _385_ (
    .A(_028_),
    .B(_023_),
    .Y(_068_)
  );
  DFF _386_ (
    .C(clk),
    .D(_159_),
    .Q(estado[0])
  );
  DFF _387_ (
    .C(clk),
    .D(_068_),
    .Q(estado[1])
  );
  DFF _388_ (
    .C(clk),
    .D(_134_),
    .Q(estado[2])
  );
  DFF _389_ (
    .C(clk),
    .D(_176_),
    .Q(estado[3])
  );
  DFF _390_ (
    .C(clk),
    .D(_175_),
    .Q(estado[4])
  );
  DFF _391_ (
    .C(clk),
    .D(_003_[0]),
    .Q(Umbral_MF_alto_interno_synth[0])
  );
  DFF _392_ (
    .C(clk),
    .D(_003_[1]),
    .Q(Umbral_MF_alto_interno_synth[1])
  );
  DFF _393_ (
    .C(clk),
    .D(_003_[2]),
    .Q(Umbral_MF_alto_interno_synth[2])
  );
  DFF _394_ (
    .C(clk),
    .D(_003_[3]),
    .Q(Umbral_MF_alto_interno_synth[3])
  );
  DFF _395_ (
    .C(clk),
    .D(_003_[4]),
    .Q(Umbral_MF_alto_interno_synth[4])
  );
  DFF _396_ (
    .C(clk),
    .D(_004_[0]),
    .Q(Umbral_MF_bajo_interno_synth[0])
  );
  DFF _397_ (
    .C(clk),
    .D(_004_[1]),
    .Q(Umbral_MF_bajo_interno_synth[1])
  );
  DFF _398_ (
    .C(clk),
    .D(_004_[2]),
    .Q(Umbral_MF_bajo_interno_synth[2])
  );
  DFF _399_ (
    .C(clk),
    .D(_004_[3]),
    .Q(Umbral_MF_bajo_interno_synth[3])
  );
  DFF _400_ (
    .C(clk),
    .D(_004_[4]),
    .Q(Umbral_MF_bajo_interno_synth[4])
  );
  DFF _401_ (
    .C(clk),
    .D(_005_[0]),
    .Q(Umbral_VC_alto_interno_synth[0])
  );
  DFF _402_ (
    .C(clk),
    .D(_005_[1]),
    .Q(Umbral_VC_alto_interno_synth[1])
  );
  DFF _403_ (
    .C(clk),
    .D(_005_[2]),
    .Q(Umbral_VC_alto_interno_synth[2])
  );
  DFF _404_ (
    .C(clk),
    .D(_005_[3]),
    .Q(Umbral_VC_alto_interno_synth[3])
  );
  DFF _405_ (
    .C(clk),
    .D(_005_[4]),
    .Q(Umbral_VC_alto_interno_synth[4])
  );
  DFF _406_ (
    .C(clk),
    .D(_006_[0]),
    .Q(Umbral_VC_bajo_interno_synth[0])
  );
  DFF _407_ (
    .C(clk),
    .D(_006_[1]),
    .Q(Umbral_VC_bajo_interno_synth[1])
  );
  DFF _408_ (
    .C(clk),
    .D(_006_[2]),
    .Q(Umbral_VC_bajo_interno_synth[2])
  );
  DFF _409_ (
    .C(clk),
    .D(_006_[3]),
    .Q(Umbral_VC_bajo_interno_synth[3])
  );
  DFF _410_ (
    .C(clk),
    .D(_006_[4]),
    .Q(Umbral_VC_bajo_interno_synth[4])
  );
  DFF _411_ (
    .C(clk),
    .D(_001_[0]),
    .Q(Umbral_D_alto_interno_synth[0])
  );
  DFF _412_ (
    .C(clk),
    .D(_001_[1]),
    .Q(Umbral_D_alto_interno_synth[1])
  );
  DFF _413_ (
    .C(clk),
    .D(_001_[2]),
    .Q(Umbral_D_alto_interno_synth[2])
  );
  DFF _414_ (
    .C(clk),
    .D(_001_[3]),
    .Q(Umbral_D_alto_interno_synth[3])
  );
  DFF _415_ (
    .C(clk),
    .D(_001_[4]),
    .Q(Umbral_D_alto_interno_synth[4])
  );
  DFF _416_ (
    .C(clk),
    .D(_002_[0]),
    .Q(Umbral_D_bajo_interno_synth[0])
  );
  DFF _417_ (
    .C(clk),
    .D(_002_[1]),
    .Q(Umbral_D_bajo_interno_synth[1])
  );
  DFF _418_ (
    .C(clk),
    .D(_002_[2]),
    .Q(Umbral_D_bajo_interno_synth[2])
  );
  DFF _419_ (
    .C(clk),
    .D(_002_[3]),
    .Q(Umbral_D_bajo_interno_synth[3])
  );
  DFF _420_ (
    .C(clk),
    .D(_002_[4]),
    .Q(Umbral_D_bajo_interno_synth[4])
  );
  DFF _421_ (
    .C(clk),
    .D(_008_),
    .Q(error_out_synth)
  );
  DFF _422_ (
    .C(clk),
    .D(_009_[0]),
    .Q(errors_out_synth[0])
  );
  DFF _423_ (
    .C(clk),
    .D(_009_[1]),
    .Q(errors_out_synth[1])
  );
  DFF _424_ (
    .C(clk),
    .D(_009_[2]),
    .Q(errors_out_synth[2])
  );
  DFF _425_ (
    .C(clk),
    .D(_009_[3]),
    .Q(errors_out_synth[3])
  );
  DFF _426_ (
    .C(clk),
    .D(_009_[4]),
    .Q(errors_out_synth[4])
  );
  DFF _427_ (
    .C(clk),
    .D(_007_),
    .Q(active_out_synth)
  );
  DFF _428_ (
    .C(clk),
    .D(_010_),
    .Q(idle_out_synth)
  );
  DFF _429_ (
    .C(clk),
    .D(_000_[0]),
    .Q(FIFO_errors_temp[0])
  );
  DFF _430_ (
    .C(clk),
    .D(_000_[1]),
    .Q(FIFO_errors_temp[1])
  );
  DFF _431_ (
    .C(clk),
    .D(_000_[2]),
    .Q(FIFO_errors_temp[2])
  );
  DFF _432_ (
    .C(clk),
    .D(_000_[3]),
    .Q(FIFO_errors_temp[3])
  );
  DFF _433_ (
    .C(clk),
    .D(_000_[4]),
    .Q(FIFO_errors_temp[4])
  );
  assign active_out_synth_temp = estado[2];
  assign error_out_synth_temp = estado[1];
  assign idle_out_synth_temp = estado[3];
endmodule
