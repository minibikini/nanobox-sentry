tee ./config/config.yml << END
# While a lot of configuration in Sentry can be changed via the UI, for all
# new-style config (as of 8.0) you can also declare values here in this file
# to enforce defaults or to ensure they cannot be changed via the UI. For more
# information see the Sentry documentation.

###############
# Mail Server #
###############

# mail.backend: 'smtp'  # Use dummy if you want to disable email entirely
# mail.host: 'localhost'
# mail.port: 25
# mail.username: ''
# mail.password: ''
# mail.use-tls: false
# The email address to send on behalf of
# mail.from: 'root@localhost'

# If you'd like to configure email replies, enable this.
# mail.enable-replies: false

# When email-replies are enabled, this value is used in the Reply-To header
# mail.reply-hostname: ''

# If you're using mailgun for inbound mail, set your API key and configure a
# route to forward to /api/hooks/mailgun/inbound/
# mail.mailgun-api-key: ''

###################
# System Settings #
###################

# If this file ever becomes compromised, it's important to regenerate your a new key
# Changing this value will result in all current sessions being invalidated.
# A new key can be generated with `$ sentry config generate-secret-key`
system.secret-key: '$(sentry config generate-secret-key)'

system.admin-email: '$ADMIN_EMAIL'
system.url-prefix: '$URL_PREFIX'

# The ``redis.clusters`` setting is used, unsurprisingly, to configure Redis
# clusters. These clusters can be then referred to by name when configuring
# backends such as the cache, digests, or TSDB backend.
#
# Two types of clusters are currently supported:
#
#   rb.Cluster
#   A redis blaster cluster is the traditional cluster used by most services
#   within sentry. This is the default type cluster type.
#
#   rediscluster.StrictRedisCluster
#   An official Redis Cluster can be configured by marking the named group with
#   the ``is_redis_cluster: True`` flag. In future versions of Sentry more
#   services will require this type of cluster.
#
redis.clusters:
  default:
    hosts:
      0:
        host: $DATA_REDIS_HOST
        port: 6379

################
# File storage #
################

# Uploaded media uses these `filestore` settings. The available
# backends are either `filesystem` or `s3`.

filestore.backend: 'filesystem'
filestore.options:
  location: '/tmp/sentry-files'

# filestore.backend: 's3'
# filestore.options:
#   access_key: 'AKIXXXXXX'
#   secret_key: 'XXXXXXX'
#   bucket_name: 's3-bucket-name'

END
