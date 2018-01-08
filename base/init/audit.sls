/etc/bashrc:
  file.managed:
    - source: salt://base/init/file/bashrc
    - user: root
    - group: root
    - mode: 644 

  file.append:
    - text:
      - export PROMPT_COMMAND='{ msg=$(history 1 | { read x y; echo $y; });logger "[euid=$(whoami)]":$(who am i):[`pwd`]"$msg"; }'
