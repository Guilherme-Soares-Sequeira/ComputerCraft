--simple script to move the turtle, accepts up to 2 shell arguments

local arg = {...}
local direction = "forward"
local num = 1
 
if arg[1] ~= nil then
  if arg[1] ~= "forward" and arg[1] ~= "back" and arg[1] ~= "backwards" and arg[1] ~= "left" and arg[1] ~= "right" then
    if tonumber(arg[1]) ~= nil then
      num = tonumber(arg[1])
    end
  else
    direction = arg[1]
  end
end
 
if arg[2] ~= nil then
  if tonumber(arg[2]) ~= nil then
    num = tonumber(arg[2])
  elseif arg[2] == "forwards" or arg[2] == "back" or arg[2] == "backwards" or arg[2] == "left" or arg[2] == "right" then
    direction = arg[2] 
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
 
for i=1,num do
    turtle.forward()
end