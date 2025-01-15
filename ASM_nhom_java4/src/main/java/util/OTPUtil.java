package util;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class OTPUtil {
    // Lưu trữ OTP hoặc token kèm thời gian tạo
    private static final Map<String, OTPEntry> otpStore = new HashMap<>();
    private static final long EXPIRATION_TIME = 10 * 60 * 1000; // 10 phút

    // Sinh mã OTP ngẫu nhiên
    public static String generateOtp() {
        int otp = (int) (Math.random() * 900000) + 100000; // Random 6 chữ số
        return String.valueOf(otp);
    }

    // Sinh token đặt lại mật khẩu
    public static String generateResetToken(String username) {
        String token = UUID.randomUUID().toString();
        otpStore.put(username, new OTPEntry(token, System.currentTimeMillis()));
        return token;
    }

    // Kiểm tra token hợp lệ
    public static boolean validateResetToken(String username, String token) {
        OTPEntry entry = otpStore.get(username);

        if (entry != null && entry.getOtpOrToken().equals(token)) {
            long now = System.currentTimeMillis();
            if ((now - entry.getTimestamp()) <= EXPIRATION_TIME) {
                return true;
            } else {
                otpStore.remove(username); // Token hết hạn
            }
        }
        return false;
    }

    // Lớp nội bộ để lưu trữ OTP/token và thời gian tạo
    private static class OTPEntry {
        private final String otpOrToken;
        private final long timestamp;

        public OTPEntry(String otpOrToken, long timestamp) {
            this.otpOrToken = otpOrToken;
            this.timestamp = timestamp;
        }

        public String getOtpOrToken() {
            return otpOrToken;
        }

        public long getTimestamp() {
            return timestamp;
        }
    }
}
