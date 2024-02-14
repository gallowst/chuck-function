using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Change the variable to that of the parameter passed to the function
if (!($null -eq $Request.Query.Name)) {
    $name = $Request.Query.Name
}
else {
    # Set the category to dev
    $name = "dev"
}

# Check the name variable is sane
if (-not ($name.ToLower() -in @("animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"))) {
    $name = "dev"
}

if ($name.ToLower()) {
    $strJoke = ((Invoke-WebRequest "https://api.chucknorris.io/jokes/random?category=$name").Content | ConvertFrom-Json | Select-Object -Property Value).Value
    $body = ("Category: {0} - {1}" -f $name.ToLower(),$strJoke)
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})