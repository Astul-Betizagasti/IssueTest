#--Params--
#labelsString: Labels to add in the flowing format: 'label1, label2'
#token: Users github token
#URL: URL to which make the post label request
param([string]$labelsString, [string]$token, [string]$URL)

#--Processing--
#Split labels into arry
$labelsArray =$labelsString.Split(", ")

#Creates de basic auth credentials to be passed on the request
$pair = "$('admin'):$($token)"
$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
$basicAuthValue = "Basic $encodedCreds"
$Headers = @{
    Authorization = $basicAuthValue
}

#Create a request to add each label
foreach ($label in $labelsArray) {
    $body = @{
        "labels"= @($label)
    } | ConvertTo-Json
       
    Invoke-RestMethod -Uri $URL -Method 'Post' -Body $body -Headers $Headers
}
