dnsmasq:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: dnsmasq
/etc/dnsmasq.d/loc_nodes:
  file.managed:
    - source: salt://dnsmasq/loc_nodes
    - mode: 0644
    - user: root
    - group: root
    - service:
      -service: dnsmasq

    
