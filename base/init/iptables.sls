firewalld:
  cmd.run:
    - name: echo "stop firewalld, if os is c7 will not to do."

  {% if grains['osfinger'] == 'CentOS Linux-7' %}
  service.running:
    - name: firewalld
    - enable: false 
    - reload: false
  {% endif %}

iptables:
  file.managed:
    - name: /etc/sysconfig/iptables
    - source: salt://init/files/iptables
    - user: root
    - group: root
    - mode: 600

  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: iptables

  {% if grains['osfinger'] == 'CentOS Linux-7' %}
  cmd.run:
    - name: systemctl disable firewalld
  {% endif %}
