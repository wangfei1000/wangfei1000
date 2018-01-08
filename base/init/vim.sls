/etc/skel/.vimrc
  file.managed:
  - source: salt://base/init/file/.vimrc
  - user: root
  - group: root
  - mode: 644
