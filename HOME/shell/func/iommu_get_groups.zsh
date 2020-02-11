if [ "${OSTYPE}" = "Linux" ]
then
iommu_get_groups() {
	for g in /sys/kernel/iommu_groups/*; do
		echo "IOMMU Group ${g##*/}:"
		for d in $g/devices/*; do
			echo -e "\t$(lspci -nns ${d##*/})"
		done;
	done;
}
fi
