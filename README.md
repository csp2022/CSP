"""
This project is intended to provision resources in AWS,AZURE and GCP cloud platforms using Python tool
"""

az login

export MSYS_NO_PATHCONV=1
az ad sp create-for-rbac --name <myserviceprincipal> --role Contributor

https://docs.microsoft.com/en-us/azure/developer/python/configure-local-development-environment?tabs=cmd

$ cat providers.tf
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "df19ba8d-519d-4d17-a023-4264d1c8416c"
  tenant_id         = "8e282823-3b9a-4641-8b98-357830868d88"
  client_id         = "52d9a653-6b0d-4e2b-a6ba-8911f385c1cd"
  client_secret     = "RXmZJI-SvlQ6.oBIaulqfHG2kScuD.kL.1"
}


$ cat rg.tf
resource "azurerm_resource_group" "rg" {
  name      = "rgterra"
  location = "westus"
}






jyoth@LAPTOP-2OAMJNGF MINGW64 ~
$ cat terraform-gcp/gcp.json
{
  "type": "service_account",
  "project_id": "atlantean-bebop-339306",
  "private_key_id": "f02baeee86a02685fe3d452a957db49e2bbac3a4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDDUlTgAFvjtwR0\nVA23MMhgMaIbhjE9i+SUtucatGWmnQY/gv0kgrHHWoR7jasUbg7Yq+lkUnxGi5J5\nfi22y0rXNZIZESda52So5xAKXh+sd+FqsL5GTDET1Mx/LBhY48IoUCjNGkYzNE17\nkJwKIrkJnMj0trwR7d+KLg2jjAkYsYDQEB2+odR3poKPC48Z6yQ6rR/mQrbsNhkf\nVrabkkE7mex2cEP0KmGUL3MTKQUEWnMA0CP3wBjcYijGqfWQlaP1SR7FfiIZtmaW\nDu8dMHUYGj02g4/SMWNeL+TZoZ4H6noCgvpAC/8ZJ4RipJiqOuhBrNNAMB+3y/JV\np4vE5vujAgMBAAECggEARZ80ys3F81L63v5RD0Hvwr4eYwI/zgjt9waFNTMlYrDp\nF714v0lo1j8RJztVxof+ecQ5gr2WN80rbmwIHnazXCfnxlCjfxco/b2zLYbkcmUe\n8BlFEai5+7AoHpKYsSKqRBVinc1mRX04uzlOLZy36VG+HeB/BEMOoeINkYTqfyax\n4SK8ywJu5daWcomo9z1GkKY16GUO68LBvZx+xCLbYRiWwq/BzDmFZiPwm5TUe7gt\nkiLpnLI3gXdNid4AcPhoC78CNDO7z7yOBA6TLZqhqi2C4zc0mvAfp/tk63CSiLEN\nPEScOd6jsN4cnNsz/HEnRsVPQRVyusv5sT65w2w4oQKBgQD7BEzW6sQWtjHPfPrk\nxnvagOA3rZ9QEpGI5x9YmuZ/xIusoiQMR/pIJwGAuhD4INexAkNvQCCFjWEft0sh\nB+MjU6qupmK5wqKgxjqWvjI7B5dJnB1XiAVvXmBsIhzpEM5e2xtaaMb3qz1qx8nc\ngYOPLeQnizuqNTIIt/0xpKZcoQKBgQDHMvsxrh3W6e/1oG2RQlHyw5r7+Rx7CyK9\n0Iih7xjrm22GjEyQFlzp15hsgnJ5oCVkaMnkFFdOZ2qk37/EaJnbMpRfe+OqiUv7\ngKskvMHt5JOIBPXbbKUpE5AZQJK09l5//forVBtXcaobadacXGKCT2MbAn8J9u5E\nXLmqrRJNwwKBgQDBftwYo5oKg+G7tvTUW6hnlAbDBMSU/etP5BHGxIlAHmso5Ufy\na52j9uVyrHueOfrqiPsgjAdFy+j9gNaaHLFbrwgYX0wlM8MXOhc50l14IW7eoEgC\nDGlcIx0i3dz5UCo09qOMOs59ZnQOlvmlT/Tw7wg771lL6HusOuAjX2+aYQKBgEmd\nCn1KhhZ070uLVNJYeuZG6RBy99Z0wAr7dHK7ZC81ih0t3eFlkkKMfPSkpF9UEl1v\n6CQUbEs6Jov1b+3KZgk+QNykcPcFtAGmhBiYdOZQEUEz7BOBq+tpIlhip5Secz/D\ngN7gPxZql913mGrCLVlQsyQ5IO9yxIyY47gyK1B3AoGBAOLh/WDwe1sberlWf9/b\nK3E0Su4BjDTFrNimqLe+mfZZe9GKgGRhSit+TWznbk+N1TtuhBauWXnEpM1LZ2BR\neI0XaTpChCqg7O7gnIFzHtFIOqdprzECd3V4OzIhUCmmk8yDlJdcFslk7+4QewCH\nH6cZLoD89N6tgNCYX43ZAXY+\n-----END PRIVATE KEY-----\n",
  "client_email": "775432640154-compute@developer.gserviceaccount.com",
  "client_id": "100741160466240502970",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/775432640154-compute%40developer.gserviceaccount.com"
}





$ cat terraform-gcp/providers.tf
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("gcp.json")

  project = "atlantean-bebop-339306"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}





