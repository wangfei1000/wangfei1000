/etc/resolv.conf:
  file.managed:
    - source: salt://base/init/files/resolv.conf
    - user: root
    - gourp: root
    - mode: 644
