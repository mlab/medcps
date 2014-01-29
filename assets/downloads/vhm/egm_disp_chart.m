function egm_disp_chart(Config, data)
if size(data,1)<2000
   for i=1:size(data,2)
       set(Config.plot_egm(i),'XData',1:size(data,1));
       set(Config.plot_egm(i),'YData',data(:,i));
       set(Config.egm_axe(i),'Xlim',[0,2000]);
   end
   
else
   for i=1:size(data,2)
       set(Config.plot_egm(i),'XData',1:2000);
       set(Config.plot_egm(i),'YData',data(size(data,1)-1999:end,i));
       set(Config.egm_axe(i),'Xlim',[0,2000]);
   end
   
end