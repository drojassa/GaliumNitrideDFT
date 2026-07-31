# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import os


# ==========================
# User parameters
# ==========================

filename = "GaN_Etot_vs_a_vs_c-script.dat_50Ry"

output_dir = "fit_results"

# Number of points around minimum used in the parabola fit
n_points_fit = 15


# ==========================
# Create output directory
# ==========================

os.makedirs(output_dir, exist_ok=True)


# ==========================
# Read data
# ==========================

data = np.loadtxt(filename)

a = data[:,0]
c = data[:,1]
E = data[:,2]


# ==========================
# Find global minimum
# ==========================

imin = np.argmin(E)

a_min_grid = a[imin]
c_min_grid = c[imin]
E_min_grid = E[imin]


print("\nGrid minimum:")
print(f"a = {a_min_grid:.5f} Å")
print(f"c = {c_min_grid:.5f} Å")
print(f"E = {E_min_grid:.10f} Ry")


# ==========================
# Parabolic function
# ==========================

def parabola(x, A, B, C):
    return A*x*x + B*x + C



# ==========================
# Fit E(c) at fixed a
# ==========================

mask_c = np.isclose(a, a_min_grid)

c_cut = c[mask_c]
E_c = E[mask_c]


# sort data
idx = np.argsort(c_cut)
c_cut = c_cut[idx]
E_c = E_c[idx]


# select points close to minimum
ic = np.argmin(E_c)

start = max(ic-n_points_fit//2,0)
end = min(ic+n_points_fit//2+1,len(c_cut))

c_fit = c_cut[start:end]
E_c_fit = E_c[start:end]


params_c, _ = curve_fit(parabola,c_fit,E_c_fit)

Ac,Bc,Cc = params_c

c0 = -Bc/(2*Ac)
E_c0 = parabola(c0,*params_c)



# ==========================
# Fit E(a) at fixed c
# ==========================

mask_a = np.isclose(c, c_min_grid)

a_cut = a[mask_a]
E_a = E[mask_a]


idx = np.argsort(a_cut)
a_cut = a_cut[idx]
E_a = E_a[idx]


ia = np.argmin(E_a)

start = max(ia-n_points_fit//2,0)
end = min(ia+n_points_fit//2+1,len(a_cut))

a_fit = a_cut[start:end]
E_a_fit = E_a[start:end]


params_a, _ = curve_fit(parabola,a_fit,E_a_fit)

Aa,Ba,Ca = params_a

a0 = -Ba/(2*Aa)
E_a0 = parabola(a0,*params_a)



# ==========================
# Print results
# ==========================

print("\nParabolic fit results:")
print("----------------------")

print(f"a equilibrium = {a0:.6f} Å")
print(f"c equilibrium = {c0:.6f} Å")

print(f"E(a fit) = {E_a0:.10f} Ry")
print(f"E(c fit) = {E_c0:.10f} Ry")



# ==========================
# Plot E(c)
# ==========================

plt.figure(figsize=(7,5))

plt.scatter(c_cut,E_c,label="DFT points")

xplot = np.linspace(min(c_fit),max(c_fit),200)

plt.plot(
    xplot,
    parabola(xplot,*params_c),
    label="Parabolic fit"
)

plt.scatter(
    c0,
    E_c0,
    s=80,
    label=f"Minimum c={c0:.5f} Å"
)


plt.xlabel("c (Å)")
plt.ylabel("Energy (Ry)")
plt.title(f"E(c) at a={a_min_grid:.3f} Å")

plt.legend()
plt.tight_layout()

plt.savefig(
    f"{output_dir}/fit_c.png",
    dpi=300
)

plt.close()



# ==========================
# Plot E(a)
# ==========================

plt.figure(figsize=(7,5))

plt.scatter(a_cut,E_a,label="DFT points")

xplot = np.linspace(min(a_fit),max(a_fit),200)

plt.plot(
    xplot,
    parabola(xplot,*params_a),
    label="Parabolic fit"
)


plt.scatter(
    a0,
    E_a0,
    s=80,
    label=f"Minimum a={a0:.5f} Å"
)


plt.xlabel("a (Å)")
plt.ylabel("Energy (Ry)")
plt.title(f"E(a) at c={c_min_grid:.3f} Å")

plt.legend()
plt.tight_layout()


plt.savefig(
    f"{output_dir}/fit_a.png",
    dpi=300
)

plt.close()



print("\nFigures saved in:")
print(output_dir)
