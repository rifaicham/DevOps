# install kubernetes via ansible
Install ansible terlebih dahulu
- Jalankan ansible `ansible-playbook-kubernetes-install` di semua server
- Ubah token dalam `join-node` dan ketika sudah jalankan `join-node.yml` di server yang akan menjadi node atau worker

# Arsitektur Kubernetes
<p align="center">
    <img src= assets/arsitektur-kubernetes.jpg />
</p>

# Kubernetes

## Kubernetes Master
- kube-apiserver bertugas sebagai API yang digunakan untuk berinteraksi dengan Kubernetes cluster
- etcd bertugas untuk sebagai database untuk menyimpan data Kubernetes Cluster
- kube-scheduler bertugas untuk memperhatikan aplikasi yang kita jalankan dan meminta Node untuk menjalankan aplikasi yang kita jalankan
- kube-controller-manager bertugas melakukan kontrol terhadap Kubernetes Cluster
- cloud-controller-manager bertugas untuk melakukan kontrol terhadap interaksi dengan cloud
provider

## Kubernetes Nodes
- kubelet berjalan di setiap Node dan bertugas untuk memastikan bahwa aplikasi kita berjalan di Node
- kube-proxy berjalan di setiap Node dan bertugas sebagai proxy terhadap arus network yang masuk ke aplikasi kita dan sebagai load balancer juga
- container-manager berjalan di setiap Node dan bertugas sebagai container manager. Kubernetes mendukung beberapa container manager seperti Docker, containerd, cri-o, rktlet, dan yang lainnya.

## Alur kerja 
<p align="center">
    <img src= assets/alur-kerja-kubernetes.jpg />
</p>

1. Developer membuat aplikasi kemudian dibuat imagenya dan  dipush dalam image registry (dockerhub)
2. membuat configuration file untuk aplikasi yang akan dideploy dan jalankan config file tersebut di Master
3. Kemudian Master akan memberi tahu kubelet untuk meminta container manager (docker) untuk pull aplikasi dari image registry dan dideploy dalam pod

### pod
1. Pod adalah unit terkecil yang bisa di deploy di Kubernetes Cluster
2. Pod berisi satu atau lebih container
3. Secara sederhana Pod adalah aplikasi kita yang running di Kubernetes Cluster
