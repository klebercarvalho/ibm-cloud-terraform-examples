/*
resource "ibm_is_vpc" "vpc1" {
    name = "example-vpc"
}

resource "ibm_is_subnet" "subnet1" {
    name            = "example-subnet"
    vpc             = ibm_is_vpc.vpc1.id
    zone            = "us-south-1"
    ipv4_cidr_block = "10.240.0.0/24"
}

resource "ibm_is_ssh_key" "ssh-key1" {
    name       = "example-ssh"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKVmnMOlHKcZK8tpt3MP1lqOLAcqcJzhsvJcjscgVERRN7/9484SOBJ3HSKxxNG5JN8owAjy5f9yYwcUg+JaUVuytn5Pv3aeYROHGGg+5G346xaq3DAwX6Y5ykr2fvjObgncQBnuU5KHWCECO/4h8uWuwh/kfniXPVjFToc+gnkqA+3RKpAecZhFXwfalQ9mMuYGFxn+fwn8cYEApsJbsEmb0iJwPiZ5hjFC8wREuiTlhPHDgkBLOiycd20op2nXzDbHfCHInquEe/gYxEitALONxm0swBOwJZwlTDOB7C6y2dzlrtxr1L59m7pCkWI4EtTRLvleehBoj3u7jB4usR"
}
*/

resource "ibm_is_instance" "vsi1" {
    /*******************
    * REQUIRED ARGUMENTS
    *******************/
    image = "r006-f3a6eb33-8b7f-4850-b7b7-cf2f4ef41bb6"
    keys  = [data.ibm_is_ssh_key.sshkey.id]
    name  = "${var.vpc_name}-vsi-1"

    primary_network_interface {
        #allow_ip_spoofing = (true|false)
        name               = "eth0"
        /*
        primary_ip {
            auto_delete = (true|false)
            address     = ""
            name        = ""
            reserved_ip = ""
        }
        */
        subnet           = ibm_is_subnet.subnet1.id
        #security_groups = [""]
    }
    profile = "cx2-4x8"
    vpc     = ibm_is_vpc.vpc1.id
    zone    = local.zone_1



    /*******************
    * OPTIONAL ARGUMENTS
    *******************/
    #action                   = "(start|stop|reboot)"
    #auto_delete_volume       = (true|false)

    /*boot_volume {
        encryption = ""
        name       = ""
        size       = (int)
        snapshot   = "" # Conflicts with image id and instance template
    }*/

    #dedicated_host           = ""
    #metadata_service_enabled = (true|false)

    /*network_interfaces {
        allow_ip_spoofing = (true|false)
        name              = ""

        primary_ip {
            auto_delete = (true|false)
            address     = ""
            name        = ""
            reserved_ip = ""
        }

        subnet          = ""
        security_groups = [""]
    }*/

    #placement_group = ""
    resource_group   = data.ibm_resource_group.rg.id
    tags             = ["estudo","terraform","schematics"]
    
    //User can configure timeouts
    timeouts {
        create = "15m"
        update = "15m"
        delete = "15m"
  }
}