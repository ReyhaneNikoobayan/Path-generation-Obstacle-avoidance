# Path planning of robot and avoiding obstacle

**In this project, I implemented a MATLAB function that plans a path for a robot using the Potential Field Method.**

The function receives:

- 𝑋 → coordinates of the starting point
- 𝑓→ coordinates of the final destination
- η → scaling factor for the attractive field
- B → a matrix that stores the obstacle information

Using these inputs, the function computes a sequence of via-points (path) that:

- Guides the robot from the start point to the goal
- Ensures the robot avoids obstacles by generating repulsive forces
- Stops when the robot is sufficiently close to the final destination

The output is the path 

P, which contains all the intermediate points from X to 𝑓

	​


