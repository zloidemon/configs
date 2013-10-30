sshd:
{% if grains['os'] != 'FreeBSD' %}
  pkg:
    - installed
    - name: {{ pillar['ssh']['server'] }} 
{% endif %}
  service:
    - name: {{ pillar['ssh']['service'] }}
    - running
    - watch:
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/sshd_config
    - mode: 644
    - user: root
{% if grains['os'] != 'FreeBSD' %}
    - require:
      - pkg: sshd
{% endif %}
