module Traffic_Light_Controller(
    input clk,rst,
    output reg [2:0]light_S,
    output reg [2:0]light_E,
    output reg [2:0]light_N,
    output reg [2:0]light_W 
	 );
	 
    parameter  S1=0, S2=1, S3 =2, S4=3, S5=4, S6=5, S7=6, S8=7;
    reg [3:0] count;
    reg [2:0] ps;
    parameter  sec7=9,sec5=4;
	 
    always@(posedge clk)
        begin
        if(rst==1)
        begin
        ps<=S1;
        count<=0;
        end
        else 
            case(ps)
                S1: if(count<sec7)
                        begin
                        ps<=S1;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S2;
                        count<=0;
                        end
                        
                S2: if(count<sec5)
                        begin
                        ps<=S2;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S3;
                        count<=0;
                        end
                S3: if(count<sec7)
                        begin
                        ps<=S3;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S4;
                        count<=0;
                        end
                S4:if(count<sec5)
                        begin
                        ps<=S4;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S5;
                        count<=0;
                        end
                S5:if(count<sec7)
                        begin
                        ps<=S5;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S6;
                        count<=0;
                        end
                S6:if(count<sec5)
                        begin
                        ps<=S6;
                        count<=count+1;
                        end
                        else
                        begin
                        ps<=S7;
                        count<=0;
                        end
                S7:if(count<sec7)
                        begin
                        ps<=S7;
                        count<=count+1;
                        end
                        else
                        begin
                        ps<=S8;
                        count<=0;
                        end
                S8:if(count<sec5)
                         begin
                         ps<=S8;
                         count<=count+1;
                         end
                         else
                         begin
                         ps<=S1;
                         count<=0;
                         end       
                default: ps<=S1;
                endcase
            end   

            always@(ps)    
            begin   
            case(ps)          
                    S1:
                    begin
                       light_S<=3'b100;
                       light_E<=3'b100;
                       light_N<=3'b100;
                       light_W<=3'b010;
                    end
                    S2:
                                        begin
                                           light_S<=3'b100;
                                           light_E<=3'b100;
                                           light_N<=3'b001;
                                           light_W<=3'b001;
                                        end
                    S3:
                    begin 
                       light_S<=3'b100;
                       light_E<=3'b100;
                       light_N<=3'b010;
                       light_W<=3'b100;
                    end
                    S4:
                                        begin 
                                           light_S<=3'b100;
                                           light_E<=3'b001;
                                           light_N<=3'b001;
                                           light_W<=3'b100;
                                           end
                    S5:
                    begin
                       light_S<=3'b100;
                       light_E<=3'b010;
                       light_N<=3'b100;
                       light_W<=3'b100;
                    end
                     S6:
                                       begin
                                          light_S<=3'b001;
                                          light_E<=3'b001;
                                          light_N<=3'b100;
                                          light_W<=3'b100;
                                       end
                    S7:
                    begin
                       light_S<=3'b010;
                       light_E<=3'b100;
                       light_N<=3'b100;
                       light_W<=3'b100;
                    end
                    S8:
                                        begin
                                           light_S<=3'b001;
                                           light_E<=3'b100;
                                           light_N<=3'b100;
                                           light_W<=3'b001;
                                        end
                    
                    default:
                    begin 
                       light_S<=3'b001;
                       light_E<=3'b001;
                       light_N<=3'b001;
                       light_W<=3'b001;
                    end
                  endcase
            end                         
endmodule
