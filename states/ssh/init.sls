/etc/ssh/ssh_config:
  file.managed:
    - source: salt://ssh/ssh_config
    - mode: 644
    - user: root

