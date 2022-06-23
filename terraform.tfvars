# Environmental variables
environment = "temporary"
location    = "westus"

# Tag names and values
required_tags = {
  WorkloadName       = "Transit Hub"
  DataClassification = "Sensitive"
  Criticality        = "Business-Critical"
  BusinessUnit       = "Information Technology"
  OpsTeam            = "Network Team"
  ApplicationName    = "Transit Hub"
  Approver           = "some@guy.com"
  BudgetAmount       = "1234"
  CostCenter         = "99999"
  DR                 = "Mission-Critical"
  Env                = "Production"
  EndDate            = "2025-12-31"
  Owner              = "some@gal.com"
  Requester          = "someother@dude.com"
  TicketNumber       = "54321"
}

# VM variables
vmuser = "testuser"
vmpass = "vmpass"

virtual_machines = {
  vm1 = {
    workloadname = "app1"
    size         = "Standard_DS3_v2"
    subnetid     = "<subnet resource id value here>"
    sku          = "2019-Datacenter"
  }
  vm2 = {
    workloadname = "app2"
    size         = "Standard_DS3_v2"
    subnetid     = "<subnet resource id value here>"
    sku          = "2019-Datacenter"
  }
}
