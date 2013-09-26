jason:
  user.present:
    - fullname: Jason Paryani
    - shell: /bin/zsh
    - home: /home/jason
    - groups:
      - sudo
      - adm

https://github.com/robbyrussell/oh-my-zsh.git:
  git.latest:
    - target: /home/jason/.oh-my-zsh
    - runas: jason
    - user: jason
    - require:
      - user: jason

https://github.com/jparyani/dotfiles.git:
  git.latest:
    - target: /home/jason/dotfiles
    - runas: jason
    - user: jason
    - require:
      - user: jason

python-pip:
  pkg.installed

virtualenvwrapper:
  pip.installed:
    - require:
      - pkg: python-pip

run_virtualenvwrapper:
  cmd.wait:
    - name: 'bash virtualenvwrapper.sh'
    - watch:
      - pip: virtualenvwrapper


/home/jason/dotfiles/install.sh:
  cmd.wait:
    - watch:
      - git: 'https://github.com/jparyani/dotfiles.git'
    - require:
      - git: https://github.com/robbyrussell/oh-my-zsh.git
      - pip: virtualenvwrapper
      - cmd: run_virtualenvwrapper
    - cwd: /home/jason/dotfiles
    - user: jason

/home/jason/.site_specific.pre:
  file.managed:
    - user: jason
    - group: jason
    - mode: '0600'

/home/jason/.site_specific.post:
  file.managed:
    - user: jason
    - group: jason
    - mode: '0600'