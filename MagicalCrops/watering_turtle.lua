--script to water a (by default) 24x24 farm, design to work with MagicalCrops and utilizing a turtle

local arg = {...}
--global variables
local col_max = 24
local row_max = 24
local watering_can_name = "ExtraUtilities:watering_can"
local watering_can_index = 1
local fuel_index = 16
local turn_left = true
local fuels_table = {
  ["minecraft:coal"]=true,
  ["minecraft:coal_block"]=true,
  ["minecraft:coal:1"]=true
}
 
--functions
 
local function is_fuel(name)
  return fuels_table[name] ~= nil
end
 
local function get_watering_can_index()
  for i=1, 16 do
    local data = turtle.getItemDetail(i)
    if (data ~= nil) then
      if data.name == watering_can_name then
        watering_can_index = i
        return true
      end
    end
  end
  return false
end
 
local function get_fuel_index()
  for i=1, 16 do
    local data = turtle.getItemDetail(i)
    if data ~= nil then
      if is_fuel(data.name) then
        fuel_index = i
        return true
      end
    end
  end
  return false
end
 
local function turtleRefill()
  if (turtle.getFuelLevel() == 0) then --needs to refill
    turtle.select(fuel_index)
    
    if (turtle.refuel() == false) then --there is no more fuel here
 
      if (get_fuel_index == false) then --there is no more fuel in the turtle
        print("Out of fuel...")
        return false
      end
 
      turtle.refuel()                   --there is more fuel in the turtle
      turtle.select(watering_can_index)
      return true
    end
 
    turtle.select(watering_can_index) --there is fuel here
    return true
 
  elseif turtle.getFuelLevel()%10 == 0 then --turtle didn't need refilling, printing a message sometimes to update on the fuel status
    print("turtle fuel level = ", turtle.getFuelLevel())
  end
  return true
end
 
local function get_shell_arguments()
  if (arg[1] ~= nil) then
    if (tonumber(arg[1] ~= nil)) then
      col_max = tonumber(arg[1])
    end
  end
 
  if (arg[2] ~= nil) then
    if (tonumber(arg[1] ~= nil)) then
      row_max = tonumber(arg[2])
    end
  end
end
 
--main
 
local function main()
  get_shell_arguments()
  get_fuel_index()
  
  if (get_watering_can_index() == false) then
    print("No watering can found...")
    return
  end
 
  while true do
    for curr_row = 0, row_max, 4 do
      for curr_col = 1, col_max do
        if (turtleRefill() == false) then
          break
        end
        turtle.placeDown()
        turtle.forward()
      end
      if turn_left then
        turtle.turnLeft()
      else
        turtle.turnRight()
      end
      turtle.forward()
      turtle.forward()
      turtle.forward()
      turtle.forward()
      if turn_left then
        turtle.turnLeft()
        turn_left = false
      else
        turtle.turnRight()
        turn_left = true
      end
    end
  turtle.turnLeft()
  turtle.forward()
  turtle.forward()
  turtle.forward()
  turtle.forward()
  turtle.turnRight()
  turn_left = true
  end
end
 
main()
