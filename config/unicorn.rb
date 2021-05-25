app_path = File.expand_path('../../', __FILE__)

#アプリケーションサーバの性能を決定する
worker_processes 1

#アプリケーションの設置されているディレクトリを指定
working_directory "#{app_path}"
pid "#{app_path}/tmp/pids/unicorn.pid"
listen "#{app_path}/tmp/sockets/unicorn.sock"
stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

#Railsアプリケーションの応答を待つ上限時間を設定
timeout 60
                                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                             