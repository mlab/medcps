function [last_s1,last_s2]=program_pace(node_ind,s1_n,s1_t,s2_t)
global pace_panel_para
global node_table

last_s1=0;
last_s2=0;
% initialize
if isempty(pace_panel_para)
    pace_panel_para.s1=s1_t;
    pace_panel_para.s1n=s1_n;
    pace_panel_para.state=1;
    pace_panel_para.s2=s2_t;
    node_table{1,9}=true;
    pace_panel_para.s=1;
end

if pace_panel_para.s
switch pace_panel_para.state
        case 1 %s1
            if pace_panel_para.s1n>0
                if pace_panel_para.s1>0
                    pace_panel_para.s1=pace_panel_para.s1-1;
                else
                    pace_panel_para.s1=s1_t;
                    pace_panel_para.s1n=pace_panel_para.s1n-1;
                    node_table{node_ind,9}=true;
                end
            else
                pace_panel_para.state=2;
                pace_panel_para.s1=s1_t;
                pace_panel_para.s1n=s1_n;
                last_s1=1;
            end
            
        case 2
            
                if pace_panel_para.s2>0
                    pace_panel_para.s2=pace_panel_para.s2-1;
                else
                    node_table{node_ind,9}=true;
                    last_s2=1;
                    pace_panel_para.s=0;
                end
            
        
end
end