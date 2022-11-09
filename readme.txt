・cuda、python3を使用できるdocker環境を構築します。
・nvidia-docker2がインストールされている必要があります。
・docker-composeはバージョン1.27.3以上が必要です。
・DockerfileのFROMにて必要なcuda+os環境を指定してください。
・「./home」にコンテナ内の「./home」がマウントされます。


xhost +local:
dockerコンテナのrootユーザからguiを使えるようにする

xhost -local:
解除

xhost
確認

docker compose down --rmi all --volumes --remove-orphans

docker compose exec ubuntu-cuda bash -c "jupyter-lab --port=8888 --ip=0.0.0.0 --allow-root --NotebookApp.token=''"
http://localhost:8888

tensorboard --logdir ./data --host=0.0.0.0
http://localhost:6006