ntpdate:
  pkg.installed:
    - name: ntpdate

  file.managed:
    - name: /data/tools/ntpdate/ntp.sh
    - source: salt://init/files/ntp.sh
    - mode: 777
    - user: dhom
    - group: dhom
    - require:
      - pkg: ntpdate


/data/tools/ntpdate/ntp.sh:
  cmd.run:
    - name: rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

  cron.present:
    - user: root
    - minute: "*/20"
    - require:
      - pkg: ntpdate
      - file: ntpdate
      - cmd: /data/tools/ntpdate/ntp.sh
