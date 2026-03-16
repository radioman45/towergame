# Study Notes

이 문서는 비개발자 초보가 이 프로젝트를 보면서 같이 공부할 수 있도록, 구현 과정에서 실제로 중요했던 개념만 추려서 정리한 메모다.

## 1. 게임은 "한 번에 완성"이 아니라 "매 프레임 갱신"으로 움직인다

- 브라우저 게임은 보통 `requestAnimationFrame()` 안에서 계속 업데이트된다.
- 핵심 흐름은 대체로 `입력 처리 -> 상태 계산 -> 화면 그리기`다.
- 이번 프로젝트에서도 `animate()`가 계속 돌면서 적 이동, 탄환 이동, 충돌, 렌더링을 수행한다.
- 중요한 점은 `requestAnimationFrame()`이 한 번만 실행된다는 것이다. 다음 프레임도 돌리고 싶으면 콜백 안에서 다시 호출해야 한다.

초보자 체크:
- 루프가 멈췄다면 "함수가 아예 호출되지 않는지"와 "함수 안에서 예외가 나서 끊겼는지"를 먼저 나눠서 생각한다.
- `dt`(delta time)를 쓰는 이유는 컴퓨터 성능이 달라도 게임 속도를 비슷하게 맞추기 위해서다.

## 2. 런타임 오류는 작은 `null` 체크 하나로도 발생한다

- 이번에 실제로 났던 오류는 `Cannot read properties of null (reading 'id')`였다.
- 원인은 드래그 상태 객체는 있었지만, 그 안의 `tank`가 `null`일 수 있다는 점을 놓쳤기 때문이다.
- 이런 종류의 버그는 "객체가 있나?"만 보면 안 되고, "내가 지금 읽으려는 하위 값도 있나?"까지 확인해야 막을 수 있다.

초보자 체크:
- `something.id`를 읽는 코드에서 `something`이 항상 존재하는지 의심한다.
- 사용자 입력 상태(`selected`, `dragging`, `hover`, `currentTarget`)는 자주 `null`이 된다.
- 특히 마우스/포인터 이벤트는 "빈 곳을 클릭한 경우"를 항상 같이 생각해야 한다.

## 3. 일시정지, 정지, 재시작은 버튼 문제가 아니라 상태 설계 문제다

- 버튼을 추가하는 것보다 중요한 건 "게임이 어떤 상태에 들어갔는가"를 명확히 만드는 일이다.
- 이번 프로젝트에서는 최소한 다음 상태를 구분해야 했다.
- 일반 진행 상태
- 일시정지 상태
- 런타임 오류 상태
- 승리/패배 오버레이 상태
- 재시작 직후 초기화 상태

초보자 체크:
- `Pause`는 보통 렌더링 전체를 끄는 것이 아니라 "업데이트만 멈추는 것"으로 구현하는 편이 안정적이다.
- `Restart`는 화면만 다시 그리는 것이 아니라 배열, 선택 상태, 웨이브 상태, 오버레이 상태까지 모두 초기화해야 한다.
- "오류 후 복구"는 평상시 재시작과 분리해서 생각하는 편이 디버깅하기 쉽다.

## 4. 오디오는 웹에서 그냥 자동 재생되지 않는다

- Web Audio API는 강력하지만, 대부분의 브라우저는 사용자 입력 전 자동 재생을 제한한다.
- 그래서 첫 클릭이나 키 입력 뒤에 `AudioContext`를 `resume()`하는 패턴이 자주 나온다.
- 이번 프로젝트도 효과음과 BGM이 "첫 상호작용 이후"부터 안정적으로 동작하도록 맞췄다.

초보자 체크:
- 소리가 안 나면 먼저 코드보다 브라우저 정책을 의심한다.
- BGM과 효과음을 같은 볼륨 경로로 보내면 조절이 어려우니, 버스를 나누는 습관이 좋다.
- 효과음은 짧고 즉각적이어야 하고, BGM은 반복돼도 피로하지 않아야 한다.

## 5. 외부 CDN은 편하지만, 항상 믿으면 안 된다

- 처음에는 Three.js를 CDN에서 불러왔지만, 이 환경에서는 보호 페이지/차단 응답 때문에 게임이 안 떴다.
- 그래서 로컬 `three.min.js`를 프로젝트에 두고 직접 읽도록 바꿨다.
- 데모나 학습용 프로젝트는 "의존성을 직접 같이 보관할지"도 중요한 설계 포인트다.

초보자 체크:
- 화면이 안 뜨면 게임 로직보다 먼저 "필수 라이브러리가 실제로 로드됐는지" 확인한다.
- 브라우저 콘솔의 첫 오류가 보통 제일 중요하다.
- 외부 스크립트 실패와 게임 로직 실패는 분리해서 본다.

## 6. Three.js는 결국 "장면(Scene) 안에 객체(Object3D)를 넣고, 카메라로 보고, 렌더러가 그린다"

- 초보자는 Three.js를 너무 거창하게 느끼기 쉽지만, 기본 구조는 단순하다.
- `Scene`: 월드 전체
- `Camera`: 어디서 볼지
- `Mesh` / `Group`: 실제 보이는 물체
- `Renderer`: 브라우저 캔버스에 그리는 도구
- `userData`: 객체에 내 게임 데이터 연결할 때 유용한 공간

초보자 체크:
- 게임 객체와 Three.js 객체를 완전히 같은 것으로 생각하지 말고, "게임 상태 + 시각 객체" 두 층으로 나눠서 보면 이해가 쉬워진다.
- 삭제할 때는 화면에서만 빼는 게 아니라 geometry/material dispose도 같이 생각해야 한다.

## 7. 초보자가 이 프로젝트를 읽는 추천 순서

1. `index.html`에서 HUD와 버튼이 어디 있는지 먼저 본다.
2. `state` 객체를 읽고 "게임이 어떤 값을 기억하는지" 파악한다.
3. `startWave`, `resetGame`, `animate`를 읽는다.
4. 그다음 `Tank`, `Enemy`, `Projectile` 클래스를 읽는다.
5. 마지막으로 오디오 시스템과 오버레이 복구 흐름을 본다.

## 8. lessons learned

- UI 기능 추가보다 상태 전이가 더 중요하다.
- 런타임 오류 복구 버튼은 실제 디버깅 시간을 크게 줄여준다.
- 사운드 기능은 "소리를 내는 코드"보다 "언제 브라우저가 재생을 허용하는가"를 이해하는 것이 먼저다.
- 작은 `null` 방어가 전체 게임 루프를 살린다.
- 브라우저 게임은 콘솔의 첫 번째 오류가 거의 항상 핵심 단서다.

## 9. 참고 링크

- MDN `requestAnimationFrame()`
  - https://developer.mozilla.org/en-US/docs/Web/API/Window/requestAnimationFrame
- MDN Web Audio API
  - https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API
- MDN Autoplay guide for media and Web Audio APIs
  - https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Autoplay
- Three.js WebGLRenderer docs
  - https://threejs.org/docs/#api/en/renderers/WebGLRenderer
- Three.js Object3D docs
  - https://threejs.org/docs/#api/en/core/Object3D
- Three.js manual: Creating a scene
  - https://threejs.org/manual/#en/creating-a-scene
