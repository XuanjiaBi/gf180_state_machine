/* Generated by Yosys 0.22 (git sha1 f109fa3d4c5, gcc 8.3.1 -fPIC -Os) */

module plant_example(wb_clk_i, wb_rst_i, wbs_we_i, wbs_sel_i, io_in, io_out, io_oeb);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
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
  wire \fsm_plant_opt.state_temperature_synth_0 ;
  wire \fsm_plant_opt.state_temperature_synth_1 ;
  wire \fsm_plant_opt.state_temperature_synth_2 ;
  wire \fsm_plant_opt.state_water_synth_0 ;
  wire \fsm_plant_opt.state_water_synth_1 ;
  wire \fsm_plant_opt.state_water_synth_2 ;
  wire \fsm_plant_opt.tmp2409 ;
  wire \fsm_plant_opt.tmp2410 ;
  wire \fsm_plant_opt.tmp2411 ;
  wire \fsm_plant_opt.tmp3553 ;
  wire \fsm_plant_opt.tmp3554 ;
  wire \fsm_plant_opt.tmp3555 ;
  input [37:0] io_in;
  wire [37:0] io_in;
  output [37:0] io_oeb;
  wire [37:0] io_oeb;
  output [37:0] io_out;
  wire [37:0] io_out;
  input wb_clk_i;
  wire wb_clk_i;
  input wb_rst_i;
  wire wb_rst_i;
  input [3:0] wbs_sel_i;
  wire [3:0] wbs_sel_i;
  input wbs_we_i;
  wire wbs_we_i;
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _058_ (
    .I(\fsm_plant_opt.state_water_synth_0 ),
    .ZN(_000_)
  );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 _059_ (
    .A1(_000_),
    .A2(\fsm_plant_opt.state_water_synth_1 ),
    .Z(_001_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand3_1 _060_ (
    .A1(_000_),
    .A2(\fsm_plant_opt.state_water_synth_2 ),
    .A3(\fsm_plant_opt.state_water_synth_1 ),
    .ZN(_002_)
  );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _061_ (
    .I(wbs_we_i),
    .ZN(_003_)
  );
  gf180mcu_fd_sc_mcu7t5v0__buf_1 _062_ (
    .I(_003_),
    .Z(_004_)
  );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 _063_ (
    .A1(_004_),
    .A2(wb_rst_i),
    .Z(_005_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 _064_ (
    .A1(\fsm_plant_opt.state_water_synth_2 ),
    .A2(\fsm_plant_opt.state_water_synth_1 ),
    .ZN(_006_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 _065_ (
    .A1(_005_),
    .A2(_006_),
    .ZN(_007_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand3_1 _066_ (
    .A1(_001_),
    .A2(_002_),
    .A3(_007_),
    .ZN(_008_)
  );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _067_ (
    .I(\fsm_plant_opt.state_temperature_synth_0 ),
    .ZN(_009_)
  );
  gf180mcu_fd_sc_mcu7t5v0__buf_1 _068_ (
    .I(_009_),
    .Z(_010_)
  );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _069_ (
    .I(\fsm_plant_opt.state_temperature_synth_1 ),
    .ZN(_011_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 _070_ (
    .A1(_011_),
    .A2(\fsm_plant_opt.state_temperature_synth_2 ),
    .ZN(_012_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _071_ (
    .A1(\fsm_plant_opt.state_water_synth_0 ),
    .A2(\fsm_plant_opt.state_water_synth_2 ),
    .ZN(_013_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor4_1 _072_ (
    .A1(_003_),
    .A2(wb_rst_i),
    .A3(\fsm_plant_opt.state_water_synth_1 ),
    .A4(_013_),
    .ZN(_014_)
  );
  gf180mcu_fd_sc_mcu7t5v0__buf_1 _073_ (
    .I(_014_),
    .Z(_015_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 _074_ (
    .A1(wbs_sel_i[1]),
    .A2(wbs_sel_i[2]),
    .ZN(_016_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand4_1 _075_ (
    .A1(_010_),
    .A2(_012_),
    .A3(_015_),
    .A4(_016_),
    .ZN(_017_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 _076_ (
    .A1(_008_),
    .A2(_017_),
    .Z(_018_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 _077_ (
    .A1(wbs_sel_i[1]),
    .A2(wbs_sel_i[2]),
    .Z(_019_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor4_1 _078_ (
    .A1(_004_),
    .A2(\fsm_plant_opt.state_temperature_synth_1 ),
    .A3(\fsm_plant_opt.state_temperature_synth_2 ),
    .A4(wb_rst_i),
    .ZN(_020_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and3_1 _079_ (
    .A1(_000_),
    .A2(_006_),
    .A3(_020_),
    .Z(_021_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _080_ (
    .A1(wbs_we_i),
    .A2(wb_rst_i),
    .ZN(_022_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _081_ (
    .A1(_010_),
    .A2(_022_),
    .ZN(_023_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and3_1 _082_ (
    .A1(\fsm_plant_opt.state_temperature_synth_0 ),
    .A2(\fsm_plant_opt.state_water_synth_0 ),
    .A3(_006_),
    .Z(_024_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _083_ (
    .A1(_020_),
    .A2(_024_),
    .ZN(_025_)
  );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 _084_ (
    .A1(_021_),
    .A2(_023_),
    .B(_025_),
    .ZN(_026_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 _085_ (
    .A1(_005_),
    .A2(_002_),
    .ZN(_027_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _086_ (
    .A1(\fsm_plant_opt.state_temperature_synth_0 ),
    .A2(_012_),
    .ZN(_028_)
  );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 _087_ (
    .I(_028_),
    .ZN(io_oeb[1])
  );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 _088_ (
    .A1(_015_),
    .A2(_027_),
    .B(io_oeb[1]),
    .ZN(_029_)
  );
  gf180mcu_fd_sc_mcu7t5v0__mux2_2 _089_ (
    .I0(_019_),
    .I1(_026_),
    .S(_029_),
    .Z(_030_)
  );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _090_ (
    .A1(_018_),
    .A2(_030_),
    .B(_004_),
    .ZN(\fsm_plant_opt.tmp2409 )
  );
  gf180mcu_fd_sc_mcu7t5v0__buf_1 _091_ (
    .I(\fsm_plant_opt.state_temperature_synth_2 ),
    .Z(_031_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand3_1 _092_ (
    .A1(_011_),
    .A2(_031_),
    .A3(_010_),
    .ZN(_032_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _093_ (
    .A1(_028_),
    .A2(_032_),
    .ZN(io_oeb[0])
  );
  gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _094_ (
    .A1(\fsm_plant_opt.state_temperature_synth_1 ),
    .A2(_022_),
    .B1(_024_),
    .B2(_020_),
    .ZN(_033_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and4_1 _095_ (
    .A1(io_in[3]),
    .A2(io_in[2]),
    .A3(io_in[1]),
    .A4(io_in[0]),
    .Z(_034_)
  );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _096_ (
    .I(_034_),
    .ZN(_035_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and4_1 _097_ (
    .A1(_010_),
    .A2(_012_),
    .A3(_015_),
    .A4(_035_),
    .Z(_036_)
  );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _098_ (
    .A1(wbs_sel_i[0]),
    .A2(wbs_sel_i[1]),
    .B(wbs_sel_i[2]),
    .ZN(_037_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and4_1 _099_ (
    .A1(_011_),
    .A2(_031_),
    .A3(_009_),
    .A4(_037_),
    .Z(_038_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor4_1 _100_ (
    .A1(_011_),
    .A2(_031_),
    .A3(\fsm_plant_opt.state_temperature_synth_0 ),
    .A4(_019_),
    .ZN(_039_)
  );
  gf180mcu_fd_sc_mcu7t5v0__oai211_1 _101_ (
    .A1(_038_),
    .A2(_039_),
    .B(_015_),
    .C(_035_),
    .ZN(_040_)
  );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 _102_ (
    .A1(_033_),
    .A2(_036_),
    .B(_040_),
    .ZN(_041_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _103_ (
    .A1(_009_),
    .A2(_012_),
    .ZN(_042_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _104_ (
    .A1(_014_),
    .A2(_034_),
    .ZN(_043_)
  );
  gf180mcu_fd_sc_mcu7t5v0__or3_1 _105_ (
    .A1(_042_),
    .A2(_016_),
    .A3(_043_),
    .Z(_044_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _106_ (
    .A1(_041_),
    .A2(_044_),
    .ZN(_045_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _107_ (
    .A1(wbs_sel_i[1]),
    .A2(wbs_sel_i[2]),
    .ZN(_046_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nor3_1 _108_ (
    .A1(_042_),
    .A2(_016_),
    .A3(_043_),
    .ZN(_047_)
  );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 _109_ (
    .A1(_005_),
    .A2(_002_),
    .B(_043_),
    .ZN(_048_)
  );
  gf180mcu_fd_sc_mcu7t5v0__aoi22_1 _110_ (
    .A1(_046_),
    .A2(_047_),
    .B1(_048_),
    .B2(_038_),
    .ZN(_049_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _111_ (
    .A1(wbs_we_i),
    .A2(_008_),
    .ZN(_050_)
  );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _112_ (
    .A1(_045_),
    .A2(_049_),
    .B(_050_),
    .ZN(\fsm_plant_opt.tmp2410 )
  );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _113_ (
    .I(_040_),
    .ZN(_051_)
  );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _114_ (
    .A1(_031_),
    .A2(_022_),
    .B(_036_),
    .ZN(_052_)
  );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 _115_ (
    .A1(_051_),
    .A2(_052_),
    .B(_044_),
    .ZN(_053_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and4_1 _116_ (
    .A1(wbs_we_i),
    .A2(_008_),
    .A3(_049_),
    .A4(_053_),
    .Z(_054_)
  );
  gf180mcu_fd_sc_mcu7t5v0__buf_1 _117_ (
    .I(_054_),
    .Z(\fsm_plant_opt.tmp2411 )
  );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 _118_ (
    .I(_001_),
    .ZN(io_out[0])
  );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _119_ (
    .A1(io_in[2]),
    .A2(io_in[1]),
    .B(io_in[3]),
    .ZN(_055_)
  );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 _120_ (
    .A1(_027_),
    .A2(_055_),
    .ZN(_056_)
  );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 _121_ (
    .A1(_048_),
    .A2(_056_),
    .Z(_057_)
  );
  gf180mcu_fd_sc_mcu7t5v0__buf_1 _122_ (
    .I(_057_),
    .Z(\fsm_plant_opt.tmp3554 )
  );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 _123_ (
    .A1(_004_),
    .A2(\fsm_plant_opt.tmp3554 ),
    .ZN(\fsm_plant_opt.tmp3553 )
  );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _124_ (
    .A1(_001_),
    .A2(_002_),
    .B(_005_),
    .ZN(\fsm_plant_opt.tmp3555 )
  );
  gf180mcu_fd_sc_mcu7t5v0__dffq_1 _125_ (
    .CLK(wb_clk_i),
    .D(\fsm_plant_opt.tmp2410 ),
    .Q(\fsm_plant_opt.state_temperature_synth_1 )
  );
  gf180mcu_fd_sc_mcu7t5v0__dffq_1 _126_ (
    .CLK(wb_clk_i),
    .D(\fsm_plant_opt.tmp2411 ),
    .Q(\fsm_plant_opt.state_temperature_synth_2 )
  );
  gf180mcu_fd_sc_mcu7t5v0__dffq_1 _127_ (
    .CLK(wb_clk_i),
    .D(\fsm_plant_opt.tmp3553 ),
    .Q(\fsm_plant_opt.state_water_synth_0 )
  );
  gf180mcu_fd_sc_mcu7t5v0__dffq_1 _128_ (
    .CLK(wb_clk_i),
    .D(\fsm_plant_opt.tmp3554 ),
    .Q(\fsm_plant_opt.state_water_synth_1 )
  );
  gf180mcu_fd_sc_mcu7t5v0__dffq_1 _129_ (
    .CLK(wb_clk_i),
    .D(\fsm_plant_opt.tmp2409 ),
    .Q(\fsm_plant_opt.state_temperature_synth_0 )
  );
  gf180mcu_fd_sc_mcu7t5v0__dffq_1 _130_ (
    .CLK(wb_clk_i),
    .D(\fsm_plant_opt.tmp3555 ),
    .Q(\fsm_plant_opt.state_water_synth_2 )
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _131_ (
    .ZN(io_oeb[2])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _132_ (
    .ZN(io_oeb[3])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _133_ (
    .ZN(io_oeb[4])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _134_ (
    .ZN(io_oeb[5])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _135_ (
    .ZN(io_oeb[6])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _136_ (
    .ZN(io_oeb[7])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _137_ (
    .ZN(io_oeb[8])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _138_ (
    .ZN(io_oeb[9])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _139_ (
    .ZN(io_oeb[10])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _140_ (
    .ZN(io_oeb[11])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _141_ (
    .ZN(io_oeb[12])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _142_ (
    .ZN(io_oeb[13])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _143_ (
    .ZN(io_oeb[14])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _144_ (
    .ZN(io_oeb[15])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _145_ (
    .ZN(io_oeb[16])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _146_ (
    .ZN(io_oeb[17])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _147_ (
    .ZN(io_oeb[18])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _148_ (
    .ZN(io_oeb[19])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _149_ (
    .ZN(io_oeb[20])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _150_ (
    .ZN(io_oeb[21])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _151_ (
    .ZN(io_oeb[22])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _152_ (
    .ZN(io_oeb[23])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _153_ (
    .ZN(io_oeb[24])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _154_ (
    .ZN(io_oeb[25])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _155_ (
    .ZN(io_oeb[26])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _156_ (
    .ZN(io_oeb[27])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _157_ (
    .ZN(io_oeb[28])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _158_ (
    .ZN(io_oeb[29])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _159_ (
    .ZN(io_oeb[30])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _160_ (
    .ZN(io_oeb[31])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _161_ (
    .ZN(io_oeb[32])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _162_ (
    .ZN(io_oeb[33])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _163_ (
    .ZN(io_oeb[34])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _164_ (
    .ZN(io_oeb[35])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _165_ (
    .ZN(io_oeb[36])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _166_ (
    .ZN(io_oeb[37])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _167_ (
    .ZN(io_out[1])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _168_ (
    .ZN(io_out[2])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _169_ (
    .ZN(io_out[3])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _170_ (
    .ZN(io_out[4])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _171_ (
    .ZN(io_out[5])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _172_ (
    .ZN(io_out[6])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _173_ (
    .ZN(io_out[7])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _174_ (
    .ZN(io_out[8])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _175_ (
    .ZN(io_out[9])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _176_ (
    .ZN(io_out[10])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _177_ (
    .ZN(io_out[11])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _178_ (
    .ZN(io_out[12])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _179_ (
    .ZN(io_out[13])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _180_ (
    .ZN(io_out[14])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _181_ (
    .ZN(io_out[15])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _182_ (
    .ZN(io_out[16])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _183_ (
    .ZN(io_out[17])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _184_ (
    .ZN(io_out[18])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _185_ (
    .ZN(io_out[19])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _186_ (
    .ZN(io_out[20])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _187_ (
    .ZN(io_out[21])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _188_ (
    .ZN(io_out[22])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _189_ (
    .ZN(io_out[23])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _190_ (
    .ZN(io_out[24])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _191_ (
    .ZN(io_out[25])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _192_ (
    .ZN(io_out[26])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _193_ (
    .ZN(io_out[27])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _194_ (
    .ZN(io_out[28])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _195_ (
    .ZN(io_out[29])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _196_ (
    .ZN(io_out[30])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _197_ (
    .ZN(io_out[31])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _198_ (
    .ZN(io_out[32])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _199_ (
    .ZN(io_out[33])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _200_ (
    .ZN(io_out[34])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _201_ (
    .ZN(io_out[35])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _202_ (
    .ZN(io_out[36])
  );
  gf180mcu_fd_sc_mcu7t5v0__tiel _203_ (
    .ZN(io_out[37])
  );
endmodule
