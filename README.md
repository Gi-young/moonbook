# KH문고
둥글게둥글게 팀의 파이널 프로젝트
---
### 내 컴퓨터에서 실행시키기(클론)
1. 윈도우 탐색기에서 khbook프로젝트를 생성할 워크스페이스로 이동합니다. (기존 워크스페이스 사용 가능)

2. 새폴더 "khbook"을 생성합니다 (이름 무관)

3. 해당 폴더에서 khbook 깃허브 HTTPS 주소로 clone을 실행합니다.

    Git Bash 기준 설명
    
    생성한 새폴더(khbook) 우클릭 -> Git Bash Here -> git clone https://github.com/Gi-young/khbook.git . 입력 (맨 마지막의 "."은 현재폴더를 의미) -> 완료

4. STS에서 해당 워크스페이스로 들어갑니다.

5. 우클릭 -> new -> Spring Legacy Project

    Project name = khbook (이름 무관)

    Use default location을 체크 해제하고 Browse -> clone한 디렉토리 선택
    
    Templates = Spring MVC Project
    
    Top Level Package = com.rar.khbook (rar은 "Round And Round, 둥글게 둥글게"의 약자)

6. root-context.xml, servlet-context.xml, mybatis-config.xml, pom.xml, web.xml을 기존의 것으로 변경해주세요

7. com.rar.khbook패키지 아래의 HomeController.java를 삭제합니다. (메소드 매핑 중복)

8. 메이븐 업데이트를 통해서 자바 버전을 11로 맞춰줍니다. (프로젝트 우클릭 -> Maven -> Update Project)

    완료 -> 실행
