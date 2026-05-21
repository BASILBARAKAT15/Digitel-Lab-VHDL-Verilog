`timescale 1ns / 1ps



// Code your design here
module LCD_Driver ( CLK , E , RS , RW , Data );
  input CLK ;
  output reg E;
  output reg RS;
  output reg RW;
  output reg [7:0] Data;
  
  integer CLK_CYCLIST = 0 ;
  
  always @( posedge CLK ) begin
    
    // 1) Startup
    if (CLK_CYCLIST == 0) begin
      E = 0;
      RS = 0;
      RW = 0;
    end
   
    
    // 2) Configuration (same as before)
    if (CLK_CYCLIST == 2000000)
     begin 
     E = 1; 
     Data = 8'h38;
      end
    if (CLK_CYCLIST == 20000100) 
    begin
     E = 0;
     end
    
    if (CLK_CYCLIST == 20004100)
     begin 
     E = 1; 
     Data = 8'h06; 
     end
    if (CLK_CYCLIST == 20004200)
     begin 
     E = 0;
      end
    
    if (CLK_CYCLIST == 20008200) 
    begin E = 1;
     Data = 8'h0C;
      end
    if (CLK_CYCLIST == 20008300) 
    begin E = 0; 
    end
    
    if (CLK_CYCLIST == 20012300)
     begin E = 1;
      Data = 8'h01;
       end
    if (CLK_CYCLIST == 20012400) 
    begin
     E = 0;
      end
    
           
    
  
    
    //3) Display
    //First line: "abdallah"
    if (CLK_CYCLIST == 20176400)
     begin 
     E = 1; 
     Data = 8'h84;
      end // Set DDRAM to line 1
    if (CLK_CYCLIST == 20176500) 
    begin
     E = 0;
     end
     
    if (CLK_CYCLIST == 20180500) 
    begin 
    RS = 1;
     end
    if (CLK_CYCLIST == 20180600)
     begin 
     E = 0; 
     end
    
    // a
    if (CLK_CYCLIST == 20184600) 
    begin 
    E = 1; 
    Data = 8'h61;
     end
    if (CLK_CYCLIST == 20184700)
     begin 
     E = 0;
      end
    // b
    if (CLK_CYCLIST == 20188700)
     begin E = 1; 
     Data = 8'h62;
      end
    if (CLK_CYCLIST == 20188800)
     begin 
     E = 0;
      end
    // d
    if (CLK_CYCLIST == 20192800)
     begin
      E = 1;
      Data = 8'h64;
      end
    if (CLK_CYCLIST == 20192900) 
    begin 
    E = 0; 
    end
    
    // a
    if (CLK_CYCLIST == 20196900)
     begin E = 1; 
     Data = 8'h61;
      end
      
    if (CLK_CYCLIST == 20197000)
     begin 
     E = 0;
      end
    // l
    
    if (CLK_CYCLIST == 20201000) 
    begin 
    E = 1; 
    Data = 8'h6C;
     end
    if (CLK_CYCLIST == 20201100)
     begin
      E = 0; 
      end
      
    // l
    if (CLK_CYCLIST == 20205100)
     begin 
     E = 1; 
     Data = 8'h6C;
      end
      
    if (CLK_CYCLIST == 20205200)
     begin 
     E = 0; 
     end
     
    // a
    if (CLK_CYCLIST == 20209200) 
    begin 
    E = 1; 
    Data = 8'h61;
     end
     
    if (CLK_CYCLIST == 20209300)
     begin
      E = 0;
       end
       
    // h
    if (CLK_CYCLIST == 20213300) 
    begin
     E = 1; 
     Data = 8'h68;
      end
    if (CLK_CYCLIST == 20213400) 
    begin 
    E = 0;
     end
    
    // Move to second line: "12241040"
    if (CLK_CYCLIST == 20217400)
     begin 
     RS = 0;
      end
      
    if (CLK_CYCLIST == 20217500) 
    begin
     E = 0;
      end
      
    if (CLK_CYCLIST == 20221500) 
    begin
     E = 1;
      Data = 8'hC4;
       end
       
    if (CLK_CYCLIST == 20221600) 
    begin
     E = 0;
      end
      
    if (CLK_CYCLIST == 20225600)
     begin 
     RS = 1; 
     end
    
    // 1
    if (CLK_CYCLIST == 20225700)
     begin 
     E = 1; 
     Data = 8'h31;
      end
      
    if (CLK_CYCLIST == 20225800) 
    begin 
    E = 0; 
    end
    
    // 2
    if (CLK_CYCLIST == 20229800) 
    begin 
    E = 1; 
    Data = 8'h32;
     end
    if (CLK_CYCLIST == 20229900) 
    begin 
    E = 0; 
    end
    
    // 2
    if (CLK_CYCLIST == 20233900) 
    begin 
    E = 1;
     Data = 8'h32;
      end
      
    if (CLK_CYCLIST == 20234000) 
    begin
     E = 0;
      end
      
    // 4
    if (CLK_CYCLIST == 20238000) 
    begin 
    E = 1; 
    Data = 8'h34;
     end
     
    if (CLK_CYCLIST == 20238100) 
    begin E = 0;
     end
     
    // 1
    if (CLK_CYCLIST == 20242100)
     begin 
     E = 1; 
     Data = 8'h31; 
      end
      
    if (CLK_CYCLIST == 20242200)
     begin 
     E = 0;
      end
      
    // 0
    if (CLK_CYCLIST == 20246200) 
    begin E = 1; 
    Data = 8'h30; 
    end
    
    if (CLK_CYCLIST == 20246300)
     begin
      E = 0;
       end
       
    // 4
    if (CLK_CYCLIST == 20250300) 
    begin 
    E = 1; 
    Data = 8'h34; 
    end
    if (CLK_CYCLIST == 20250400)
     begin 
     E = 0;
      end
      
    // 0
    if (CLK_CYCLIST == 20254400)
     begin
      E = 1;
       Data = 8'h30;
        end
        
    if (CLK_CYCLIST == 20254500) 
    begin E = 0; 
    end
    
    // Reset
    if (CLK_CYCLIST >= 20254500)
     begin
      CLK_CYCLIST = 0;
    end
     else 
     begin
      CLK_CYCLIST = CLK_CYCLIST + 1;
    end
  end
endmodule