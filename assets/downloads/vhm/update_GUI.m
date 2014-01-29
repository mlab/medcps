function update_GUI
global Config
global path_table
global node_table
global pace_para

if get(Config.update_table,'Value')
set(Config.Table_node,'Data',node_table(:,1:9));
set(Config.Table_path,'Data',path_table(:,1:11));
set(Config.Table_pace,'Data',pace_para);
end

if get(Config.update_fig,'Value')
color_opt_node={[0 1 0],[1 0 0],[1 1 0]}; 
color_opt_path={'Blue','Green','Yellow','Black','Red'};
for i=1:size(node_table,1)
    node_color(i,:)=color_opt_node{node_table{i,2}};
    
end

set(Config.node_pos,'CData',node_color);

for i=1:size(path_table,1)
    set(Config.path_path_plot(i),'Color',color_opt_path{path_table{i,2}});
    
    
end
end
drawnow