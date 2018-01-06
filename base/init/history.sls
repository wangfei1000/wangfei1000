/etc/profile:
  file.append:
    - text:
      - export HISTTIMEFORMAT="%F %T `whoami` "
      - export HISTSIZE=10000
      - export HISTFILESIZE=10000
