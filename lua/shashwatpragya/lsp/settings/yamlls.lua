return {
	settings = {
		yaml = {
			-- No need to specify yaml configs here, doesn't seem to work, just use
			-- inline metadata as specified in this blogpost from redhat -
			-- https://developers.redhat.com/blog/2020/11/25/how-to-configure-yaml-schema-to-make-editing-files-easier#schema_association_without_a_file_name_pattern
			-- Example :- # yaml-language-server: $schema=https://my.url.to/the/schema
			-- schemas = {
			-- 	["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = {
			-- 		"/*.k8s.yaml",
			-- 		"/k8s/*.k8s.yaml",
			-- 	},
			-- 	schemaStore = {
			-- 		enable = true,
			-- 	},
			-- },
		},
	},
}
