<h1>Realizar todos los pasos</h1>
<h2>PASOS MANUALES</h2>

1. Crear el usuario en cuenta aws (IAM)-> debe tener acceso de usuario a la consola de admn-> crear un grupo-> Crear clave de acceso (credenciales de seguridad) para aws cli-> en terminal local ingresar y configurar a aws cli (aws configure) --> configurar credenciales usando aws-vault add NombreDeUsuarioIAM
2. Crear par de claves-> EC2 -> Pares de claves	-> (RCA y .pem) 


 <h2>PASOS AUTOMATIZADOS</h2>

1. Clonar repositorio https://github.com/Dipinoar/AWS-Terraform-Ansible-K8s
2. En la carpeta terraform ejecutar comandos 'terraform init' > 'terraform plan'>'terraform apply --auto-approve'
3. Reemplazar las ips en el inventario hosts.example y cambiar la ruta del la clave pem con NombreClave.pem
4. En la carpeta ansible ejecutar comandos 'ansible-playbook -i hosts.example kube-dependencies.yml'--> luego ejecutar 'ansible-playbook -i hosts.example master.yml' ---> por último 'ansible-playbook -i hosts.example workers.yml'
5. Ahora se debe construir la imagen: ejecutar docker build -t nombre-repositorio/nombre-imagen .  (incluir el punto)
6. Levantar la imagen a Hub.Docker---> docker push nombre-repositorio/nombre-imagen


 <h2>PASOS MANUALES</h2>
 
1. Accedemos al nodo maestro ejecutando ssh -i "clave.pem" ubuntu@ip-maestro
2. Creamos un archivo con nano ejemplo.yml y pegamos en su interior el contenido del archivo del repositorio llamado springBootMongo.yml
4. Ejecutamos en el nodo maestro kubectl apply -f ejemplo.yml
5. Ubicamos la ip en la cual se despliega la aplicación SPRING ejecutando el comando kubectl get services, ubicar la app de spring y el puerto acompañado al 8080:puerto
6. Tomamos una ip pública de los workers y accedemos a ella en el navegador acompañado del puerto pesquisado. Utiliza la aplicación 
7. Como el puerto es inalcanzable (no funciona el método post para realizar queries) desde el pod de la aplicación, debe accederse al grupo de seguridad (EC2 -> Security Groups) y permitir todo el tráfico de entrada
8. Se vuelve a intentar el paso 5


-------------
Destruir instancias donde se realizó Terraform init, ejecutando el comando Terraform destroy --auto-approve
¡¡Intenta realizar tantos pasos automatizados como te sea posible!!









