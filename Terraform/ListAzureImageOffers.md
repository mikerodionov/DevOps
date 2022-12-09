# Script to list AZ Image Offers

```Bash
# Ubuntu → Canonical
# RedHat → RedHat
# CentOS → OpenLogic
# SuSE Linux → SUSE
# Debian → credativ (versions 8 & 9) and Debian (version +10)
# Oracle Linux → Oracle-Linux
# CoreOS → CoreOS
$publisher = "OpenLogic"
$location = "WestEurope"
Get-AzVMImageOffer -Location $location -PublisherName $publisher | Select Offer
```
