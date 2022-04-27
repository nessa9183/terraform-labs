
resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.vmlinux
  ]

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.linux_admin_user
      private_key = file(var.private_key)
      host        = element(azurerm_public_ip.public_ip[*].fqdn, count.index + 1)
    }
  }

}