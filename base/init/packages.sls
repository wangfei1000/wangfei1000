base-soft:
  pkg.installed:
    - names: 
      - bc
      - lsof
      - dmidecode
      - dos2unix
      - nmap
      - telnet
      - iftop
      - net-tools
      - nload
      - nethogs
      - iotop
      - htop
      - unzip
      - perl-core
      - perf
      - bind-utils
      - python
      - mtr
      - tcpdump
      - ipmitool
      - strace
      - zabbix-agent
  {% if grains['osfinger'] == 'CentOS Linux-7' %}
      - iptables-services
  {% endif %}
