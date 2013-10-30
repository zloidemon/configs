sudo:
  pkg:
    - installed

{{ pillar['sudo']['conf'] }}:
  file:
    - managed
    - user:  root
    - mode: 440
    - source: salt://sudo/sudoers
    - require:
      - pkg: sudo 

