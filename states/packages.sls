include:
  - vim
  - zsh
  - diff
  - sudo
  - ssh
{% if grains['nodename'] == 'x' %}
  - i3
{% endif %}
