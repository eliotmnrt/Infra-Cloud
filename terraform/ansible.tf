
resource "null_resource" "openvpn_server" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = <<-EOT
      until nc -z -w 3 ${module.openvpn.instance_external_ip[0]} 22; do echo "attente SSH..."; sleep 5; done
      echo > /tmp/openvpn.ini;
      echo "[openvpn]" | tee -a /tmp/openvpn.ini;
      echo "srv-openvpn ansible_host=${module.openvpn.instance_external_ip[0]}" | tee -a /tmp/openvpn.ini;
      ANSIBLE_CONFIG=../ansible/ansible.cfg ansible-playbook -u ansible -i /tmp/openvpn.ini  ../ansible/playbook_openvpn_server.yml;
      rm -f /tmp/openvpn.ini;
    EOT
  }
  depends_on = [module.openvpn, module.openvpn.instance_external_ip]
}

resource "null_resource" "create_new_vpn_client" {
  for_each = toset(var.vpn_user_list)
  triggers = {
    name       = each.value
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo > /tmp/openvpn.ini;
      echo "[openvpn]" | tee -a /tmp/openvpn.ini;
      echo "srv-openvpn ansible_host=${module.openvpn.instance_external_ip[0]}" | tee -a /tmp/openvpn.ini;
      ANSIBLE_CONFIG=../ansible/ansible.cfg ansible-playbook -u ansible -i /tmp/openvpn.ini  -e vpn_user_list=${each.value} ../ansible/playbook_openvpn_client.yml;
      rm -f /tmp/openvpn.ini;
    EOT
  }
  depends_on = [module.openvpn, null_resource.openvpn_server, module.openvpn.instance_external_ip]
}
