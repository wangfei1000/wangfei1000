/etc/resolv.conf:
  file.managed:
    - source: salt://base/init/files/resolv.conf
    - user: root
    - group: root
    - mode: 644
