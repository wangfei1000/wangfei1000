adduser:
  user.present:
    - fullname: dhom
    - shell: /bin/bash
    - system: true
    - createhome: true
    - uid: 1001
    - gid: 1001

  user.present:
    - fullname: dba
    - shell: /bin/bash
    - system: true
    - createhome: true
    - uid: 2001
    - gid: 2001

