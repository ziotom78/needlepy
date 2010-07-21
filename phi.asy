import graph;

size (10cm, 5cm, IgnoreAspect);

file in = input ("phi.txt").line ();
real[][] a = in.dimension (0, 0);
a = transpose (a);

real[] x = a[0];
real[] y = a[1];

draw (graph (x, y, join=operator ..), linewidth (1bp));

xaxis ("$t$", xmin = 0, xmax = 1.1, Ticks ("%", step = 1, Step = 1));
yaxis ("$\varphi(t)$", ymin = 0, ymax = 1.1, Ticks ("%", step = 1, Step = 1));

real invB = 1.0/3.0;

draw ((invB, 0) -- (invB, 1), dashed);
labelx ("$O$", 0, SW);
labelx (1, N);
labelx ("$\frac1B$", invB, NW);
labely (1);
