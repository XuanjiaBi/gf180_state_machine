// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module plant_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    //input wbs_stb_i,
    //input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    //input [31:0] wbs_dat_i,
    //input [31:0] wbs_adr_i,
    //output wbs_ack_o,
    //output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    //input  [63:0] la_data_in,
    //output [63:0] la_data_out,
    //input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    //output [2:0] irq
);
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    //wire [31:0] rdata; 
    //wire [31:0] wdata;
    wire [BITS-1:0] count;

    //wire valid;
    //wire [3:0] wstrb;
    //wire [31:0] la_write;

    // WB MI A
    //assign valid = wbs_cyc_i && wbs_stb_i; 
    //assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    //assign wbs_dat_o = rdata;
    //assign wdata = wbs_dat_i;

    // IO
    assign io_out = count;
    //assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    //assign irq = 3'b000;	// Unused

    // LA
    //assign la_data_out = {{(127-BITS){1'b0}}, count};
    // Assuming LA probes [63:32] are for controlling the count register  
    //assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    //assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    //assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    assign clk = wb_clk_i;
    assign rst = wb_rst_i;

    fsm_plant_opt #(
        //.WIDTH(BITS)
    ) fsm_plant_opt(
        //.clk(clk),
        //.reset(rst),
        //.ready(wbs_ack_o),
        //.valid(valid),
        //.rdata(rdata),
	//.wdata(wbs_dat_i),
        //.wstrb(wstrb),
	//.la_write(la_write),
        //.la_input(la_data_in[63:32]),
    .clk(clk),
	.reset(rst),
	.start(wbs_we_i),
    .temperature(wbs_sel_i),
    .water(io_in),
	.pump(io_out),
	.ac(io_oeb)
    );

endmodule


module fsm_plant_opt(
    input[2:0] temperature,
    input[3:0] water,
    input reset,
    input start,
    input clk,
    output pump,
    output[1:0] ac
);
    reg state_temperature_synth_0;
    reg state_temperature_synth_1;
    reg state_temperature_synth_2;
    reg state_water_synth_1;
    reg state_water_synth_2;
    reg state_water_synth_0;
    wire tmp3320;
    wire tmp2256;
    wire tmp2969;
    wire tmp2457;
    wire tmp3389;
    wire tmp2267;
    wire tmp2998;
    wire tmp2856;
    wire tmp2093;
    wire tmp3461;
    wire tmp2306;
    wire tmp3352;
    wire tmp3431;
    wire tmp2684;
    wire[1:0] tmp2069;
    wire tmp2510;
    wire tmp2065;
    wire tmp2407;
    wire tmp2441;
    wire tmp3068;
    wire tmp3600;
    wire tmp3113;
    wire tmp2837;
    wire tmp2183;
    wire tmp3123;
    wire tmp2108;
    wire tmp2314;
    wire tmp2836;
    wire tmp3011;
    wire tmp3377;
    wire tmp3034;
    wire tmp3484;
    wire tmp2113;
    wire tmp3432;
    wire tmp2353;
    wire tmp2122;
    wire tmp2793;
    wire tmp2595;
    wire tmp3121;
    wire tmp2418;
    wire tmp2280;
    wire tmp3475;
    wire tmp2408;
    wire tmp3226;
    wire tmp2130;
    wire tmp2286;
    wire tmp2513;
    wire tmp2238;
    wire tmp3507;
    wire tmp3143;
    wire tmp2236;
    wire tmp2531;
    wire tmp2948;
    wire tmp2259;
    wire tmp3364;
    wire tmp2309;
    wire tmp3629;
    wire tmp3223;
    wire tmp3586;
    wire tmp2729;
    wire tmp2536;
    wire tmp2066;
    wire tmp2573;
    wire tmp2766;
    wire tmp2987;
    wire tmp2219;
    wire tmp2146;
    wire tmp3638;
    wire tmp3331;
    wire tmp3671;
    wire tmp3134;
    wire tmp2751;
    wire tmp2241;
    wire tmp3339;
    wire tmp2411;
    wire tmp3262;
    wire tmp2231;
    wire tmp3489;
    wire tmp2337;
    wire tmp3598;
    wire tmp3456;
    wire tmp2327;
    wire tmp2622;
    wire tmp2834;
    wire tmp3610;
    wire tmp3240;
    wire tmp3254;
    wire tmp3199;
    wire tmp2419;
    wire tmp3672;
    wire tmp2289;
    wire tmp3029;
    wire tmp2968;
    wire tmp3342;
    wire tmp2508;
    wire tmp3491;
    wire tmp2986;
    wire tmp3616;
    wire tmp2663;
    wire tmp3012;
    wire tmp2789;
    wire tmp3178;
    wire tmp2722;
    wire tmp3044;
    wire tmp2908;
    wire tmp2925;
    wire tmp3054;
    wire tmp3227;
    wire tmp2294;
    wire tmp2946;
    wire tmp2063;
    wire tmp2318;
    wire tmp2060;
    wire tmp3420;
    wire tmp2566;
    wire tmp2466;
    wire tmp2980;
    wire tmp3160;
    wire tmp2182;
    wire tmp3155;
    wire tmp3153;
    wire tmp3297;
    wire tmp2288;
    wire tmp3111;
    wire tmp2927;
    wire tmp2614;
    wire tmp3083;
    wire tmp3340;
    wire tmp2096;
    wire tmp2068;
    wire tmp3535;
    wire tmp3667;
    wire tmp2377;
    wire tmp3430;
    wire tmp3664;
    wire tmp2290;
    wire tmp2275;
    wire tmp3165;
    wire tmp2578;
    wire tmp2459;
    wire tmp3321;
    wire tmp2791;
    wire tmp2372;
    wire tmp2345;
    wire tmp3326;
    wire tmp2340;
    wire tmp3440;
    wire tmp3077;
    wire tmp2116;
    wire tmp2197;
    wire tmp2115;
    wire tmp3144;
    wire tmp3204;
    wire tmp2260;
    wire tmp2507;
    wire tmp3033;
    wire tmp3587;
    wire tmp3026;
    wire tmp3154;
    wire tmp3583;
    wire tmp2988;
    wire tmp3415;
    wire tmp3338;
    wire tmp2727;
    wire tmp2839;
    wire tmp3255;
    wire tmp3325;
    wire tmp3478;
    wire tmp2945;
    wire tmp2910;
    wire tmp2506;
    wire tmp3038;
    wire tmp3362;
    wire tmp2062;
    wire tmp3065;
    wire tmp3324;
    wire tmp3019;
    wire tmp2748;
    wire tmp3490;
    wire tmp2083;
    wire tmp3066;
    wire tmp2148;
    wire tmp3619;
    wire tmp3347;
    wire tmp2480;
    wire tmp3267;
    wire tmp2184;
    wire tmp2835;
    wire tmp3182;
    wire tmp3657;
    wire tmp3200;
    wire tmp2420;
    wire tmp2830;
    wire tmp3079;
    wire tmp3673;
    wire tmp3568;
    wire tmp3129;
    wire tmp2304;
    wire tmp3343;
    wire tmp2402;
    wire tmp3496;
    wire tmp3384;
    wire tmp2320;
    wire tmp2291;
    wire tmp2643;
    wire tmp2859;
    wire tmp2431;
    wire tmp2685;
    wire tmp3650;
    wire tmp3361;
    wire tmp2735;
    wire tmp2380;
    wire tmp2909;
    wire tmp2374;
    wire tmp3298;
    wire tmp2451;
    wire tmp2723;
    wire tmp3466;
    wire tmp3411;
    wire tmp2362;
    wire tmp2391;
    wire tmp2074;
    wire tmp2496;
    wire tmp3265;
    wire tmp3477;
    wire tmp3057;
    wire tmp2112;
    wire tmp3464;
    wire tmp2234;
    wire tmp2067;
    wire tmp2137;
    wire tmp2683;
    wire tmp3533;
    wire tmp2409;
    wire tmp2853;
    wire tmp2077;
    wire tmp3289;
    wire tmp2928;
    wire tmp2124;
    wire tmp2540;
    wire tmp2361;
    wire tmp3032;
    wire tmp2902;
    wire tmp3494;
    wire tmp2611;
    wire tmp2690;
    wire tmp2490;
    wire tmp2778;
    wire tmp2177;
    wire tmp2397;
    wire tmp2383;
    wire tmp2529;
    wire tmp3617;
    wire tmp2858;
    wire tmp2523;
    wire tmp2792;
    wire tmp2667;
    wire tmp2142;
    wire tmp2087;
    wire tmp2678;
    wire tmp2871;
    wire tmp3259;
    wire tmp3483;
    wire tmp3266;
    wire tmp3636;
    wire tmp3513;
    wire tmp2982;
    wire tmp2120;
    wire tmp3270;
    wire tmp2261;
    wire tmp3225;
    wire tmp3344;
    wire tmp3459;
    wire tmp3296;
    wire tmp3630;
    wire tmp3081;
    wire tmp2406;
    wire tmp2505;
    wire tmp2305;
    wire tmp3481;
    wire tmp3290;
    wire tmp2728;
    wire tmp3547;
    wire tmp2742;
    wire tmp3388;
    wire tmp3035;
    wire tmp3159;
    wire tmp2162;
    wire tmp3631;
    wire tmp2299;
    wire tmp2866;
    wire tmp3553;
    wire tmp3604;
    wire tmp2343;
    wire tmp2149;
    wire tmp3599;
    wire tmp2603;
    wire tmp2285;
    wire tmp3201;
    wire tmp3114;
    wire tmp3615;
    wire tmp2442;
    wire tmp2873;
    wire tmp2768;
    wire tmp2919;
    wire tmp2931;
    wire tmp3379;
    wire tmp3523;
    wire tmp2795;
    wire tmp3302;
    wire tmp2877;
    wire tmp2860;
    wire tmp2705;
    wire tmp2417;
    wire tmp3082;
    wire tmp2653;
    wire tmp3167;
    wire tmp2821;
    wire tmp3668;
    wire tmp3482;
    wire tmp2512;
    wire tmp3108;
    wire tmp3142;
    wire tmp2359;
    wire tmp3554;
    wire tmp3360;
    wire tmp2344;
    wire tmp2363;
    wire tmp3169;
    wire tmp2084;
    wire tmp3218;
    wire tmp3101;
    wire tmp2656;
    wire tmp2970;
    wire tmp2726;
    wire tmp2567;
    wire tmp3474;
    wire tmp2686;
    wire tmp3345;
    wire tmp3534;
    wire tmp2939;
    wire tmp3166;
    wire tmp2410;
    wire tmp3013;
    wire tmp3488;
    wire tmp3515;
    wire tmp2929;
    wire tmp2478;
    wire tmp2851;
    wire tmp3588;
    wire tmp2794;
    wire tmp2237;
    wire tmp3119;
    wire tmp2366;
    wire tmp2064;
    wire tmp3495;
    wire tmp3627;
    wire tmp3208;
    wire tmp2947;
    wire tmp3666;
    wire tmp3258;
    wire tmp3341;
    wire tmp3559;
    wire tmp2646;
    wire tmp3109;
    wire tmp2867;
    wire tmp2543;
    wire tmp2172;
    wire tmp2395;
    wire tmp3186;
    wire tmp3555;
    wire tmp2593;
    wire tmp3359;
    wire tmp2061;
    wire tmp3443;
    wire tmp3260;
    wire tmp3521;
    wire tmp3120;
    wire tmp3594;
    wire tmp2103;
    wire tmp2109;
    wire tmp3317;


    assign tmp3129 = ~state_temperature_synth_1;
    assign tmp3344 = tmp2380 & tmp3032;
    assign tmp2496 = ~tmp3166;
    assign tmp2116 = tmp2402 & tmp2397;
    assign tmp3616 = tmp2685 & tmp3289;
    assign tmp3218 = state_temperature_synth_0 | tmp2256;
    assign tmp3587 = tmp2087 & tmp3440;
    assign tmp2065 = {temperature[1]};
    assign tmp3123 = ~tmp2234;
    assign tmp2945 = ~tmp2327;
    assign tmp2667 = ~tmp2280;
    assign tmp2593 = tmp2653 & tmp2536;
    assign tmp2314 = tmp2686 | tmp3411;
    assign tmp2766 = tmp2066 | tmp3068;
    assign tmp2735 = ~tmp2288;
    assign tmp2327 = tmp2478 & tmp2288;
    assign tmp2231 = tmp3361 | tmp2275;
    assign tmp2406 = state_temperature_synth_0 & tmp2366;
    assign tmp2162 = ~tmp2063;
    assign tmp2748 = tmp3535 | tmp2643;
    assign tmp2353 = ~tmp3466;
    assign tmp2678 = tmp3364 & tmp2353;
    assign tmp2505 = ~tmp2536;
    assign tmp2337 = ~tmp2062;
    assign tmp3568 = ~tmp2643;
    assign tmp3459 = tmp2839 & tmp3636;
    assign tmp3588 = tmp3013 & tmp3440;
    assign tmp2611 = tmp2065 & tmp3123;
    assign tmp2851 = ~tmp2646;
    assign tmp3186 = tmp3616 | tmp3610;
    assign tmp2397 = ~tmp3258;
    assign tmp2289 = tmp3199 & tmp2441;
    assign tmp2946 = tmp2285 & tmp2578;
    assign tmp3254 = tmp3459 & tmp2603;
    assign tmp3667 = tmp2947 & tmp2457;
    assign tmp3629 = tmp2543 & tmp2611;
    assign tmp2103 = tmp3160 & tmp2768;
    assign tmp3068 = tmp3521 & tmp2234;
    assign tmp2795 = ~tmp3144;
    assign tmp3636 = tmp2063 | tmp2417;
    assign tmp2417 = tmp3142 & tmp2162;
    assign tmp3204 = ~tmp2851;
    assign tmp2510 = tmp2116 & tmp3650;
    assign ac = tmp2069;
    assign tmp2291 = tmp3201 & tmp2441;
    assign tmp3038 = tmp3495 & tmp2667;
    assign tmp2093 = tmp3619 & tmp2496;
    assign tmp3111 = ~tmp3338;
    assign tmp2728 = tmp2407 & tmp2622;
    assign tmp2063 = {water[3]};
    assign tmp2120 = tmp2490 & tmp2611;
    assign tmp3266 = tmp2344 & tmp3362;
    assign tmp2506 = tmp2083 & tmp2540;
    assign tmp2478 = tmp3631 & tmp2851;
    assign tmp3586 = tmp3011 & tmp3440;
    assign tmp3521 = tmp2064 & tmp3377;
    assign tmp2982 = tmp2116 & tmp2795;
    assign tmp3325 = tmp2507 & tmp3114;
    assign tmp2256 = state_temperature_synth_1 | tmp2566;
    assign tmp3615 = tmp2684 & tmp3289;
    assign tmp2431 = ~state_water_synth_0;
    assign tmp2573 = tmp3631 & tmp3204;
    assign tmp3208 = ~tmp2603;
    assign tmp2986 = tmp2529 & tmp2383;
    assign tmp3178 = ~tmp3629;
    assign tmp2653 = tmp2510 & tmp3111;
    assign tmp2856 = ~tmp2611;
    assign tmp2466 = tmp3559 | tmp2925;
    assign tmp3364 = tmp3459 & tmp3208;
    assign tmp2931 = tmp2853 & tmp2353;
    assign tmp2183 = state_water_synth_1 & tmp2366;
    assign tmp2109 = tmp3466 & tmp2742;
    assign tmp2987 = tmp2305 & tmp2383;
    assign tmp2408 = state_temperature_synth_2 & tmp2366;
    assign tmp2130 = tmp2508 | tmp2614;
    assign tmp3431 = tmp3186 & tmp3456;
    assign tmp2929 = tmp3668 & tmp3178;
    assign tmp2142 = tmp2856 | tmp2667;
    assign tmp3160 = tmp2653 & tmp2505;
    assign tmp2536 = ~tmp2768;
    assign tmp2742 = ~tmp3218;
    assign tmp2794 = tmp2678 & tmp2742;
    assign tmp3474 = tmp2362 | tmp2103;
    assign tmp2853 = tmp2593 & tmp3208;
    assign tmp2970 = tmp2729 & tmp3044;
    assign tmp3240 = tmp2219 & tmp2667;
    assign tmp2359 = ~tmp3302;
    assign pump = tmp2172;
    assign tmp2197 = tmp3466 ^ tmp2742;
    assign tmp3343 = tmp3481 & tmp3032;
    assign tmp2219 = tmp3254 & tmp3415;
    assign tmp3631 = tmp2510 & tmp2096;
    assign tmp2603 = ~tmp2377;
    assign tmp2873 = tmp3488 & tmp2856;
    assign tmp3270 = tmp3227 | tmp2726;
    assign tmp3082 = tmp3297 & tmp2359;
    assign tmp2363 = tmp2374 & tmp3630;
    assign tmp2540 = ~tmp2614;
    assign tmp3599 = tmp3226 & tmp2320;
    assign tmp2928 = tmp3260 & tmp3178;
    assign tmp2722 = tmp3331 | tmp3523;
    assign tmp2910 = tmp2860 & tmp2115;
    assign tmp2529 = tmp2304 | tmp2982;
    assign tmp3610 = tmp3038 & tmp2856;
    assign tmp3443 = ~tmp2573;
    assign tmp2345 = tmp3155 & tmp2442;
    assign tmp3166 = ~tmp2766;
    assign tmp2077 = tmp3331 | tmp2146;
    assign tmp2236 = ~tmp3223;
    assign tmp3484 = tmp2980 & tmp2353;
    assign tmp3496 = tmp2406 | tmp2778;
    assign tmp2727 = tmp3496 & tmp2622;
    assign tmp2729 = tmp2408 & tmp2622;
    assign tmp2366 = ~tmp2778;
    assign tmp2871 = state_temperature_synth_0 | tmp2146;
    assign tmp2395 = ~tmp2337;
    assign tmp3657 = tmp2093 & tmp2766;
    assign tmp2656 = tmp3119 | tmp2419;
    assign tmp2290 = tmp3169 & tmp2441;
    assign tmp3389 = tmp3431 | tmp2873;
    assign tmp2362 = tmp2987 & tmp3630;
    assign tmp2925 = ~state_water_synth_2;
    assign tmp2980 = tmp2327 & tmp3208;
    assign tmp2074 = tmp2931 & tmp2742;
    assign tmp3664 = tmp3298 | tmp3223;
    assign tmp2288 = ~tmp3636;
    assign tmp3415 = ~tmp2142;
    assign tmp2409 = tmp2267 & tmp2939;
    assign tmp3320 = ~tmp2856;
    assign tmp3044 = ~tmp3604;
    assign tmp3201 = tmp3326 & tmp2420;
    assign tmp3154 = tmp3461 & tmp3583;
    assign tmp2531 = tmp2306 | tmp2982;
    assign tmp3143 = tmp2327 & tmp2603;
    assign tmp2948 = tmp3588 & tmp2578;
    assign tmp2237 = ~tmp2683;
    assign tmp3481 = tmp2866 & tmp2113;
    assign tmp3627 = tmp2451 & tmp3466;
    assign tmp2305 = tmp3120 & tmp3108;
    assign tmp3265 = tmp2343 & tmp3362;
    assign tmp3555 = tmp2836 & tmp2939;
    assign tmp3440 = ~tmp3262;
    assign tmp3650 = ~tmp2795;
    assign tmp3338 = tmp2431 | tmp3255;
    assign tmp2259 = tmp3359 & tmp3443;
    assign tmp2402 = tmp2068 & tmp2919;
    assign tmp3432 = tmp3617 & tmp3456;
    assign tmp2407 = state_temperature_synth_1 & tmp2366;
    assign tmp2177 = tmp2980 & tmp3466;
    assign tmp2241 = tmp3254 & tmp2142;
    assign tmp2260 = tmp3360 & tmp3443;
    assign tmp3225 = tmp2512 & tmp2998;
    assign tmp3134 = tmp2727 | tmp3054;
    assign tmp3384 = tmp2340 & tmp2742;
    assign tmp3594 = ~tmp2068;
    assign tmp2137 = tmp2074 & tmp3166;
    assign tmp2087 = tmp3012 | tmp2523;
    assign tmp3223 = tmp2299 & tmp2766;
    assign tmp3011 = tmp3533 & tmp2751;
    assign tmp3494 = tmp3143 & tmp3415;
    assign tmp2451 = tmp2103 & tmp3208;
    assign tmp2947 = tmp2286 & tmp2578;
    assign tmp3630 = ~tmp2103;
    assign tmp3619 = tmp3484 & tmp2742;
    assign tmp2182 = state_water_synth_0 & tmp2366;
    assign tmp3377 = ~tmp3167;
    assign tmp3361 = tmp2291 & tmp2309;
    assign tmp2113 = ~tmp3339;
    assign tmp3101 = state_water_synth_0 | tmp3019;
    assign tmp3144 = tmp2431 | tmp3019;
    assign tmp2643 = tmp3026 & tmp2766;
    assign tmp2108 = tmp2794 & tmp3166;
    assign tmp3066 = tmp3325 | tmp3347;
    assign tmp2859 = tmp3389 & tmp2459;
    assign tmp3495 = tmp2593 & tmp2603;
    assign tmp3120 = tmp2183 & tmp2837;
    assign tmp3317 = tmp2909 | tmp2137;
    assign tmp2595 = tmp3384 & tmp3166;
    assign tmp3108 = ~tmp2982;
    assign tmp3466 = ~tmp2722;
    assign tmp3420 = tmp2690 & tmp2667;
    assign tmp2927 = tmp3259 & tmp3178;
    assign tmp2683 = tmp2219 & tmp2280;
    assign tmp3035 = tmp2970 & tmp2418;
    assign tmp3289 = ~tmp3610;
    assign tmp3054 = tmp2419 & tmp2122;
    assign tmp2149 = tmp3342 | tmp3459;
    assign tmp3666 = tmp2946 & tmp2457;
    assign tmp2115 = ~tmp2137;
    assign tmp3114 = ~tmp3347;
    assign tmp2060 = {water[0]};
    assign tmp2839 = tmp2478 & tmp2735;
    assign tmp3345 = tmp3483 & tmp3032;
    assign tmp3339 = tmp3513 & tmp2611;
    assign tmp3200 = tmp3066 & tmp2420;
    assign tmp3153 = tmp2927 & tmp3583;
    assign tmp3668 = tmp2318 & tmp2457;
    assign tmp2299 = tmp2074 & tmp2496;
    assign tmp2148 = tmp3341 | tmp3459;
    assign tmp2902 = ~tmp2077;
    assign tmp3226 = tmp2513 & tmp2998;
    assign tmp3013 = tmp2748 & tmp2751;
    assign tmp3033 = tmp2968 & tmp2418;
    assign tmp2457 = ~tmp2723;
    assign tmp2622 = ~tmp3054;
    assign tmp3638 = tmp3290 & tmp2395;
    assign tmp3533 = tmp3343 & tmp3568;
    assign tmp2684 = tmp3477 & tmp3507;
    assign tmp3297 = tmp3317 & tmp2236;
    assign tmp3159 = tmp2345 | tmp3657;
    assign tmp3032 = ~tmp2595;
    assign tmp2686 = tmp3035 & tmp3507;
    assign tmp2304 = tmp2656 & tmp3108;
    assign tmp3081 = tmp3296 & tmp2359;
    assign tmp3554 = tmp2835 & tmp2939;
    assign tmp3559 = ~state_water_synth_1;
    assign tmp2280 = tmp3167 & tmp2234;
    assign tmp2835 = tmp2148 & tmp3443;
    assign tmp3019 = state_water_synth_1 | state_water_synth_2;
    assign tmp2112 = tmp3379 & tmp2611;
    assign tmp3352 = tmp3619 & tmp3166;
    assign tmp3553 = tmp2567 & tmp2939;
    assign tmp2069 = {tmp3182, tmp2197};
    assign tmp3347 = tmp2238 & tmp2856;
    assign tmp2061 = {water[1]};
    assign tmp3255 = state_water_synth_1 | tmp2925;
    assign tmp3258 = ~tmp3101;
    assign tmp3488 = tmp2853 & tmp3466;
    assign tmp3165 = tmp3488 & tmp3320;
    assign tmp2318 = tmp2948 | tmp2112;
    assign tmp2614 = tmp3240 & tmp2611;
    assign tmp3673 = tmp3475 & tmp2945;
    assign tmp2172 = tmp2795 | tmp3111;
    assign tmp2361 = tmp2372 & tmp3630;
    assign tmp2261 = tmp2231 & tmp3443;
    assign tmp2566 = ~state_temperature_synth_2;
    assign tmp2096 = ~tmp3111;
    assign tmp3079 = tmp3673 | tmp2327;
    assign tmp2830 = tmp3154 | tmp3352;
    assign tmp2419 = tmp2402 & tmp3258;
    assign tmp2988 = tmp2531 & tmp2383;
    assign tmp2793 = tmp3600 & tmp3057;
    assign tmp3617 = tmp2314 & tmp3289;
    assign tmp3672 = tmp3474 & tmp2945;
    assign tmp2567 = tmp2834 | tmp2573;
    assign tmp2275 = tmp3464 & tmp2766;
    assign tmp2837 = ~tmp2419;
    assign tmp2377 = state_temperature_synth_0 | tmp3523;
    assign tmp3671 = tmp2361 & tmp2945;
    assign tmp3302 = tmp2690 & tmp2280;
    assign tmp3331 = ~state_temperature_synth_0;
    assign tmp2834 = tmp3340 & tmp3443;
    assign tmp2391 = tmp2859 | tmp2877;
    assign tmp3583 = ~tmp3352;
    assign tmp3199 = tmp3065 & tmp2420;
    assign tmp3534 = tmp3029 & tmp3568;
    assign tmp2146 = state_temperature_synth_1 | state_temperature_synth_2;
    assign tmp3598 = tmp3225 & tmp2320;
    assign tmp2867 = tmp2792 | tmp2663;
    assign tmp2067 = {reset};
    assign tmp2685 = tmp3478 & tmp3507;
    assign tmp2309 = ~tmp2275;
    assign tmp2512 = tmp3081 | tmp3302;
    assign tmp2238 = tmp3364 & tmp3466;
    assign tmp2578 = ~tmp2112;
    assign tmp2836 = tmp2149 & tmp3443;
    assign tmp2789 = tmp3495 & tmp2280;
    assign tmp2792 = tmp2294 & tmp3057;
    assign tmp2234 = ~tmp2066;
    assign tmp2513 = tmp3082 | tmp3302;
    assign tmp2184 = state_water_synth_2 & tmp2366;
    assign tmp3121 = tmp2184 & tmp2837;
    assign tmp3477 = tmp3033 | tmp2789;
    assign tmp2383 = ~tmp2593;
    assign tmp2459 = ~tmp2877;
    assign tmp2084 = tmp3490 | tmp2683;
    assign tmp2998 = ~tmp2726;
    assign tmp2420 = ~tmp2120;
    assign tmp3167 = ~tmp2065;
    assign tmp3119 = tmp3515 & tmp2837;
    assign tmp3169 = tmp3200 | tmp2120;
    assign tmp2968 = tmp3134 & tmp3044;
    assign tmp3012 = tmp3534 & tmp2751;
    assign tmp2344 = tmp2830 & tmp2442;
    assign tmp2294 = tmp3599 | tmp3547;
    assign tmp3478 = tmp3034 | tmp2789;
    assign tmp3155 = tmp2929 & tmp3583;
    assign tmp3340 = tmp3077 & tmp3109;
    assign tmp2768 = tmp3638 & tmp3321;
    assign tmp3535 = tmp3345 & tmp3568;
    assign tmp3359 = tmp2289 & tmp2309;
    assign tmp3341 = tmp3672 & tmp3109;
    assign tmp2374 = tmp2988 | tmp2593;
    assign tmp3113 = ~tmp2061;
    assign tmp3182 = tmp3466 ^ tmp2109;
    assign tmp2340 = tmp2451 & tmp2353;
    assign tmp2083 = tmp3489 | tmp2683;
    assign tmp2286 = tmp3587 | tmp3262;
    assign tmp3513 = tmp3627 & tmp3320;
    assign tmp3227 = tmp3083 & tmp2998;
    assign tmp2705 = tmp2969 | tmp3604;
    assign tmp2908 = tmp2858 & tmp2115;
    assign tmp2726 = tmp3420 & tmp2611;
    assign tmp3260 = tmp3667 | tmp2723;
    assign tmp3109 = ~tmp3459;
    assign tmp2821 = tmp2290 | tmp2108;
    assign tmp3491 = tmp3267 & tmp2237;
    assign tmp3490 = tmp2480 & tmp2237;
    assign tmp3259 = tmp3666 | tmp2723;
    assign tmp3475 = tmp2363 | tmp2103;
    assign tmp2523 = tmp3143 & tmp2142;
    assign tmp2267 = tmp2259 | tmp2573;
    assign tmp2751 = ~tmp2523;
    assign tmp2866 = tmp2791 | tmp2663;
    assign tmp2285 = tmp3586 | tmp3262;
    assign tmp2372 = tmp2986 | tmp2593;
    assign tmp2122 = ~tmp2871;
    assign tmp2062 = {water[2]};
    assign tmp3083 = tmp3664 & tmp2359;
    assign tmp2411 = tmp2261 & tmp2939;
    assign tmp3262 = tmp3494 & tmp2280;
    assign tmp2690 = tmp2103 & tmp2603;
    assign tmp2124 = ~tmp3113;
    assign tmp3379 = tmp3494 & tmp2667;
    assign tmp2068 = {start};
    assign tmp3362 = ~tmp2241;
    assign tmp3142 = tmp2061 & tmp2395;
    assign tmp2543 = tmp2177 & tmp3320;
    assign tmp2663 = tmp3627 & tmp2856;
    assign tmp2508 = tmp3491 & tmp2540;
    assign tmp3523 = tmp3129 | state_temperature_synth_2;
    assign tmp3290 = tmp2060 & tmp2124;
    assign tmp3482 = tmp2867 & tmp2113;
    assign tmp3464 = tmp2794 & tmp2496;
    assign tmp2791 = tmp3598 & tmp3057;
    assign tmp3342 = tmp3079 & tmp3109;
    assign tmp3065 = tmp3324 | tmp3347;
    assign tmp3057 = ~tmp2663;
    assign tmp3034 = tmp2705 & tmp2418;
    assign tmp3600 = tmp3270 & tmp2320;
    assign tmp3456 = ~tmp2873;
    assign tmp2919 = ~tmp2067;
    assign tmp2860 = tmp3432 & tmp2459;
    assign tmp3267 = tmp3159 & tmp3362;
    assign tmp3604 = tmp2982 & tmp2902;
    assign tmp2442 = ~tmp3657;
    assign tmp2969 = tmp2728 & tmp3044;
    assign tmp3360 = tmp2821 & tmp2309;
    assign tmp2939 = ~tmp3594;
    assign tmp3326 = tmp2130 & tmp3114;
    assign tmp3547 = tmp3420 & tmp2856;
    assign tmp2380 = tmp3482 | tmp3339;
    assign tmp2778 = tmp2068 & tmp2067;
    assign tmp3321 = ~tmp2162;
    assign tmp3430 = tmp3615 & tmp3456;
    assign tmp3461 = tmp2928 | tmp3629;
    assign tmp2480 = tmp3266 | tmp2241;
    assign tmp2858 = tmp3388 & tmp2459;
    assign tmp2306 = tmp3121 & tmp3108;
    assign tmp2343 = tmp3153 & tmp2442;
    assign tmp3515 = tmp2182 | tmp2778;
    assign tmp2877 = tmp3165 & tmp2611;
    assign tmp3324 = tmp2506 & tmp3114;
    assign tmp2064 = {temperature[0]};
    assign tmp3388 = tmp3430 | tmp2873;
    assign tmp3507 = ~tmp3411;
    assign tmp3296 = tmp2908 & tmp2236;
    assign tmp2490 = tmp2238 & tmp3320;
    assign tmp2507 = tmp2084 & tmp2540;
    assign tmp2646 = state_water_synth_0 | tmp2466;
    assign tmp2418 = ~tmp2789;
    assign tmp2410 = tmp2260 & tmp2939;
    assign tmp3077 = tmp3671 | tmp2327;
    assign tmp3411 = tmp3038 & tmp2611;
    assign tmp3298 = tmp2910 & tmp2236;
    assign tmp3029 = tmp3344 | tmp2595;
    assign tmp2066 = {temperature[2]};
    assign tmp2320 = ~tmp3547;
    assign tmp2441 = ~tmp2108;
    assign tmp3026 = tmp3384 & tmp2496;
    assign tmp3489 = tmp3265 & tmp2237;
    assign tmp2723 = tmp2177 & tmp2856;
    assign tmp2909 = tmp2391 & tmp2115;
    assign tmp3483 = tmp2793 & tmp2113;

    always @( posedge clk )
    begin
        state_temperature_synth_1 <= tmp2410;
        state_water_synth_2 <= tmp3555;
        state_water_synth_1 <= tmp3554;
        state_temperature_synth_2 <= tmp2411;
        state_temperature_synth_0 <= tmp2409;
        state_water_synth_0 <= tmp3553;
    end

endmodule
`default_nettype wire














