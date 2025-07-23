locals {
  default_tags = {
    SupportGroup    = var.tag_support_group
    AppGroupEmail   = var.tag_app_group_email
    EnvironmentType = var.tag_environment_type
  }

  vm_tags = {
    ExpirationDate    = var.tag_expiration_date
    Tier              = var.tag_tier
    SolutionCentralID = var.tag_solution_central_id
    SLA               = var.tag_sla
    Description       = var.tag_description
  }

  tf_module_tags = {
    TF_ModuleName    = "redhat-vm"
    TF_ModuleVersion = "1.3.0"
  }

  managed_disk_tags = {
    NPI            = var.tag_npi
    ExpirationDate = var.tag_expiration_date
    SLA            = var.tag_sla
  }

  boks_and_patching = "/post_install/boks81.remote.install.ksh.new -a -e cloud -g ${var.bks_pre_reg_grp_nm} && curl -H 'Cache-Control: no-cache' --proxy 10.18.129.154:8080 http://bdc1rfisupmip01.fnfis.com/repo/scripts/UNIX_Patching.sh -o /root/UNIX_Patching.sh && chmod 755 /root/UNIX_Patching.sh && nohup /root/UNIX_Patching.sh --release=latest --exclude=WALinuxAgent --exclude=WALinuxAgent-udev --update --reboot --region=cloud && exit 0"
}



 