resource "google_compute_network" "my_network" {
  name = "wbi-test-default"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name   = "wbi-test-default"
  network = google_compute_network.my_network.id
  region = var.region
  ip_cidr_range = "10.0.1.0/24"
}

resource "google_workbench_instance" "instance" {
  name = "workbench-instance"
  location = var.zone

  gce_setup {
    machine_type = "n2d-highmem-2" // Type de machine
    //accelerator_configs {
      //type         = "NVIDIA_TESLA_T4"
      //core_count   = 1
    //}

    shielded_instance_config {
      enable_secure_boot = true
      enable_vtpm = true
      enable_integrity_monitoring = true
    }

    disable_public_ip = false

    service_accounts {
      //email = "my@service-account.com"
    }

    boot_disk {
      disk_size_gb  = 150
      disk_type = "PD_SSD"
      //disk_encryption = "CMEK"
      //kms_key = "my-crypto-key"
    }

    data_disks {
      disk_size_gb  = 100
      disk_type = "PD_SSD"
      //disk_encryption = "CMEK"
      //kms_key = "my-crypto-key"
    }

    network_interfaces {
      network = google_compute_network.my_network.id
      subnet = google_compute_subnetwork.my_subnetwork.id
      nic_type = "GVNIC"
    }

    metadata = {
      terraform = "true"
    }

    enable_ip_forwarding = true

    tags = ["jupyter-perso"]

  }

  disable_proxy_access = "false"

  //instance_owners  = [ "my@service-account.com"]

  //labels = {
  //  k = "val"
  //}

  desired_state = "ACTIVE"

}