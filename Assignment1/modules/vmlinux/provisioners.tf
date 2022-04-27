resource "null_resource" "linux_provisioner" {
  count = var.count_val
  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.admin_user
      private_key = file(var.private_key)
      host        = element(azurerm_public_ip.public_ip[*].fqdn, count.index + 1)
    }
  }

}