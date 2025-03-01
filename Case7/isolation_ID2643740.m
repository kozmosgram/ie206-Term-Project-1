% Emre Başaran 2643740

function [simulationMatrix, isolationMatrix] = isolation_ID2643740(simulationMatrix, isolationMatrix, delta2, qs, M, iteration)
    infectedIndices = find(simulationMatrix(:, 4) == 1 & simulationMatrix(:, 5) <= M); % Indices of infected individuals
    
    if iteration == 1
        % Initial isolation for delta2 ratio of infected individuals
        numToIsolate = round(delta2 / 100 * sum(simulationMatrix(:, 4) == 1)); % Number of initially infected individuals to isolate
        indicesToIsolate = infectedIndices(randperm(length(infectedIndices), numToIsolate));
        isolationMatrix(indicesToIsolate) = 1;
    else
        % Isolation with qs probability for sick individuals not already in isolation
        nonIsolatedInfectedIndices = infectedIndices(isolationMatrix(infectedIndices) == 0); % Exclude already isolated infected individuals
        numToIsolate = round(qs * length(nonIsolatedInfectedIndices)); % Number of newly infected individuals to isolate
        indicesToIsolate = nonIsolatedInfectedIndices(randperm(length(nonIsolatedInfectedIndices), numToIsolate));
        isolationMatrix(indicesToIsolate) = 1;
    end
    completedIsolationIndices = find(simulationMatrix(:, 4) == 1 & simulationMatrix(:, 5) >= M-1);
    isolationMatrix(completedIsolationIndices) = 0;
    simulationMatrix(:, 7) = isolationMatrix;
end
