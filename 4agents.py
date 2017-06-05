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

def trajectory_plot(t, trajectory, case, title, linestyle, ax1 = None, ax2 = None):

    fig = plt.figure(title, figsize=(6, 8), dpi=80)
    fig.subplots_adjust(left=0.2, wspace=0.4, hspace = 0.5)
    # st = fig.suptitle(title)
    # st.set_y(0.95)
    labelx = -0.15
    components = itertools.cycle([r'$x(t)$', r'$y(t)$'])
    color_vector = itertools.cycle(['red', 'blue', 'green', 'black'])
    for counter in range(trajectory.shape[1]):
        if (counter % 2) == 0:
            if (case is 'diagonal') & (counter == 0) & (ax1 == None):
                ax1 = plt.subplot2grid((4, 2), ((counter % 2), 0))
            elif (case is 'neighbour') & (counter == 0) & (ax1 == None):
                ax1 = plt.subplot2grid((4, 2), ((counter % 2) + 2, 0))
            elif (case is 'unconstrained') & (counter == 0) & (ax1 == None):
                ax1 = plt.subplot2grid((4, 2), ((counter % 2), 1))
            elif (counter == 0) & (ax1 == None):
                ax1 = plt.subplot2grid((4, 2), ((counter % 2) + 2, 1))
            color = color_vector.next()
            ax1.plot(t, trajectory[:, counter], label=r'x' + str(counter / 2 + 1), linestyle=linestyle, c=color)
            ax1.set_xticklabels([])
            ax1.set_title(case)
            #ax1.yaxis.set_label_coords(labelx, 0.5)
        else:
            if (case is 'diagonal') & (counter == 1) & (ax2 == None):
                ax2 = plt.subplot2grid((4, 2), ((counter % 2), 0))
                ax2.set_xticklabels([])
            elif (case is 'neighbour') & (counter == 1) & (ax2 == None):
                ax2 = plt.subplot2grid((4, 2), ((counter % 2) + 2, 0))
                ax2.set_xlabel(r'time $t$')
            elif (case is 'unconstrained') & (counter == 1) & (ax2 == None):
                ax2 = plt.subplot2grid((4, 2), ((counter % 2), 1))
                ax2.set_xticklabels([])
            elif (counter == 1) & (ax2 == None):
                ax2 = plt.subplot2grid((4, 2), ((counter % 2) + 2, 1))
                ax2.set_xlabel(r'time $t$')
            plt.plot(t, trajectory[:, counter], label=r'y' + str(counter / 2 + 1), linestyle=linestyle, c=color)
            #ax2.yaxis.set_label_coords(labelx, 0.5)

        # plt.legend(loc='best')
        plt.ylabel(components.next())
        plt.grid(True)
        plt.tight_layout()
    return ax1, ax2

def initial_condition_generator(n_agents, zero = False):
    logging.info('Starting')
    logging.debug('input = %s' %n_agents)
    if zero is False:
        ic = []
        for counter in range(2 * n_agents):
            ic.append(random.random() * (-1) ** random.randrange(1, 10))
    else:
        ic = np.zeros(2 * n_agents)
    ic = np.array(ic).reshape(2 * n_agents, 1) * 10
    logging.debug('output = %s' % ic)
    logging.info('End\n\n')
    return ic

def load_system(states, t, open_loop, M = np.eye(2), target_trajectory = None, case = 'zero'):
    logging.info('\n Starting')
    logging.debug('')

    n_agents = len(states) / 2

    x = np.array([states[2 * item] for item in range(n_agents)])
    y = np.array([states[2 * item + 1] for item in range(n_agents)])

    if open_loop is True:
        u = np.zeros(n_agents)
    else:
        q_tt = target_trajectory.next()


        u = feedback_law(x, y, q_tt, M, case)
    dq = np.squeeze(system(x, y, u)) + 0.0

    logging.debug('output = %s' %dq)
    logging.info('End\n')
    return dq


def feedback_law(x, y, q_tt, M, case):
    logging.info('\n Starting')

    n_agents = len(x)

    x_tt = np.array([q_tt[2 * item] for item in range(n_agents)])
    y_tt = np.array([q_tt[2 * item + 1] for item in range(n_agents)])
    q = np.squeeze(np.array([[x[0]], [y[0]], [x[1]], [y[1]], [x[2]], [y[2]], [x[3]], [y[3]]]))

    K1 = lambda s: np.dot(Y_matrix(x + s * (x_tt - x), y + s * (y_tt - y), case), M.dot(q_tt - q))[0, 0]
    K2 = lambda s: np.dot(Y_matrix(x + s * (x_tt - x), y + s * (y_tt - y), case), M.dot(q_tt - q))[0, 1]
    K3 = lambda s: np.dot(Y_matrix(x + s * (x_tt - x), y + s * (y_tt - y), case), M.dot(q_tt - q))[0, 2]
    K4 = lambda s: np.dot(Y_matrix(x + s * (x_tt - x), y + s * (y_tt - y), case), M.dot(q_tt - q))[0, 3]

    k1 = quad(K1, 0.0, 1.0)
    k2 = quad(K2, 0.0, 1.0)
    k3 = quad(K3, 0.0, 1.0)
    k4 = quad(K4, 0.0, 1.0)
    k1 = k1[0]
    k2 = k2[0]
    k3 = k3[0]
    k4 = k4[0]
    k = -np.array([[k1], [k2], [k3], [k4]])
    logging.debug('output = %s' %k)
    logging.info('\n End')
    return k

def Y_matrix(x, y, case):
    x1 = x[0]
    x2 = x[1]
    x3 = x[2]
    x4 = x[3]

    y1 = y[0]
    y2 = y[1]
    y3 = y[2]
    y4 = y[3]

    if case is 'diagonal':
        Y = np.mat([
            [-2 * y1, - 3.0 - 2.0 * (x1 ** 2 + y1 ** 2), 0, 0, 0, 0, 0, 0],
            [0, 0, -2 * y2, - 3.0 - 2.0 * (x2 ** 2 + y2 ** 2), 0, 0, 0, 0],
            [0, 0, 0, 0, -2 * y3, - 3.0 - 2.0 * (x3 ** 2 + y3 ** 2), 0, 0],
            [0, 0, 0, 0, 0, 0, -2 * y4, - 3.0 - 2.0 * (x4 ** 2 + y4 ** 2)]
        ])
    elif case is 'neighbour':
        Y = np.mat([
            [-2.0 * y1, -2.0 * (1.0 + x2 ** 2 + y2 ** 2), 0, 0, 0, 0, 0, 0],
            [0, 0, -2.0 * y2, -2.0 * (1.0 + x1 ** 2 + y1 ** 2 + x3 ** 2 + y3 ** 2), 0, 0, 0, 0],
            [0, 0, 0, 0, -2.0 * y3, -2.0 * (1.0 + x2 ** 2 + y2 ** 2 + x4 ** 2 + y4 ** 2), 0, 0],
            [0, 0, 0, 0, 0, 0, -2.0 * y4, -2.0 * (1.0 + x3 ** 2 + y3 ** 2)],
        ])
    elif case is 'unconstrained':
        Y = np.mat([
            [-2 * y1, -2 * (1 + x1 ** 2 + y1 ** 2 + x2 ** 2 + y2 ** 2 + x3 ** 2 + y3 ** 2 + x4 ** 2 + y4 ** 2), 0, 0,
             0.03 * y1, 0, 0, 0],
            [0, 0, -2 * y2, -2 * (1 + x1 ** 2 + y1 ** 2 + x2 ** 2 + y2 ** 2 + x3 ** 2 + y3 ** 2 + x4 ** 2 + y4 ** 2), 0,
             0, 0.04 * y2, 0],
            [0.04 * y2, 0, 0, 0, -2 * y3,
             -2 * (1 + x1 ** 2 + y1 ** 2 + x2 ** 2 + y2 ** 2 + x3 ** 2 + y3 ** 2 + x4 ** 2 + y4 ** 2), 0, 0],
            [0, 0, 0.03 * y4, 0, 0, 0, -2 * y4,
             -2 * (1 + x1 ** 2 + y1 ** 2 + x2 ** 2 + y2 ** 2 + x3 ** 2 + y3 ** 2 + x4 ** 2 + y4 ** 2)]
        ])
    else:
        Y = np.mat(np.zeros((4, 8)))
    return Y

def system(x, y, u):
    logging.info('\n Starting')
    logging.debug('input = %s' % list((x, y, u)))

    x1 = x[0]
    x2 = x[1]
    x3 = x[2]
    x4 = x[3]

    y1 = y[0]
    y2 = y[1]
    y3 = y[2]
    y4 = y[3]

    u1 = u[0]
    u2 = u[1]
    u3 = u[2]
    u4 = u[3]

    InterconnectionParameter = 0.01

    # compute acceleration xdd
    dx1 = -x1 - x1 ** 3 + y1 ** 2 + InterconnectionParameter * (x1 ** 3 - 2 * x1 ** 3 + x2 ** 3)
    dy1 = u1
    dx2 = -x2 - x2 ** 3 + y2 ** 2 + InterconnectionParameter * (x1 ** 3 - 2 * x2 ** 3 + x3 ** 3)
    dy2 = u2
    dx3 = -x3 - x3 ** 3 + y3 ** 2 + InterconnectionParameter * (x2 ** 3 - 2 * x3 ** 3 + x4 ** 3)
    dy3 = u3
    dx4 = -x4 - x4 ** 3 + y4 ** 2 + InterconnectionParameter * (x3 ** 3 - 2 * x4 ** 3 + x4 ** 3)
    dy4 = u4

    output = np.array([[dx1], [dy1], [dx2], [dy2], [dx3], [dy3], [dx4], [dy4]])

    # return the two state derivatives

    logging.debug('output = %s' %output)
    logging.info('End\n')
    return output


def trajectory_generator(t, ic, open_loop, M = np.eye(4), target_trajectory = None, case = 'zero'):
    logging.info('\n Starting')
    logging.debug('input = %s' % list((t, ic, open_loop)))
    trajectory, information = odeint(load_system, ic, t, args=(open_loop, M, target_trajectory, case), Dfun=None,
                                     col_deriv=0, full_output=1, mxstep=2000)
    logging.debug('ode info = %s' % information)
    logging.debug('output = %s' %trajectory)
    logging.info('End\n')
    return trajectory

def main():
    logging.basicConfig(filename='4agents.log', filemode='w', level=logging.DEBUG,
                        format='%(asctime)s:%(levelname)s:%(funcName)s:%(message)s', datefmt='%m/%d/%Y %I:%M:%S %p')
    logging.info('\n Starting')

    n_agents = 4
    open_loop = True
    t = np.arange(0.0, 1.0, 0.001)
    ic = np.squeeze(initial_condition_generator(n_agents, True))
    # The following works with initial conditions that is not zero
    # ic = np.array([ 6.03898782, 7.80603852, -7.16372085, 5.69110573, -0.0326517, 8.82421257, 0.18566321,
    #               -1.97987788])
    print 'Initial condition for trajectory generation: ', ic
    target_trajectory = trajectory_generator(t, ic, open_loop)

    tt = itertools.cycle(target_trajectory)
    styles_vector = itertools.cycle(['-', '--', '-.', ':'])
    for case in ['diagonal', 'neighbour', 'unconstrained', 'open loop']:

        line_style = styles_vector.next()
        # ax1, ax2 = trajectory_plot(t, target_trajectory, case, 'Simulation', ':')

        if case is 'diagonal':
            W = np.diag([2, 1, 1, 1, 1, 1, 1, 1])
            ic = np.squeeze(initial_condition_generator(n_agents))
            # To generate a nice figure
            ic = np.array([-1.44395373, -5.17801414, 6.1762607, -8.0185518, -7.05370655, 9.64592077, 7.94661802,
              3.66124175])

        elif case is 'neighbour':
            W = np.diag([2, 1, 1, 1, 1, 1, 2, 1])
        elif case is 'unconstrained':
            W = np.diag([1, 1, 2, 1, 2, 1, 1, 1])
        else:
            W = np.eye(2 * n_agents)
        M = np.linalg.inv(W)


        print 'Initial condition for closed-loop system: ', ic
        open_loop = False
        simulation = trajectory_generator(t, ic, open_loop, M, tt, case)
        trajectory_plot(t, simulation, case, 'Simulation', line_style)

        V_temp = np.dot((target_trajectory - simulation), M.dot((target_trajectory - simulation).transpose()))
        V = []
        for counter in range(len(V_temp)):
            if case is None:#'open loop':
                V.append(np.exp(-7.5*t[counter]) * V_temp.max())
            else:
                V.append(V_temp[counter, counter])
        V = np.array(V)


        labelx = -0.15
        fig = plt.figure('Riemannian Energy')
        fig.subplots_adjust(left=0.2, wspace=0.4, hspace=0.0)
        if case is 'diagonal':
            ax3 = plt.subplot2grid((2, 1), (0, 0), colspan=2)
            ax4 = plt.subplot2grid((2, 1), (1, 0), colspan=2)
        ax3.plot(t, V, label=case, linestyle=line_style)
        ax3.grid(True,  linewidth=0.5)
        ax3.set_ylabel(r'$e(t)$')
        ax3.legend(loc='best')
        ax3.set_title('Riemannian energy')
        ax3.set_xticklabels([])

        ax4.plot(t, V, label=case, linestyle=line_style)
        ax4.grid(True,  which="both", linewidth=0.5)
        ax4.set_yscale('log')
        ax4.set_xlabel(r'time $t$')
        ax4.set_ylabel(r'$\log(e(t))$')
        ax4.legend(loc='best')
        plt.tight_layout()
        #ax3.yaxis.set_label_coords(labelx, 0.5)

    plt.savefig('Riemannian_energy.eps', format='eps', dpi=1200, bbox_inches='tight')
    fig = plt.figure('Simulation')
    plt.savefig('simulation.eps', format='eps', dpi=1200, bbox_inches='tight')
    plt.show()
    logging.info('End\n')
    return

if __name__ == '__main__':
    main()