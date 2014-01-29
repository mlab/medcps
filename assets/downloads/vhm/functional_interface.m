function [egm_data,probe_amp]=functional_interface(Config,node_pos,path_table,probe_pos,probe_table)

% functional pacing
probe_amp=pacing_panel_functional(Config, probe_table);

% functional sensing
egm_data=functional_sensing(node_pos,path_table,probe_pos,probe_table,probe_amp);



egm_data=egm_data+probe_amp;