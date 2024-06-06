
# Version 2.0
# Copyright 2024 Thomas.B 


$username = "powershell@sunnus.nl"
$topsecret = "8lRiHzXc" #never store passwords like this.
$password = ConvertTo-SecureString $topsecret -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $password)

#SMTP Settings
$smtp = "smtp.sunnus.nl"
$port = 587

#Address
$to = "176574@student.horizoncollege.nl" # aanpassen!
$from = "powershell@sunnus.nl"

$status = "Down"
$serverName = "Server01"
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$cause = "Onbekend"
$companyName = "HC-IT"
$lastChange = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>Server Status Notification</title>
</head>
<body>
    <h1>Server Status Notification</h1>
    <p>Geachte gebruiker,</p>
    <p>Hier is de huidige status van de server:</p>
    <ul>
        <li>Status Server: $status</li>

        <li>Servernaam: $serverName</li>

        <li>Datum/Tijd: $dateTime</li>

        <li>Mogelijke oorzaak: $cause</li>

        <li>Laatste wijziging: $lastChange</li>

        <li>Bedrijfsnaam: $companyName</li>
        <img src= "file:///C:/Users/thooz/Downloads/488180379ecc0fc842c96cf6ae8bea30.jpg" alt="Server status afbeelding"> 
        
    </ul>
    <p>Met vriendelijke groet,</p>
    <p>Uw IT-team</p>
</body>
</html>
"@

# for ($i = 1; $i -le 5 ; $i++) {
# }

# ^^ Dit is een spammer AFBLIJVEN ^^

Send-MailMessage -BodyAsHtml $htmlContent -To $to -Subject $subject -SmtpServer $smtp -From $from -Credential $psCred -Port $port

Write-Output "E-mail is verstuurd."

# SIG # Begin signature block
# MIIFuQYJKoZIhvcNAQcCoIIFqjCCBaYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAB3SoSKq4XTif1
# BnQRnpX1u+1cb95jYRn13Ova8PQf/KCCAyIwggMeMIICBqADAgECAhAi6IH43j+3
# mUjEYIvzoMF5MA0GCSqGSIb3DQEBCwUAMCcxJTAjBgNVBAMMHFBvd2VyU2hlbGwg
# Q29kZSBTaWduaW5nIENlcnQwHhcNMjQwNTMwMDczNzE4WhcNMjUwNTMwMDc1NzE4
# WjAnMSUwIwYDVQQDDBxQb3dlclNoZWxsIENvZGUgU2lnbmluZyBDZXJ0MIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyHSMZ7HkrxS2Bz0G2bw/kTAuCthP
# K1pG1RYEBoNuTdpf/Hh9aa4JeIVKS78E6LkmKLUh3DeH+2jFbDW3YgT5X2JQPsyA
# ICMo0cvWsybiYyKUwhIUhjz8UCSrZngXhQhEZdoydKZxtMi97F0Cyb6Qvzhvq6c/
# IRVAaNbYXL67m/MGNjiH6MWf7hnbxrJLobKUSiJOcPNoxYNB0RY9OLTgrzbMWKf9
# RESpHvFMRw/+YNcrz9CE/MpPw7djJR23Ie1eVJX6J/YUgZedarWa/rBuSSTMcUg0
# Bk4fFWZpWPDmZv5/9NVVeo73iQhmelcQG2Qr0wV75Xy9sZhkJX48ZwJpfQIDAQAB
# o0YwRDAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0O
# BBYEFEZ52PzuSxMOc4gfTRepaiDzR3j7MA0GCSqGSIb3DQEBCwUAA4IBAQBn/Rmr
# l/2FcBIgh+WKt1nKr05oOGSsRorR6KYyLCO0R8wn9NH1itd6lmpIkkJZI2aWABCL
# Ywr3JFt48+rY4hL4PLkV6fCFQxfUbvpdWjejADNlpjfGpjdHk7gWSn8RmKjBG8I0
# /VQWw8rRWPW6fjleTHJxAC032S9Gf4d3m3VnyKskkI2aJM/bJYfGe0BKtFBwAE8y
# o2SxssSpzK2tT6UEDFruWj4YZ7SaHCb+u+SuIUjWlPEvk8EERohApQ93XnYIte+G
# h0frHbJZpm8ZkuC72ddPkUnRyI1vCdAylbFL322vsmi2U9sn8Hz1NPfaIJ7lAjR4
# c9Ny+CP27YXmnbCKMYIB7TCCAekCAQEwOzAnMSUwIwYDVQQDDBxQb3dlclNoZWxs
# IENvZGUgU2lnbmluZyBDZXJ0AhAi6IH43j+3mUjEYIvzoMF5MA0GCWCGSAFlAwQC
# AQUAoIGEMBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZI
# hvcNAQkEMSIEIC/tioqvtUWRLeT9WBr8gfzipGlYWAgpMJ3ZWNgD6hmqMA0GCSqG
# SIb3DQEBAQUABIIBAErjxrPmH/3KJQNdOd4euEvuPmZu+ZTDXfFF+P+02ZuXVDRa
# FOGMtMKSJQOhFCt8oREMXi5nF+ywfsD9ew3X6sZTfpBH5KD8srb0CKg1NPNlrkRB
# Yg+wDZgzzPqnYAD7Bn/uRTeRVnSEuyODp6RnEMJ35pMhoR+feuDcl5VC4pTulktN
# HC4tGjuyN91u6p2c6ikPQ0Ld5MMybJnxmnMXYZLvB0Ep27xzmHHP+nfXosjmF2e8
# gIlOlHyuVzuMterpune3oYFqw173xVe6FEqC/lI3mIlvRfe7AQ45Nj0pnkCRoZ+U
# 4Iqeh9x1p5l3cA+0yJGfZi/Alc2cKgjKjVjdqWc=
# SIG # End signature block
