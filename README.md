# efabless_vlsi_verilog

`irun -access +r -gui parity.v parity_stim.v parity_driver.v`

Parity checker:
input: 8 bit data_in
output: even_parity bit is set if parity is even, 
        odd_parity bit is set if parity is odd.

| STATE      | ACTION                                      | TRANSITION                                |
|------------|---------------------------------------------|-------------------------------------------|
| WAIT       | `busy ← 0`                                  | `if (start) goto INIT`<br>`else goto WAIT`|
| INIT       | `One_count = 0`<br>`zero_count = 0`<br>`Current_bit = 1`<br>`Shift_reg <= data_in`<br>`Parity = 0`<br>`busy ← 1`<br>`Even_parity = 0`<br>`Odd_parity = 0`|` if(shift_reg[0] == 0) goto ONE_STATE`<br>`Else goto ZERO_STATE` |
| ONE_STATE   | `One_count++`|`if (current_bit == 8) goto CALCULATE`<br>`Else Goto UPDATE_BIT`  |
| ZERO_STATE  | `zero_count++`|`if (current_bit == 8) goto CALCULATE`<br>`Else Goto UPDATE_BIT` |
| UPDATE_BIT  | `current_bit ← current_bit + 1`<br>`Shift_reg >> 1`|`if(shift_reg[0] == 0) goto ONE_STATE`<br>`Else goto ZERO_STATE` |
| CALCULATE   | `Parity <= One_count % 2`|`if(parity==0) goto EVEN_STATE`<br>`else goto ODD_STATE` |
| ODD_STATE   | `Odd_parity = 1`|`Goto FINISH` |
| EVEN_STATE  | `Even_parity = 1`|`Goto FINISH` |
| FINISH     | `busy ← 0` | `goto WAIT`                  |
