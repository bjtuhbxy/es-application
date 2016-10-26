package cc.movein.common.excepiton;

public class InvalidTidException extends Exception {

	private static final long serialVersionUID = -746345197225263478L;

	public InvalidTidException() {
		super();
	}

	public InvalidTidException(String message, Throwable cause) {
		super(message, cause);
	}

	public InvalidTidException(String message) {
		super(message);
	}

	public InvalidTidException(Throwable cause) {
		super(cause);
	}

	@Override
	public String getMessage() {
		return "Invalid _tid_ parameter : " + super.getMessage();
	}

}
