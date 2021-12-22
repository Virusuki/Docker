# 도커란?
- 도커는 리눅스 컨테이너를 기반으로 특정 서비스를 패키징하고 실행, 운영 및 배포하는데 유용한 오픈소스 플랫폼이다.
- 커는 2019/2020 Stack Overflow의 Developer Survey of 90,000 Developers에서 진행한 설문조사에서 Most Wanted 부문에서 1위를 차지했습니다.
   (관련 기술은 Kubernetes 경우 4위를 차지했네요.) 이것은 모든 분야에 걸쳐 도커의 쓰임새가 널리 확장되고 있다는 의미와 함께 경쟁력 있는 Developer/Architect로
   성장하는데 있어서 기술습득 및 학습할 가치가 있다는 메세지를 던지고 있는 것 같습니다.
   
[도커 설문조사 이미지]

# 도커 컨테이너
- 컨테이너는 도커==컨테이너라 할 정도로 컨테이너는 매우 중요한 개념입니다.
- 컨테이너 그림에서 사각형 전체를 컴퓨터라고 생각해볼때 CPU, 저장장치, LAN 카드, 그래픽카드 등 하드웨어가 물리적 컴퓨터로 구성하고 있습니다. 여기에서 OS를
  기반으로 하여 도커 엔진이 구동되고, 컨테이너는 도커 엔진 통제에 의해 구동됩니다.
  언뜻 보면 VM가 비슷한 것 같지만, 컨테이너는 OS가 없습니다. application을 구동하기 위한 오로지 필요한 라이브러리만 가지고 있습니다. 여기서 장점은 OS를
  실행할 필요가 없기 떄문에 부하가 적고 구동되는 속도 역시 빠른 이점이 있습니다. 또한 애플리케이션은 각자 독립된 영역을 할당받기 때문에 런타임에서 발생하는 
  충돌도 피할 수 있습니다.
  
[도커 컨테이너 이미지]

## 도커 & 도커 컴포즈 Install

- apt-get update
- apt install apt-transport-https ca-certificates curl software-properties-common
- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
- sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
- apt update
- sudo apt install docker-ce
- apt-get install systemd
- systemctl status docker
- docker -v
- sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
- sudo chmod +x /usr/local/bin/docker-compose
- docker-compose --version
