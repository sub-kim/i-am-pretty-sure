# 비디오 미디어 컨트롤러(video Controller)

---

## 📅 What's this?

브라우저를 통해 열고, 버튼으로 스피드나 이전/다음 등을 클릭하지 못하게 설정되어 있는 경우 사용

- [적용하는 법]
    - videoContol.js 소스 확인 - 필요한 부분을 수정하여 개발자도구 콘솔에 붙여넣어 사용  
  
      - [비디오 재생 속도 조절] 섹터를 복사하여 개발자도구(F12)의 콘솔에 붙여넣기  
        단, 실제 html이 그려진 비디오 미디어 태그 및 상단 부모 태그의 아이디 등 아래 부분 수정 필요
        > setTimeout(() => {
        > 
        > const outerIframe = document.getElementById('여기');
        > 
        > ...
        > 
        > const innerFrame = outerIframe.contentWindow.document.getElementById('여기'); <

      - [비디오 다음 버튼 클릭] 기본 설정: 5초마다 다음 버튼 있는지 확인 후 있다면 클릭  
        단, 실제 html이 그려진 비디오 미디어 태그 및 상단 부모 태그의 아이디 등 아래 부분 수정 필요
        > const outer = document.getElementById('여기');
        >
        > ... 
        > 
        >  const inner = outerDoc.getElementById('여기');
        > 
        >  ...
        > 
        >  const btn = innerDoc.getElementById('여기');
      