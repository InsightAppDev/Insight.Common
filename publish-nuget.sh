cd src
for directory in *; do 
    if [[ -d ${directory} ]]; then
        cd ${directory}
        dotnet build -c Release
        dotnet pack *.csproj --include-symbols -p:PackageVersion=${3} -c Release --output "."
        ls
        sleep 5
        dotnet nuget push -s ${1} -k ${2} "${directory}.${3}.symbols.nupkg"
        if [[ ${?} != 0  ]]
        then
            exit -1
        fi
        cd ..
    fi
done
