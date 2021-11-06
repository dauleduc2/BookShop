package models;

public enum StatusCode {
    BAD_REQUEST(400),
    NOT_FOUND(404),
    INTERNAL_SERVER_ERROR(500);

    private int value;

    private StatusCode(int value) {
        this.value = value;
    }
}
