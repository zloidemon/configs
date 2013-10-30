vim:
{% if grains['os'] == 'FreeBSD' %}
  name: vim-lite
  conf: /usr/local/share/vim/vimrc
{% elif grains['os'] == 'Debian' %}
  name: vim-nox
  conf: /usr/share/vim/vimrc
{% else %}
  name: vim
  conf: /etc/vimrc
{% endif %}

colordiff:
{% if grains['os'] == 'FreeBSD' %}
  conf: /usr/local/etc/colordiffrc
{% else %}
  conf: /etc/colordiffrc
{% endif %}

sudo:
{% if grains['os'] == 'FreeBSD' %}
  conf: /usr/local/etc/sudoers
{% else %}
  conf: /etc/sudoers
{% endif %}

ssh:
{% if grains['os'] == 'Debian' %}
  server: openssh-server
  service: ssh
  client: openssh-client
{% else %}
  service: sshd
{% endif %}

i3:
  status: /usr/local/etc/i3status.conf
  conf:   /usr/local/etc/i3/config
  slim:   /usr/local/etc/slim.conf
