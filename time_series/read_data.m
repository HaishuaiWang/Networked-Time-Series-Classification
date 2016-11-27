function[TS, Network, Y] = read_data()
clc;
clear;
fid=fopen('matrix.dat','a+');

cr = randperm(20);
rand_change = cr(1:5);

%%%%%%%%%%%% Time Series matrix %%%%%%%%%%%%
f_ts = fopen('matrix_TS.dat', 'r');
i = 1;
while ~feof(f_ts)
    ts = fgetl(f_ts);
    ts = deblank(ts);
    S = regexp(ts, ',', 'split');
    for j = 1:length(S)
        xx = eval(S{j});
        TS(i,j) = xx;
    end
    i = i + 1;
end

timeseries_size = size(TS)

%%%%%%%%%%%% Network matrix %%%%%%%%%%%%
Network = zeros(200,200);
for  i= 1:20
    for j = 1:20
        Network(i, j) = 1;
    end
end

r = randperm(30);
rr = r + 20;
randnum = rr(1:15);

for ni = 1:length(randnum)
    Network(randnum(ni), (randnum(ni)+1)) = 1;
    Network((randnum(ni)+1),randnum(ni)) = 1;
end

for nii = 21:50
    Network(nii, nii) = 1;
end

lr = randperm(150);
llr = lr + 50;
rand = llr(1:15);

for nni = 1:length(rand)
    Network(rand(nni), (rand(nni)+1)) = 1;
    Network((rand(nni)+1),rand(nni)) = 1;
end

for nnii = 51:200
    Network(nnii, nnii) = 1;
end

Network_size = size(Network)

%%%%%%%%%%%% Network matrix %%%%%%%%%%%%
Y = zeros(200, 3);
for yi = 1:20
    Y(yi, 1) = 1;
end
for yii = 21:50
    Y(yii, 2) = 1;
end
for yiii = 51:200
    Y(yiii, 3) = 1;
end
 label_size = size(Y)

 for ccr = 1:rand_change
     temp = TS(ccr,:);
     TS(ccr,:) = TS(ccr+50,:);
     TS(ccr+50,:) = TS(ccr+20,:);
     TS(ccr+20,:) = temp;
 end

  for ccr = 1:rand_change
     Ntemp = Network(ccr,:);
     Network(ccr,:) = Network(ccr+50,:);
     Network(ccr+50,:) = Network(ccr+20,:);
     Network(ccr+20,:) = Ntemp;
 end
 
dlmwrite('matrix_TS.dat',TS);
dlmwrite('matrix_network.dat',Network);
dlmwrite('matrix_Y.dat',Y);
 
fclose(f_ts);
fclose(fid);