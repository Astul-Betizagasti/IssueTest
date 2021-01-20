param([string]$commitMessage)

$commitData = $commitMessage | Select-String -Pattern 'Cherry-pick to:\s?"*"'

$commitData

if($commitData){
    $splitedData = $commitData.Split('"')
    $branchName = $splitedData[1]
    if($branchName){
        Write-Output $branchName
        exit
    }
}
Write-Output 'invalid'