/etc/sysctl.conf:
  file.managed:
    - source: salt://base/init/files/sysctl.conf
    - user: root
    - group: root
    - mode: 644
