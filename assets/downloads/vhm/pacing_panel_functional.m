function probe_amp=pacing_panel_functional(Config, probe_table)
global pace_panel_para
probe_amp=zeros(1,size(probe_table,1));

if ishandle(Config.pace_panel) && get(Config.pace_deliver,'Value')
    switch pace_panel_para.state
        case 1 %s1
            if pace_panel_para.s1n>0
                if pace_panel_para.s1>0
                    pace_panel_para.s1=pace_panel_para.s1-1;
                else
                    pace_panel_para.s1=sscanf(get(Config.s1,'String'),'%d');
                    pace_panel_para.s1n=pace_panel_para.s1n-1;
                    pace_panel_para.pace_state=1;
                end
            else
                pace_panel_para.state=2;
                pace_panel_para.s1=sscanf(get(Config.s1,'String'),'%d');
                pace_panel_para.s1n=sscanf(get(Config.s1n,'String'),'%d');
            end
            
        case 2
            if pace_panel_para.s2n>0
                if pace_panel_para.s2>0
                    pace_panel_para.s2=pace_panel_para.s2-1;
                else
                    pace_panel_para.s2=sscanf(get(Config.s2,'String'),'%d');
                    pace_panel_para.s2n=pace_panel_para.s2n-1;
                    pace_panel_para.pace_state=1;
                end
            else
                set(Config.pace_deliver,'Value',0);
                pace_panel_para.s1=sscanf(get(Config.s2,'String'),'%d');
                pace_panel_para.s1n=sscanf(get(Config.s2n,'String'),'%d');
            end
        
    end
    
    if pace_panel_para.pace_state
        if pace_panel_para.pulse_w>0
            pace_panel_para.pulse_w=pace_panel_para.pulse_w-1;
            
                probe_amp(get(Config.pace_probe,'Value'))=sscanf(get(Config.pulse_a,'String'),'%d');
            
        else
            pace_panel_para.pace_state=0;
            pace_panel_para.pulse_w=sscanf(get(Config.pulse_w,'String'),'%d');
        end
        
        
    end
    
    
    
end