`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2023 12:28:34 PM
// Design Name: 
// Module Name: aes
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

	module aes # 
	(
		// Users to add parameters here
        
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXI
		parameter integer C_M00_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M00_AXI_DATA_WIDTH	= 32
	)
	(
		// Users to add ports here
        input wire clk,
        input wire reset_n,
        
        input wire          new_bit,
        input wire  [127:0] in_IV,
        input wire  [255:0] dbg_key,
        input wire  [1:0] dbg_ENCLEN        ,
//        output wire dbg_ENCDEC     ,
//        output wire dbg_core_init     ,
//        output wire dbg_core_next     ,
//        output wire dbg_core_ready    ,
//        output wire [255:0]dbg_core_key      ,
//        output wire  dbg_KEYLEN        ,
//        output wire [127:0] dbg_core_block    ,
//        output wire [127:0] dbg_core_result   ,
//        output wire dbg_core_valid    ,
        
//        output wire [127:0] dbg_send_fifo_out,
//        output wire [1:0]   dbg_send_4word_cnt,
        
        
//        output wire dbg_send_fifo_empty    ,
//        output wire [3:0]dbg_send_state         ,
//        output wire [3:0]dbg_send_next_state    ,
//        output wire dbg_send_fifo_re       ,
//        output wire dbg_send_cnt_we        ,
        
//        output wire [3:0]       dbg_aes_state            ,
//        output wire [3:0]       dbg_aes_next_state       ,
//        output wire [127:0]     dbg_core_last_block      ,
//        output wire             dbg_core_last_block_we   ,
//        output wire             dbg_core_new_IV          ,
//        output wire  [127:0]    dbg_core_result_cbc      ,
        
        
        
        
        
        
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output reg  s00_axi_arready,
		output reg [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output reg [1 : 0] s00_axi_rresp,
		output reg  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXI
		input wire  m00_axi_aclk,
		input wire  m00_axi_aresetn,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_awaddr,
		output wire [2 : 0] m00_axi_awprot,
		output wire  m00_axi_awvalid,
		input wire  m00_axi_awready,
		output wire [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_wdata,
		output wire [C_M00_AXI_DATA_WIDTH/8-1 : 0] m00_axi_wstrb,
		output wire  m00_axi_wvalid,
		input wire  m00_axi_wready,
		input wire [1 : 0] m00_axi_bresp,
		input wire  m00_axi_bvalid,
		output wire  m00_axi_bready,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0]  m00_axi_araddr,
		output wire [2 : 0]                       m00_axi_arprot,
		output reg                               m00_axi_arvalid,
		input wire                                m00_axi_arready,
		input wire [C_M00_AXI_DATA_WIDTH-1 : 0]   m00_axi_rdata,
		input wire [1 : 0]                        m00_axi_rresp,
		input wire                                m00_axi_rvalid,
		output reg                               m00_axi_rready
	);
assign		m00_axi_awaddr = 0;
assign		m00_axi_awprot= 0;
assign		m00_axi_awvalid= 0;
assign		m00_axi_wdata= 0;
assign		m00_axi_wstrb= 0;
assign		m00_axi_wvalid= 0;
assign		m00_axi_bready= 0;



//assign dbg_ENCDEC          = ENCDEC         ;
//assign dbg_core_init       = core_init      ;
//assign dbg_core_next       = core_next      ;
//assign dbg_core_ready      = core_ready     ;
//assign dbg_core_key        = core_key       ;
//assign dbg_KEYLEN          = KEYLEN         ;
//assign dbg_core_block      = core_block     ;
//assign dbg_core_result     = core_result    ;
//assign dbg_core_valid      = core_valid     ;

//assign dbg_send_fifo_out    = send_fifo_out;
//assign dbg_send_4word_cnt = send_4word_cnt;
//assign dbg_send_fifo_empty   = send_fifo_empty   ; 
//assign dbg_send_state        = send_state        ;
//assign dbg_send_next_state   = send_next_state   ;
//assign dbg_send_fifo_re      = send_fifo_re      ; 
//assign dbg_send_cnt_we       = send_cnt_we       ; 
 
 
//assign dbg_aes_state           = aes_state           ;
//assign dbg_aes_next_state      = aes_next_state      ;
//assign dbg_core_last_block     = core_last_block     ;
//assign dbg_core_last_block_we  = core_last_block_we  ;
//assign dbg_core_new_IV         = core_new_IV         ;
//assign dbg_core_result_cbc     = core_result_cbc     ;
 
 
///////////////////////////////////////////////////////////////////////////////// ADDRES DECODING ///////////////////////////////////////////////////////////////////////////

// -------------------------------- ADDR fifo ----------------------------------------------------------------------------------------
localparam ADDR_FIFO_WIDTH = 3+32;

reg     addr_fifo_we;
reg     addr_fifo_re;
wire    addr_fifo_full;
wire    addr_fifo_empty;
wire    addr_fifo_threshold;

reg     [ADDR_FIFO_WIDTH-1:0] recv_fifo_in;
wire    [ADDR_FIFO_WIDTH-1:0] recv_fifo_out;

synchronous_fifo #(8,ADDR_FIFO_WIDTH, 4)   // 4 de threshold
addr_fifo( 
    .clk        (clk),
    .rst_n      (reset_n),
    .w_en       (addr_fifo_we),
    .r_en       (addr_fifo_re),
    .data_in    ({addr_fifo_latest_prot, addr_fifo_latest_addr}),
    .data_out   ({m00_axi_arprot, m00_axi_araddr}),
    .full_out   (addr_fifo_full),
    .empty      (addr_fifo_empty),
    .threshold_reached (addr_fifo_threshold)
); 

//------------------------------------------ from SLAVE ADDR -------------------------------------
reg [32-1:0]            addr_fifo_latest_addr;       //tells wich addres was incerted lastest in addr_fifo
reg [32-1:0]            addr_fifo_latest_prot;
reg                     addr_fifo_latest_we;
reg [1:0]               addr_offset_count;
reg                     addr_in_we;

localparam  ADDR_ST_Init             = 4'd0,
            ADDR_ST_Idle             = 4'd1,
            ADDR_ST_GetAddr          = 4'd2,
            ADDR_ST_HandSh           = 4'd3,
            ADDR_ST_Fill             = 4'd4;
     
reg [3:0]       addr_state;
reg [3:0]       addr_next_state;

always @(posedge clk)begin
    if(!reset_n)begin
        addr_state <= ADDR_ST_Init;
        
        addr_fifo_latest_addr   <= 0;
        addr_fifo_latest_prot   <= 0;
        addr_offset_count       <= 0;
    end
    else begin
        addr_state      <= addr_next_state;
        
    //register update
    addr_fifo_we <= 0;
    
    if(addr_in_we)begin         //get the ARADDR and ARPROT
        addr_fifo_latest_addr       <= s00_axi_araddr;      
        addr_fifo_latest_prot       <= s00_axi_arprot;
        addr_fifo_we                <= 1;
        addr_offset_count           <= 1;                   
    end
    if(addr_fifo_latest_we)begin
       addr_fifo_latest_addr        <= addr_fifo_latest_addr + 4 ;
       addr_fifo_we                 <= 1;
       addr_offset_count            <= addr_offset_count + 1;      
    end 
    end //else begin
end


//next state logic
always@(*)begin
    addr_next_state = addr_state;
    
    case(addr_state)
        ADDR_ST_Init:begin
                addr_next_state <= ADDR_ST_Idle;
        end
        ADDR_ST_Idle:begin
            if(s00_axi_arvalid)begin
                 if(s00_axi_araddr <= addr_fifo_latest_addr && (s00_axi_araddr > addr_fifo_latest_addr - 16)) //verifies if the addr is already in the fifo
                    addr_next_state = ADDR_ST_HandSh;
                 if((s00_axi_araddr > addr_fifo_latest_addr || s00_axi_araddr < addr_fifo_latest_addr -16)&& addr_fifo_threshold) //addr_fifo_threshold means that there is atleast 4 empty places in fifo
                    addr_next_state = ADDR_ST_GetAddr;
            end
        end
        ADDR_ST_GetAddr:begin
                addr_next_state = ADDR_ST_Fill;
        end
        ADDR_ST_HandSh:begin
                addr_next_state = ADDR_ST_Idle;
        end
        ADDR_ST_Fill:begin
            if(addr_offset_count == 3)
                addr_next_state = ADDR_ST_Idle;
        end
        
    endcase
end 


//output logic
always@(*)begin
    //back to default values
    addr_in_we                  = 0;
    s00_axi_arready             = 0;
    addr_fifo_latest_we         = 0;
    
    case(addr_state)
        ADDR_ST_Init:begin
                     
        end
        ADDR_ST_Idle:begin

        end
        ADDR_ST_GetAddr:begin                        
            s00_axi_arready             = 1;            
            addr_in_we                  = 1;
            
        end
        ADDR_ST_HandSh:begin
            s00_axi_arready             = 1;
        end
        ADDR_ST_Fill:begin
            addr_fifo_latest_we         = 1;
        end
        
    endcase
end


//----------------------------------------------------------- to MASTER ADDR -------------------------------------
 reg [1:0] mst_state;

  always @(posedge clk) begin
    if (!reset_n) begin
      mst_state         <= 2'b00;  // Initial state
      m00_axi_arvalid   <= 0;
      addr_fifo_re      <= 0; 
    end 
    else begin
      case (mst_state)
        2'b00: begin  // Idle state
          if (!addr_fifo_empty) begin
            mst_state       <= 2'b01;  // Start sending addr
            addr_fifo_re    <= 1;
          end
        end
        2'b01: begin  //get addr from fifo
            mst_state       <= 2'b10;  
            m00_axi_arvalid <= 1;
            addr_fifo_re    <= 0;
        end
        2'b10: begin // Addr transfer state
             if(m00_axi_arready)begin
             mst_state          <= 2'b00;            
             m00_axi_arvalid    <= 0; // Data sent, go back to idle state
            end
        end
      endcase
    end
  end


//////////////////////////////////////////////////////////////////////////////// DATA RECEIVE /////////////////////////////////////////////////////////////////////////////////////////////
// -------------------------------- RECV fifo ----------------------------------------------------------------------------------------
localparam RECV_FIFO_WIDTH = 128;

reg    recv_fifo_we;
reg    recv_fifo_re;
wire   recv_fifo_full;
wire   recv_fifo_empty;

reg [127:0] recv_fifo_data_in;
wire [127:0] recv_fifo_data_out;
synchronous_fifo #(16,RECV_FIFO_WIDTH)
recv_fifo( 
    .clk        (clk),
    .rst_n      (reset_n),
    .w_en       (recv_fifo_we),
    .r_en       (recv_fifo_re),
    .data_in    (recv_fifo_data_in),
    .data_out   (recv_fifo_data_out),
    .full_out   (recv_fifo_full),
    .empty      (recv_fifo_empty)
); 

reg [31:0]      recv_4word [3:0];
reg             recv_4word_en;
reg [1:0]       recv_4word_cnt;
reg             recv_4word_full;

localparam  RECV_ST_Init             = 4'd0,
            RECV_ST_Idle             = 4'd1,
            RECV_ST_GetData          = 4'd2,
            RECV_ST_WriteFifo        = 4'd3;
    
reg [3:0]       recv_state;
reg [3:0]       recv_next_state;

always @(posedge clk)begin
    if(!reset_n)begin
        recv_state <= RECV_ST_Init;
        
        recv_4word[0]   <= 0;
        recv_4word[1]   <= 0;
        recv_4word[2]   <= 0;
        recv_4word[3]   <= 0;
        recv_4word_cnt  <= 0;
    end
    else begin
        recv_state      <= recv_next_state;
        
    //register update
    recv_fifo_we <= 0;
    
    if(recv_4word_en)begin         
        recv_4word[recv_4word_cnt] <= m00_axi_rdata;
        recv_4word_cnt      <= recv_4word_cnt + 1; 
    end
    if(recv_4word_full)begin
        recv_fifo_we        <= 1;
        recv_4word_cnt      <= 0; 

    end 

    end //else begin
end

//next state logic
always@(*)begin
    recv_next_state = recv_state;
    
    case(recv_state)
        RECV_ST_Init:begin
            recv_next_state = RECV_ST_Idle;
        end
        RECV_ST_Idle:begin
            if(m00_axi_rvalid && !recv_fifo_full)
                recv_next_state = RECV_ST_GetData;
        end
        RECV_ST_GetData:begin
            recv_next_state = RECV_ST_Init;
            if(recv_4word_cnt == 3)             //recv_4word is full    
                recv_next_state = RECV_ST_WriteFifo;
        end
        RECV_ST_WriteFifo:begin                 //write recv_4word to recv_fifo
            recv_next_state = RECV_ST_Init;
        end
    endcase
end 


//output logic
always@(*)begin  
    //back to default values
    m00_axi_rready  = 0;
    recv_4word_en   = 0;
    recv_4word_full = 0;
    
    recv_fifo_data_in = {recv_4word[3],recv_4word[2],recv_4word[1],recv_4word[0]};
    
    case(recv_state)
        RECV_ST_Init:begin
           
        end
        RECV_ST_Idle:begin
        end
        RECV_ST_GetData:begin                        
            recv_4word_en   = 1;
            m00_axi_rready  = 1;
        end
        RECV_ST_WriteFifo:begin                 //write recv_4word to recv_fifo
            recv_4word_full = 1;
        end
        
    endcase
end


////////////////////////////////////////////////////////////////////////////// DATA PROCESS ////////////////////////////////////////////////////////////////////////////////////////////////////
////---------------------- AES ----------------------------------------------------------------
wire ENCDEC;
wire KEYLEN;
assign ENCDEC = dbg_ENCLEN[0:0];
assign KEYLEN = dbg_ENCLEN[1:1];

wire [255:0]    core_key;
assign core_key = dbg_key;

reg             core_init;
reg             core_next;
wire [127:0]     core_block;

wire [127:0]    core_result;
wire            core_valid;
wire            core_ready;

reg [127:0]     core_last_block;
reg             core_last_block_we;
reg             core_new_IV;
wire [127:0]    core_result_cbc;

assign core_block = {     
      recv_fifo_data_out[7:0],
      recv_fifo_data_out[15:8],
      recv_fifo_data_out[23:16],
      recv_fifo_data_out[31:24],
      recv_fifo_data_out[39:32],
      recv_fifo_data_out[47:40],
      recv_fifo_data_out[55:48],
      recv_fifo_data_out[63:56],
      recv_fifo_data_out[71:64],
      recv_fifo_data_out[79:72],
      recv_fifo_data_out[87:80],
      recv_fifo_data_out[95:88],
      recv_fifo_data_out[103:96],
      recv_fifo_data_out[111:104],
      recv_fifo_data_out[119:112],
      recv_fifo_data_out[127:120]
    };
    
aes_core core(
    .clk            (clk),
    .reset_n        (reset_n),

    .encdec         (ENCDEC),
    .init           (core_init),
    .next           (core_next),
    .ready          (core_ready),

    .key            (core_key),
    .keylen         (KEYLEN),

    .block          (core_block),
    .result         (core_result),
    .result_valid   (core_valid)
);


//--------------------------------------------- AES FSM ----------------------------------
/*
    responsible to:
        - get the values from the RECV_FIFO
        - menage the signals from/to the AES module
        - forward the result to the SEND_FIFO       (this will be done the pipeline fashion later)
*/
localparam  AES_ST_Init             = 4'd0,
            AES_ST_Idle             = 4'd1,
            AES_ST_GetData          = 4'd2,
            AES_ST_StartProc        = 4'd3,
            AES_ST_Processing       = 4'd4,
            AES_ST_GetResult        = 4'd5,
            AES_ST_AESinit          = 4'd6,
            AES_ST_AESiniting       = 4'd7;
          
reg [3:0] aes_state;
reg [3:0] aes_next_state;

always @(posedge clk)begin
    if(!reset_n || new_bit)begin     //reset or there is a new bit so we need to update the Initialization Vector (IV)
        aes_state <= AES_ST_Init;
    end
    else begin
        aes_state <= aes_next_state;
    end //else begin
    
    if(core_last_block_we)begin
        if(core_new_IV)
        core_last_block <= in_IV;
        else
        core_last_block <= core_block;
    end
    
        
end

//next state logic
always@(*)begin
    aes_next_state = aes_state;
    
    case(aes_state)
        AES_ST_Init:begin
            aes_next_state = AES_ST_Idle;
        end
        AES_ST_Idle:begin
        if(!recv_fifo_empty && core_ready)
            aes_next_state = AES_ST_GetData;
        end
        AES_ST_GetData:begin
            aes_next_state = AES_ST_AESinit;
        end
        AES_ST_AESinit:begin
            aes_next_state = AES_ST_AESiniting;
        end
        AES_ST_AESiniting:begin
        if(core_ready)
            aes_next_state = AES_ST_StartProc;
        end
        AES_ST_StartProc:begin
            aes_next_state = AES_ST_Processing;
        end
        AES_ST_Processing:begin     
        if(core_valid && !send_fifo_full)                  //waits until the block is processed by the AES CORE
            aes_next_state = AES_ST_GetResult;
        end
        AES_ST_GetResult:begin
            aes_next_state = AES_ST_Idle;
        end
        default
            aes_next_state = AES_ST_Init; 
    endcase
end 

//output logic

always@(*)begin
   
    //back to default values
    recv_fifo_re    = 0;
    core_next       = 0;
    core_init       = 0;
    send_fifo_we    = 0;
    core_last_block_we = 0;
    core_new_IV     = 0; 
    
   
    case(aes_state)
        AES_ST_Init:begin
//            core_init = 1;
            core_new_IV = 1;
            core_last_block_we = 1;       
        end
        AES_ST_Idle:begin
            
        end
        AES_ST_GetData:begin
            recv_fifo_re = 1;
        end
        AES_ST_AESinit:begin
            core_init = 1;
        end
        AES_ST_AESiniting:begin
                   
        end
        AES_ST_StartProc:begin
            core_next = 1;          //
        end
        AES_ST_Processing:begin
        
        end
        AES_ST_GetResult:begin
            send_fifo_we = 1;
                        core_last_block_we = 1;          


        end
        
    endcase
end


assign core_result_cbc = core_result ^ core_last_block;   //XOR with last block for CBC

///////////////////////////////////////////////////////////////////////////// DATA SEND ///////////////////////////////////////////////////////////////////////////////////////////////////////
// -------------------------------- SEND fifo ------------------------------------------
localparam SEND_FIFO_WIDTH = 128;

reg     send_fifo_we;
reg     send_fifo_re;
wire    send_fifo_full;
wire    send_fifo_empty;

wire [127: 0]   send_fifo_out;
wire [31:0]     send_4word [3:0];
reg  [1:0]      send_4word_cnt;
reg             send_cnt_we; 

assign    send_4word [0]   = {  send_fifo_out[103:96],
                                send_fifo_out[111:104], 
                                send_fifo_out[119:112], 
                                send_fifo_out[127:120]   };
                                
assign    send_4word [1]   = {  send_fifo_out[71:64],     
                                send_fifo_out[79:72], 
                                send_fifo_out[87:80], 
                                send_fifo_out[95:88]   };
                                
assign    send_4word [2]   = {  send_fifo_out[39:32], 
                                send_fifo_out[47:40], 
                                send_fifo_out[55:48], 
                                send_fifo_out[63:56]   };
                                
assign    send_4word [3]   = {  send_fifo_out[7:0], 
                                send_fifo_out[15:8], 
                                send_fifo_out[23:16], 
                                send_fifo_out[31:24]   };

    
synchronous_fifo #(16,SEND_FIFO_WIDTH)
send_fifo( 
    .clk        (clk),
    .rst_n      (reset_n),
    .w_en       (send_fifo_we),
    .r_en       (send_fifo_re),
    .data_in    (core_result_cbc),
    .data_out   (send_fifo_out),
    .full_out   (send_fifo_full),
    .empty      (send_fifo_empty)
); 

//--------------------------------------------- SEND FSM ----------------------------------
/*
    responsible to:
        - get the values from the RECV_FIFO
        - menage the signals from/to the AES module
        - forward the result to the SEND_FIFO       (this will be done the pipeline fashion later)
*/
localparam  SEND_ST_Init             = 4'd0,
            SEND_ST_Idle             = 4'd1,
            SEND_ST_GetData          = 4'd2,
            SEND_ST_Send             = 4'd3,
            SEND_ST_NextWord         = 4'd4;

          
reg [3:0] send_state;
reg [3:0] send_next_state;

always @(posedge clk)begin
    if(!reset_n)begin
        send_state <= SEND_ST_Init;
    end
    else begin
        send_state <= send_next_state;
    end //else begin
    
    if(send_fifo_re)begin
         send_4word_cnt  <= 0;     //reset index counter
    end
    if(send_cnt_we)begin
         send_4word_cnt  <= send_4word_cnt + 1;
    end
    
    
end

//next state logic
always@(*)begin
    send_next_state = send_state;
    
    case(send_state)
        SEND_ST_Init:begin
            send_next_state = SEND_ST_Idle;
        end
        SEND_ST_Idle:begin
            if(!send_fifo_empty)
            send_next_state = SEND_ST_GetData;
        end
        SEND_ST_GetData:begin
            send_next_state = SEND_ST_Send;
        end
        SEND_ST_Send:begin
            
            if(send_4word_cnt == 3)
            send_next_state = SEND_ST_Idle;
            else
            send_next_state = SEND_ST_NextWord;
            
        end
        SEND_ST_NextWord:begin
            if(s00_axi_rready)
            send_next_state = SEND_ST_Send;         
        end
        
    endcase
end 

//output logic

always@(*)begin
   
    //back to default values
    send_fifo_re        = 0;    
  
    s00_axi_rdata       = send_4word [send_4word_cnt];
    s00_axi_rresp       = 0;
    s00_axi_rvalid      = 0;
    send_cnt_we = 0;
    
    case(send_state)
        SEND_ST_Init:begin
            
        end
        SEND_ST_Idle:begin
            
        end    
        SEND_ST_GetData:begin
            send_fifo_re    = 1;
           
        end
        SEND_ST_Send:begin
            s00_axi_rvalid = 1;    
        end
        SEND_ST_NextWord:begin
            send_cnt_we = 1;
        end
    endcase
end


endmodule                           


