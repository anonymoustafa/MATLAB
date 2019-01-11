
for i =  1 : Reach_ID 
   
    for t = 1  : nT -1
        
        for x = 2 : nX -1
          
          TX_Cells(t+1,x) = PLoad(t,x) ./ RI_vol(i) +  ( DLoad(t,x) .*  delta_T) ./ RI_vol(i) - (delta_T ./ RI_vol(i)) .* ( -RI_Flow(i) .* Alpha - epr(i) ) .* TX_Cells(t,x-1) +              (1-(delta_T ./ RI_vol(i)) .* (-RI_Flow(i) * Betha + RI_Flow(i) .* Alpha + 2 .* epr(i) + DL_Decay .* RI_vol(i) ) ) .* TX_Cells(t,x) - (delta_T ./ RI_vol(i)) .* (RI_Flow(i) .* Betha-epr(i)) .* TX_Cells(t,x+1);
        end
    end

end
plot(TX_Cells)