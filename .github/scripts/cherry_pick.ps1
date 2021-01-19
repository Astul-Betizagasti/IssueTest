#--Params--
#branch: The branch it will cherrypick INTO
param([string]$branch, [string]$commitSHA)

git fetch --all
git checkout $branch
git cherry-pick $commitSHA
git push origin $branch


#Response
#if($label -ne 'undefined') 
#    { Write-Output ($label) }
#else 
#    { Write-Output ('Valid') }
