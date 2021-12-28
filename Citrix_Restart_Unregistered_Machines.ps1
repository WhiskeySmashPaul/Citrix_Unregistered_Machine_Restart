#region Required Modules

Add-PSSnapin Citrix.Broker.Admin.*

#endregion

#region Adjustable Variables

#Enter the FQDN or shortname of a Citrix Delivery Controller within the quotation marks
$Controller = "<ControllerFQDNHere>"

#endregion

#region Restart Machines working script

$crashedmachines = get-brokermachine -AdminAddress $controller |Where-Object {$_.RegistrationState -eq "Unregistered" -and $_.SessionCount -eq 0}


foreach ($crashedmachine in $crashedmachines )
    {
        Get-BrokerMachine -MachineName $crashedmachine.machinename | New-BrokerHostingPowerAction -Action Reset
    }

#endregion
