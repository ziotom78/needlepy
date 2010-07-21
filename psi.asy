import graph;

size (10cm, 5cm, IgnoreAspect);

file in = input ("psi.txt").line ();
real[][] a = in.dimension (0, 0);
a = transpose (a);

real[] x = a[0];
real[] y = a[1];

draw (graph (x, y, join=operator ..), linewidth (1bp));

xaxis ("$t$", xmin = -1, xmax = 1, Ticks ("%", step = 1, Step = 1));
yaxis ("$\psi(t)$", ymin = 0, ymax = 1.0, Ticks ("%", step = 0.5, Step = 0.5));

draw ((0, 1) -- (1, 1), dashed);
labelx ("$O$", 0, SW);
labelx (-1, N);
labelx (1, N);
labely ("$\frac12$", 0.5, NW);
labely (1);
