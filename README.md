# 뷰티샵 통합 예약 시스템 NEW RESERVATION

서울시 뷰티샵을 통합하여 다양한 조건별 검색을 제공하고 쉽고 빠른 예약, 간편한 예약 관리, 고객과 사업자 간의 소통을 도와주는 웹 시스템 입니다.

화면은 로그인에 따라 고객, 사업자 화면으로 나뉩니다.

#### 기간 : 2017.03.09 ~ 2017.11.10
#### 참여 인원 : 6명
#### 역할 : 팀장

* 웹 : UI/UX, 로그인, 사업자 예약내역, 샵 조회, 예약하기, 예약 취소, 후기, FAQ 게시판
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

* 메인 화면

![main1](https://user-images.githubusercontent.com/62014520/102007461-a2154f80-3d6c-11eb-9baa-ab5f52df6afe.png)
![main2](https://user-images.githubusercontent.com/62014520/102007462-a5a8d680-3d6c-11eb-89f3-471e11fb16b1.png)

– 로그인한 사용자가 어떤 회원(고객/사업자)인지에 따라 옵션바의 메뉴가 달라집니다.

– 내비게이션에 미리 완성되어 있는 검색어로 빠르게 검색해 볼 수 있습니다.

– BEST SHOP은 시술 종류별 예약이 많은 순서로 나열되고 마우스를 올리면 샵의 정보가 보입니다.

– NEW SHOP은 가장 최근에 가입한 순서로 나열 됩니다.

– 화면 우측 하단에 따라다니는 리모컨으로 TOP/BOTTOM 이동을 할 수 있습니다.

* 검색

![search](https://user-images.githubusercontent.com/62014520/102007463-a80b3080-3d6c-11eb-86d0-1fd969eb8dfd.png)

– 시술 종류, 매장명, 지역, 시간대, 해시태그 총 5가지 조건을 다중으로 검색할 수 있습니다.

* 예약 하기

![reserve](https://user-images.githubusercontent.com/62014520/102007465-a93c5d80-3d6c-11eb-8ee9-16960e993864.png)

– 좌측에서는 샵의 기본정보, 상세정보, 이용안내, 후기를 볼 수 있고 우측에서 예약 사항을 선택할 수 있습니다.

– 날짜는 오늘부터 2주간의 날짜가 뜨고 시간은 오늘 날짜를 선택했을 경우엔 현재 시간을 기준으로 30분 이후의 시간부터, 오늘 이후의 날짜를 선택했다면 사업자가 설정한 영업시간이 뜹니다.

* 고객 예약내역

![customer_reserve](https://user-images.githubusercontent.com/62014520/102007466-aa6d8a80-3d6c-11eb-83ee-6b8840aefda7.png)

– 예약 날짜와 시간을 기준으로 내림차순으로 정렬 됩니다.

– 현재 시간과 비교하여 날짜가 지나지 않았다면 예약 취소 버튼이, 지났다면 후기 작성 버튼이, 후기 작성까지 완료된 내역은 체크 버튼이 나타납니다.

* 사업자 예약내역

![business_reserve](https://user-images.githubusercontent.com/62014520/102007467-ab062100-3d6c-11eb-8038-d0bd1a4fd465.png)

– 해당 날짜에 예약되어 있는 시간을 마크를 통해 미리 보여줍니다.

– 달력에서 클릭한 날짜와 그 날짜의 예약 내역을 온/오프라인을 구분해서 보여줍니다.

– 날짜의 우측에 있는 + 버튼으로 오프라인 예약을 추가할 수 있고, 예약 내역에 있는 X 버튼으로 예약을 취소할 수 있습니다.

* 후기

![review](https://user-images.githubusercontent.com/62014520/102007468-ab9eb780-3d6c-11eb-921d-fc9f9ef62501.png)

– 고객 예약 내역에서 후기 작성 버튼을 클릭하여 작성할 수 있고 내가 작성한 후기를 한 번에 모아보며 수정, 삭제를 할 수 있습니다.

– 작성한 후기는 해당 샵의 예약 페이지 맨 하단의 후기 정보 영역에 나타납니다.

* 쪽지

![message](https://user-images.githubusercontent.com/62014520/102007469-accfe480-3d6c-11eb-9964-4d6f094d0ff9.png)

– 예약 페이지에서 해당 샵의 사업자에게 바로 쪽지를 보낼 수 있습니다.

– 주고 받은 쪽지를 쪽지함에서 확인할 수 있고, 받은 쪽지함에서는 답장을 보낼 수 있습니다.

---

### 개발 후기

* 향후 개선 방향

초기 기획 시에 예약 변경, 가입 후 예약한 고객 회원들에게 혜택을 줄 수 있는 쿠폰, 노쇼를 해결하기 위한 블랙리스트 기능이 있었지만 시간의 제약으로 개발하지 못하여 아쉬운 부분이 있습니다. 따라서 차후에 이 기능들을 추가한다면 좀 더 완성도 높은 시스템이 될 것으로 보입니다. 또 결제 시스템을 도입한다면 사업자와 관리자 간의 계약금을 사이트 내에서 결제하여 원활한 계약이 이루어질 수 있을 것이며, 예약 시에도 미리 결제하여 좀 더 편하게 샵을 이용하고 노쇼 방지를 할 수 있을 것입니다.

---

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
