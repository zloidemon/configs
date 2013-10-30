i3:
  pkg.installed

i3status:
  pkg.installed

slim:
  pkg.installed

slim-themes:
  pkg.installed

{% if grains['os'] == 'FreeBSD' %}
{{ pillar['i3']['status'] }}:
  file:
    - managed
    - user:  root
    - mode: 644
    - source: salt://i3/i3status.conf
    - require:
      - pkg: i3status
{{ pillar['i3']['conf'] }}:
  file:
    - managed
    - user:  root
    - mode: 644
    - source: salt://i3/i3.conf
    - require:
      - pkg: i3status
{{ pillar['i3']['slim'] }}:
  file:
    - managed
    - user:  root
    - mode: 644
    - source: salt://i3/slim.conf
    - require:
      - pkg: slim-themes
{% endif %}
