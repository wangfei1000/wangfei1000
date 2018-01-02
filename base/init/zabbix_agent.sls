zabbix-agent:
  pkg.installed:
    - name: zabbix-agent
  file.managed:
    - name: /etc/zabbix_agentd.conf
    - source: salt://base/init/files/zabbix_agentd.conf
    - require:
      - pkg: zabbix-agent
  service.running:
    - enable: True
    - watch:
      - pkg: zabbix-agent
      - file: zabbix-agent
zabbix_agentd.conf.d:
  file.directory:
    - name: /etc/zabbix_agentd.conf.d
    - watch_in:
      - service: zabbix-agent
    - require:
      - pkg: zabbix-agent
      - file: zabbix-agent
