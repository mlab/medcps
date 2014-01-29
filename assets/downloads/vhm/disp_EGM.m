function data=disp_EGM(Config,data,egm_table,egm_data)

double_ind=find(ismember(egm_table(:,3),'d'));
       
       for i=1:length(double_ind)
           temp=egm_table{double_ind(i),2};
          egm_data=[egm_data, egm_data(temp(2))-egm_data(temp(1))];
           
       end
       data=[data;egm_data];
            
           if ishandle(Config.data_fig)
               if get(Config.show_unipolar,'Value')
                   egm_disp_chart(Config, data);
               else
                   egm_disp_chart(Config, data(:,double_ind));
               end
           end