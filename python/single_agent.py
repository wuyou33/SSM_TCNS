"""
Notes:
    
    1) Known numerical errors. Choosing the initial condition [-9.44500792, 2.92172601] for the trajectory generator and
    the initial condition [-9.06892831, -9.7230096 ] for the closed-loop system leads to a trajectory error, when the
    odeint is executed with the option mxstep<1500

"""

import logging
import inspect
import numpy as np
from pylab import *
from scipy.integrate import odeint
from scipy.integrate import quad
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import random
import itertools

def trajectory_plot(t, trajectory, label, title, linestyle, color):

    fig = figure(title)
    st = fig.suptitle(title)
    st.set_y(0.95)
    components = [r'$x(t)$', r'$y(t)$']
    for counter, y_label in zip(range(trajectory.shape[1]), components):
        if counter == 0:
            ax1 = plt.subplot(3, 1, counter + 1)
            plt.plot(t, trajectory[:, counter], label=label, linestyle=linestyle, c=color)
        else:
            ax2 = plt.subplot(3, 1, counter + 1)
            plt.plot(t, trajectory[:, counter], label=label, linestyle=linestyle, c=color)

        plt.legend(loc='best')
        plt.ylabel(y_label)
        plt.grid(True)
    ax1.get_shared_x_axes().join(ax1, ax2)
    ax1.set_xticklabels([])
    ax2.set_xticklabels([])
    #plt.xlabel(r'time $t$')


    return

def initial_condition_generator(n_agents, zero = False):
    logging.info('Starting')
    logging.debug('input = %s' %n_agents)
    if zero is False:
        ic = []
        for counter in range(2 * n_agents):
            ic.append(random.random() * (-1) ** random.randrange(1, 10))
    else:
        ic = np.zeros(2)
    ic = np.array(ic).reshape(2, 1) * 10
    logging.debug('output = %s' % ic)
    logging.info('End\n\n')
    return ic

def load_system(states, t, open_loop, M = np.eye(2), target_trajectory = None):
    logging.info('\n Starting')
    logging.debug('')

    x = states[0]
    y = states[1]

    if open_loop is True:
        u = 0.0
    else:
        q_tt = target_trajectory.next()
        x_tt = q_tt[0]
        y_tt = q_tt[1]
        u = feedback_law(x, x_tt, y, y_tt, M)
    dq = np.squeeze(system(x, y, u)) + 0.0

    logging.debug('output = %s' %dq)
    logging.info('End\n')
    return dq


def feedback_law(x, x_tt, y, y_tt, M):
    logging.info('\n Starting')
    logging.debug('Input = %s' % list((x, x_tt, y, y_tt, M)))

    q = np.array([[x], [y]])
    q_tt = np.array([[x_tt], [y_tt]])
    Y = lambda (x, y): np.mat([-0.9082 * y - 0.1376 * x * y, -1.247947821 - 1.2740 * y ** 2 - 1.2227 * x ** 2])
    K = lambda s: np.dot(Y([x + s * (x_tt - x), y + s * (y_tt - y)]), M.dot(q - q_tt))
    k = quad(K, 0.0, 1.0)
    k = k[0]
    logging.debug('output = %s' %k)
    logging.info('\n End')
    return k

def system(x, y, u):
    logging.info('\n Starting')
    logging.debug('input = %s' % list((x, y, u)))

    dx = -x - x ** 3 + y ** 2
    dy = u

    output = np.array([[dx], [dy]])
    logging.debug('output = %s' %output)
    logging.info('End\n')
    return output


def trajectory_generator(t, ic, open_loop, M = np.eye(2), target_trajectory = None):
    logging.info('\n Starting')
    logging.debug('input = %s' % list((t, ic, open_loop)))
    trajectory, information = odeint(load_system, ic, t, args=(open_loop, M, target_trajectory), Dfun=None, col_deriv=0, full_output=1, mxstep=2000)
    logging.debug('ode info = %s' % information)
    logging.debug('output = %s' %trajectory)
    logging.info('End\n')
    return trajectory

def main():
    logging.basicConfig(filename='single_agent.log', filemode='w', level=logging.DEBUG,
                        format='%(asctime)s:%(levelname)s:%(funcName)s:%(message)s', datefmt='%m/%d/%Y %I:%M:%S %p')
    logging.info('\n Starting')

    n_agents = 1
    open_loop = True
    t = np.arange(0.0, 1.0, 0.001)
    ic = np.squeeze(initial_condition_generator(n_agents))
    ic = np.squeeze([2.27048262, 0.02774451]) #Nice graphs
    print 'Initial condition for trajectory generation: ', ic
    target_trajectory = trajectory_generator(t, ic, open_loop)

    trajectory_plot(t, target_trajectory, 'Target trajectory', 'Simulation', ':', 'blue')

    tt = itertools.cycle(target_trajectory)

    W = np.matrix([[1.255952062, 0.0], [0.0, 0.7956732804]])
    M = np.linalg.inv(W)
    ic = np.squeeze(initial_condition_generator(n_agents))
    ic = np.squeeze([ 3.98519881, 8.42114602]) # Nice graphs
    print 'Initial condition for closed-loop system: ', ic
    open_loop = False
    simulation = trajectory_generator(t, ic, open_loop, M, tt)
    trajectory_plot(t, simulation, 'Closed-loop simulation', 'Simulation', '-', 'red')



    V_temp = np.dot((target_trajectory - simulation), M.dot((target_trajectory - simulation).transpose()))
    V = []
    for counter in range(len(V_temp)):
        V.append(V_temp[counter, counter])
    V = np.array(V)

    fig = figure('Simulation')
    plt.subplot(3, 1, 3)
    plt.plot(t, V, label=V, linestyle='-', c='black')
    plt.grid()
    plt.xlabel(r'time $t$')
    plt.ylabel(r'$V(Q(t))$')
    # plt.subplots_adjust(hspace=.0)
    plt.show()

    logging.info('End\n')
    return

if __name__ == '__main__':
    main()