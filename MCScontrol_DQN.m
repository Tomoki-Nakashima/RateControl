function next_MCS = MCScontrol_DQN(MCS, distance)

modelfile = 'weights.h5';
net = importKerasNetwork(modelfile);

input = zeros(1,18);
input(1,MCS+1) = 1;
if(distance>43.77)
    input(1,10) = 1;
elseif(distance>36.33) 
    input(1,11) = 1;
elseif(distance>28.24) 
    input(1,12) = 1;
elseif(distance>23.07) 
    input(1,13) = 1;
elseif(distance>16.77) 
    input(1,14) = 1;
elseif(distance>15.45) 
    input(1,15) = 1;
elseif(distance>14.32) 
    input(1,16) = 1;
elseif(distance>10.46) 
    input(1,17) = 1;
else 
    input(1,18) = 1;
end

output = predict(net,input);
[argvalue, argmax] = max(output);
action = argmax;

if (action==1)
    next_MCS = MCS + 1;
    next_MCS = rem(next_MCS, 9);
elseif (action==3)
    next_MCS = MCS - 1;
    next_MCS = rem(next_MCS, 9);
else
    next_MCS = MCS;
end

if(next_MCS==-1)
    next_MCS = 8;
end

