firewalld:
{%- if grains['osfinger'] == 'CentOS Linux-7' %}
  service.running:
    - enable: false 
    - reload: false
  cmd.run:
    - name: systemctl disable firewalld
    - requires:
      - service: firewalld
{%- endif %}


iptables:
  pkg.installed:
    - name: iptables-services

  file.managed:
    - name: /etc/sysconfig/iptables
    - source: salt://base/init/files/iptables
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: iptables

  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: iptables
      - file: iptables
