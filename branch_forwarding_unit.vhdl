library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity  branch_forwarding_unit is
      Port (
            ex_mem_alu_result : in STD_LOGIC_VECTOR(31 downto 0);
            mem_wb_mem_data   : in STD_LOGIC_VECTOR(31 downto 0);
            reg1_data         : in STD_LOGIC_VECTOR(31 downto 0);
            if_id_rs1         : in STD_LOGIC_VECTOR(4 downto 0);
            ex_mem_rd         : in STD_LOGIC_VECTOR(4 downto 0);
            mem_wb_rd         : in STD_LOGIC_VECTOR(4 downto 0);
            ex_mem_reg_write  : in STD_LOGIC;
            mem_wb_mem_read   : in STD_LOGIC;
            branch_reg1_data  : out STD_LOGIC_VECTOR(31 downto 0)
      );
end branch_forwarding_unit; 

architecture Behavioral of branch_forwarding_unit is
    --signal temp_data : STD_LOGIC_VECTOR(31 downto 0); 
    begin
        process(ex_mem_alu_result, mem_wb_mem_data, reg1_data, if_id_rs1, ex_mem_rd, mem_wb_rd, ex_mem_reg_write, mem_wb_mem_read )
        begin
            if <what control signals>  then -- forward from ALU case
                branch_reg1_data <= ex_mem_alu_result;
            elsif <what control signals> then  -- forward from Memory case
                branch_reg1_data <= mem_wb_mem_data;
            else 
                branch_reg1_data <= reg1_data;   -- value in register file case
            end if;

        end process;
    end Behavioral;