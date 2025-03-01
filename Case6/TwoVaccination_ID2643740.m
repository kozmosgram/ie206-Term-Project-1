% Emre Başaran 2643740

function simulationMatrix = TwoVaccination_ID2643740(simulationMatrix, N, w, tsec, iteration, ts, rs, p)
    k = 1.5;
    if iteration>=ts
        tv = iteration;
       delta3 = 1/(k*(tv - 19));
    else
        delta3 = 0;
    end
    if iteration >= ts
        healthyIndices1 = find(simulationMatrix(:, 4) == 0 & simulationMatrix(:, 6) == 1 & simulationMatrix(:, 9) == 0);
        healthyIndices2 = find(simulationMatrix(:, 4) == 0 & simulationMatrix(:, 6) == 1 & simulationMatrix(:, 9) == 1 & simulationMatrix(:, 10) ~= 1 & simulationMatrix(:, 11) == 4);
        eligibleIndices = [healthyIndices1; healthyIndices2];
        numToVaccinate = round(delta3*length(eligibleIndices));
        numToVaccinate = min(numToVaccinate, length(eligibleIndices));% Ensure numToVaccinate is within the range
        vaccinated = 0;
        while vaccinated < numToVaccinate && ~isempty(eligibleIndices)
            randomIndex = eligibleIndices(randperm(length(eligibleIndices), 1));
            if simulationMatrix(randomIndex, 9) == 0
                simulationMatrix(randomIndex, 9) = 1;% Set the 1st vaccination flag
                simulationMatrix(randomIndex, 8) = rs;% Set the infection probability for the vaccinated individuals
                simulationMatrix(randomIndex, 13) = iteration;
                vaccinated = vaccinated + 1;
                for i = 1:length(randomIndex)
                    eligibleIndices(eligibleIndices == randomIndex(i)) = [];
                end

            elseif simulationMatrix(randomIndex, 9) == 1 && simulationMatrix(randomIndex, 4)~=1 && simulationMatrix(randomIndex, 10) ~=1
                if rand() <= w
                    simulationMatrix(randomIndex, 8) = 0;
                    simulationMatrix(randomIndex, 10) = 1;
                    simulationMatrix(randomIndex, 11) = 0;
                    simulationMatrix(randomIndex, 13) = 0;
                    vaccinated = vaccinated + 1;
                    for i = 1:length(randomIndex)
                        eligibleIndices(eligibleIndices == randomIndex(i)) = [];
                    end
                else
                    simulationMatrix(randomIndex, 8) = p;
                    simulationMatrix(randomIndex, 9) = 0;
                    simulationMatrix(randomIndex, 13) = 0;
                    for i = 1:length(randomIndex)
                        eligibleIndices(eligibleIndices == randomIndex(i)) = [];
                    end
                end
                if numToVaccinate > length(eligibleIndices)
                    numToVaccinate = length(eligibleIndices);
                end
            end
        end
    end
    for i = 1:N
        if simulationMatrix(i, 9) == 1 && simulationMatrix(i, 10) ~= 1% Check if the individual has received the 1st vaccination
            daysSinceVaccination = simulationMatrix(i, 11);% Get the number of days since vaccination
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
                    simulationMatrix(i, 8) = p; % Set the infection probability to 0 (fully protected)
                    simulationMatrix(i, 10) = 1; % Set the second vaccination flag
                    simulationMatrix(i, 9) = 0;% Reset the first vaccination flag
                end
            end
        end
    end
end    