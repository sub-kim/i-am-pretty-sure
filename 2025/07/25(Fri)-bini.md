## 2025-07-25(Fri)

- 🌤 Weather: 와 덥다 진짜 덥다 너무 덥다
- 😊 Mood: (⓿_⓿) 아무 생각 없음
- ✅ To-Do
  - [ ✔ ] Task 1:
  - [ ⏳ ] Task 2:
  - [ ✖ ] Task 3:
<hr style="border-top: 1px dashed #333;">
- 💡 Is there something NEW?   

> *배가 진짜 고픔 지금 별로 할 일이 없음*

- 📝 How was your day?
> 울 회사 망하는 건 아니겠지요...?
> 딱히 할 일이 없어서 날짜 오류 고칠 겸 켰는데 고치는 건 챗지피티가 바로 해 줌
> 그렇다면 나는 뭘 하느냐? 나는 그냥 커밋을 하지요...
> 나는 프로그래머가 아니고 그냥 코더가 될 건가 봐
> 책이라도 읽어야 하나? 뭔가 무료해
> 7월이라 건보료 오른 월급이 적용됐는데 이번에 성과급 받은 것도 선지급금으로 까여서 그런가
> 월급이 엄청 적어진 느낌이야!! 차 사고 싶어! 집 사고 싶어! 부유하고 싶어!
>
> 오 대박!
> 이제 제가 2차 커밋을 할 건데요
> 맨날 쓰는 척하고 안 써서 한 달에 한두 번밖에 없으니까 그냥 요일별로 파일을 만들었어요
> 나중에 보기에도 이게 더 편하다 아님?
> 예전 거 읽어 봤는데 뭐 대단한 거 쓰지는 않았더라고요
> 루루한테도 공유하고 같이 쓰는 일기장 할까 봐요 키키키  
>   
>  아 맞다 제가 회사에서 커밋하다 보니까 이름으로 바로 커밋되는 불상사가 있었는데요~ 이거 제가 다시 바깠거등요 신기한 오늘의 정보를 공유드려요! 이름하야~


> # 깃 계정 이름과 이메일 변경하기!  
>  
> * 현재 깃 레포지토리의 committer 정보 확인 (해당 레포지토리만 적용되는 정보)  
    >  git config user.name  
    >  git config user.email  
>  
> 
> * 현재 깃 레포지토리의 committer 정보 변경 (해당 레포지토리만 적용되는 정보) - puppy, new@email.com으로 변경할 때  
    > git config user.name "puppy"  
    > git config user.email "new@email.com  
>  
> 
> * 현재 기본 committer 정보 확인(레포지토리 정보가 없을 때 기본값)  
    > git config --global user.name  
    > git config --global user.email  
>  
> 
> * 파이썬 설치 확인    
    > where python  
>  
> 
> * 위 명령어 입력 시 만약 아래와 같은 응답이 온다면 이건 "가짜 파이썬"  
> * 이 경로는 Microsoft Store에서 제공하는 "가짜" python.exe임!  
> * 이건 단순히 "Python을 아직 설치하지 않은 사람을 위해 Store로 연결만 시켜주는 실행기"일 뿐, 실제 Python 해석기나 pip 모듈은 아예 포함되어 있지 않음  
    > C:\Users\user\AppData\Local\Microsoft\WindowsApps\python.exe  
>  
>
> * 파이썬 설치  
> * 아래 경로에서 Windows installer (64-bit) 다운로드    
    > https://www.python.org/downloads/release/python-31210/    
>  
> 
> * 파이썬 설치 확인 후 아직 동일하게 나온다면 환경변수 등록    
    > where python  
>  
> 
> * 파이썬 환경변수 등록    
    >  Win 키 → "환경 변수" 검색 → "시스템 환경 변수 편집" 클릭 → 하단의 [환경 변수(N)...] 버튼 클릭 → 사용자 변수 또는 시스템 변수에서 Path 더블클릭 → [새로 만들기] 클릭해서 아래 2개 경로를 추가    
    > C:\Users\user\AppData\Local\Programs\Python\Python312\  
    > C:\Users\user\AppData\Local\Programs\Python\Python312\Scripts\  
>  
> 
> * 파이썬 설치 확인    
    > where python  
>  
> 
> * git-filter-repo 설치    
    > pip install git-filter-repo    
>  
> 
> * 설치 확인    
    > git filter-repo --version    
>  
> 
> * 현재 커밋 내역을 시간 역순으로 표출하여 바꿀 name, email 확인    
    > git log --pretty=format:"%h %an <%ae>" --reverse  
>  
> 
> * 가독성 향상을 위해 줄바꿈을 했으나 실제로 명령어 적용 시에는 줄바꿈을 없애야 함  
> * 명령어: author 이름 puppy, 이메일 origin@email.com 으로 커밋된 것을 bini, new@email.com로 변경해라  
    > git filter-repo --force --commit-callback  
      "if commit.author_name == b'puppy' and commit.author_email == b'origin@email.com'    
      : commit.author_name = b'bini'; commit.author_email = b'new@email.com'; commit.committer_name = b'bini'; commit.committer_email = b'new@email.com'"    
>  
> 
> * 현재 커밋 내역을 시간 역순으로 표출하여 name, email 변경되었는지 확인    
    > git log --pretty=format:"%h %an <%ae>" --reverse  
>  
> 
> * 원격 저장소를 연결 (https로 클론할 때 가지고 오는 url 주소를 넣으면 됨)    
    > git remote add origin https://github.com/보통은계정/보통은레포지토리이름    
>  
> 
> * 원격 저장소로 강제 푸시    
    > git push origin main --force      
    > git push origin --tags --force  
>  

---
