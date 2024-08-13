#For Clearing all previous settings
clear -all


#For coverage purpose
check_cov -init -type all -model {branch toggle statement} -toggle_ports_only

analyze -sv12 sync_fifo.sva

elaborate -top syncFIFO_v2 -parameter WIDTH 4 -parameter DEPTH_LEN 4 -create_related_covers {precondition witness}

clock i_clk
reset i_rst_n

check_cov -measure -type {coi stimuli proof bound} -time_limit 60s -bg

