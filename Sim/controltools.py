from matplotlib import  pyplot as plt
def plot2d_fun(fig, ax, data,
               title='',
               label='',
               xlabel='time [s]',
               ylabel='',
               grid=True,
               legend_pos='upper right',
               color='lightblue',
               ls='-',
               show=False,
               xscale=None,
               xlim=(),
               ylim=()
              ):
    tt, yt = data
    ax.plot(tt,yt,label=label,color=color,ls=ls)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    if xscale: ax.set_xscale(xscale)
    if xlim: ax.set_xlim(*xlim)
    if ylim: ax.set_ylim(*ylim)
    ax.legend(loc=legend_pos)
    if xscale=='log':
        ax.grid(grid,which='both',ls='--',color='gray')
    else:
        ax.grid(grid,ls='--',color='gray')
    ax.set_title(title)
    if show:
        # plt.tight_layout()
        plt.show()
        return
    else:
        return fig