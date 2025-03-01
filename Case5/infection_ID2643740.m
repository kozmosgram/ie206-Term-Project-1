% Emre Başaran 2643740

function simulationMatrix = infection_ID2643740(simulationMatrix, X, Y, M, iteration)
    N = length(X);
    for i = 1:N
        %Check if the individual is already infected or dead
        if simulationMatrix(i, 4) == 0 || simulationMatrix(i, 6) == 0
            continue;%Skip this individual
        end
        for j = 1:N
            if i == j
                continue;%Skip self-encounter
            end
            if X(i) == X(j) && Y(i) == Y(j)%Check if the individuals have the same coordinates
                if simulationMatrix(j, 4) == 0%Check if the other individual is non-infected
                    if rand <= simulationMatrix(j, 8)%Determine if the non-infected individual gets infected
                        simulationMatrix(j, 4) = 1;%Infect the individual
                        simulationMatrix(j, 5) = 1;%Reset the iteration count for the newly infected individual
                        simulationMatrix(j,14) = 0;
                    end
                end
            end
        end
        if simulationMatrix(i, 5) == M
            if rand <= 0.95
                simulationMatrix(i, 4) = 0;
                simulationMatrix(i, 6) = 1;
                simulationMatrix(i, 5) = 0;
                simulationMatrix(i,14)=1;
            else
                simulationMatrix(i, 6) = 0;
                simulationMatrix(i, 8) = 0;
                simulationMatrix(i,9) =0;
                simulationMatrix(i,14)=0;
                simulationMatrix(i, 12) = iteration;
            end
        end
    end
end

