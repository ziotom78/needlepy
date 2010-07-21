import graph;

size (10cm, 5cm, IgnoreAspect);

file in = input ("b.txt").line ();
real[][] a = in.dimension (0, 0);
a = transpose (a);

real[] l  = a[0];
real[] b1 = a[1];
real[] b2 = a[2];

draw (graph (l, b1), linewidth (1bp),            legend = "B = 2.72");
draw (graph (l, b2), dashed + linewidth (1.3bp), legend = "B = 2.50");

xaxis ("$\ell$",    BottomTop, LeftTicks ());
yaxis ("$b(\ell/B^j)$", LeftRight, RightTicks ());

attach (scale(0.7) * legend (), point (NE), 5SW, UnFill);
