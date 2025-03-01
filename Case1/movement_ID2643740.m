% Emre Başaran 2643740

function [X, Y] = movement_ID2643740(X, Y, T, isolationMatrix, simulationMatrix)
    N = length(X); % Number of people
    for i = 1:N
        if simulationMatrix(i, 6) == 0 % Check if individual is alive
            continue
        elseif isolationMatrix(i)==1
            % Isolated person's movement logic
            newX = X(i);
            newY = Y(i);
            if newX == 1 && newY == 1
                validMovesX = [1,2];
                validMovesY = [1,2];
            elseif newX == 1 && newY == T
                validMovesX = [1,2];
                validMovesY = [24,25];
            elseif newX == T && newY == 1
                validMovesX = [24,25];
                validMovesY = [1,2];
            elseif newX == T && newY == T
                validMovesX = [24,25];
                validMovesY = [24,25];
            elseif newX == 1 && newY ~= 1 &&  newY ~= T
                validMovesX = [1,2];
                validMovesY = [newY+1,newY,newY-1];
            elseif newX == T && newY ~= T && newY ~= 1
                validMovesX = [24,25];
                validMovesY = [newY+1,newY,newY-1];
            elseif newY == 1 && newX ~= T
                validMovesX = [newX+1,newX,newX-1];
                validMovesY = [1,2];
            elseif newY == T && newX ~= T
                validMovesX = [newX+1,newX,newX-1];
                validMovesY = [24,25];
            else
                validMovesX = [newX+1,newX,newX-1];
                validMovesY = [newY+1,newY,newY-1];
            end
            randomIndex1 = randi(length(validMovesX));% Randomly select a move from valid moves
            randomIndex2 = randi(length(validMovesY));
            % Update person's position
            X(i) = validMovesX(randomIndex1);
            Y(i) = validMovesY(randomIndex2);
        else
            newX = X(i);
            newY = Y(i);
            if newX == 1 && newY == 1
                dx = [ 0, 1, 1];
                dy = [ 1, 1, 0];
                newX = X(i);
                newY = Y(i);
                direction= randi(3);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            elseif newX == 1 && newY == T
                dx = [ 0, 1, 1];
                dy = [-1, -1, 0];
                newX = X(i);
                newY = Y(i);
                direction= randi(3);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            elseif newX == T && newY == 1
                dx = [-1, -1, 0];
                dy = [ 0, 1, 1];
                newX = X(i);
                newY = Y(i);
                direction= randi(3);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            elseif newX == T && newY == T
                dx = [-1, -1, 0];
                dy = [-1, 0, -1];
                newX = X(i);
                newY = Y(i);
                direction= randi(3);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            elseif newX == 1 && newY ~= 1 &&  newY ~= T
                dx = [ 0, 0, 1, 1, 1];
                dy = [-1, 1, -1, 0, 1];
                newX = X(i);
                newY = Y(i);
                direction= randi(5);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            elseif newX == T && newY ~= T && newY ~= 1
                dx = [-1, -1, -1, 0, 0];
                dy = [-1, 0, 1, -1, 1];
                newX = X(i);
                newY = Y(i);
                direction= randi(5);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            elseif newY == 1 && newX ~= T && newX ~= 1
                dx = [ -1,  0, 0, 1, 1];
                dy = [ 0, 1, 1, 0, 1];
                newX = X(i);
                newY = Y(i);
                direction= randi(5);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            elseif newY == T && newX ~= T && newX ~= 1
                dx = [-1, -1, 0, 1, 1];
                dy = [-1, 0, -1, -1, 0];
                newX = X(i);
                newY = Y(i);
                direction= randi(5);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            else
                dx = [-1, -1, -1, 0, 0, 1, 1, 1];
                dy = [-1, 0, 1, -1, 1, -1, 0, 1];
                newX = X(i);
                newY = Y(i);
                direction= randi(8);
                numSteps = randi(4)-1;
                for k= 1:numSteps
                    newX = newX + dx(direction);
                    newY = newY + dy(direction);
                    if newX == 1 || newX == T || newY == 1 || newY == T
                        newX = max(1, min(newX, T));
                        newY = max(1, min(newY, T));
                        break
                    end
                end
            end
            X(i) = newX;
            Y(i) = newY;
        end
    end
end
