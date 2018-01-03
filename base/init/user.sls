adduser:
  user.present:
    - fullname: dhom
    - shell: /bin/bash
    - home: /home/dhom
    - uid: 1001
    - gid: 1001

  user.present:
    - fullname: dba
    - shell: /bin/bash
    - home: /home/dba
    - uid: 2001
    - gid: 2001

