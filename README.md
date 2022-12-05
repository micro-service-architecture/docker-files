# docker-files
## 목차
* **[애플리케이션 배포 Docker Container](#애플리케이션-배포-Docker-Container)**
  * **[Mysql 배포](#Mysql-배포)**

## 애플리케이션 배포 Docker Container
### Mysql 배포
#### 도커 파일 생성
```docker 
FROM mariadb:10.5.17
ENV MYSQL_ROOT_PASSWORD test1357
ENV MYSQL_DATABASE mydb
COPY ./data /var/lib/mysql
EXPOSE 3306
ENTRYPOINT [ "mysqld", "--user=root" ]
```
- COPY : ./data   
Host PC에 있는 데이터 경로를 복사하여 `Dockerfile` 과 같은 경로로 옮긴다.
  - MacOS    
  ![image](https://user-images.githubusercontent.com/31242766/205596150-72a7ec1d-2796-4611-bbd8-6d35d008e353.png)
  - Window
  ![image](https://user-images.githubusercontent.com/31242766/205595942-9b186af3-c3dd-4dbb-9fa4-6fd653426733.png)
  
#### 도커 파일 빌드
```docker
docker build -t yong7317/my-mariadb:1.0 .
```
#### 도커 파일 실행
```docker
docker run -d -p 3306:3306  --network ecommerce-network --name mariadb yong7317/my-mariadb:1.0
```
#### mariaDB 컨테이너 실행
```docker
docker exec -it mariadb /bin/bash
```
![image](https://user-images.githubusercontent.com/31242766/205598531-5bbdc134-918a-47ef-b084-debf04b8d664.png)
![image](https://user-images.githubusercontent.com/31242766/205598753-bdd03f5b-f226-4dd6-a0e6-527617309aea.png)

#### 외부 접속 권한 설정
```mariadb
grant all privileges on *.* to 'root'@'%' identified by 'test1357';
```
```mariadb
flush privileges
```
![image](https://user-images.githubusercontent.com/31242766/205599630-b30155c4-6553-419d-9c83-655cc74f42a6.png)
