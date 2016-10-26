package cc.movein.common.excepiton;

/**
 * 业务异常
 * 
 * @author geyx
 *
 */
public class BizException extends Exception {

	private static final long serialVersionUID = -124462655205301810L;

	public BizException() {
		super();
	}

	public BizException(String msg) {
		super(msg);
	}

	public BizException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public BizException(String message, Throwable cause) {
		super(message, cause);
	}

	public BizException(Throwable cause) {
		super(cause);
	}

}
