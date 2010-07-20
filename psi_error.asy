import graph;

size (13cm, 6cm, IgnoreAspect);

file in = input ("psi_error.txt").line ();
real[][] a = in.dimension (0, 0);
a = transpose (a);

real[] x = a[0];
real[] y = a[1];

draw (graph (x, y, join=operator ..), linewidth (1bp));

xaxis ("$t$", BottomTop, LeftTicks);
yaxis ("$\tilde\psi(t) - \psi(t)$", LeftRight, RightTicks);
