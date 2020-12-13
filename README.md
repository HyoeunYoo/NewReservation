# 뷰티샵 통합 예약 시스템 NEW RESERVATION

서울시 뷰티샵을 통합하여 다양한 조건별 검색을 제공하고 쉽고 빠른 예약, 간편한 예약 관리, 고객과 사업자 간의 소통을 도와주는 웹 시스템 입니다.

화면은 로그인에 따라 고객, 사업자 화면으로 나뉩니다.

#### 기간 : 2017.03.09 ~ 2017.11.10
#### 참여 인원 : 6명
#### 역할 : 팀장
* 웹 : UI/UX, 로그인, 사업자 예약내역 조회, 샵 조회, 예약하기, 예약 취소, 후기, FAQ 게시판
* 데이터베이스 : 설계, 구축

---

### 기획

현재 뷰티샵(네일 샵, 속눈썹 연장 샵, 왁싱 샵을 통칭)은 전화나 SNS를 통해 예약 받는 곳이 대다수 입니다. 이 방법은 고객에게도 번거롭고 매장에서도 영업 중에 대응하기가 어렵다는 문제점이 있습니다. 또한 주변에 뷰티샵이 굉장히 많이 분포하고 있지만 이를 모아놓은 사이트가 없어 원하는 샵을 찾으려면 포털사이트를 통해 일일이 찾아봐야 한다는 불편함도 있습니다.

따라서 뷰티샵을 통합하여 기존 예약 방법과 검색의 번거로움을 해소하고 고객과 사업자 간의 원활한 소통을 돕고자 합니다. 더 나아가 예약 관리도 간편하게 할 수 있고 그 외 부합하는 기능들을 추가로 제공하고자 합니다.

---

### 설계

* 시스템 구성도

![structure](https://user-images.githubusercontent.com/62014520/102007277-f7e8f800-3d6a-11eb-9fc4-7f5863e840fc.png)
![structure2](https://user-images.githubusercontent.com/62014520/102007278-f8818e80-3d6a-11eb-9784-e01e6f059839.png)

* 데이터베이스

![db](https://user-images.githubusercontent.com/62014520/102007203-44800380-3d6a-11eb-91f5-9a56e7cc078f.png)


---

### 주요 기능 시연




---

### 개발 후기

* 향후 개선 방향

초기 기획 시에 예약 변경, 가입 후 예약한 고객 회원들에게 혜택을 줄 수 있는 쿠폰, 노쇼를 해결하기 위한 블랙리스트 기능이 있었지만 시간의 제약으로 개발하지 못하여 아쉬운 부분이 있습니다. 따라서 차후에 이 기능들을 추가한다면 좀 더 완성도 높은 시스템이 될 것으로 보입니다. 또 결제 시스템을 도입한다면 사업자와 관리자 간의 계약금을 사이트 내에서 결제하여 원활한 계약이 이루어질 수 있을 것이며, 예약 시에도 미리 결제하여 좀 더 편하게 샵을 이용하고 노쇼 방지를 할 수 있을 것입니다.

---

JSP, PHP, Ajax, JAVA, SQL

## Program Stacks
### Client
* HTML
* CSS
* JavaScript
* jQuery
* Ajax
* Bootstrap

### Server
* Apache Tomcat
* MySQL
* Java
* JSP
