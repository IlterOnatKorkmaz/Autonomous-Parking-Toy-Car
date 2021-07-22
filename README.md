# Autonomous-Parking-Toy-Car
A VHDL project where a toy-car autonomously (not AI) parks when it senses a gap to park to. The video presentation can be found at:  https://www.youtube.com/watch?v=J9uQSxlZrZM . 

# top_module.vhd:
As the name suggests, this is the top module of the project. Main machine states (described in the video) and the connections are defined here.

# distance.vhd:
The distance measured by the distance sensors are calculated here.

# back_eye.vhd:
The final stage of sensing and arranging the distance from the rear park obstacle.

# constr.xdc:
The pyhsical ports of the BASYS3 FPGA board are defined here.

