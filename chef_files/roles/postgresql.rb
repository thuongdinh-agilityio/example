name "postgresql"
description "Postgresql Database"

if node[:databag][:encrypted]
	settings = Chef::EncryptedDataBagItem.load("passwords", "postgresql")
else
	settings = data_bag_item("passwords", "postgresql")
end

postgres_pass = settings["POSTGRES_PASS"]
db_name = settings["DATABASE_NAME"]

override_attributes(
	:postgresql => {
		:config => {"listen_addresses" => '*'},
		:config_pgtune => {:db_type => "web",
			               :tune_sysctl => true},
		:password => {"postgres" => postgres_pass},
		:db_name => db_name,
		:pg_hba => [{
			:comment => '# EC2 internal access',
			:type => 'host',
			:db => 'all',
			:user => 'postgres',
			:addr => "0.0.0.0/0",
			:method => 'md5'
		}]
	},
	"build_essential" => {"compiletime" => true},
	:sysctl => {:conf_dir => "/etc/sysctl.d",
		:allow_sysctl_conf=>true}


)

run_list(
  "recipe[webapp::database]"
)
