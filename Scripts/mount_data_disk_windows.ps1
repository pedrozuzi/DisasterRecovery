# Get all uninitialized disks
$disks = Get-Disk | Where-Object PartitionStyle -eq "RAW"

# Initialize, partition, and format each disk
foreach ($disk in $disks) {
    # Initialize the disk
    Initialize-Disk -Number $disk.Number -PartitionStyle GPT

    # Create a new partition and assign a drive letter
    $partition = New-Partition -DiskNumber $disk.Number -UseMaximumSize -AssignDriveLetter

    # Format the partition with NTFS
    Format-Volume -DriveLetter $partition.DriveLetter -FileSystem NTFS -NewFileSystemLabel "DataDisk$($disk.Number)" -Confirm:$false
}

# Display the mounted disks
Get-Volume
