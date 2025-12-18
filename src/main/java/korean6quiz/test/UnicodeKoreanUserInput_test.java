package korean6quiz.test;

import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class UnicodeKoreanUserInput_test {
    /** 초성 */
    public static char[] arrChoSung = { 0x3131, 0x3132, 0x3134, 0x3137, 0x3138,
            0x3139, 0x3141, 0x3142, 0x3143, 0x3145, 0x3146, 0x3147, 0x3148,
            0x3149, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e };
    /** 중성 */
    public static char[] arrJungSung = { 0x314f, 0x3150, 0x3151, 0x3152,
            0x3153, 0x3154, 0x3155, 0x3156, 0x3157, 0x3158, 0x3159, 0x315a,
            0x315b, 0x315c, 0x315d, 0x315e, 0x315f, 0x3160, 0x3161, 0x3162,
            0x3163 };
    /** 종성 */
    public static char[] arrJongSung = { 0x0000, 0x3131, 0x3132, 0x3133,
            0x3134, 0x3135, 0x3136, 0x3137, 0x3139, 0x313a, 0x313b, 0x313c,
            0x313d, 0x313e, 0x313f, 0x3140, 0x3141, 0x3142, 0x3144, 0x3145,
            0x3146, 0x3147, 0x3148, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e };

    /** 초성 영문 */
    public static String[] arrChoSungEng = { "r", "R", "s", "e", "E",
            "f", "a", "q", "Q", "t", "T", "d", "w",
            "W", "c", "z", "x", "v", "g" };
    /** 중성 영문 */
    public static String[] arrJungSungEng = { "k", "o", "i", "O",
            "j", "p", "u", "P", "h", "hk", "ho", "hl",
            "y", "n", "nj", "np", "nl", "b", "m", "ml",
            "l" };
    /** 종성 영문 */
    public static String[] arrJongSungEng = { "", "r", "R", "rt",
            "s", "sw", "sg", "e", "f", "fr", "fa", "fq",
            "ft", "fx", "fv", "fg", "a", "q", "qt", "t",
            "T", "d", "w", "c", "z", "x", "v", "g" };
    /** 단일 자음 영문 */
    public static String[] arrSingleJaumEng = { "r", "R", "rt",
            "s", "sw", "sg", "e","E" ,"f", "fr", "fa", "fq",
            "ft", "fx", "fv", "fg", "a", "q","Q", "qt", "t",
            "T", "d", "w", "W", "c", "z", "x", "v", "g" };

    /** 변환 결과 묶음 */
    public static class Conversion {
        public final String jamo;  // 자음/모음 분리 결과
        public final String eng;   // 두벌식 영문 키보드 대응
        public Conversion(String jamo, String eng) {
            this.jamo = jamo;
            this.eng = eng;
        }
    }

    /** 문자열 하나 변환 */
    public static Conversion convert(String word) {
        StringBuilder result = new StringBuilder();
        StringBuilder resultEng = new StringBuilder();

        for (int i = 0; i < word.length(); i++) {
            char ch = word.charAt(i);
            int code = ch - 0xAC00;

            if (code >= 0 && code <= 11172) {
                // 한글 음절 (가~힣)
                int chosung  = code / (21 * 28);
                int jungsung = (code % (21 * 28)) / 28;
                int jongsung = code % 28;

                result.append(arrChoSung[chosung]).append(arrJungSung[jungsung]);
                resultEng.append(arrChoSungEng[chosung]).append(arrJungSungEng[jungsung]);

                if (jongsung != 0) {
                    result.append(arrJongSung[jongsung]);
                    resultEng.append(arrJongSungEng[jongsung]);
                }
            } else {
                // 한글 음절 외
                result.append(ch);

                // 원본 코드가 char 래핑 기반 범위를 쓴 걸 그대로 유지하려면:
                int wrapped = (ch - 0xAC00) & 0xFFFF;
                if (wrapped >= 34097 && wrapped <= 34126) {
                    int jaum = (wrapped - 34097);
                    resultEng.append(arrSingleJaumEng[jaum]);
                } else if (wrapped >= 34127 && wrapped <= 34147) {
                    int moum = (wrapped - 34127);
                    resultEng.append(arrJungSungEng[moum]);
                } else {
                    resultEng.append(ch);
                }
            }
        }
        return new Conversion(result.toString(), resultEng.toString());
    }

    public static void main(String[] args) {
        // 콘솔에서 반복 입력 (UTF-8)
        Scanner sc = new Scanner(System.in, StandardCharsets.UTF_8);
        System.out.println("=== 한국어 자모/영문 변환기 (종료를 원하면 exit 입력) ===");
        while (true) {
            System.out.print("입력> ");
            if (!sc.hasNextLine()) break;
            String line = sc.nextLine();
            if ("exit".equalsIgnoreCase(line.trim())) break;

            Conversion c = convert(line);
            System.out.println("자음분리: " + c.jamo);
            System.out.println("알파벳 : " + c.eng);
        }
        sc.close();
    }
}