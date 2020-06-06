package cn.fy.exception;

public class LoginException extends Exception {
    // 存储提示信息的
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LoginException(String message) {
        this.message = message;
    }

    public LoginException() {
    }
}
