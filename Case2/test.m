% Emre Başaran 2643740

clear
clc

t=200;
TotInfMatrix =zeros(500,t);
TotHealMatrix=zeros(500,t);
TotDeadMatrix=zeros(500,t);
for i = 1:500
    % Model parameters
    T = 25;% Grid size
    N =200;% Population size (randomly selected within the given range)
    delta1 = 8;% Percentage of initially infected people (randomly selected within the given range)
    p = 0.4;% Infection probability in encounter scenario (randomly selected within the given range)
    M = 30;% Infectious period duration (randomly selected within the given range)
    t = 200;% Total iterations
    delta2 = 100;% Percentage of isolated infected people at initialization
    qs = 1;% Isolation probability of a newly infected person
    
    grid = zeros(T, T);%Grid of Simulation
    numInfected = round(delta1/100*N);% Number of initially infected individuals
    infectedIndices = randperm(N, numInfected);% Randomly select indices of initially infected individuals
    positions = randperm(T^2, N);% Randomly select N positions on the grid
    X = ceil(positions/T);% Calculate x positions
    Y = mod(positions-1,T) + 1;% Calculate y positions
    
    for j = 1:N
        grid(X(j), Y(j)) = 1;
    end
    
    simulationMatrix = zeros(N, 14);% Nx14 matrix to store simulation data
    isolationMatrix = zeros(N, 1);% Initialize the isolation matrix
    
    % Initialize the simulation matrix with initial data
    simulationMatrix(:, 1) = 1:N;% Column 1: Person's number
    simulationMatrix(:, 2) = X';% Column 2: x coordinate of person
    simulationMatrix(:, 3) = Y';% Column 3: y coordinate of person
    simulationMatrix(infectedIndices, 4) = 1;% Column 4: sick or not? (1 if sick, 0 if not)
    simulationMatrix(infectedIndices, 5) = 1;% Column 5: How many iterations have passed since getting sick?(0 for initially infected)
    simulationMatrix(:, 6) = 1;% Column 6: live or dead (1 if live, 0 if dead)
    simulationMatrix(:, 7) = 0;% Column 7: isolation (0 if not isolated, 1 if isolated)
    simulationMatrix(:, 8) = p;% Column 8: infection probability
    simulationMatrix(:, 9) = 0;% Column 9: 1st vaccination (1 if yes, 0 if not)
    simulationMatrix(:, 10) = 0;% Column 10: 2nd vaccine received/not (1 if yes, 0 if not)
    simulationMatrix(:, 11) = 0;% Column 11: number of days since vaccination
    simulationMatrix(:, 12) = 0;% Column 12 : in which iteration did he/she die?
    simulationMatrix(:,13) = 0;% Column 13 : in which iteration was the 1st vaccine given?
    simulationMatrix(:,14)=0;% Column 14 : # of healed people
    infectedCounts= zeros(t, 1);
    healedCounts= zeros(t, 1);
    deadCounts= zeros(t, 1);
    
    % TEST PART
    for iteration = 1:t
        [X, Y] = movement_ID2643740(X, Y, T, isolationMatrix, simulationMatrix);
        simulationMatrix(:, 2) = X';
        simulationMatrix(:, 3) = Y';
        simulationMatrix = infection_ID2643740(simulationMatrix, X, Y, p, M, iteration);
        [simulationMatrix, isolationMatrix] = isolation_ID2643740(simulationMatrix, isolationMatrix, delta2, qs, M, iteration);
        simulationMatrix(simulationMatrix(:, 4) == 1, 5) = simulationMatrix(simulationMatrix(:, 4) == 1, 5) + 1;
        simulationMatrix(:, 7) = isolationMatrix;
        deadIndices = find(simulationMatrix(:, 6) == 0);
        simulationMatrix(deadIndices, 5) = 0;
        infectedCounts(iteration) = sum(simulationMatrix(:, 4) == 1 & simulationMatrix(:,6)==1);
        if iteration>=M
            healedCounts(iteration) = sum(simulationMatrix(:,14)==1 & simulationMatrix(:,4)==0);
        end
        deadCounts(iteration) = sum(simulationMatrix(:, 6) == 0);
        TotInfMatrix(i,iteration)= infectedCounts(iteration);
        TotHealMatrix(i,iteration)=healedCounts(iteration);
        TotDeadMatrix(i,iteration)=deadCounts(iteration);

    end
end
AveInfMatrix=zeros(1,200);
AveHealMatrix=zeros(1,200);
AveDeadMatrix=zeros(1,200);
for index = 1:200
    for k=1:500
        AveInfMatrix(1,index)=mean(TotInfMatrix(k,index));
        AveHealMatrix(1,index)=mean(TotHealMatrix(k,index));
        AveDeadMatrix(1,index)=mean(TotDeadMatrix(k,index));
    end
end
figure;
iteration = 1:t;
ax = gca;
ax.Color = [0.9 0.9 0.9];
hold on;
plot(iteration, AveInfMatrix, 'b-', 'LineWidth', 2);
plot(iteration, AveHealMatrix, 'g-', 'LineWidth', 2);
plot(iteration, AveDeadMatrix, 'r-', 'LineWidth', 2);
hold off;

xlabel('Iteration');
ylabel('Counts');
title('Simulation Results');