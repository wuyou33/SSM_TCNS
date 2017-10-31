# -*- coding: utf-8 -*-
"""
Created on Tue May 02 11:20:13 2017

@author: humberto
"""

import scipy.io as sio
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

number_of_neighbors = [2**i for i in range(0, 10)]

l_constraint = []
l_nn = []
l_st = []
l_solver = []

for solver in ['mosek', 'CDCS']:
    for nn in number_of_neighbors:
        for constraint in ['General', 'Neighbor', 'Diagonal']:
            
            filename = 'Output' + constraint + str(nn) + 'Agents' + '-Solver_' + solver
            filename = filename + '.mat'
            l_constraint.append(constraint)
            l_nn.append(nn)
            l_solver.append(solver)
            try:
                mat = sio.loadmat(filename)
                l_st.append(float(mat['SolverTime']))
            except IOError:
                l_st.append('na')

df = pd.DataFrame(zip(l_constraint, l_nn, l_st, l_solver), 
                  columns=['Constraint', 'NNeigh', 'SolverTime', 'Solver'])

df[['SolverTime']] = pd.to_numeric(df['SolverTime'], errors='coerce')
print df.head()
print df[(df.Constraint == 'Neighbor') & (df.Solver == 'mosek')]

fig = plt.figure()
ax = plt.gca()
mosek_diagonal = ax.scatter(df[(df.Constraint == 'Diagonal') & (df.Solver == 'mosek')].NNeigh, df[(df.Constraint == 'Diagonal') & (df.Solver == 'mosek')].SolverTime, c='blue', marker='o', label='Diagonal', alpha=0.33, lw=1)
mosek_neighbor = ax.scatter(df[(df.Constraint == 'Neighbor') & (df.Solver == 'mosek')].NNeigh, df[(df.Constraint == 'Neighbor') & (df.Solver == 'mosek')].SolverTime, c='blue', marker='s', label='Neighbor', alpha=0.33, lw=1)
mosek_general = ax.scatter(df[(df.Constraint == 'General') & (df.Solver == 'mosek')].NNeigh, df[(df.Constraint == 'General') & (df.Solver == 'mosek')].SolverTime, c='blue', marker='d', label='Unconstrained', alpha=0.33, lw=1)
#CDCS_diagonal = ax.scatter(df[(df.Constraint == 'Diagonal') & (df.Solver == 'CDCS')].NNeigh, df[(df.Constraint == 'Diagonal') & (df.Solver == 'CDCS')].SolverTime, c='red', marker='o', label='Diagonal & CDCS', alpha=0.33, lw=1)
#CDCS_neighbor = ax.scatter(df[(df.Constraint == 'Neighbor') & (df.Solver == 'CDCS')].NNeigh, df[(df.Constraint == 'Neighbor') & (df.Solver == 'CDCS')].SolverTime, c='red', marker='s', label='Neighbor & CDCS', alpha=0.33, lw=1)
#CDCS_general = ax.scatter(df[(df.Constraint == 'General') & (df.Solver == 'CDCS')].NNeigh, df[(df.Constraint == 'General') & (df.Solver == 'CDCS')].SolverTime, c='red', marker='d', label='General & CDCS', alpha=0.33, lw=1)
ax.set_yscale('log')
plt.ylabel('Time [s]')
ax.set_xscale('log', basex=2)
plt.xlabel('Number of nodes (N)')
plt.xticks(number_of_neighbors, number_of_neighbors)
plt.title('Time taken to solve the set of matrix inequalities')
# lgd = plt.legend(handles=[mosek_diagonal, mosek_neighbor, mosek_general, CDCS_diagonal, CDCS_neighbor, CDCS_general], loc='upper right', bbox_to_anchor=(1,-0.15), ncol=2)
lgd = plt.legend(handles=[mosek_diagonal, mosek_neighbor, mosek_general], loc='best')
plt.grid(True, which="both", linewidth=0.25, linestyle=':')
plt.savefig('ParserTimes.eps', format='eps', dpi=1200, bbox_inches='tight')
plt.show()
# print sio.whosmat('OutputGeneral1Agents-Solver_CDCS.mat')

