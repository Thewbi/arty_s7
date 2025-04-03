module mux3 #(parameter WIDTH = 32) (

    input wire [WIDTH-1:0] d0,  // input A (selector: 00)
    input wire [WIDTH-1:0] d1,  // input B (selector: 01)
    input wire [WIDTH-1:0] d2,  // input C (selector: 1?)
    input wire [1:0] s,         // selector signal

    output wire [WIDTH-1:0] y    // output
);

    assign y = s[1] ? d2 : (s[0] ? d1 : d0);

    // //always @*
    // always @(d0, d1, d2, s)
    // begin

    //     if (s == 2'b00)
    //     begin
    //         y = d0;
    //     end
    //     else if (s == 2'b01)
    //     begin
    //         y = d1;
    //     end
    //     else if (s == 2'b10)
    //     begin
    //         y = d2;
    //     end
    //     else
    //     begin
    //        y = d2;
    //     end
    // end

endmodule