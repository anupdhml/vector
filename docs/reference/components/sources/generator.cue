package metadata

components: sources: generator: {
	title: "Generator"

	classes: {
		commonly_used: false
		delivery:      "at_least_once"
		deployment_roles: ["daemon", "sidecar"]
		development:   "stable"
		egress_method: "stream"
	}

	features: {
		multiline: enabled: false
		generate: {}
	}

	support: {
		targets: {
			"aarch64-unknown-linux-gnu":  true
			"aarch64-unknown-linux-musl": true
			"x86_64-apple-darwin":        true
			"x86_64-pc-windows-msv":      true
			"x86_64-unknown-linux-gnu":   true
			"x86_64-unknown-linux-musl":  true
		}

		requirements: []
		warnings: []
		notices: []
	}

	installation: {
		platform_name: null
	}

	configuration: {
		batch_interval: {
			common:      false
			description: "The amount of time, in seconds, to pause between each batch of output lines. If not set, there will be no delay."
			required:    false
			warnings: []
			type: float: {
				default: null
				examples: [1.0]
			}
		}
		count: {
			common:      false
			description: "The number of times to repeat outputting the `lines`. By default the source will continuously print logs (infinite)."
			required:    false
			warnings: []
			type: uint: {
				default: null
				unit:    null
			}
		}
		format: {
			description: "The message format for output lines."
			required:    true
			default:     null
			type: enum: ["round_robin", "apache_common", "apache_error", "syslog"]
		}
		items: {
			description:   "The list of lines to output."
			required:      false
			relevant_when: "[`format`](#format) is set to `round_robin`"
			warnings: []
			type: array: items: type: string: examples: ["Line 1", "Line 2"]
		}
		sequence: {
			common:        false
			description:   "If `true`, each output line will start with an increasing sequence number."
			relevant_when: "[`format`](#format) is set to `round_robin`"
			required:      false
			warnings: []
			type: bool: default: false
		}
	}

	output: logs: {}
}
