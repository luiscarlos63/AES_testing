`timescale 1ns / 1ps
//-----------------------------------------------------------------
// (c) Copyright 1984 - 2018 Xilinx, Inc. All rights reserved.	
//							
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.							
//-----------------------------------------------------------------							 
// DISCLAIMER							
// This disclaimer is not a license and does not grant any	 
// rights to the materials distributed herewith. Except as	 
// otherwise provided in a valid license issued to you by	
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-	 
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and	 
// (2) Xilinx shall not be liable (whether in contract or tort,	
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature 
// related to, arising under or in connection with these	 
// materials, including for any direct, or any indirect,	
// special, incidental, or consequential loss or damage		 
// (including loss of data, profits, goodwill, or any type of	
// loss or damage suffered as a result of any action brought	
// by a third party) even if such damage or loss was		 
// reasonably foreseeable or Xilinx had been advised of the	 
// possibility of the same.					 
//								 
// CRITICAL APPLICATIONS					 
// Xilinx products are not designed or intended to be fail-	 
// safe, or for use in any application requiring fail-safe	 
// performance, such as life-support or safety devices or	 
// systems, Class III medical devices, nuclear facilities,	 
// applications related to the deployment of airbags, or any	 
// other applications that could lead to death, personal	 
// injury, or severe property or environmental damage		 
// (individually and collectively, "Critical			 
// Applications"). Customer assumes the sole risk and		 
// liability of any use of Xilinx products in Critical		 
// Applications, subject only to applicable laws and		 
// regulations governing limitations on product liability.	 
//								 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS	 
// PART OF THIS FILE AT ALL TIMES. 				 
//-----------------------------------------------------------------
// ************************************************************************
//
//-----------------------------------------------------------------------------
// Filename:        AXI_GPIO_tb.sv
// Version:         v1.0
// Description:     Simulation test bench for the AXI Basics Series 3
//                  
//-----------------------------------------------------------------------------
//Step 2 - Import two required packages: axi_vip_pkg and <component_name>_pkg.
import axi_vip_pkg::*;
import AXI_GPIO_Sim_axi_vip_0_0_pkg::*;
import AXI_GPIO_Sim_axi_vip_1_0_pkg::*;


//////////////////////////////////////////////////////////////////////////////////
// Test Bench Signals
//////////////////////////////////////////////////////////////////////////////////
// Clock and Reset
bit aclk = 0, aresetn = 1;
//Simulation output
bit led_1, switch_1;
//AXI4-Lite signals


xil_axi_resp_t 	resp;
xil_axi_resp_t [255:0]    resp_full;
xil_axi_data_beat [255:0] ruser_full;
bit[31:0]  addr, data, base_addr = 32'hC000_0000, switch_state;


module AXI_GPIO_tb( );

bit [255:0] dbg_key = 256'hF1;
bit [1:0]dbg_ENCLEN = 2'b1_0;

AXI_GPIO_Sim_wrapper UUT
(
    .aclk               (aclk),
    .aresetn            (aresetn),
    .dbg_key            (dbg_key),
    .dbg_ENCLEN         (dbg_ENCLEN)
);

// Generate the clock : 50 MHz    
always #5ns aclk = ~aclk;

//////////////////////////////////////////////////////////////////////////////////
// Main Process
//////////////////////////////////////////////////////////////////////////////////
//
initial begin
    //Assert the reset
    aresetn = 0;
    #10ns
    // Release the reset
    aresetn = 1;
end
//
//////////////////////////////////////////////////////////////////////////////////
// The following part controls the AXI VIP. 
//It follows the "Usefull Coding Guidelines and Examples" section from PG267
//////////////////////////////////////////////////////////////////////////////////
//
// Step 3 - Declare the agent for the master VIP
AXI_GPIO_Sim_axi_vip_0_0_mst_t      master_agent_vpi0;
AXI_GPIO_Sim_axi_vip_1_0_mst_t      master_agent_vpi1;
 

 
//bit[127:0] plaintext0 = 128'hD099E3372D5825E31CDCEC9D78EEFA30;
//bit[127:0] plaintext1 = 128'h36E3FE1BA0BE59FC844078E3CC8ACD1A;
//bit[127:0] plaintext2 = 128'h69C3FF99D962C8A329FF472D36CE3846;
//bit[127:0] plaintext3 = 128'hCE13D5CE9EA533FC7472C1344644C359;

//bit[127:0] plaintext0 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
//bit[127:0] plaintext1 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
//bit[127:0] plaintext2 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
//bit[127:0] plaintext3 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

bit[127:0] plaintext0 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
bit[127:0] plaintext1 = 128'hBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB;
bit[127:0] plaintext2 = 128'h11111111111111111111111111111111;
bit[127:0] plaintext3 = 128'h44444444444444444444444444444444;

//bit[127:0] expected0 = 128'h5c8a4eabab1dc7ca9179e0317d6f85c3;
//bit[127:0] expected1 = 128'h9c690216e96fed9b90d823741d5663b0;
//bit[127:0] expected2 = 128'he4706f7d22cbd2805b8a745bc59b38ec;
//bit[127:0] expected3 = 128'hfc4407729cefda1daad5ed06f26d1675;

bit[127:0] expected0 = 128'h35731bf7703ba672451cc0adeb7b8d4a;
bit[127:0] expected1 = 128'h35731bf7703ba672451cc0adeb7b8d4a;
bit[127:0] expected2 = 128'h35731bf7703ba672451cc0adeb7b8d4a;
bit[127:0] expected3 = 128'h35731bf7703ba672451cc0adeb7b8d4a;






    
bit [255:0] data_1;
bit [255:0] data_2;



//
initial begin    

    // Step 4 - Create a new agent
    master_agent_vpi0   = new("master vip agent 0",UUT.AXI_GPIO_Sim_i.axi_vip_0.inst.IF);
    master_agent_vpi1   = new("master vip agent 1",UUT.AXI_GPIO_Sim_i.axi_vip_1.inst.IF);
    
    // Step 5 - Start the agent
    master_agent_vpi0.start_master();
    master_agent_vpi1.start_master();
    //Wait for the reset to be released
    wait (aresetn == 1'b1);


    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 0,0,plaintext0[31:0  ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 4,0,plaintext0[63:32 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 8,0,plaintext0[95:64 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 12,0,plaintext0[127:96],resp);

    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 16,0,plaintext1[31:0  ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 20,0,plaintext1[63:32 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 24,0,plaintext1[95:64 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 28,0,plaintext1[127:96],resp);

    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 32,0,plaintext2[31:0  ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 36,0,plaintext2[63:32 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 40,0,plaintext2[95:64 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 44,0,plaintext2[127:96],resp);
    
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 48,0,plaintext3[31:0  ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 52,0,plaintext3[63:32 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 56,0,plaintext3[95:64 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 60,0,plaintext3[127:96],resp);


    
    #100ns;
    
    
    master_agent_vpi0.AXI4_READ_BURST(
    0,
    base_addr,
    7+8, //beat lenght
    XIL_AXI_SIZE_4BYTE,  //size = 2 -> beat = 4 bytes
    XIL_AXI_BURST_TYPE_INCR,  //burst
    XIL_AXI_ALOCK_NOLOCK,
    0,
    0,
    0,
    0,
    0,
    data_1,
    resp_full,
    ruser_full
    );
    

    
    
    
end





endmodule













/*


    
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 64,0,plaintext0[31:0  ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 68,0,plaintext0[63:32 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 72,0,plaintext0[95:64 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 76,0,plaintext0[127:96],resp);

    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 80,0,plaintext1[31:0  ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 84,0,plaintext1[63:32 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 88,0,plaintext1[95:64 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 92,0,plaintext1[127:96],resp);

    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 96,0,plaintext2[31:0  ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 100,0,plaintext2[63:32 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 104,0,plaintext2[95:64 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 108,0,plaintext2[127:96],resp);
    
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 112,0,plaintext3[31:0  ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 116,0,plaintext3[63:32 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 120,0,plaintext3[95:64 ],resp);
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + 124,0,plaintext3[127:96],resp);





*/



/*

    addr = 0;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext0[31:0],resp);
    addr = 4;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext0[63:32],resp);
    addr = 8;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext0[95:64],resp);
    addr = 12;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext0[127:96],resp);
    addr = 16;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext1[31:0],resp);
    addr = 20;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext1[63:32],resp);
    addr = 24;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext1[95:64],resp);
    addr = 28;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext1[127:96],resp);
    addr = 32;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext2[31:0],resp);
    addr = 36;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext2[63:32],resp);
    addr = 44;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext2[95:64],resp);
    addr = 44;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext2[127:96],resp);
    addr = 48;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext3[31:0],resp);
    addr = 52;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext3[63:32],resp);
    addr = 56;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext3[95:64],resp);
    addr = 60;
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,plaintext3[127:96],resp);



*/


/*

    
//    master_agent_vpi0.AXI4_READ_BURST(
//    0,
//    base_addr + addr,
//    8, //beat lenght
//    XIL_AXI_SIZE_4BYTE,  //size = 2 -> beat = 4 bytes
//    XIL_AXI_BURST_TYPE_INCR,  //burst
//    XIL_AXI_ALOCK_NOLOCK,
//    0,
//    0,
//    0,
//    0,
//    0,
//    data_512,
//    resp_full,
//    ruser_full
//    );
*/

/*
 //Send 0x1 to the AXI GPIO Data register 1
    
    addr = 0;
    data = plaintext0[31:0];
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);
    
    //Send 0x0 to the AXI GPIO Data register 1
    
    addr = 4;
    data = plaintext0[63:32];
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);
    
    //Send 0x0 to the AXI GPIO Data register 1
    
    addr = 8;
    data = plaintext0[95:64];
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);
    
    //Send 0x0 to the AXI GPIO Data register 1
    
    addr = 12;
    data = plaintext0[127:96];
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);


    //------------------------ READ -----------------------------------
    addr = 0;
    master_agent_vpi1.AXI4LITE_READ_BURST(base_addr + addr,0,data,resp);
    data_128[31:0] = data;
    
    addr = 4;
    master_agent_vpi1.AXI4LITE_READ_BURST(base_addr + addr,0,data,resp);
    data_128[63:32] = data;

    addr = 8;
    master_agent_vpi1.AXI4LITE_READ_BURST(base_addr + addr,0,data,resp);
    data_128[95:64] = data;   
     
    addr = 12;
    master_agent_vpi1.AXI4LITE_READ_BURST(base_addr + addr,0,data,resp);
    data_128[127:96] = data;
    
   
   
   //send data again
    
    addr = 0+32;
    data = data_128[31:0];
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);

    addr = 4+32;
    data = data_128[63:32];
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);
    

    addr = 8+32;
    data = data_128[95:64];
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);
    

    addr = 12+32;
    data = data_128[127:96];
    master_agent_vpi1.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);

*/








/////////////////////////////////////////////////////////////////////////////////////////////////////////












/*
    addr = 0;
    data = plaintext0[31:0];
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);
    
    //Send 0x0 to the AXI GPIO Data register 1
    
    addr = 4;
    data = plaintext0[63:32];
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);
    
    //Send 0x0 to the AXI GPIO Data register 1
    
    addr = 8;
    data = plaintext0[95:64];
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);
    
    //Send 0x0 to the AXI GPIO Data register 1
    
    addr = 12;
    data = plaintext0[127:96];
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr,0,data,resp);


    //------------------------ READ -----------------------------------
    addr = 0;
    master_agent_reader.AXI4LITE_READ_BURST(base_addr + addr,0,data,resp);
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr + 32,0,data,resp);
    
    addr = 4;
    master_agent_reader.AXI4LITE_READ_BURST(base_addr + addr,0,data,resp);
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr + 32,0,data,resp); 
    
    addr = 8;
    master_agent_reader.AXI4LITE_READ_BURST(base_addr + addr,0,data,resp);
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr + 32,0,data,resp);
    
    addr = 12;
    master_agent_reader.AXI4LITE_READ_BURST(base_addr + addr,0,data,resp);
    master_agent.AXI4LITE_WRITE_BURST(base_addr + addr + 32,0,data,resp);
*/


