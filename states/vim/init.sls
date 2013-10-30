vim:
  pkg:
    - installed
    - name: {{ pillar['vim']['name'] }}

{{ pillar['vim']['conf'] }}:
  file:
    - managed
    - user:  root
    - mode: 644
    - source: salt://vim/vimrc
    - require:
      - pkg: vim

