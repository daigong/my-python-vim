""" SCM hooks.
"""
from __future__ import absolute_import

import sys
from os import path as op, chmod
from subprocess import Popen, PIPE

from .main import LOGGER


try:
    from configparser import ConfigParser # nolint
except ImportError:   # Python 2
    from ConfigParser import ConfigParser


def run(command):
    """ Run a shell command.

    :return str: Stdout

    """
    p = Popen(command.split(), stdout=PIPE, stderr=PIPE)
    (stdout, stderr) = p.communicate()
    return (p.returncode, [line.strip() for line in stdout.splitlines()],
            [line.strip() for line in stderr.splitlines()])


def git_hook():
    """ Run pylama after git commit. """

    from .main import check_files
    _, files_modified, _ = run("git diff-index --cached --name-only HEAD")
    LOGGER.setLevel('WARN')
    check_files([f for f in map(str, files_modified) if f.endswith('.py')])


def hg_hook(ui, repo, **kwargs):
    """ Run pylama after mercurial commit. """

    from .main import check_files
    seen = set()
    paths = []
    for rev in range(repo[kwargs['node']], len(repo)):
        for file_ in repo[rev].files():
            file_ = op.join(repo.root, file_)
            if file_ in seen or not op.exists(file_):
                continue
            seen.add(file_)
            if file_.endswith('.py'):
                paths.append(file_)
    LOGGER.setLevel('WARN')
    check_files(paths)


def install_git(path):
    """ Install hook in Git repository. """
    hook = op.join(path, 'pre-commit')
    with open(hook, 'w+') as fd:
        fd.write("""#!/usr/bin/env python
import sys
from pylama.hook import git_hook

if __name__ == '__main__':
    sys.exit(git_hook())
""")
    chmod(hook, 484)


def install_hg(path):
    """ Install hook in Mercurial repository. """

    hook = op.join(path, 'hgrc')
    if not op.isfile(hook):
        open(hook, 'w+').close()

    c = ConfigParser()
    c.readfp(open(path, 'r'))
    if not c.has_section('hooks'):
        c.add_section('hooks')

    if not c.has_option('hooks', 'commit'):
        c.set('hooks', 'commit', 'python:pylama.hooks.hg_hook')

    if not c.has_option('hooks', 'qrefresh'):
        c.set('hooks', 'qrefresh', 'python:pylama.hooks.hg_hook')

    c.write(open(path, 'w+'))


def install_hook(path):
    """ Auto definition of SCM and hook installation. """

    git = op.join(path, '.git', 'hooks')
    hg = op.join(path, '.hg')
    if op.exists(git):
        install_git(git) and LOGGER.warn('Git hook has been installed.') # nolint

    elif op.exists(hg):
        install_hg(git) and LOGGER.warn('Mercurial hook has been installed.') # nolint

    else:
        LOGGER.error('VCS has not found. Check your path.')
        sys.exit(1)
