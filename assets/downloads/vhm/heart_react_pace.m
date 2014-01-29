function path_table=heart_react_pace(probe_table,path_table,probe_pos,node_pos,probe_amp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% How heart will react to pacing signals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs:
%        probe_table: Cell array 
%           format: 'probe name','corresponding path','far-field path'(to be
%           deleted)
%        path_table: Cell array
%        probe_pos: the position of the probes
%           format: for each row:[row,col]
%        node_pos: the position of the nodes
%        probe_amp:the amplitude of the probes [1 x # of probes]
% Outputs:
%        path_table: updated path table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a persistent variable memorizing the last amplitude to determine rising
% edge
persistent last_amp

% initialize
if isempty(last_amp)
    last_amp=probe_amp;
end

% the probes with pacing signals
pacing_ind=find((probe_amp-last_amp)>0);

% renew the variable since the rest of the code will not use it
last_amp=probe_amp;

% for every probe with pacing signals
for i=1:length(pacing_ind)
    % corresponding path which will be activated by the pacing signal
     cur_path=probe_table{pacing_ind(i),2};
     % The position of the probe
     p0=probe_pos(pacing_ind(i),:);
     % one node connecting to the path
    p1=node_pos(path_table{cur_path(1),3},:);
   
    % calculating the distance from one point on path and the perpendicular
    % point of the probe on path
    l=((p1(1)-p0(1))^2+(p1(2)-p0(2))^2)^.5;
    a=path_table{pacing_ind(i),13};
    b=-1;
    c=p1(2)-a*p1(1);
    d=abs(a*p0(1)+b*p0(2)+c)/((a^2+b^2)^.5);
    ratio=(l^2-d^2)^.5/path_table{pacing_ind(i),12};
    %calculate the corresponding timer reading
   
    switch path_table{cur_path(1),2}
        case 1 %Idle
            % go to "double" state
            path_table{cur_path(1),2}=5;
            % change the current timer of Tante and Tretro according to the
            % pacing position
            path_table{cur_path(1),8}=round(ratio*path_table{cur_path(1),9});
            path_table{cur_path(1),10}=round((1-ratio)*path_table{cur_path(1),11})+1;
        case 2 %Ante
            % if the pacing signal exceed the activation wavefront
            if ratio>path_table{cur_path(1),8}/path_table{cur_path(1),9}
                % keep antegrade condunction and change wavefront to the
                % pacing site since the other direction will conflict
                path_table{cur_path(1),8}=round(ratio*path_table{cur_path(1),9});
            end
            % else the pacing signal will fall into ERP tissue and blocked
                
        case 3 %Retro
            if ratio<path_table{cur_path(1),10}/path_table{cur_path(1),11}
                path_table{cur_path(1),10}=round(ratio*path_table{cur_path(1),11});
            end
        case 4 %conflict
             % pacing signal will fall into ERP tissue
        case 5 %double
            % the conbination of the situation in Ante and Retro
            if ratio>path_table{cur_path(1),8}/path_table{cur_path(1),9}
                path_table{cur_path(1),8}=round(ratio*path_table{cur_path(1),9});
            else if ratio<path_table{cur_path(1),10}/path_table{cur_path(1),11}
                path_table{cur_path(1),10}=round(ratio*path_table{cur_path(1),11});
                end
            end
        
        
    end
    
    
    
end