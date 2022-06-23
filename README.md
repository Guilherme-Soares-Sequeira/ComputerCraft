# ComputerCraft
This is a simple repository for organizing ComputerCraft scripts (mainly for turtles).

Note: If you're playing with ComputerCraft on minecraft version 1.7 or lower you won't be able to utilize the existing pastebin command. To be able to use it you'll need to somehow get [pastebin_fix.lua](VanillaCC/pastebin_fix.lua) or fix the pastebin command by hand. Here's a step by step guide on how to do it:

1. If your turtle is stuck running a program and you can't quit, force quit by holding `Ctrl+T`
2. Go to your turtle's terminal and be sure you're in the root directory. If you're not sure, run `cd /`
3. Enter `cp rom/programs/http/pastebin pb`
4. Enter `edit pb` to edit the newly created pb file (this is the replacement program for pastebin)
5. In line 24, change `"http://pastebin.com/raw.php?i="..textutils.urlEncode( paste )` to `"https://pastebin.com/raw/"..textutils.urlEncode( paste )` (note the *https* as it's important)
6. In line 59, change `http://pastebin.com/api/api_post.php"` to `https://pastebin.com/api/api_post.php"`
7. Click Ctrl, Save and then go back to the shell
8. Utilize **pb** instead of **pastebin**

[Source for the fix](http://www.computercraft.info/forums2/index.php?/topic/26882-resource-pack-pastebin-fix-for-pre-mc18x-users/)

[ComputerCraft](https://www.computercraft.info/)