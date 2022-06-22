--simple script to turn the turtle, accepts up to 1 shell argument
local arg = {...}
local direction = "forward"
 
if arg[1] ~= nil then
  if arg[1] ~= "forward" and arg[1] ~= "back" and arg[1] ~= "backwards" and arg[1] ~= "left" and arg[1] ~= "right" then
  else
    direction = arg[1]
  end
end
 
if direction == "back" or direction == "backwards" then
  turtle.turnLeft()
  turtle.turnLeft()
end
 
if direction == "right" then
  turtle.turnRight()
end
 
if direction == "left" then
  turtle.turnLeft()
end
