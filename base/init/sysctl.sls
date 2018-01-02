/etc/sysctl.conf:
  file.managed:
    - source: salt://base/init/files/sysctl.conf
    - user: root
    - gourp: root
    - mode: 644
