#
TAG ?= v1.12.7

# Hash: 376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba customization: {}
# Hash: 6d423353cba6ef7d56d5a818fff27caf23f32b90cf271eada90f706141a84ec0 talos.dashboard.disabled=1
images-factory:
	wget -O oracle-amd64.qcow2 https://factory.talos.dev/image/376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba/$(TAG)/oracle-amd64.qcow2
	cp image_metadata_amd64.json image_metadata.json
	tar zcf oracle-amd64.oci oracle-amd64.qcow2 image_metadata.json

	wget -O oracle-arm64.qcow2 https://factory.talos.dev/image/376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba/$(TAG)/oracle-arm64.qcow2
	cp image_metadata_arm64.json image_metadata.json
	tar zcf oracle-arm64.oci oracle-arm64.qcow2 image_metadata.json
