% Emre Başaran 2643740

function simulationMatrix = OneVaccination(simulationMatrix, N, tsec, iteration, ts, rs, p)
    k = 4;
    if iteration>=ts
        tv = iteration;
        delta3 = 1/(k*(tv - 19));
    else
        delta3 = 0;
    end
    if iteration >= ts
        healthyIndices = find(simulationMatrix(:, 4) == 0 & simulationMatrix(:, 6) == 1 & simulationMatrix(:, 9) == 0);
        numToVaccinate = round(delta3*length(healthyIndices));
        if numToVaccinate > length(healthyIndices)
            numToVaccinate = length(healthyIndices);
        end
        if numToVaccinate <= length(healthyIndices)
            indicesToVaccinate = healthyIndices(randperm(length(healthyIndices), numToVaccinate));
            simulationMatrix(indicesToVaccinate, 9) =1; % Set the 1st vaccination flag
            simulationMatrix(indicesToVaccinate, 8) = rs; % Set the infection probability for the vaccinated individuals
            simulationMatrix(indicesToVaccinate, 13) = iteration;
        end
    end
    for i = 1:N
        if simulationMatrix(i, 9) == 1 && simulationMatrix(i, 10) ~= 1% Check if the individual has received the 1st vaccination
            daysSinceVaccination = simulationMatrix(i, 11); % Get the number of days since vaccination
            if simulationMatrix(i, 4) == 1%Infect the individual
                simulationMatrix(i, 8) = 0;
                simulationMatrix(i, 10) = 1;%Second Vaccination
                simulationMatrix(i, 11) = 0;%Reset the days since vaccination
                simulationMatrix(i,13) = 0;% Reset the iteration of first vaccination
            elseif daysSinceVaccination < tsec % Check if the tsec period has passed
                if simulationMatrix(i,13) ~= iteration
                    simulationMatrix(i, 11) = simulationMatrix(i, 11)+1;
                end
            elseif daysSinceVaccination == tsec
                simulationMatrix(i, 11) = 0;% Reset the days since vaccination
                simulationMatrix(i,13) = 0;% Reset the iteration of first vaccination
                if simulationMatrix(i, 10) == 0 % Check if the individual has not received the 2nd vaccination
                    simulationMatrix(i, 8) = p; % Infect the individual
                    simulationMatrix(i, 9) = 0; % Reset the 1st vaccination flag
                end
            end
        end
    end
end
