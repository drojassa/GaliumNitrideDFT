from ase.io import read
from ase.build import surface

# 1) Leer tu celda bulk relajada
bulk = read('GaN.xsf')

# 2) Construir la superficie (10-10) = (100)
#    'layers' = número de capas equivalentes; 'vacuum' se añade a AMBOS lados
slab = surface(bulk, (1, 0, 0), layers=6, vacuum=8.0)
slab.write('slab_1010.xsf')      # revísalo en VESTA/XCrySDen ANTES de correr

# 3) Imprimir los bloques listos para pegar en el .in
cell = slab.get_cell()
print(f"nat = {len(slab)}   ntyp = {len(set(slab.get_chemical_symbols()))}\n")

print("CELL_PARAMETERS angstrom")
for v in cell:
    print(f"  {v[0]:16.10f} {v[1]:16.10f} {v[2]:16.10f}")

print("\nATOMIC_POSITIONS crystal")
for s, p in zip(slab.get_chemical_symbols(), slab.get_scaled_positions()):
    print(f"  {s:<3s} {p[0]:16.10f} {p[1]:16.10f} {p[2]:16.10f}")
