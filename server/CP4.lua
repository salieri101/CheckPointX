waypoints = {}        -- Race waypoint Vector3s
checkpoints = {} -- Checkpoint objects

if message == "/savecpos" then
                savePosition(player:GetPosition())

                return false
        end
-- else

        -- It is chat
--        return true
-- end

createCheckpoints = function(path)
        -- Open file
        local file = io.open(path, "r")

        -- Index
        local index = 1

        -- For whole file
        while true do
                -- Get next line
                local line = file:read("*line")

                -- While file has lines
                if line != nil then
                        -- Get each element
                        local words = line:split(", ")

                        if words != nil and #words == 5 then
                                -- Store Vector3
                                waypoints[index] = Vector3(tonumber(words[1]), tonumber(words[3]), tonumber(words[5]))
                                
                                -- Create checkpoint
                                checkpoints[index] = Checkpoint.Create(waypoints[index])
                                checkpoints[index]:SetText(tostring(index))

                                print("Waypoint " .. index  .. ": " .. tostring(waypoints[index]))

                                index = index + 1
                        else
                                print("ERROR: Reading waypoint " .. line)
                                print(#words .. " words")
                        end
                else
                        print("End of file.")
                        break
                end
        end

        file:close()
end

savePosition = function(position)
        -- Open file
        local file = io.open("locations.txt", "a+")        -- Append + mode, only at the end of file

        file:write("\n")
        file:write(tostring(position))
        file:write("\n")

        -- Finish
        file:flush()
        file:close() 
end

-- Read all waypoints

-- Any testing code
testCode = function()

end

