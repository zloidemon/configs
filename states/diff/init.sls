colordiff:
  pkg:
    - installed

{{ pillar['colordiff']['conf'] }}:
  file:
    - managed
    - user:  root
    - mode: 644
    - source: salt://diff/colordiffrc
    - require:
      - pkg: colordiff
