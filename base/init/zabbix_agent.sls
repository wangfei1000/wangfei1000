zabbix-agent:
  file.managed:
    - name: /etc/zabbix_agentd.conf
    - source: salt://base/init/files/zabbix_agentd.conf
  service.running:
    - enable: True
    - watch:
      - file: zabbix-agent
zabbix_agentd.conf.d:
  file.directory:
    - name: /etc/zabbix_agentd.conf.d
    - watch_in:
      - service: zabbix-agent
    - require:
      - file: zabbix-agent
