from ase.io import read

atoms = read("GaN_3x3x3.xsf")

print("CELL_PARAMETERS angstrom")
for v in atoms.cell:
    print(*v)

print("\nATOMIC_POSITIONS angstrom")
for atom in atoms:
    print(atom.symbol, *atom.position)
