library verilog;
use verilog.vl_types.all;
entity Cin is
    port(
        s1              : in     vl_logic;
        s0              : in     vl_logic;
        cin             : out    vl_logic
    );
end Cin;
