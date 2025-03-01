% Emre Başaran 2643740

function [X, Y] = movement_ID2643740(X, Y, T, simulationMatrix)
    N = length(X); % Number of people
    for i = 1:N
        if simulationMatrix(i, 6) == 0 % Check if individual is alive
            continue
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
