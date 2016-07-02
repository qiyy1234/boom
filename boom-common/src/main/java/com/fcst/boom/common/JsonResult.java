package com.fcst.boom.common;

import java.util.HashMap;

/**
 * 返回对象
 * @author qiyy
 * Date:2016年6月24日
 *
 */
public class JsonResult extends HashMap<String, Object> {
    /**
	 * 
	 */
	private static final long serialVersionUID = 614065419337135090L;
	private static final String SUCCESS = "success";
    private static final String DATA = "data";
    private static final String MESSAGE = "message";

    public boolean isSuccess() {
        return (Boolean) get(SUCCESS);
    }

    public void setSuccess(boolean success) {
        put(SUCCESS, success);
    }

    public String getMessage() {
        return (String) get(MESSAGE);
    }

    public void setMessage(String message) {
        put(MESSAGE, message);
    }

    public Object getData() {
        return get(DATA);
    }

    public void setData(Object data) {
        put(DATA, data);
    }


}
