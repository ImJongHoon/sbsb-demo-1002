# SBSB 시연 앱

시연용 Node.js 앱입니다. 브랜치마다 보여 주는 것이 다릅니다.

| 브랜치 | 화면 | 배포 대상 | 내용 |
|--------|------|-----------|------|
| `main` | 파랑 v1, 방문 수 | 온프레미스 | 방문할 때마다 Postgres에 기록하고 총 방문 수를 보여 줌 |
| `v2` | 초록 v2, 방문 수 | 온프레미스 | `server.js`의 버전·색만 다름. 무중단 교체 후에도 방문 수가 이어짐 |
| `v3` | 보라 "AWS v1" | AWS EC2 | DB를 쓰지 않는 버전. 방문 수 화면과 `pg` 의존성이 없음 |

- 일부러 `Dockerfile`이 없습니다. SBSB가 설정 PR에 Dockerfile과 빌드 워크플로를 넣습니다.
- `main`·`v2`는 `package.json`의 `pg` 의존성으로 SBSB가 Postgres를 감지하고, 배포 서버에 DB를 띄워 `DATABASE_URL`을 넣어 줍니다.
- 테이블은 앱이 시작할 때 직접 만듭니다 (`CREATE TABLE IF NOT EXISTS`). SBSB 배포 점검 요청(`wget`)은 방문 수에 넣지 않습니다.
- 8000번 포트에서 실행됩니다 (`PORT`로 바꿀 수 있음).
