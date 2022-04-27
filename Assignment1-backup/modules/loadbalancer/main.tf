# LoadBalancer with Linux VMs behind it
resource "azurerm_lb" "load_balancer" {
  name                = var.load_balancer_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.common_tags

  frontend_ip_configuration {
    name                 = "${var.load_balancer_name}-FrontendIP"
    public_ip_address_id = azurerm_public_ip.lb_frontend_pip.id
  }
}

## Public IP Address for the frontend of the load balancer 
resource "azurerm_public_ip" "lb_frontend_pip" {
  name                = "${var.load_balancer_name}-PublicIP"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = var.common_tags
}

# Backend Address Pool for the load balancer
resource "azurerm_lb_backend_address_pool" "lb_backend_add_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "${var.load_balancer_name}-BackEndAddressPool"
}

# Network Association with the Backend Address Pool
resource "azurerm_network_interface_backend_address_pool_association" "lb_network_int_backend_addr_pool_association" {
  count                   = length(var.linux_vm_nics)
  network_interface_id    = element(var.linux_vm_nics[*].id, count.index + 1)
  ip_configuration_name   = element(var.linux_vm_nics[*].ip_configuration[0].name, count.index + 1)
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_add_pool.id
}

# Load Balancer Rules
resource "azurerm_lb_rule" "load_balancer_rule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "${var.load_balancer_name}-Rule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = azurerm_lb.load_balancer.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_add_pool.id]
}

# Load Balancer Probe
resource "azurerm_lb_probe" "load_balancer_probe" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.load_balancer.id
  name                = "${var.load_balancer_name}-Probe"
  port                = 22
}
