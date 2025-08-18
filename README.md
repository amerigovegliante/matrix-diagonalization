# MATRIX DIAGONALIZATION

## Folder Structure

```bash
matrix-diagonalization
│   main.m
│   README.md
│
├───functions
│       multalg.m
│       multgeo.m
│       myobjective.m
│
├───graphs
│       clustered_graph.m
│       spaced_graph.m
│
└───testing
        test_diagonalization.m
        test_matrix_gen.m
```

## Description
The goal of this project is to **study the numerical diagonalization of matrices** generated with prescribed eigenvalues and multiplicities.  
The experiments aim to determine:  
- the **maximum multiplicity** of eigenvalues for which the diagonalization process remains stable,  
- the effect of **clustering eigenvalues** (i.e., very close eigenvalues) on the success of diagonalization.  

In short, the project analyzes **when eigenvalue decomposition is numerically reliable** and when it starts to fail.

---

## Main Components
1. **Custom Functions**
   - `matrix_gen(eigenvalues, multiplicities)` → generates a matrix with the given eigenvalues and multiplicities.  
   - `test_diagonalization(A, eigenvalues, delta, toll, it, maxit)` → tests whether the matrix `A` can be diagonalized stably within the given tolerances and iteration limits.  

2. **Control Parameters**
   - `delta = 1e-4` → tolerance for eigenvalue perturbations.  
   - `toll = 1e-8` → numerical tolerance for convergence.  
   - `it = 10`, `maxit = 100` → iteration parameters.  

3. **Main Experiments**
   - **Well Spaced Eigenvalues**  
     - Eigenvalues are far apart (e.g., `[2, 350]`).  
     - The multiplicity of each eigenvalue is increased step by step.  
     - The experiment determines the **maximum multiplicity** for which diagonalization still succeeds.  

   - **Clustered Eigenvalues**  
     - Eigenvalues are very close to each other (e.g., `2 + 10^-i`, `2 + 2·10^-i`, `2 + 3·10^-i`).  
     - Both the spacing (`delta`) and multiplicity are varied.  
     - The experiment shows the **limit of stability** when eigenvalues become clustered.  

---

## Results Visualization
Two types of plots are generated:  

1. **Well Spaced Eigenvalues**
   - A bar chart showing, for each multiplicity, whether diagonalization succeeded (`1`) or failed (`0`).  
   - The maximum valid multiplicity is also computed and displayed.  

2. **Clustered Eigenvalues**
   - A heatmap representing success (`1`, green) and failure (`0`, red).  
   - Axes represent:  
     - **X-axis** → multiplicity,  
     - **Y-axis** → spacing between eigenvalues (`10^-1`, `10^-2`, `10^-3`, `10^-4`).  
   - This provides a clear visualization of the **stability/instability region**.  

---

## Workflow Diagram
```mermaid
flowchart TD

A[Start] --> B[Set Parameters: delta, toll, it, maxit]
B --> C[Define Eigenvalues]

C --> D1[Well Spaced Eigenvalues: e.g. 2, 350]
C --> D2[Clustered Eigenvalues: e.g. 2+10^-i, 2+2*10^-i, 2+3*10^-i]

D1 --> E1[Loop over multiplicities 1 to 7 and generate A with matrix_gen]
E1 --> F1[Test diagonalization]
F1 --> G1[Record success/failure in spaced_results]
G1 --> H1[Compute max valid multiplicity]

D2 --> E2[Loop over delta values 10^-1 to 10^-4 and multiplicities 1 to 7]
E2 --> F2[Test diagonalization]
F2 --> G2[Record success/failure in clustered_results]
G2 --> H2[Compute max valid delta and multiplicity]

H1 --> I[Generate Plots]
H2 --> I

I --> J[Results and Analysis]
J --> K[End]


