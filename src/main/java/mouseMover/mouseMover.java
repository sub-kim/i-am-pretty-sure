package mouseMover;

import java.awt.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class mouseMover {

    private static final long INTERVAL_MS = 90_000L; // 마우스 움직일 주기(9분)
    private static final int MOVE_PIXELS = 50;

    private static final int CORNER_EXIT = 500; // 메소드 종료를 위해 마우스를 왼쪽 상단 이동 어디까지 허용할지 (500, 500)
    private static final long POLL_MS = 5000L; // 종료를 위한 마우스 움직임 체크 주기(5초)

    private static final DateTimeFormatter FMT =
            DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"); // ms까지 표시

    public static void main(String[] args) throws Exception {
        Robot robot = new Robot();

        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int screenWidth = screenSize.width;
        int screenHeight = screenSize.height;

        int centerX = screenWidth / 2;
        int baseY = (int) (screenHeight * 0.75);

        log("START");

        boolean toggle = false;
        long nextMoveAt = System.currentTimeMillis() + INTERVAL_MS;

        long loopCount = 0;

        while (true) {
            Point p = MouseInfo.getPointerInfo().getLocation();
            long now = System.currentTimeMillis();

            // 종료 조건
            if (p.x < CORNER_EXIT && p.y < CORNER_EXIT) {
                log("EXIT detected -> 종료");
                break;
            }

            // 이동 조건(1분마다 1번)
            if (now >= nextMoveAt) {
                Point cur = MouseInfo.getPointerInfo().getLocation();
                int offsetX = toggle ? -MOVE_PIXELS : MOVE_PIXELS;

                int targetX = clamp(cur.x + offsetX, 0, screenWidth - 1);
                int targetY = clamp(cur.y, 0, screenHeight - 1);

                robot.mouseMove(targetX, targetY);
                toggle = !toggle;

                // ✅ 시간 포함 이동 로그
                log("MOVE -> (" + cur.x + "," + cur.y + ") => (" + targetX + "," + targetY + ")");
                nextMoveAt += INTERVAL_MS;
            }

            Thread.sleep(POLL_MS);
        }

        log("END");
    }

    private static void log(String msg) {
        System.out.println("[" + LocalDateTime.now().format(FMT) + "] " + msg);
    }

    private static int clamp(int v, int min, int max) {
        return Math.max(min, Math.min(max, v));
    }
}