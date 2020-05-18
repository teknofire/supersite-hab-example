export RAILS_ENV="{{cfg.web.rails_env}}"
export RAILS_TMP_PATH="{{pkg.svc_var_path}}/tmp"
export RAILS_CACHE_PATH="$RAILS_TMP_PATH/cache"
{{~#if cfg.web.log_to_stdout}}
export RAILS_LOG_TO_STDOUT=true
{{~/if}}
export RAILS_MASTER_KEY="{{cfg.web.master_key}}"
export PIDFILE="$RAILS_TMP_PATH/pids/server.pid"
{{~#eachAlive bind.database.members as |member|}}
  {{#if @last}}
  export DATABASE_URL="postgresql://{{cfg.db.username}}:{{cfg.db.password}}@{{member.sys.ip}}:{{member.cfg.port}}/{{pkg.name}}"
  {{~/if}}
{{~/eachAlive}}
