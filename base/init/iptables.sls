iptables:

{%- if grains['os'] == 'CentOS' %}
  cmd.run:
    - name: systemctl stop firewalld.service && systemctl disable firewalld.service
{%- endif %}

  pkg.installed:
    - name: iptables-services

  file.managed:
    - name: /etc/sysconfig/iptables
    - source: salt://base/init/files/iptables
    - user: root
    - gourp: root
    - mode: 600
    - require:
      - pkg: iptables

  service.running:
    - enable: True
    - watch:
      - pkg: iptables
      - file: iptables
