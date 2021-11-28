트위치 팔로우 목록 관리용 앱 어플리케이션
======================
스프링 프레임워크를 이용하여, 트위치의 나만의 팔로우 목록을 관리할 수 있는 앱 어플리케이션을 만드는 프로젝트입니다.         

* [2021.07.25 진행](./info/20210725.md)
* [2021.08.05 로그인 기능 구현 및 트위치 계정연동/API로 정보 가져오기](./info/20210805.md)
* [2021.08.10 팔로우 목록 관리 및 팔로우 목록으로의 정렬된 데이터를 가져오는 쿼리 작성](./info/20210810.md)
* [2021.08.17 스트리머 검색 기능과 스트리머 상세보기 페이지 구현](./info/20210817.md)
* [2021.11.04 프로젝트 재개 및 정비](./com.kokochi.samp/report/2021.11/20211104.md)
* [2021.11.05 헤더슬라이드 복구 및 새로운 원칙 정의](./com.kokochi.samp/report/2021.11/20211105.md)
* [2021.11.06 로그인/회원가입 처리 복구 및 DB수정](./com.kokochi.samp/report/2021.11/20211106.md)
* [2021.11.07 사용자의 팔로우 데이터 갱신/관리목록 설정하기](./com.kokochi.samp/report/2021.11/20211107.md)
* [2021.11.10 관리목록 최신 다시보기 가져오기 구현](./com.kokochi.samp/report/2021.11/20211110.md)
* [2021.11.12 관리목록 라이브 가져오기 구현](./com.kokochi.samp/report/2021.11/20211112.md)
* [2021.11.14 관리목록 인기클립 구현](./com.kokochi.samp/report/2021.11/20211114.md)
* [2021.11.23 스트리머 상세보기 다시보기/클립 데이터 가져오기](./com.kokochi.samp/report/2021.11/20211123.md)
* [2021.11.24 데이터 새로고침 구현](./com.kokochi.samp/report/2021.11/20211124.md)




## 원칙정의
프로젝트를 진행하는데 있어서 지키고자 하는 원칙입니다. 계속해서 추가해 나갈 예정입니다.
1. 스크립트에서는 document.ready를 사용하여 사용자 콘솔단에 변수가 누락되는 부분을 최소화시킨다.
2. 스크립트의 공통적으로 중복되는 함수들은(Ajax통신 등) 별도의 js파일로 모아두어서 모듈과 같이 떼서 사용할 수 있도록 구성한다.
3. 절대 서버의 비밀값인 clientId, clientSecret은 사용자단에 공개되지 않는다. (이외에도 인증토큰 등은 공개되어서는 안됨.)
4. DB에 영향이 가는 Insert, Update, Delete문이 들어가는 Url은 무조건적으로 인증을 통해서 진행하도록 한다. (최소 자동입력 방지가 포함되어야함.)


