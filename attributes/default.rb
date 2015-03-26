default['influxdb']['version'] = 'latest'
default['influxdb']['package_baseurl'] = 'http://s3.amazonaws.com/influxdb/'
default['influxdb']['user'] = 'influxdb'
default['influxdb']['group'] = 'influxdb'
default['influxdb']['home'] = '/opt/influxdb'
default['influxdb']['bind_ip'] = '0.0.0.0'

default.influxdb.limits.nofile.domain = node.influxdb.user
default.influxdb.limits.nofile.type = '-'
default.influxdb.limits.nofile.item = 'nofile'
default.influxdb.limits.nofile.value = '65536'

default['influxdb']['logging']['level'] = 'info'
default['influxdb']['logging']['logdir'] = '/opt/influxdb/shared'

default['influxdb']['admin']['port'] = 8083

default['influxdb']['api']['port'] = 8086
default['influxdb']['api']['read-timeout'] = '5s'

default['influxdb']['input_plugins']['graphite']['enabled'] = false

default['influxdb']['raft']['port'] = 8090
default['influxdb']['raft']['dir'] = '/opt/influxdb/shared/data/raft'

default['influxdb']['storage']['dir'] = '/opt/influxdb/shared/data/db'
default['influxdb']['storage']['write-buffer-size'] = 10000

default['influxdb']['cluster']['protobuf_port'] = 8099
default['influxdb']['cluster']['protobuf_timeout'] = '2s'
default['influxdb']['cluster']['protobuf_heartbeat'] = '200ms'
default['influxdb']['cluster']['protobuf_min_backoff'] = '1s'
default['influxdb']['cluster']['protobuf_max_backoff'] = '10s'
default['influxdb']['cluster']['write-buffer-size'] = 10000
default['influxdb']['cluster']['max-response-buffer-size'] = 100
default['influxdb']['cluster']['concurrent-shard-query-limit'] = 10

default['influxdb']['leveldb']['max-open-files'] = 40
default['influxdb']['leveldb']['lru-cache-size'] = '200m'
default['influxdb']['leveldb']['max-open-shards'] = 0
default['influxdb']['leveldb']['point-batch-size'] = 100

default['influxdb']['sharding']['replication-factor'] = 1
default['influxdb']['sharding']['short-term']['duration'] = '7d'
default['influxdb']['sharding']['short-term']['split'] = 1
default['influxdb']['sharding']['long-term']['duration'] = '30d'
default['influxdb']['sharding']['long-term']['split'] = 1

default['influxdb']['wal']['dir'] = '/opt/influxdb/shared/data/wal'
default['influxdb']['wal']['flush-after'] = 1000
default['influxdb']['wal']['bookmark-after'] = 1000
default['influxdb']['wal']['index-after'] = 1000
default['influxdb']['wal']['requests-per-logfile'] = 10000
