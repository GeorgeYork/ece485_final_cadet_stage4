library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hazard_detection_unit is
    Port (
        reset :          in STD_LOGIC;
        if_id_mem_read : in STD_LOGIC;                      -- previous instr mem read
        if_id_load_addr : in STD_LOGIC;                     -- previous instr load addr
        instr    : in STD_LOGIC_VECTOR(31 downto 0);        -- current  instr
        if_id_instr    : in STD_LOGIC_VECTOR(31 downto 0);  -- previous instr
        if_id_rd       : in STD_LOGIC_VECTOR(4 downto 0);   -- previous instr destination register
        rs1      : in STD_LOGIC_VECTOR(4 downto 0);         -- current  instr source register
        rs2      : in STD_LOGIC_VECTOR(4 downto 0);         -- current  instr source register
        -- need any other input registers?
        stall_counter  : in integer range 0 to 3 := 0;
        start_stall    : out STD_LOGIC;
        double_stall   : out STD_LOGIC
    );
end hazard_detection_unit;

-- NOTE: only looks one instruction before dependency (not two or three before)
architecture Behavioral of hazard_detection_unit is
    -- declare any internal signals?
begin
    -- would opcodes of instructions be useful?

    process(if_id_mem_read, if_id_rd, rs1, rs2, if_id_opcode, opcode, stall_counter) -- any others?)
    begin      
        if (reset = '1') then
            start_stall <= '0';
            double_stall <= '0';
        -- stall cases, dependency on a (1)load from memory, (2) load_addr
        elsif (<what control signals and/or opcodes?>) 
              and (<what control signals and opcodes?>) then -- single stall data dependency case
                start_stall <= '1';
        elsif (<what control signals and/or opcodes?>) --(3) add, (4) addi/subi
              and (<what control signals and/or opcodes?>)  -- stall data dependency case
              and (<what control signals and/or opcodes?>) then --BNE double stall
                    start_stall <= '1';
                    double_stall <= '1';
        elsif -- stall cases for branch or jump, needing time to calulate branch address, etc
              (<what control signals and/or opcodes?>) then 
                start_stall <= '1';  
                double_stall <= '0';    
        else        
                start_stall <= '0';
        end if;    
        
    end process;
end Behavioral;
