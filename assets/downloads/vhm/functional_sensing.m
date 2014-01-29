function egm_data=functional_sensing(node_pos,path_table,probe_pos,probe_table,probe_amp)


local_theta=15;
far_theta=80;
egm_data=zeros(1,size(probe_table,1));

% local signal
for i=1:size(probe_table,1)
    temp=probe_table{i,2}; 
    act_probe=probe_pos(i,:);
    
    act_local=temp(cell2mat(path_table(probe_table{i,2},2))~=1);
   
    for j=1:length(act_local)
        p1=node_pos(path_table{act_local(j),3},:);
        p2=node_pos(path_table{act_local(j),4},:);
%         path_length=path_table{act_local(j),12};
%         path_slope=path_table{act_local(j),13};
        
        
        switch path_table{act_local(j),2}
            case 2 % Ante
                cur_timer=path_table{act_local(j),8};
                def_timer=path_table{act_local(j),9};
                
                wave_front=[p1(1)+(p2(1)-p1(1))*(def_timer-cur_timer)/def_timer,...
                            p2(2)+(p1(2)-p2(2))*cur_timer/def_timer];
            case 3 % Retro
                cur_timer=path_table{act_local(j),10};
                def_timer=path_table{act_local(j),11};
                wave_front=[p1(1)+(p2(1)-p1(1))*cur_timer/def_timer,...
                            p2(2)+(p1(2)-p2(2))*(def_timer-cur_timer)/def_timer];
            case 5 % double
                cur_timer=path_table{act_local(j),8};
                def_timer=path_table{act_local(j),9};
                
                wave_front(1,:)=[p1(1)+(p2(1)-p1(1))*(def_timer-cur_timer)/def_timer,...
                            p2(2)+(p1(2)-p2(2))*cur_timer/def_timer];
                        
                cur_timer=path_table{act_local(j),10};
                def_timer=path_table{act_local(j),11};
                wave_front(2,:)=[p1(1)+(p2(1)-p1(1))*cur_timer/def_timer,...
                            p2(2)+(p1(2)-p2(2))*(def_timer-cur_timer)/def_timer];
            otherwise
                wave_front=[Inf,Inf];
                
                
        end
          for k=1:size(wave_front,1)
                    cur_dist=((act_probe(2)-wave_front(k,2))^2+(act_probe(1)-wave_front(k,1))^2)^.5;
                    ratio=gaussmf(cur_dist,[local_theta 0]);
                    egm_data(i)=egm_data(i)+ratio*path_table{act_local(j),5};
                    
          end
    end
  
    
    
    % pacing artifact
    pacing_probe_ind=find(probe_amp);
    
    for k=1:length(pacing_probe_ind)
        cur_dist=((act_probe(2)-probe_pos(pacing_probe_ind(k),2))^2+(act_probe(1)-probe_pos(pacing_probe_ind(k),1))^2)^.5;
                    ratio=0.7*gaussmf(cur_dist,[far_theta 0]);
                    egm_data(i)=egm_data(i)+ratio*probe_amp(pacing_probe_ind(k));
        
    end
    
end

